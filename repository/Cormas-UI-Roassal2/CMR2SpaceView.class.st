Class {
	#name : #CMR2SpaceView,
	#superclass : #RTViewForSpec,
	#instVars : [
		'anim',
		'cellSize',
		'model',
		'situatedEntitiesViews',
		'origin',
		'speed',
		'window',
		'cellViews',
		'activePovsSelector'
	],
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #'instance creation' }
CMR2SpaceView class >> newOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	^ instance
]

{ #category : #'instance creation' }
CMR2SpaceView class >> openOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	instance openWithToolbar.
	^ instance
]

{ #category : #accessing }
CMR2SpaceView >> activePovsSelector [
	^ activePovsSelector ifNil: [ activePovsSelector := Dictionary new ]
]

{ #category : #accessing }
CMR2SpaceView >> activePovsSelector: anObject [
	activePovsSelector := anObject
]

{ #category : #refreshing }
CMR2SpaceView >> addNewSituatedEntities [
	
	| newSituatedEntities newSituatedEntitiesViews |
	newSituatedEntities := model allTheSituatedEntities select: [ :a | ((situatedEntitiesViews collect: [ :e | e model ]) includes: a) not ].
	newSituatedEntitiesViews := (RTEllipse new
		color: [ :fe | fe getColorForPov: #pov ];
		size: [:aSituatedEntity | aSituatedEntity sizeOfPOV]) elementsOn: newSituatedEntities.
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self addAll: newSituatedEntitiesViews.
	newSituatedEntitiesViews do: [:nse | nse @ CMR2DraggableSituatedEntity  ]
	
]

{ #category : #'instance creation' }
CMR2SpaceView >> addViewForAgents: situatedEntities [
	"Organize coordinate system"

	| windowSize |
	
	
	origin := (self elements collect: [ :e | e position x ]) min @ (self elements collect: [ :e | e position y ]) min.
	windowSize := (self elements collect: [ :e | e position x ]) max @ (self elements collect: [ :e | e position y ]) max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (model spaceModel column @ model spaceModel line).
	situatedEntitiesViews := (RTEllipse new
		color: [ :fe | fe getColorForPov: (self getActivePovSelectorOf: fe class)];
		size: [ :fe | fe sizeOfPOV ]) elementsOn: situatedEntities.
	self addAll: situatedEntitiesViews.
	"Adding property to be draggable"
	situatedEntitiesViews do: [ :situatedEntityEl | situatedEntityEl @ CMR2DraggableSituatedEntity ]
]

{ #category : #'instance creation' }
CMR2SpaceView >> addViewForCells: cells [
	| cellClass |

	cellClass := cells first class.
	cellViews := (RTBox new
		color: [ :e | e getColorForPov: (self getActivePovSelectorOf: cellClass) ];
		size: self cellSize) elementsOn: cells.
	self addAll: cellViews.
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self elements
]

{ #category : #'instance creation' }
CMR2SpaceView >> addViewForCells: cells withPov: aPovName [
self flag: #toBeRevised. "This method seems obsolete"
	cellViews := (RTBox new
		color: [ :e | e getColorForPov: aPovName ];
		size: 25) elementsOn: cells.
	self addAll: cellViews.
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self elements
]

{ #category : #accessing }
CMR2SpaceView >> cellSize [
	^ cellSize ifNil:[ cellSize := 25]
]

{ #category : #accessing }
CMR2SpaceView >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #accessing }
CMR2SpaceView >> cellViews [
	^ cellViews ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #refreshing }
CMR2SpaceView >> clearView [
	self situatedEntitiesViews removeAll.
	self clean
]

{ #category : #accessing }
CMR2SpaceView >> getActivePovSelectorOf: aClass [
^self activePovsSelector at: aClass ifAbsent: [ nil ]
	
]

{ #category : #initialization }
CMR2SpaceView >> initializeOn: aModel [
	"This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour"

	model := aModel.
	self addViewForCells: aModel theESE.
	aModel allTheSituatedEntities isEmpty not
		ifTrue: [ self addViewForAgents: aModel allTheSituatedEntities.
			situatedEntitiesViews
				do: [ :e | e translateTo: e model patch numCol @ e model patch numLine * cellSize ] ].
	self canvas focusOnCenterScaled.
	self signalUpdate.
	"self setDefaultMenu"
]

{ #category : #accessing }
CMR2SpaceView >> origin [
	^ origin
]

{ #category : #accessing }
CMR2SpaceView >> origin: anObject [
	origin := anObject
]

{ #category : #refreshing }
CMR2SpaceView >> removeObsoleteSituatedEntities [
	| obsoleteSituatedEntities |
	self situatedEntitiesViews isEmpty
		ifTrue: [ ^ self ].
	obsoleteSituatedEntities := self situatedEntitiesViews select: [ :e | e model isSituated not ].
	obsoleteSituatedEntities do: [ :e | e remove ].
	self situatedEntitiesViews removeAll: obsoleteSituatedEntities
]

{ #category : #accessing }
CMR2SpaceView >> setActivePovSelectorOf: aClass with: aSymbol [
self activePovsSelector at: aClass put: aSymbol
]

{ #category : #accessing }
CMR2SpaceView >> setAndRefreshActivePovSelectorOf: aClass with: aSymbol [ 

	self setActivePovSelectorOf: aClass with: aSymbol .
	self elements do: #updateShape.
	self canvas signalUpdate
]

{ #category : #accessing }
CMR2SpaceView >> situatedEntitiesViews [
	^ situatedEntitiesViews
		ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR2SpaceView >> situatedEntitiesViews: anObject [
	situatedEntitiesViews := anObject
]

{ #category : #initialization }
CMR2SpaceView >> subscribeOn: aModel [
	"This method subscribes the simualtionGrid to the timeChange announcements of a cormasModel.
	When the simulation time has change, the simulation grid can update it self by calling  self  canvas signalUpdate "

	model projectAnnouncer
		when: CMTimeChangedAnnouncement
			do: [ :aAnnounce | 
			aAnnounce timeStep = 0
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		when: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ]
]

{ #category : #refreshing }
CMR2SpaceView >> timeChanged: aNewTimeStep [
	aNewTimeStep = 0
		ifTrue: [ self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ self removeObsoleteSituatedEntities ].
	self addNewSituatedEntities.
	situatedEntitiesViews do: [ :e | e translateTo: e model patch numCol @ e model patch numLine  * cellSize ].
	self elements do: #updateShape.
	self canvas signalUpdate
]
