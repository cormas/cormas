Class {
	#name : #CMSimulationGrid,
	#superclass : #CMSpaceView,
	#category : #'Cormas-UI-PoV'
}

{ #category : #'opening and menus' }
CMSimulationGrid >> buildMenu [
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

{ #category : #'opening and menus' }
CMSimulationGrid >> createSimulationMenus [
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
CMSimulationGrid >> goFast [
anim intervalInMilliseconds: 2.
]

{ #category : #speedOfDisplay }
CMSimulationGrid >> goMedium [
anim intervalInMilliseconds: 500
]

{ #category : #speedOfDisplay }
CMSimulationGrid >> goSlow [
anim intervalInMilliseconds: 1000
]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel [

	^ self on: aModel with: aModel spaceModelEntities
]

{ #category : #'instance creation' }
CMSimulationGrid >> on: aModel with: cells [
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
CMSimulationGrid >> on: aModel with: cells and: situatedEntities [
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
CMSimulationGrid >> on: aModel with: cells and: situatedEntities withProbe: probeName [
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
CMSimulationGrid >> on: aModel withCells: cells withSituatedEntities: situatedEntities [
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

{ #category : #'opening and menus' }
CMSimulationGrid >> runAndVisualize [

	self buildMenu.
	
	self openWithToolbar.
	
]

{ #category : #'opening and menus' }
CMSimulationGrid >> runAndVisualizeWithMenus [
	self openWithToolbar.
	self createSimulationMenus.
]

{ #category : #'opening and menus' }
CMSimulationGrid >> runAndVisualizeWithProbes [
	| probes |
	"the method is not used. Is it obsolete ?"
	self openWithToolbar.
	self createSimulationMenus.
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbTrees'.
	model class setActiveProbes: probes.
]

{ #category : #'opening and menus' }
CMSimulationGrid >> runAndVisualizeWithProbes: probes [
	"the method is not used. Is it obsolete ?"

	self openWithToolbar.
	self createSimulationMenus.
	model class setActiveProbes: probes.
]

{ #category : #'model scheduling' }
CMSimulationGrid >> runModelStep [
	model runStep.
	self removeObsoleteSituatedEntities.
	self addNewSituatedEntities.
	situatedEntitiesViews
		do: [ :e | e translateTo: e model patch numCol @ e model patch numLine * cellSize ].
	self elements do: #updateShape
]
