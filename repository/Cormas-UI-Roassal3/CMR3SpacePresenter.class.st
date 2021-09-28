"
This is the main container for Space Interface. It holds a Roassal presenter and manages menu instantiation and configuration.

Internal Representation and Key Implementation Points.

Instance Variables
	diagram:		<Object>
	menuToolbar:		<Object>
	projectManager:		<Object>
	spaceView:		<Object>


    Implementation Points
"
Class {
	#name : #CMR3SpacePresenter,
	#superclass : #SpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'projectManager',
		'spaceView',
		'diagram',
		'menuToolbar'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #specs }
CMR3SpacePresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
			add: #menuToolbar height: self toolbarHeight;
			add: #diagram;
			yourself
]

{ #category : #'instance creation' }
CMR3SpacePresenter class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMR3SpacePresenter class >> openFor: aCMProjectManager [
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		yourself
]

{ #category : #initialization }
CMR3SpacePresenter >> appSettingsClass [ 

	^ CMApplicationPreferences
]

{ #category : #accessing }
CMR3SpacePresenter >> buildExportFilenameWithExtension: aString [ 
	" Answer a timestamped <String> representing the receiver's exported canvas "
	
	^ String streamContents: [ : stream |
			stream 
				<< self cormasModel friendlyName;
				<< '-Space-';
				<< DateAndTime now asFileNameCompatibleString;
				<< $.;
				<< aString ]
]

{ #category : #accessing }
CMR3SpacePresenter >> canvas [
	" Private - Answer a <RSCanvas> "

	^ self diagram canvas
]

{ #category : #private }
CMR3SpacePresenter >> closeAfterCreateProject [
	^ true
]

{ #category : #accessing }
CMR3SpacePresenter >> cormasModel [
	" Answer the receiver's <CMAbstractModel> "

	^ self projectManager cormasModel.
]

{ #category : #'submorphs - add/remove' }
CMR3SpacePresenter >> delete [ 

	'Space Presenter: Unsubscribing diagram before deleting presenter...' traceCr.
	self projectAnnouncer unsubscribe: self diagram.
	super delete.
]

{ #category : #accessing }
CMR3SpacePresenter >> diagram [

	^ diagram
]

{ #category : #accessing }
CMR3SpacePresenter >> diagram: anObject [

	diagram := anObject
]

{ #category : #initialization }
CMR3SpacePresenter >> exportSpaceWith: aRSExporter [
	" Private - Export the receiver's canvas using aRSExporter "

	| outFileRef |
	
	outFileRef := (self buildExportFilenameWithExtension: aRSExporter extension) asFileReference.
	aRSExporter 
		canvas: self canvas;
		exportToFile: outFileRef.
	self inform: (outFileRef exists
		ifTrue: [ 'Exported to file: ' , outFileRef fullName ]
		ifFalse: [ 'Failed exporting the space : ' , aRSExporter asString ])
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeCanvasInteractions [

	self canvas
		addInteraction: RSCanvasController new;
		addInteraction: RSZoomToFitCanvasInteraction new;
		addInteraction: RSZoomableCanvasInteraction new;
		addInteraction: RSKeyNavigationCanvasInteraction new
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeDiagram [
	" Private - Create the configured receiver's diagram "
	
	diagram := self
		           instantiate: self appSettingsClass settingSpaceViewer
		           on: self cormasModel.
	self projectAnnouncer
		when: CMSChangePoVAnnouncement 
		send: #setAndRefreshActivePovs
		to: self diagram.
	
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeDisplaysMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tInfo;
						subMenu: self subMenuForInfo ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tSpatialDelimitor;
						subMenu: self subMenuForSpatialDelimitor ];
			addItem: [ : item | 
					item 
						name: self translator tTime;
						subMenu: self subMenuForTime ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tCellVsAggregates;
						subMenu: self subMenuForCellVsAggregates ] ]
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeEnvironmentMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tNew;
						subMenu: self subMenuForNew ];
				addItem: [ : item | 
					item 
						name: self translator tLoad;
						subMenu: self subMenuForLoad ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tModify;
						subMenu: self subMenuForModify ];
				addItem: [ : item | 
					item 
						name: self translator tReOpen;
						action: [ self reOpen ] ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tClose;
						action: [ self delete ] ] ]
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeExportMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu addGroup: [ : group | 
		group
			addItem: [ :item | 
				item
					name: 'PDF';
					action: [ self exportSpaceWith: RSPDFExporter new ] ];
			addItem: [ :item | 
				item
					name: 'SVG';
					action: [ self exportSpaceWith: RSSVGExporter new ] ];
			addItem: [ :item | 
				item
					name: 'PNG';
					action: [ self exportSpaceWith: RSPNGExporter new ] ] ];
			yourself
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeOptionMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tUnmoveableZoom;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tMoveableZoom;
						action: [  ] ] ];
		addGroup: [ : group |
			group
				addItem: [ : item | 
					item 
						name: self translator tSetTrackLength;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tEnableUndoRedo;
						action: [  ] ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tTouchpad;
						action: [  ] ] ];
		yourself

]

{ #category : #initialization }
CMR3SpacePresenter >> initializePOVMenuToolbar [
	" Private - See superimplementor's commen "

	| cormasModel |
	cormasModel := self projectManager cormasModel.
	^ self newMenu
		addGroup: [ :group | 
			cormasModel class socialClasses
				do: [ :socialClass | 
					group
						addItem: [ :item | 
							item
								name: socialClass name;
								subMenu: (self subMenuForClassPov: socialClass) ] ] ];
		addGroup: [ :group | 
			cormasModel class spatialClasses_sorted
				do: [ :spatialClasse | 
					group
						addItem: [ :item | 
							item
								name: spatialClasse name;
								subMenu: (self subMenuForClassPov: spatialClasse) ] ] ];
		addGroup: [ :group | 
			cormasModel class passiveObjectClasses
				do: [ :passiveClass | 
					group
						addItem: [ :item | 
							item
								name: passiveClass name;
								subMenu: (self subMenuForClassPov: passiveClass) ] ] ]
]

{ #category : #initialization }
CMR3SpacePresenter >> initializePresenters [
	" Private - See superimplementor's comment "

	menuToolbar := self mainMenuToolbar.
	self initializeDiagram.
	self initializeCanvasInteractions
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeToolsMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: self translator tDisplayLegends;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: self translator tPhoto;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: self translator tVideo;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: self translator tManipulateInstances;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: self translator tCreateInstances;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: self translator tPreferences;
						action: [ CMSpaceSettingsBrowser openFor: self ] ];
					
				addItem: [ :item | 
					item
						name: self translator tInspectModel;
						icon: (self iconNamed: #smallObjects);
						shortcut: $I command;
						action: [ self cormasModel inspect ] ] ];
		yourself
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeWindow: w [

	w 
		title: self initializeWindowTitle;
		initialExtent: 800 @ 500;
		whenClosedDo: [ self projectAnnouncer unsubscribe: self ];
		centered
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeWindowTitle [

	^ String streamContents: [ : stream |
		stream
			<< self formattedWindowTitle;
			<< ' - ';
			<< self translator tSpaceInterface;
			space;
			<< self spaceModel humanReadableString ].
]

{ #category : #'initialization - menu' }
CMR3SpacePresenter >> mainMenuToolbar [
	" Private - See superimplementor's commen "

	| aMenu |
	
	aMenu := self newMenuBar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: self translator tEnvironment;
						subMenu: self initializeEnvironmentMenuToolbar ];
				addItem: [ :item | 
					item
						name: self translator tPoV;
						subMenu: self initializePOVMenuToolbar ];
				addItem: [ :item | 
					item
						name: self translator tOptions;
						subMenu: self initializeOptionMenuToolbar ];
				addItem: [ :item | 
					item
						name: self translator tTools;
						subMenu: self initializeToolsMenuToolbar ];
				addItem: [ :item | 
					item
						icon: (self iconNamed: #glamorousZoomToFit);
						action: [ 
							self canvas camera zoomToFit.
							self canvas signalUpdate ] ];
				addItem: [ :item | 
					item
						icon: (self iconNamed: #glamorousSave);
						subMenu: self initializeExportMenuToolbar ] ].
	^ aMenu
]

{ #category : #accessing }
CMR3SpacePresenter >> menuToolbar [

	^ menuToolbar
]

{ #category : #accessing }
CMR3SpacePresenter >> menuToolbar: anObject [

	menuToolbar := anObject
]

{ #category : #initialization }
CMR3SpacePresenter >> projectAnnouncer [

	^ self cormasModel projectAnnouncer
]

{ #category : #accessing }
CMR3SpacePresenter >> projectManager [

	^ projectManager
]

{ #category : #accessing }
CMR3SpacePresenter >> projectManager: anObject [

	projectManager := anObject
]

{ #category : #accessing }
CMR3SpacePresenter >> spaceModel [
	" Answer a <CMSpaceModel>, the receiver's model configured space "
	
	^ self cormasModel spaceModel
]

{ #category : #accessing }
CMR3SpacePresenter >> spaceView [
	^ spaceView
]

{ #category : #accessing }
CMR3SpacePresenter >> spaceView: anObject [
	spaceView := anObject
]

{ #category : #private }
CMR3SpacePresenter >> subMenuForClassPov: aClass [

	^ self newMenu addGroup: [ :group | 
		(aClass methodsInProtocol: #pov) do: [ :povName | 
			group addItem: [ :item | 
				item
					name: povName selector;
					action: [ self diagram setAndRefreshActivePovSelectorOf: aClass with: item name ] ] ] ]
]

{ #category : #private }
CMR3SpacePresenter >> subMenuForLoad [
	
	^ MenuModel new
]

{ #category : #private }
CMR3SpacePresenter >> subMenuForModify [

	^ MenuModel new
]

{ #category : #private }
CMR3SpacePresenter >> subMenuForNew [

	^ self newMenu
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tGridSize;
						action: [ self openDimensionChooser ] ] ]
]

{ #category : #accessing }
CMR3SpacePresenter >> translator [
	" Answer the receiver's <PFTranslator> "

	^ self projectManager translator.
]
