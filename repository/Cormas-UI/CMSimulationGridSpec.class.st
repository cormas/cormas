Class {
	#name : #CMSimulationGridSpec,
	#superclass : #RTViewForSpec,
	#instVars : [
		'anim',
		'cellSize',
		'model',
		'situatedEntitiesViews',
		'origin',
		'speed',
		'window'
	],
	#category : #'Cormas-UI-PoV'
}

{ #category : #'instance creation' }
CMSimulationGridSpec class >> newOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| newBe |
	newBe := self new.
	newBe initializeOn: aCMCormasModel.
	newBe subscribeOn: aCMCormasModel.
	^ newBe
]

{ #category : #'instance creation' }
CMSimulationGridSpec class >> openOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| newBe |
	newBe := self new.
	newBe initializeOn: aCMCormasModel.
	newBe subscribeOn: aCMCormasModel.
	newBe openWithToolbar.
	^ newBe
]

{ #category : #refreshing }
CMSimulationGridSpec >> addNewSituatedEntities [
	
	| newSituatedEntities newSituatedEntitiesViews |
	newSituatedEntities := model allTheSituatedEntities select: [ :a | ((situatedEntitiesViews collect: [ :e | e model ]) includes: a) not ].
	newSituatedEntitiesViews := (RTEllipse new
		color: [ :fe | fe getColorForPov: #pov ];
		size: [:aSituatedEntity | aSituatedEntity sizeOfPOV]) elementsOn: newSituatedEntities.
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self addAll: newSituatedEntitiesViews.
	newSituatedEntitiesViews do: [:nse | nse @ CMDraggableSituatedEntity  ]
	
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> addViewForAgents: situatedEntities [
	"Organize coordinate system"
	| windowSize |
	origin := (self elements collect: [ :e | e position x ]) min
		@ (self elements collect: [ :e | e position y ]) min.
	windowSize := (self elements collect: [ :e | e position x ]) max
		@ (self elements collect: [ :e | e position y ]) max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (model spaceModel column @ model spaceModel line).
	situatedEntitiesViews := ((RTEllipse new
				color: [ :fe | fe getColorForPov: #pov ];
				size: [:fe | fe sizeOfPOV]) elementsOn: situatedEntities).
	
	self addAll: situatedEntitiesViews.
	"Adding property to be draggable"
	situatedEntitiesViews do: [:situatedEntityEl | situatedEntityEl @  CMDraggableSituatedEntity]
	
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> addViewForCells: cells [
self
		addAll:
			((RTBox new
				color: [ :e | 
					e getColorForPov: #pov ];
				size: 25) elementsOn: cells).
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self elements.
]

{ #category : #accessing }
CMSimulationGridSpec >> cellSize [
	^ cellSize 
]

{ #category : #accessing }
CMSimulationGridSpec >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #refreshing }
CMSimulationGridSpec >> clearView [
	situatedEntitiesViews removeAll.
	self clean.
]

{ #category : #initialization }
CMSimulationGridSpec >> initializeOn: aModel [
	"This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour"

	model := aModel.
	self addViewForCells: aModel theESE.
	aModel allTheSituatedEntities isEmpty not ifTrue: [ 
	self addViewForAgents: aModel allTheSituatedEntities.
		situatedEntitiesViews
		do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ]
		 ].
	self canvas camera focusOnCenterScaled.
]

{ #category : #accessing }
CMSimulationGridSpec >> origin [
	^ origin
]

{ #category : #accessing }
CMSimulationGridSpec >> origin: anObject [
	origin := anObject
]

{ #category : #refreshing }
CMSimulationGridSpec >> removeObsoleteSituatedEntities [
	| obsoleteSituatedEntities |
	obsoleteSituatedEntities  := situatedEntitiesViews select: [ :e | e model isSituated not ].
	obsoleteSituatedEntities do:[:e| e remove].
	situatedEntitiesViews removeAll: obsoleteSituatedEntities.
]

{ #category : #accessing }
CMSimulationGridSpec >> situatedEntitiesViews [
	^ situatedEntitiesViews
]

{ #category : #accessing }
CMSimulationGridSpec >> situatedEntitiesViews: anObject [
	situatedEntitiesViews := anObject
]

{ #category : #initialization }
CMSimulationGridSpec >> subscribeOn: aModel [ 
	"This method subscribes the simualtionGrid to the timeChange announcements of a cormasModel.
	When the simulation time has change, the simulation grid can update it self by calling  self  canvas signalUpdate "

	model announcer
		subscribe: CMTimeChangedAnnouncement
			do: [ :aAnnounce | 
			aAnnounce timeStep = 0
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		subscribe: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].

]

{ #category : #refreshing }
CMSimulationGridSpec >> timeChanged: aNewTimeStep [
	aNewTimeStep = 0
		ifTrue: [ self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ self removeObsoleteSituatedEntities ].
	self addNewSituatedEntities.
	situatedEntitiesViews
		do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ].
	self elements do: #updateShape.
	self canvas signalUpdate
]
