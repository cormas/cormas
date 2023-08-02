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
		'cormasModel',
		'translator',
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
CMR3SpacePresenter class >> openForModel: aCormasModel withTranslator: aTranslator [

	^ self basicNew 
		cormasModel: aCormasModel;
		translator: aTranslator;
		initialize;
		openWithSpec;
		yourself
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

{ #category : #accessing }
CMR3SpacePresenter >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMR3SpacePresenter >> cormasModel: anObject [

	cormasModel := anObject
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

	self canvas addInteraction: RSCanvasController new.
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeDiagram [
	" Private - Create the configured receiver's diagram "
		
	diagram := CMR3SpaceDiagramBuilder new
		cormasModel: self cormasModel;
		asPresenter.
		
	diagram owner: self.
	self update.
	
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeEvents [

	self projectAnnouncer
		when: CMSChangePoVAnnouncement 
		do: [ self initializeDiagram ].
		
	self projectAnnouncer
		when: CMTimeChangedAnnouncement
		do: [ self initializeDiagram ].
			
	"self projectAnnouncer
		when: CMSimulationInitializationAnnouncement
		do: [ self timeChanged: 0 ]"
		
		

]

{ #category : #'initialization - menu' }
CMR3SpacePresenter >> initializeExportMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu addGroup: [ : group | 
		group
			addItem: [ :item | 
				item
					name: 'PDF';
					action: [ self exportSpaceWith: RSPDFCairoExporter new ] ];
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

{ #category : #'initialization - menu' }
CMR3SpacePresenter >> initializePOVMenuToolbar [
	" Private - See superimplementor's commen "

	| cormasModel |
	cormasModel := self cormasModel.
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
	self initializeCanvasInteractions.
	self initializeEvents.
]

{ #category : #'initialization - menu' }
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
						name: self translator tInspectModel;
						icon: (self iconNamed: #smallObjects);
						shortcut: $I command;
						action: [ self cormasModel inspect ] ] ];
		yourself
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeWindow: aWindow [
	" Private - This method is sent by the Spec2 Framework "

	aWindow 
		title: self initializeWindowTitle;
		initialExtent: 800 @ 500;
		whenWillCloseDo: [
			aWindow isDisplayed
				ifTrue: [
					self release.
					self defer: [ 3 timesRepeat: [ Smalltalk garbageCollect ] ].
				] ];
		centered
]

{ #category : #initialization }
CMR3SpacePresenter >> initializeWindowTitle [

	^ String streamContents: [ : stream |
		stream
			<< 'CORMAS';
			<< ' - ';
			<< self cormasModel class cormasModelName;
			<< ' - ';
			<< self translator tSpaceInterface;
			space;
			<< self cormasModel spaceModel humanReadableString ].
]

{ #category : #'initialization - menu' }
CMR3SpacePresenter >> mainMenuToolbar [
	" Private - See superimplementor's commen "

	| aMenu |
	
	aMenu := self newMenuBar
		addGroup: [ :group | 
			group
"				addItem: [ :item | 
					item
						name: self translator tEnvironment;
						subMenu: self initializeEnvironmentMenuToolbar ];"
				addItem: [ :item | 
					item
						name: self translator tPoV;
						subMenu: self initializePOVMenuToolbar ];
"				addItem: [ :item | 
					item
						name: self translator tOptions;
						subMenu: self initializeOptionMenuToolbar ];"
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
						icon: (self iconNamed: #smallSave);
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

{ #category : #accessing }
CMR3SpacePresenter >> projectAnnouncer [

	^ self cormasModel projectAnnouncer
]

{ #category : #private }
CMR3SpacePresenter >> subMenuForClassPov: aClass [

	^ self newMenu addGroup: [ :group | 
		(aClass methodsInProtocol: #pov) do: [ :povName | 
			group addItem: [ :item | 
				item
					name: povName selector;
					action: [ 
						self cormasModel spaceModel activePoVsDictionary at: aClass put: item name.
						self initializeDiagram ] ] ] ]
]

{ #category : #accessing }
CMR3SpacePresenter >> translator [

	^ translator.
]

{ #category : #accessing }
CMR3SpacePresenter >> translator: anObject [

	translator := anObject
]
