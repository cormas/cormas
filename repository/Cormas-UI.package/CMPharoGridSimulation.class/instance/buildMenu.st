opening and menus
buildMenu
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