Class {
	#name : #CMR3SpaceDiagram,
	#superclass : #CMSpRoassalPresenter,
	#instVars : [
		'cellSize',
		'situatedEntitiesViews',
		'origin',
		'speed',
		'cellViews',
		'layoutClass',
		'elemClass',
		'sevClass',
		'activePoVsDictionary',
		'scaleInterpolator',
		'theCellViews',
		'leftClickActionBlock'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #'instance creation' }
CMR3SpaceDiagram class >> newOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	^ instance
]

{ #category : #'instance creation' }
CMR3SpaceDiagram class >> openOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	instance openWithToolbar.
	^ instance
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> activePoVSelectorAtClass: aClass [
	" Answer a <Symbol> which is a selector to access the PoV of an entity of aClass "

	^ self activePoVsDictionary at: aClass ifAbsent: [ 
			self halt.
			aClass superClassesUntilEntity  
				ifEmpty: [ Color gray ] 
				ifNotEmpty: [ #pov ] ]
	
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> activePoVsDictionary [
	" Each presenter could have customized PoV's. If this Dictionary is empty, we use the PoV's defined in the receiver's space model "

	activePoVsDictionary ifNil: [ activePoVsDictionary := Dictionary new ].
	^ activePoVsDictionary ifEmpty: [ activePoVsDictionary := self defaultActivePoVs ]
]

{ #category : #accessing }
CMR3SpaceDiagram >> activePoVsDictionary: anObject [

	activePoVsDictionary := anObject
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> activeSpatialEntityPov [
	" Answer a <Symbol> representing the selector of the active PoV which is a Spatial Entity "
	
	| spatialEntitySelections |
	
	spatialEntitySelections := self activePoVsDictionary associationsSelect: [ : assoc | assoc key isKindOf: CMSpatialEntityElement class ].
	^ spatialEntitySelections size = 1
		ifTrue: [ spatialEntitySelections anyOne value ]
		ifFalse: [ spatialEntitySelections ifEmpty: [ #pov ] ifNotEmpty: [ self error ] ]
]

{ #category : #refreshing }
CMR3SpaceDiagram >> addNewSituatedEntities [

	| newSituatedEntities newSituatedEntitiesViews |
	newSituatedEntities := self cormasModel allTheSituatedEntities reject: [ :a | (situatedEntitiesViews collect: #model) includes: a ].
	newSituatedEntitiesViews := newSituatedEntities collect: [ : se | self newSEViewForModel: se ].
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self canvas addAll: newSituatedEntitiesViews.
	newSituatedEntitiesViews do: [ :nse | nse @ RSDraggable ]
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> addViewForAgent: atse [
	" Private - Create a view for each agent in aCollectionOfEntities and add it to the receiver's canvas "

	cellSize := self canvas encompassingRectangle extent / self cormasModel spaceModel dimensions.
	situatedEntitiesViews := atse collect: [ : se | self newSEViewForModel: se ].
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> addViewForAgents: theSituatedEntities [
	" Private - Create views for situated entities (agents) "

	theSituatedEntities ifNotEmpty: [ : atse | 
		self addViewForAgent: atse.
		self canvas addAll: situatedEntitiesViews ].
	self moveSituatedEntities
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> addViewForCells: cells [

	theCellViews := cells collect: [ : cell | self newElementViewForModel: cell ] as: RSGroup.
	self canvas addAll: theCellViews.
	self configurePopUp.
	self configureLayout.
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> atClass: aClass putActivePovSelector: aSymbol [

	self activePoVsDictionary at: aClass put: aSymbol
]

{ #category : #accessing }
CMR3SpaceDiagram >> cellAt: aPoint ifAbsent: absentBlock [
	" Answer the <RSShape> which contains aPoint in the receiver "

	^ self theCellViews
		detect: [ : roassalNode | roassalNode encompassingRectangle containsPoint: aPoint ]
		ifNone: absentBlock
]

{ #category : #accessing }
CMR3SpaceDiagram >> cellSize [

	^ cellSize 
		ifNil: [ cellSize := self defaultCellSize ]
]

{ #category : #accessing }
CMR3SpaceDiagram >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #refreshing }
CMR3SpaceDiagram >> clearView [

	self nodes removeAll.

]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> collectXAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position x ]
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> collectYAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position y ]
]

{ #category : #'accessing - layouts' }
CMR3SpaceDiagram >> configureLayout [

	self layoutClass new
		gapSize: CMSpacePreferences spaceGapSetting;
		lineItemsCount: self spaceModel column;
		on: self nodes	
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> configurePopUp [
	" Private - Configure receiver's popup behavior and click callbacks for each receiver's node "

	| popUp |
	popUp := RSPopup text: [ : aCMEntity | aCMEntity asString ].
	self nodes @ popUp.
	self nodes 
		when: RSMouseLeftClick 
		do: [ : aRSMouseClick |
			('Selected entities ' , aRSMouseClick asString) traceCr.
			(self entitiesAt: aRSMouseClick shape position) do: self leftClickActionBlock ].
]

{ #category : #defaults }
CMR3SpaceDiagram >> defaultActivePoVs [
	" Answer a <Dictionary> of receiver's model active points of view "
	
	^ self spaceModel activePoVsDictionary
]

{ #category : #defaults }
CMR3SpaceDiagram >> defaultCellSize [

	^ 25
]

{ #category : #defaults }
CMR3SpaceDiagram >> defaultLayoutClass [

	^ RSGridLayout
]

{ #category : #defaults }
CMR3SpaceDiagram >> defaultLeftClickActionBlock [

	^ 	[ : rsShape |
			| position |
			position := rsShape position.
			self canvas nodes 
				select: [ : v | v encompassingRectangle containsPoint: position ]
				thenDo: [ : s | s cormasModel inspect ] 
		]
]

{ #category : #defaults }
CMR3SpaceDiagram >> defaultScaleInterpolator [

	^ NSScale linear
		domain: (0 to: 5 by: 0.1);
		range: RSColorPalette sequential greens9 range
]

{ #category : #refreshing }
CMR3SpaceDiagram >> delete [ 
	" Release all instance variables. See https://github.com/cormas/cormas/issues/493 "

	self release.
	super delete.
]

{ #category : #callbacks }
CMR3SpaceDiagram >> entitiesAt: aPosition [
	" Answer a <RSGroup> of entities at mouse position <Point> aPosition "

	^ self nodes select: [ : v | v encompassingRectangle containsPoint: aPosition ]
]

{ #category : #initialization }
CMR3SpaceDiagram >> initialize [
	" Private - Set the receiver's Spec application "

	super initialize.
	application := CMSpApplication new
]

{ #category : #initialization }
CMR3SpaceDiagram >> initializeEvents [

	self projectAnnouncer
		when: CMTimeChangedAnnouncement do: [ : ann | 
			ann timeStep = 0 
				ifFalse: [ self timeChanged: ann timeStep ] ];
		when: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].
	self canvas when: RSExtentChangedEvent do: [ 
		self canvas camera zoomToFit: self canvas extent.
		self canvas signalUpdate.
		self extent: self canvas extent. ].
	self canvas signalUpdate
]

{ #category : #initialization }
CMR3SpaceDiagram >> initializePresenters [
	" Private - This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour "

	self halt.
	"self addViewForCells: self cormasModel theESE.
	self addViewForAgents: self cormasModel allTheSituatedEntities."
	self initializeEvents.
]

{ #category : #'accessing - layouts' }
CMR3SpaceDiagram >> layoutClass [

	^ layoutClass
		ifNil: [ layoutClass := self defaultLayoutClass ]
]

{ #category : #'accessing - layouts' }
CMR3SpaceDiagram >> layoutClass: anObject [

	layoutClass := anObject
]

{ #category : #accessing }
CMR3SpaceDiagram >> leftClickActionBlock [
	
	^ leftClickActionBlock
		ifNil: [ leftClickActionBlock := self defaultLeftClickActionBlock ]
]

{ #category : #accessing }
CMR3SpaceDiagram >> leftClickActionBlock: anObject [

	leftClickActionBlock := anObject
]

{ #category : #initialization }
CMR3SpaceDiagram >> makeDraggableEntity: e [

	"Adding property to be draggable"
	e @ RSDraggable.
	e
		when: RSMouseDragStart do: [ :evt | self inform: 'Start dragging' ];
"			when: RSMouseDragging do: [ :evt |
				self inform: evt position asString ];"
		when: RSMouseDragEnd do: [ : evt | 
			evt cormasEntity patch: (self cellAt: evt position ifAbsent: [ evt cormasEntity patch ]) ].
]

{ #category : #initialization }
CMR3SpaceDiagram >> moveExistingEntity: e [

	| entityModel eModelPatch |
			
	entityModel := e model.
	eModelPatch := entityModel patch.
	self makeDraggableEntity: e.
"	labeled := RSLabeled new
		highlightable;
		fontSize: 12;
		text: [ : aCMEntity | aCMEntity age asString ];
		yourself."
	(e propertyAt: #RSLabeled) ifNotNil: [ : p | p text: entityModel labelOfPOV ].
	e
		@ (RSPopup text: entityModel detailsOfPOV);
		size: entityModel sizeOfPOV;
		color: entityModel pov;
		translateTo: (eModelPatch numCol @ eModelPatch numLine * cellSize) - (cellSize / 2)
]

{ #category : #initialization }
CMR3SpaceDiagram >> moveSituatedEntities [
	" Position the already created entities views to the location determined by each view's patch "

	self situatedEntitiesViews do: [ : e | self moveExistingEntity: e ] 
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> newElementViewForModel: cellModel [

	| roassalShape |
	
	roassalShape := self shapeFromString: CMSpacePreferences spaceElementTypeSetting asLowercase.
	^  roassalShape 
		model: cellModel;
		"color: (cellModel getColorForPov: povSelector);"
		size: self cellSize;
		yourself
]

{ #category : #'instance creation' }
CMR3SpaceDiagram >> newSEViewForModel: aCMEntity [
	" Answer a <RSShape> for the receiver's situated entities "

	| colorSelector |
	
	colorSelector := self activePoVSelectorAtClass: aCMEntity class.
	^ self sevClass new
		model: aCMEntity;
		color: (aCMEntity perform: colorSelector);
		size: aCMEntity sizeOfPOV;
		yourself
]

{ #category : #accessing }
CMR3SpaceDiagram >> nodes [
	^ self canvas nodes.
]

{ #category : #callbacks }
CMR3SpaceDiagram >> onMouseClick: aRSMouseClick [

	(self entitiesAt: aRSMouseClick shape position) do: self leftClickActionBlock
]

{ #category : #accessing }
CMR3SpaceDiagram >> origin [
	^ origin
]

{ #category : #accessing }
CMR3SpaceDiagram >> origin: anObject [
	origin := anObject
]

{ #category : #initialization }
CMR3SpaceDiagram >> release [ 

	self 
		cormasModel: nil;
		theCellViews: nil; 
		activePoVsDictionary: nil; 
		situatedEntitiesViews: nil;
		leftClickActionBlock: nil.
	currentCanvas := nil.
	super release.
]

{ #category : #refreshing }
CMR3SpaceDiagram >> removeDeadSituatedEntities [

	| deadSituatedEntities  |
	self situatedEntitiesViews isEmpty ifTrue: [ ^ self ].
	deadSituatedEntities := self situatedEntitiesViews reject: [ :e | e model isSituated ].
	deadSituatedEntities do: [ :e | e remove ].
	self situatedEntitiesViews removeAll: deadSituatedEntities
]

{ #category : #accessing }
CMR3SpaceDiagram >> scaleInterpolator [

	^ scaleInterpolator 
		ifNil: [ scaleInterpolator := self defaultScaleInterpolator ]
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> setAndRefreshActivePovSelectorOf: aClass with: aSymbol [
	" Configure a single point of view with selector aSymbol in model class aClass "

	self atClass: aClass putActivePovSelector: aSymbol.
	self updateNodesOf: aClass.
	self canvas signalUpdate
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> setAndRefreshActivePovs [
	" Configure the receiver's point of views in all classes in the active PoVs Dictionary.
	
	This method is only called in response of Apply Scenario settings button "

	self activePoVsDictionary keysDo: [ : classPoV | self updateNodesOf: classPoV ].
	self canvas signalUpdate
]

{ #category : #initialization }
CMR3SpaceDiagram >> setModelBeforeInitialization: aCMAbstractModel [
	" Private - Set the receiver's CORMAS model to aCMAbstractModel "

	self cormasModel: aCMAbstractModel.
]

{ #category : #accessing }
CMR3SpaceDiagram >> sevClass [

	^ CMSpacePreferences spaceSituatedEntityTypeSetting
]

{ #category : #accessing }
CMR3SpaceDiagram >> sevClass: anObject [

	sevClass := anObject
]

{ #category : #utilities }
CMR3SpaceDiagram >> shapeFromString: aString [

	| roassalShapeKey |
	
	roassalShapeKey := (Dictionary newFromPairs: { 'o' . 'circle' .
	'^' . 'arrow' .
	's' . 'square' .
	'p' . 'pentagon' .
	'h' . 'hexagon' .
	'+' . 'plus' .
	'd' . 'diamond' .
	'*' . 'star' }) keyAtValue: aString.
	^ RSShapeFactory shapeFromString: roassalShapeKey
]

{ #category : #accessing }
CMR3SpaceDiagram >> situatedEntitiesViews [

	^ situatedEntitiesViews
		ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpaceDiagram >> situatedEntitiesViews: anObject [

	situatedEntitiesViews := anObject
]

{ #category : #accessing }
CMR3SpaceDiagram >> speed [

	^ speed
]

{ #category : #accessing }
CMR3SpaceDiagram >> speed: anObject [

	speed := anObject
]

{ #category : #accessing }
CMR3SpaceDiagram >> theCellViews [

	^ theCellViews
		ifNil: [ theCellViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpaceDiagram >> theCellViews: anObject [

	theCellViews := anObject
]

{ #category : #refreshing }
CMR3SpaceDiagram >> timeChanged: aNewTimeStep [

	aNewTimeStep = 0
		ifTrue: [ 
			self clearView.
			self addViewForCells: self cormasModel theESE.
			self addViewForAgents: self cormasModel allTheSituatedEntities ]
		ifFalse: [ self removeDeadSituatedEntities ].

	self addNewSituatedEntities.
	self moveSituatedEntities.
	self theCellViews do: [ : node | node updateEntityAspectIn: self ].
	self canvas signalUpdate
]

{ #category : #callbacks }
CMR3SpaceDiagram >> unsubscribeListeners [ 
	" Private - Unregister all node events "

	'Space Presenter: Unsubscribing diagram before deleting presenter...' traceCr.
	self nodes do: [ : node | node announcer subscriptions reset ].

]

{ #category : #'accessing - pov' }
CMR3SpaceDiagram >> updateNodesOf: modelClass [

	^ self nodes
		  select: [ :roassalNode | roassalNode model isKindOf: modelClass ]
		  thenDo: [ :roassalNode | 
			  | shapeSelector |
			  shapeSelector := self activePoVSelectorAtClass: modelClass.
			  roassalNode color: (roassalNode model getColorForPov: shapeSelector) ]
]
