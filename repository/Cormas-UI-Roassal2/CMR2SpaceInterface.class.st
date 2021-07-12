"
CMSpecVizSpaceWindow new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points

| menuModel |
	
menuModel := CGStSpcMenuBuilder new 
	generateGroupSubMenuItems: 
		#(
		#(#Info #Track) 
		#(#SpatialDelimitor #Time #Background)
		#(#CellVsAggregates)
		).
Smalltalk tools workspace 
	openContents: menuModel 
	label: 'MenuModel Generator'.

"
Class {
	#name : #CMR2SpaceInterface,
	#superclass : #PFStandardProjectWindow,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'spaceView',
		'specSpaceView'
	],
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #specs }
CMR2SpaceInterface class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				add: #menuToolbar height: self toolbarHeight;
				add: #specSpaceView];
		yourself
]

{ #category : #'instance creation' }
CMR2SpaceInterface class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMR2SpaceInterface class >> openFor: aCMProjectManager [
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		yourself
]

{ #category : #private }
CMR2SpaceInterface >> closeAfterCreateProject [
	^ true
]

{ #category : #accessing }
CMR2SpaceInterface >> cormasModel [
	" Answer the receiver's model, a subclass of <CMAbstractModel> "

	^ self projectManager cormasModel
]

{ #category : #initialization }
CMR2SpaceInterface >> initializeApplication [

	self applicationClass: CMApplicationProject
]

{ #category : #initialization }
CMR2SpaceInterface >> initializeDisplaysMenuToolbar [
	" Private - See superimplementor's commen "

	^ MenuModel new
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
CMR2SpaceInterface >> initializeEnvironmentMenuToolbar [
	" Private - See superimplementor's commen "

	^ MenuModel new
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
CMR2SpaceInterface >> initializeExportMenuToolbar [
	" Private - See superimplementor's commen "

	^ MenuModel new
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
CMR2SpaceInterface >> initializeMenuToolbar [
	" Private - See superimplementor's commen "

	menuToolbar := MenuModel new
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
						icon:
							(self iconNamed: #glamorousZoomIn);
						action: [ RTZoomInMove on: self spaceView ] ];
				addItem: [ :item | 
					item
						icon:
							(self iconNamed: #glamorousZoomOut);
						action: [ RTZoomOutMove on: self spaceView ] ];
				addItem: [ :item | 
					item
						icon:
							(self iconNamed: #glamorousZoomToFit);
						action: [ self spaceView canvas focusOnCenterScaled.
							self spaceView signalUpdate ] ];
				addItem: [ :item | 
					item
						icon:
							(self iconNamed: #glamorousSave);
						subMenu: self initializeExportMenuToolbar ] ].
	menuToolbar applyTo: self
]

{ #category : #initialization }
CMR2SpaceInterface >> initializeOptionMenuToolbar [
	" Private - See superimplementor's commen "

	^ MenuModel new
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
CMR2SpaceInterface >> initializePOVMenuToolbar [
	" Private - See superimplementor's commen "

	| cormasModel |
	cormasModel := self projectManager cormasModel.
	^ MenuModel new
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
CMR2SpaceInterface >> initializePresenter [
	super initializePresenter.
]

{ #category : #initialization }
CMR2SpaceInterface >> initializeToolsMenuToolbar [
	" Private - See superimplementor's commen "

	^ MenuModel new
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

{ #category : #initialization }
CMR2SpaceInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	self initializeApplication.
	super initializeWidgets.
	self specSpaceView: (self instantiate: CMR2SimGridWidgetModel).	
]

{ #category : #private }
CMR2SpaceInterface >> projectClass [
	^ CMProjectManager
]

{ #category : #accessing }
CMR2SpaceInterface >> spaceView [
	^ spaceView
]

{ #category : #accessing }
CMR2SpaceInterface >> spaceView: anObject [
	spaceView := anObject
]

{ #category : #accessing }
CMR2SpaceInterface >> specSpaceView [
	^ specSpaceView
]

{ #category : #accessing }
CMR2SpaceInterface >> specSpaceView: anObject [
	specSpaceView := anObject
]

{ #category : #private }
CMR2SpaceInterface >> subMenuForClassPov: aClass [
	^ MenuModel new
		addGroup: [ :group | 
			(aClass methodsInProtocol: #pov) do: [ :povName | 
				group addItem: [ :item | 
					item
						name: povName selector;
						action: [ 
								self spaceView 
									setAndRefreshActivePovSelectorOf: aClass 
									with: item name." Changer le pov de cette classe dans la vue spaceView. en utilisant l'argument (item name) " ] ] ] ]
]

{ #category : #private }
CMR2SpaceInterface >> subMenuForLoad [
	
	^ MenuModel new
]

{ #category : #private }
CMR2SpaceInterface >> subMenuForModify [

	^ MenuModel new
]

{ #category : #private }
CMR2SpaceInterface >> subMenuForNew [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tGridSize;
						action: [ self openDimensionChooser ] ] ]
]

{ #category : #initialization }
CMR2SpaceInterface >> title [
	" Private - See superimplementor's comment "

	^ self formattedWindowTitle: 'Visualization Space'
]
