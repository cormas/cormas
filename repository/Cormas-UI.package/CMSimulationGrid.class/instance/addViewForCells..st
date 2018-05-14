instance creation
addViewForCells: cells
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