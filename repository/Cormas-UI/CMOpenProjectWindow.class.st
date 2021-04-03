"
CMOpenProjectWindow new openWithSpec
"
Class {
	#name : #CMOpenProjectWindow,
	#superclass : #CMSpPManagedPresenter,
	#instVars : [
		'projectsListPresenter',
		'versionsListPresenter',
		'previewPresenter',
		'metaInfoPresenter',
		'cormasProjects',
		'toolbar',
		'projectsLocationsPresenter'
	],
	#category : #'Cormas-UI-Project-Spec2'
}

{ #category : #specs }
CMOpenProjectWindow class >> defaultSpec [
	<spec>
	^ SpPanedLayout newVertical
		position: 35 percent;
		add:
			(SpBoxLayout newHorizontal
				add: (
					SpBoxLayout newVertical 
						add: #projectsLocationsPresenter withConstraints: [ :constraints | constraints height: self toolbarHeight ];
						add: #projectsListPresenter);
				add: #versionsListPresenter withConstraints: [ :constraints | constraints width: 150 ];
				add: #previewPresenter;
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #metaInfoPresenter;
				add: #toolbar withConstraints: [ :constraints | constraints height: self toolbarHeight ];
				yourself)
]

{ #category : #examples }
CMOpenProjectWindow class >> example [
	<example>

	CMOpenProjectWindow new openWithSpec
]

{ #category : #specs }
CMOpenProjectWindow class >> title [
	^ 'CORMAS - Open project'
]

{ #category : #initialization }
CMOpenProjectWindow >> connectPresenters [ 

	projectsListPresenter
		transmitTo: versionsListPresenter
		transform: [ : aCormasObject | aCormasObject definedCormasVersions ]
		postTransmission: [ :destination | destination selectIndex: 1 ].
		
	versionsListPresenter 
		transmitTo: metaInfoPresenter
		transform: [ : aCormasProjectVersion | aCormasProjectVersion infoString ]
]

{ #category : #initialization }
CMOpenProjectWindow >> cormasLocations [
		
	^ Dictionary newFromPairs: { 
		'Demos'	 		. #projectsDemos .
		'In-image' 		. #projectsInImage .
		'Browse...'  	. #projectsBrowse
		}
]

{ #category : #accessing }
CMOpenProjectWindow >> cormasProjects [
	^ cormasProjects
		ifNil: [ cormasProjects := self defaultCormasProjects ]
]

{ #category : #accessing }
CMOpenProjectWindow >> cormasProjects: anObject [
	cormasProjects := anObject
]

{ #category : #defaults }
CMOpenProjectWindow >> defaultCormasProjects [
	" Answer a <Collection> of <CMProjectModel> "
	
	^ #()
]

{ #category : #accessing }
CMOpenProjectWindow >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 800 @ 700
]

{ #category : #initialization }
CMOpenProjectWindow >> initializeButtonBar [

	self toolbar
     add: (self newButton
                    label: self translator tCancel;
                    icon: (self iconNamed: #smallCancel);
                    action: [  ] );
		add: (self newButton
                    label: self translator tHelp;
                    icon: (self iconNamed: #help);
                    action: [  ]);
		add: (self newButton
                    label: self translator tOk;
                    icon: (self iconNamed: #smallOk);
                    action: [  ] )


]

{ #category : #initialization }
CMOpenProjectWindow >> initializeLocationsPresenter [
	
	projectsLocationsPresenter  
		items: self cormasLocations keys;
		transmitTo: projectsListPresenter
		transform: [ : locationId | self projectsFor: locationId ];
		"postTransmission: [ :destination :origin | destination selectIndex: 1 ];"
		selectIndex: 1.
]

{ #category : #initialization }
CMOpenProjectWindow >> initializeMetaInfoPresenter [
	
	self metaInfoPresenter 
]

{ #category : #initialization }
CMOpenProjectWindow >> initializePresenters [

	projectsLocationsPresenter := self newDropList.
	projectsListPresenter := self newList.
	versionsListPresenter := self newList.
	metaInfoPresenter := self instantiate: CMSpMetaProjectPresenter. "self newText".
	previewPresenter := self newImage.
	toolbar := self newButtonBar.
	self setFocus.
"	methodsListPresenter contextMenu: self messageMenu.
	changesListPresenter contextMenu: self changeSetMenu.
	classesListPresenter contextMenu: self classMenu.
"
	projectsListPresenter enableItemSubstringFilter.
	versionsListPresenter enableItemSubstringFilter.
	
	self 
		initializeLocationsPresenter;
		initializeProjectsPresenter;
		initializeVersionsPresenter;
		initializePreviewPresenter;
		initializeButtonBar
	


]

{ #category : #initialization }
CMOpenProjectWindow >> initializePreviewPresenter [

		
	self previewPresenter image: self currentWorld submorphs last form
]

{ #category : #initialization }
CMOpenProjectWindow >> initializeProjectsPresenter [

	projectsListPresenter 
		display: [ : fileRef | fileRef asCormasProjectName ];
		sortingBlock: [ :a :b | a asCormasProjectName < b asCormasProjectName ]
]

{ #category : #initialization }
CMOpenProjectWindow >> initializeVersionsPresenter [

	versionsListPresenter 
		display: [ :item | item userProvidedName ].


]

{ #category : #initialization }
CMOpenProjectWindow >> locationSelectorFor: locationId [

	^ self cormasLocations at: locationId
]

{ #category : #accessing }
CMOpenProjectWindow >> metaInfoPresenter [
	^ metaInfoPresenter
]

{ #category : #accessing }
CMOpenProjectWindow >> previewPresenter [
	^ previewPresenter
]

{ #category : #callbacks }
CMOpenProjectWindow >> projectsBrowse [
	
	^ CMResourceLocator cormasHomeProjects
]

{ #category : #callbacks }
CMOpenProjectWindow >> projectsDemos [
	" Answer a <Collection> of <FileReference> in the default built-in location "
	
	^ CMResourceLocator demosPath allChildrenMatching: '*.' , CMProjectModel projectFileExtension
]

{ #category : #initialization }
CMOpenProjectWindow >> projectsFor: locationId [

	^ self perform: (self locationSelectorFor: locationId).
]

{ #category : #callbacks }
CMOpenProjectWindow >> projectsInImage [
	" Answer a <Collection> of <CMProjectModel> for the models in the current image "

	^ CMAbstractModel subclasses collect: [ : cmModelClass |
		CMProjectModel forModel: cmModelClass ]
]

{ #category : #accessing }
CMOpenProjectWindow >> projectsListPresenter [
	^ projectsListPresenter
]

{ #category : #accessing }
CMOpenProjectWindow >> projectsLocationsPresenter [
	^ projectsLocationsPresenter
]

{ #category : #initialization }
CMOpenProjectWindow >> setFocus [

	self focusOrder
		add: projectsListPresenter;
		add: versionsListPresenter;
		add: metaInfoPresenter
]

{ #category : #accessing }
CMOpenProjectWindow >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMOpenProjectWindow >> versionsListPresenter [
	^ versionsListPresenter
]
