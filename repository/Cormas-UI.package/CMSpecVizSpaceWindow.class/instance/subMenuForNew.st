private
subMenuForNew

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tGridSize;
						action: [ self openDimensionChooser ] ] ]