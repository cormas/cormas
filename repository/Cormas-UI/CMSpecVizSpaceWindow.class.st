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
	#name : #CMSpecVizSpaceWindow,
	#superclass : #PFStandardProjectWindow,
	#instVars : [
		'spaceView',
		'specSpaceView'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecVizSpaceWindow class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				add: #menuToolbar height: self toolbarHeight;
				add: #specSpaceView ];
		yourself
]

{ #category : #'instance creation' }
CMSpecVizSpaceWindow class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMSpecVizSpaceWindow class >> openFor: aCMProjectManager [
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #private }
CMSpecVizSpaceWindow >> closeAfterCreateProject [
	^ true
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> initializeApplication [

	self applicationClass: CMApplicationProject
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> initializeDisplaysMenuToolbar [
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
CMSpecVizSpaceWindow >> initializeEnvironmentMenuToolbar [
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
CMSpecVizSpaceWindow >> initializeMenuToolbar [
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
						subMenu: self initializeToolsMenuToolbar ] ].
	menuToolbar applyTo: self
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> initializeOptionMenuToolbar [
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
CMSpecVizSpaceWindow >> initializePOVMenuToolbar [
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
CMSpecVizSpaceWindow >> initializePresenter [
	super initializePresenter.
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> initializeToolsMenuToolbar [
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
						name: 'inspect';
						action: [ self inspect ] ] ];
		yourself
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> initializeWidgets [
	" Private - See superimplementor's comment "

	self initializeApplication.
	super initializeWidgets.
	self specSpaceView: (self instantiate: CMSimGridWidgetModel).	
]

{ #category : #private }
CMSpecVizSpaceWindow >> projectClass [
	^ CMProjectManager
]

{ #category : #accessing }
CMSpecVizSpaceWindow >> spaceView [
	^ spaceView
]

{ #category : #accessing }
CMSpecVizSpaceWindow >> spaceView: anObject [
	spaceView := anObject
]

{ #category : #accessing }
CMSpecVizSpaceWindow >> specSpaceView [
	^ specSpaceView
]

{ #category : #accessing }
CMSpecVizSpaceWindow >> specSpaceView: anObject [
	specSpaceView := anObject
]

{ #category : #'as yet unclassified' }
CMSpecVizSpaceWindow >> subMenuForClassPov: aClass [
	^ MenuModel new
		addGroup: [ :group | 
			(aClass methodsInProtocol: #pov)
				do: [ :povName | 
					group
						addItem: [ :item | 
							item
								name: povName selector;
								action: [ "Changer le pov de cette classe dans la vue spaceView.." ] ] ] ]
]

{ #category : #private }
CMSpecVizSpaceWindow >> subMenuForLoad [
	
	^ MenuModel new
]

{ #category : #private }
CMSpecVizSpaceWindow >> subMenuForModify [

	^ MenuModel new
]

{ #category : #private }
CMSpecVizSpaceWindow >> subMenuForNew [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tGridSize;
						action: [ self openDimensionChooser ] ] ]
]

{ #category : #initialization }
CMSpecVizSpaceWindow >> title [
	^ 'CORMAS - Visualization Space'
]
