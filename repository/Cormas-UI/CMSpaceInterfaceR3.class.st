Class {
	#name : #CMSpaceInterfaceR3,
	#superclass : #SpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'projectManager',
		'spaceView',
		'diagram',
		'menuToolbar'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpaceInterfaceR3 class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
			add: #menuToolbar height: self toolbarHeight;
			add: #diagram;
			yourself
]

{ #category : #'instance creation' }
CMSpaceInterfaceR3 class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMSpaceInterfaceR3 class >> openFor: aCMProjectManager [
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		yourself
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> canvas [
	" Private - Answer a <RSCanvas> "

	^ self diagram canvas
]

{ #category : #private }
CMSpaceInterfaceR3 >> closeAfterCreateProject [
	^ true
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> cormasModel [
	" Answer the receiver's <CMAbstractModel> "

	^ self projectManager cormasModel.
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> diagram [

	^ diagram
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> diagram: anObject [

	diagram := anObject
]

{ #category : #initialization }
CMSpaceInterfaceR3 >> initializeDisplaysMenuToolbar [
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
CMSpaceInterfaceR3 >> initializeEnvironmentMenuToolbar [
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
						action: [ self close ] ] ]
]

{ #category : #initialization }
CMSpaceInterfaceR3 >> initializeExportMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup:
			[ :group | 
			group
				addItem: [ :item | 
					item
						name: 'HTML';
						action: [ RTHTML5Exporter interactiveExport: self spaceView ] ];
				addItem: [ :item | 
					item
						name: 'SVG';
						action: [ RTSVGExporter interactiveExportViewAsSVG: self spaceView ] ];
				addItem: [ :item | 
					item
						name: 'PNG';
						action: [ RTPNGExporter new
								builder: self spaceView;
								fileName: 'spaceView.png';exportToFile ] ] ] yourself
]

{ #category : #initialization }
CMSpaceInterfaceR3 >> initializeOptionMenuToolbar [
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
CMSpaceInterfaceR3 >> initializePOVMenuToolbar [
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
CMSpaceInterfaceR3 >> initializePresenters [

	menuToolbar := self mainMenuToolbar.
	diagram := self instantiate: CMR3SpaceView.
	self diagram initializeOn: self cormasModel.
 	self canvas 
		addInteraction: RSCanvasController new;
		addInteraction: RSZoomToFitCanvasInteraction new;
		addInteraction: RSZoomableCanvasInteraction new;
		addInteraction: RSKeyNavigationCanvasInteraction new.
]

{ #category : #initialization }
CMSpaceInterfaceR3 >> initializeToolsMenuToolbar [
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
						name: self translator tClickTo;
						action: [  ] ];
					
				addItem: [ :item | 
					item
						name: self translator tInspectModel;
						icon: (self iconNamed: #smallObjects);
						shortcut: $I command;
						action: [ self cormasModel inspect ] ] ];
		yourself
]

{ #category : #'initialization - menu' }
CMSpaceInterfaceR3 >> mainMenuToolbar [
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
						action: [ self spaceView canvas focusOnCenterScaled.
							self spaceView signalUpdate ] ];
				addItem: [ :item | 
					item
						icon: (self iconNamed: #glamorousSave);
						subMenu: self initializeExportMenuToolbar ] ].
	^ aMenu
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> menuToolbar [

	^ menuToolbar
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> menuToolbar: anObject [

	menuToolbar := anObject
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> projectManager [

	^ projectManager
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> projectManager: anObject [

	projectManager := anObject
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> spaceView [
	^ spaceView
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> spaceView: anObject [
	spaceView := anObject
]

{ #category : #private }
CMSpaceInterfaceR3 >> subMenuForClassPov: aClass [
	^ self newMenu 
		addGroup: [ :group | 
			(aClass methodsInProtocol: #pov)
				do: [ :povName | 
					group
						addItem: [ :item | 
							item
								name: povName selector;
								action: [ self diagram setAndRefreshActivePovSelectorOf: aClass with: item name.
									" Changer le pov de cette classe dans la vue spaceView. en utilisant l'argument (item name) " ] ] ] ]
]

{ #category : #private }
CMSpaceInterfaceR3 >> subMenuForLoad [
	
	^ MenuModel new
]

{ #category : #private }
CMSpaceInterfaceR3 >> subMenuForModify [

	^ MenuModel new
]

{ #category : #private }
CMSpaceInterfaceR3 >> subMenuForNew [

	^ self newMenu
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tGridSize;
						action: [ self openDimensionChooser ] ] ]
]

{ #category : #accessing }
CMSpaceInterfaceR3 >> translator [
	" Answer the receiver's <PFTranslator> "

	^ self projectManager translator.
]
