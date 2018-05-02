as yet unclassified
createSimulationMenus
	| menuBuilder |
	menuBuilder := RTMenuBuilder new view: self.
	speed := 2.0.
	menuBuilder
		menu: 'speed'
		submenu: 'fast'
		background: (Color green alpha: 0.4)
		callback: [ speed := 0.
			anim intervalInMilliseconds: speed ].
	menuBuilder
		menu: 'speed'
		submenu: 'medium'
		background: (Color orange alpha: 0.4)
		callback: [ speed := 500.
			anim intervalInMilliseconds: speed ].
	menuBuilder
		menu: 'speed'
		submenu: 'slow'
		background: (Color red alpha: 0.4)
		callback: [ speed := 1000.
			anim intervalInMilliseconds: speed ].
	menuBuilder
		menu: 'pause'
		background: (Color blue alpha: 0.4)
		callback: [ anim
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
		callback: [ anim blockToExecute: [  ].
			anim intervalInMilliseconds: 100000.
			self removeAllElements.
			model initSimulation.
			self
				on: model
				with: model spaceModel elementaryEntities
				and: (model allTheLocatedEntities: CMAgentLocation).
			anim
				intervalInMilliseconds: speed;
				blockToExecute: [ self runModelStep ] ].
	model class activeProbes isEmpty
		ifFalse: [ menuBuilder
				menu: 'plot'
				background: (Color brown alpha: 0.4)
				callback: [ (CMSimpleChart newOn: model) refresh openWithToolbar ] ]