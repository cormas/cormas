submenu-visualization
subMenuForVisualization

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuVizProbes: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuVizMessages: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuVizSpace: item ] ]