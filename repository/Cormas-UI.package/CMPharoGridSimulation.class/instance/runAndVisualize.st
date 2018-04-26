as yet unclassified
runAndVisualize
	| menuBuilder |
	self openWithToolbar.
	menuBuilder := RTMenuBuilder new view: self.
	speed := 2.0.
	menuBuilder
		menu: 'speedOfNextSim'
		submenu: 'fast'
		background: (Color red alpha: 0.4)
		callback: [ speed := 0.0].
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
			model
				numberOfFires: 3;
				numberOfFiremen: 20;
				percentageOfTrees: 0.60;
				dimensions: 60 -> 80;
				activeControl: #step:;
				initSimulation.
			self on: model with: model theCMFireAutomataCells and: model theCMFiremans ].
	