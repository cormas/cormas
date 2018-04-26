ESE (regular) - special locations
cellsIntoRectangleFrom: cell1 to: cell2
	"Return the cells between the lineNumber and the colNumber of the spatial grid. The Cells are ordered from cell1 to cell2.
cell1   <SpatialEntityElement>  
cell2   <SpatialEntityElement> "
	
	| firstCell lastCell invert cells |
	cell1 id = (cell1 id min: cell2 id)
		ifTrue:
			[firstCell := cell1.
			lastCell := cell2.
			invert := false]
		ifFalse:
			[firstCell := cell2.
			lastCell := cell1.
			invert := true].
	cells := OrderedCollection new.
	firstCell numCol < lastCell numCol
		ifTrue:
			[firstCell numLine
				to: lastCell numLine
				do: [:i | cells addAll: (self cellsOfLine: i)]]
		ifFalse:
			[firstCell numLine
				to: lastCell numLine
				do: [:i | cells addAll: (self cellsOfLine: i) reverse]].
	cells := cells
		select:
			[:c | 
			c numCol
				between: (firstCell numCol min: lastCell numCol)
				and: (firstCell numCol max: lastCell numCol)].
	invert ifTrue: [cells := cells reverse].
	^cells