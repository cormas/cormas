opening and menus
createSimulationMenus
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