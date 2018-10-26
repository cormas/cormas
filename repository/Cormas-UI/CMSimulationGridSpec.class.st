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
	#category : #'Cormas-UI-Core'
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

{ #category : #'model scheduling' }
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

{ #category : #'opening and menus' }
CMSimulationGridSpec >> buildMenu [
	| menuBuilder |
	menuBuilder := RTMenuBuilder new view: self.
	speed := 2.0.
	menuBuilder
		menu: 'speedOfNextSim'
		submenu: 'fast'
		background: (Color red alpha: 0.4)
		callback: [ speed := 0.0 ].
	menuBuilder
		menu: 'speedOfNextSim'
		submenu: 'medium'
		background: (Color blue alpha: 0.4)
		callback: [ speed := 500.0 ].
	menuBuilder
		menu: 'speedOfNextSim'
		submenu: 'slow'
		background: (Color green alpha: 0.4)
		callback: [ speed := 1000.0 ].
	menuBuilder
		menu: 'reset'
		background: (Color lightBlue alpha: 0.4)
		callback: [ self removeAllElements.
			model initSimulation.
			self
				on: model
				withCells: model spaceModelEntities
				withSituatedEntities: model allTheSituatedEntities ]
]

{ #category : #accessing }
CMSimulationGridSpec >> cellSize [
	^ cellSize 
]

{ #category : #accessing }
CMSimulationGridSpec >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #'opening and menus' }
CMSimulationGridSpec >> createSimulationMenus [
	| menuBuilder |
	menuBuilder := RTMenuBuilder new view: self.
	speed := 2.0.
	menuBuilder
		menu: 'speed'
		submenu: 'fast'
		background: (Color green alpha: 0.4)
		callback: [ self goFast ].
	menuBuilder
		menu: 'speed'
		submenu: 'medium'
		background: (Color orange alpha: 0.4)
		callback: [ self goMedium ].
	menuBuilder
		menu: 'speed'
		submenu: 'slow'
		background: (Color red alpha: 0.4)
		callback: [ self goSlow ].
	menuBuilder
		menu: 'pause'
		background: (Color blue alpha: 0.4)
		callback: [ 
			anim intervalInMilliseconds < 5000 ifTrue: [ 
			speed := anim intervalInMilliseconds ].
			anim
				intervalInMilliseconds: 10000.0;
				blockToExecute: [  ] ].
	menuBuilder
		menu: 'run'
		background: (Color green alpha: 0.4)
		callback: [ anim
				intervalInMilliseconds: speed;
				blockToExecute: [ self runModelStep ] ].
	menuBuilder
		menu: 'reset'
		background: (Color lightBlue alpha: 0.4)
		callback: [
			anim intervalInMilliseconds < 5000 ifTrue: [ 
			speed := anim intervalInMilliseconds ].
			anim blockToExecute: [  ].
			anim intervalInMilliseconds: 100000.
			self removeAllElements.
			model initSimulation.
			self
				on: model
				withCells: model spaceModel elementaryEntities
				withSituatedEntities: (model allTheLocatedEntities: CMAgentLocation).
			anim
				intervalInMilliseconds: speed;
				blockToExecute: [ self runModelStep ] ].
	model class activeProbes isEmpty
		ifFalse: [ menuBuilder
				menu: 'plot'
				background: (Color brown alpha: 0.4)
				callback: [ (CMSimpleChart newOn: model) refresh openWithToolbar ] ]
]

{ #category : #speedOfDisplay }
CMSimulationGridSpec >> goFast [
anim intervalInMilliseconds: 2.
]

{ #category : #speedOfDisplay }
CMSimulationGridSpec >> goMedium [
anim intervalInMilliseconds: 500
]

{ #category : #speedOfDisplay }
CMSimulationGridSpec >> goSlow [
anim intervalInMilliseconds: 1000
]

{ #category : #initialization }
CMSimulationGridSpec >> initializeOn: aModel [ 
	"This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour"

	model := aModel.
	self addViewForCells: aModel theESE.
	self addViewForAgents: aModel allTheSituatedEntities.
	self canvas camera focusOnCenterScaled.
	situatedEntitiesViews do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ].

]

{ #category : #'instance creation' }
CMSimulationGridSpec >> on: aModel [

	^ self on: aModel with: aModel spaceModelEntities
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> on: aModel with: cells [
	self
		addAll:
			((RTBox new
				color: [ :e | e getColorForPov: #pov ];
				size: 25) elementsOn: cells).
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: self elements.
	self canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 0.
	anim
		blockToExecute: [ aModel runStep.
			self elements do: #updateShape ].
	anim inView: self.
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> on: aModel with: cells and: situatedEntities [
	| windowSize |
	"self halt."
	"Create grid"
	model := aModel. 
	self
		addAll:
			((RTBox new
				color: [ :e | 
					(e theOccupants values isEmpty or: [ e theOccupants values first isEmpty ])
						ifFalse: [ e getColorForPov: #pov ]
						ifTrue: [ e getColorForPov: #pov ] ];
				size: 25) elementsOn: cells).
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: self elements.
	"Organize coordinate system"
	origin := (self elements collect: [ :e | e position x ]) min
		@ (self elements collect: [ :e | e position y ]) min.
	windowSize := (self elements collect: [ :e | e position x ]) max
		@ (self elements collect: [ :e | e position y ]) max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (aModel spaceModel column @ aModel spaceModel line).
	situatedEntitiesViews := ((RTEllipse new
				color: [ :fe | fe getColorForPov: #pov ];
				size: 20) elementsOn: situatedEntities).
	
	self addAll: situatedEntitiesViews.
	
	self canvas camera focusOnCenterScaled.
	anim ifNil: [anim := RTActiveAnimation new].
	anim intervalInMilliseconds: (speed ifNil:[2]).
	anim
		blockToExecute: [ self runModelStep].
	anim inView: self.
	
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> on: aModel with: cells and: situatedEntities withProbe: probeName [
	| windowSize |
	"the method is not used. Is it obsolete ?"
	
	"self halt."
	"Create grid"
	model := aModel. 
	self
		addAll:
			((RTBox new
				color: [ :e | 
					(e theOccupants values isEmpty or: [ e theOccupants values first isEmpty ])
						ifFalse: [ e getColorForPov: #pov ]
						ifTrue: [ e getColorForPov: #pov ] ];
				size: 25) elementsOn: cells).
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: self elements.
	"Organize coordinate system"
	origin := (self elements collect: [ :e | e position x ]) min
		@ (self elements collect: [ :e | e position y ]) min.
	windowSize := (self elements collect: [ :e | e position x ]) max
		@ (self elements collect: [ :e | e position y ]) max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (aModel spaceModel column @ aModel spaceModel line).
	situatedEntitiesViews := ((RTEllipse new
				color: [ :fe | fe getColorForPov: #pov ];
				size: 20) elementsOn: situatedEntities).
	
	self addAll: situatedEntitiesViews.
	self canvas camera focusOnCenterScaled.
	anim ifNil: [anim := RTActiveAnimation new].
	anim intervalInMilliseconds: (speed ifNil:[2]).
	anim
		blockToExecute: [ self runModelStep].
	anim inView: self.
	
]

{ #category : #'instance creation' }
CMSimulationGridSpec >> on: aModel withCells: cells withSituatedEntities: situatedEntities [
	"This method is called by the CMSpecSimulationWindow. It launches the RTActiveAnimation (replacement of spaceInterface)"

	model := aModel.
	self addViewForCells: cells.
	self addViewForAgents: situatedEntities.
	self canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: (speed ifNil: [ 0 ]).
	anim
		blockToExecute: [ self runModelStep ].
	anim inView: self
]

{ #category : #accessing }
CMSimulationGridSpec >> origin [
	^ origin
]

{ #category : #accessing }
CMSimulationGridSpec >> origin: anObject [
	origin := anObject
]

{ #category : #'model scheduling' }
CMSimulationGridSpec >> removeObsoleteSituatedEntities [
	| obsoleteSituatedEntities |
	obsoleteSituatedEntities  := situatedEntitiesViews select: [ :e | e model isSituated not ].
	obsoleteSituatedEntities do:[:e| e remove].
	situatedEntitiesViews removeAll: obsoleteSituatedEntities.
]

{ #category : #'opening and menus' }
CMSimulationGridSpec >> runAndVisualize [

	self buildMenu.
	
	self openWithToolbar.
	
]

{ #category : #'opening and menus' }
CMSimulationGridSpec >> runAndVisualizeWithMenus [
	self openWithToolbar.
	self createSimulationMenus.
]

{ #category : #'opening and menus' }
CMSimulationGridSpec >> runAndVisualizeWithProbes [
	| probes |
	"the method is not used. Is it obsolete ?"
	self openWithToolbar.
	self createSimulationMenus.
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbTrees'.
	model class setActiveProbes: probes.
]

{ #category : #'opening and menus' }
CMSimulationGridSpec >> runAndVisualizeWithProbes: probes [
	"the method is not used. Is it obsolete ?"

	self openWithToolbar.
	self createSimulationMenus.
	model class setActiveProbes: probes.
]

{ #category : #'model scheduling' }
CMSimulationGridSpec >> runModelStep [
	model runStep.
	self removeObsoleteSituatedEntities.
	self addNewSituatedEntities.
	situatedEntitiesViews do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ].
	self elements do: #updateShape
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

self removeObsoleteSituatedEntities.
	self addNewSituatedEntities.
	situatedEntitiesViews do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ].
	self elements do: #updateShape.
self canvas signalUpdate
]
