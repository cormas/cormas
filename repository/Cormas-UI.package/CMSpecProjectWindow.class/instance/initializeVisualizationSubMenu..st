initialization
initializeVisualizationSubMenu: group

	group
		addItem: [ : item | 
			item
				name: self translator tVisualization;
				subMenu: self subMenuForVisualization ]