"
CMOpenProjectWindow new openWithSpec
"
Class {
	#name : #CMSpOpenProjectPresenter,
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
CMSpOpenProjectPresenter class >> defaultSpec [

	<spec>
	^ SpBoxLayout newHorizontal
		  add: (SpBoxLayout newVertical
				   add: #projectsLocationsPresenter
				   withConstraints: [ :constraints | 
					   constraints height: self toolbarHeight ];
				   add: #projectsListPresenter);
		  add: (SpPanedLayout newVertical
				   positionOfSlider: 45 percent;
				   add: (SpBoxLayout newHorizontal
						    add: #versionsListPresenter
						    withConstraints: [ :constraints | constraints width: 150 ];
						    add: #previewPresenter;
						    yourself);
				   add: (SpBoxLayout newVertical
						    add: #metaInfoPresenter;
						    add: #toolbar
						    withConstraints: [ :constraints | 
							    constraints height: self toolbarHeight ];
						    yourself))
]

{ #category : #examples }
CMSpOpenProjectPresenter class >> example [
	<example>

	CMSpOpenProjectPresenter new openWithSpec
]

{ #category : #specs }
CMSpOpenProjectPresenter class >> specSpecPharo8 [

	<spec>
	^ SpBoxLayout newHorizontal 
		add: (
			SpBoxLayout newVertical
				add: #projectsLocationsPresenter withConstraints: [ :constraints | constraints height: self toolbarHeight ];
				add: #projectsListPresenter);
		add:
			(SpPanedLayout newVertical
				position: 45 percent;
				add: (SpBoxLayout newHorizontal
					add: #versionsListPresenter withConstraints: [ :constraints | constraints width: 150 ];
					add: #previewPresenter;
					yourself);
				add: (SpBoxLayout newVertical
					add: #metaInfoPresenter;
					add: #toolbar withConstraints: [ :constraints | constraints height: self toolbarHeight ];
					yourself))
]

{ #category : #specs }
CMSpOpenProjectPresenter class >> title [
	^ 'CORMAS - Open project'
]

{ #category : #callbacks }
CMSpOpenProjectPresenter >> connectPresenters [ 
	" Private - See superimplementor's comment "

	projectsListPresenter
		transmitTo: versionsListPresenter
		transform: [ : aCormasObject | aCormasObject definedCormasVersions ]
		postTransmission: [ :destination | destination selectIndex: 1 ];
		
		transmitTo: previewPresenter
"		transform: [ : fileReference | CMProjectOpener demoImageFromProjectFile: fileReference ]"
		transform: [ : anObject | anObject cormasDemoImage ]
		postTransmission: [ :destination | destination adapter buildWidget ].

	versionsListPresenter 
		whenSelectionChangedDo: [ :aSelection | metaInfoPresenter selectedModel: aSelection selectedItem ].	

]

{ #category : #private }
CMSpOpenProjectPresenter >> cormasLocations [
	" Private - Answer a <Dictionary> of CORMAS project opening locations along with a <Closure> specifying the action to retrieve the projects for each location "

	^ OrderedDictionary newFromPairs: { 
		'Demos'	 		. [ self projectsDemos ] .
		'In-image' 		. [ self projectsInImage ].
		'Browse...'  	. [ self projectsBrowse ]
		}
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> cormasProjects [
	^ cormasProjects
		ifNil: [ cormasProjects := self defaultCormasProjects ]
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> cormasProjects: anObject [
	cormasProjects := anObject
]

{ #category : #defaults }
CMSpOpenProjectPresenter >> defaultCormasProjects [
	" Answer a <Collection> of <CMProjectModel> "
	
	^ #()
]

{ #category : #private }
CMSpOpenProjectPresenter >> defaultSpecSelector [

	^ SystemVersion current major = 8
		ifTrue: [ #specSpecPharo8 ]
		ifFalse: [ #defaultSpec ]
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ (800 @ 700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
CMSpOpenProjectPresenter >> initializeButtonBar [

	self toolbar
     add: (self newButton
                    label: self translator tCancel;
                    icon: (self iconNamed: #smallCancel);
                    action: [ self delete ] );
		add: (self newButton
                    label: self translator tHelp;
                    icon: (self iconNamed: #help);
                    action: [ self openProjectHelp ]);
		add: (self newButton
                    label: self translator tOk;
                    icon: (self iconNamed: #smallOk);
                    action: [ 
							self 
								openSelectedProject;
								delete.  ] )

]

{ #category : #initialization }
CMSpOpenProjectPresenter >> initializeLocationsPresenter [
	
	projectsLocationsPresenter  
		items: self cormasLocations keys;
		transmitTo: projectsListPresenter
		transform: [ : locationId | self projectsFor: (self locationIdentifierFor: locationId) ];
		"postTransmission: [ :destination :origin | destination selectIndex: 1 ];"
		selectIndex: 1.
]

{ #category : #initialization }
CMSpOpenProjectPresenter >> initializePresenters [

	projectsLocationsPresenter := self newDropList.
	projectsListPresenter := self newList.
	versionsListPresenter := self newList.
	metaInfoPresenter := self instantiate: CMSpOpenProjectNotebookPresenter. "self newText".
	previewPresenter := self newMorph.
	toolbar := self newButtonBar.
	self setFocus.
	
	self 
		initializeLocationsPresenter;
		initializeProjectsPresenter;
		initializeVersionsPresenter;
		initializeButtonBar
	


]

{ #category : #initialization }
CMSpOpenProjectPresenter >> initializeProjectsPresenter [
	" #enableItemSubstringFilter will be removed: Do a component  with a list and a text field, you subscribe to text change, you apply filter and update list items. So you do not add behaviour to a SpListPresenter, you create a presenter (say “ListWithFilterPresenter”) that combines two low level presenters, in pure Spec spirit "

	projectsListPresenter 
		"enableItemSubstringFilter;"
		display: [ : fileRef | fileRef asCormasProjectName ];
		sortingBlock: [ :a :b | a asCormasProjectName < b asCormasProjectName ]
]

{ #category : #initialization }
CMSpOpenProjectPresenter >> initializeVersionsPresenter [
	" #enableItemSubstringFilter will be removed: Do a component  with a list and a text field, you subscribe to text change, you apply filter and update list items. So you do not add behaviour to a SpListPresenter, you create a presenter (say “ListWithFilterPresenter”) that combines two low level presenters, in pure Spec spirit "
	
	versionsListPresenter
		"enableItemSubstringFilter;"
		display: [ :item | item userProvidedName ].


]

{ #category : #private }
CMSpOpenProjectPresenter >> locationIdentifierFor: locId [
	" Temporary patch for backward compatibility with Pharo 8. To be removed "
	
	^ locId isString ifTrue: [ locId ] ifFalse: [ locId model ]
]

{ #category : #private }
CMSpOpenProjectPresenter >> locationSelectorFor: locationId [

	^ self cormasLocations at: locationId
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> metaInfoPresenter [
	^ metaInfoPresenter
]

{ #category : #callbacks }
CMSpOpenProjectPresenter >> openSelectedProject [
	" Private - Callback for the Ok to open button in the Open Project Dialog "

	^ self projectManager openProject: self selectedProject.
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> previewPresenter [
	^ previewPresenter
]

{ #category : #callbacks }
CMSpOpenProjectPresenter >> projectsBrowse [
	
	^ CMResourceLocator cormasHomeProjects
]

{ #category : #callbacks }
CMSpOpenProjectPresenter >> projectsDemos [
	" Answer a <Collection> of <FileReference> in the default built-in location "
	
	^ CMResourceLocator demosPath allChildrenMatching: '*.' , CMProjectModel projectFileExtension
]

{ #category : #private }
CMSpOpenProjectPresenter >> projectsFor: locationId [

	^ (self locationSelectorFor: locationId) value.
]

{ #category : #callbacks }
CMSpOpenProjectPresenter >> projectsInImage [
	" Answer a <Collection> of <CMProjectModel> for the models in the current image "

	^ CMAbstractModel subclasses collect: [ : cmModelClass |
		CMProjectModel forModel: cmModelClass ]
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> projectsListPresenter [
	^ projectsListPresenter
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> projectsLocationsPresenter [
	^ projectsLocationsPresenter
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> selectedProject [
	" Answer a <FileReference> of the currently selected project in the receiver "
	
	^ self projectsListPresenter selection selectedItem.
]

{ #category : #private }
CMSpOpenProjectPresenter >> setFocus [

	self focusOrder
		add: projectsListPresenter;
		add: versionsListPresenter;
		add: metaInfoPresenter
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMSpOpenProjectPresenter >> versionsListPresenter [
	^ versionsListPresenter
]
