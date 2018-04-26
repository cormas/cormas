landscape indices
wayFromCell: cell1 toCell: cell2
	"return a collection of cells from cell1 to cell2 (including cell1 and cell2)"
	
	| nbLines nbCols firstCell lastCell invert cellsIntoRectangle way |
	"for irregular cells, the calculus is much more longer"
	self gridCellShape = #irregular ifTrue: [^cell1 wayTo: cell2].	"Calculus for regular cells"
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	cell1 id = (cell1 id min: cell2 id)
		ifTrue:
			[firstCell := cell1.
			lastCell := cell2.
			invert := false]
		ifFalse:
			[firstCell := cell2.
			lastCell := cell1.
			invert := true].
	cellsIntoRectangle := self cellsIntoRectangleFrom: firstCell to: lastCell.
	way := OrderedCollection new.
	self nbNeighbours = #eight
		ifTrue:
			[| by |
			firstCell numCol < lastCell numCol
				ifTrue: [by := 1]
				ifFalse: [by := -1].
			0
				to: (nbLines min: nbCols)
				do:
					[:i | 
					way
						add:
							(cellsIntoRectangle
								detect:
									[:c | 
									c numLine = (firstCell numLine + i)
										and: [c numCol = (firstCell numCol + (i * by))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numCol = lastCell numCol and: [c numLine > way last numLine]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numLine = lastCell numLine and: [by * c numCol > (by * way last numCol)]])]].
	self nbNeighbours = #four
		ifTrue:
			[way
				addAll:
					(cellsIntoRectangle select: [:c | c numLine = firstCell numLine]).
			way
				addAll: (cellsIntoRectangle select: [:c | c numCol = lastCell numCol])].
	self nbNeighbours = #six
		ifTrue:
			[| by |
			"nbLines odd 
				ifTrue: [
					firstCell numCol > lastCell numCol 
						ifTrue: [firstCell numLine odd ifTrue: [nbCols := nbCols + 1]]
						ifFalse: [lastCell numLine odd ifTrue: [nbCols := nbCols + 1]].
					nbCols := (0 max: (2 * nbCols - nbLines - 1) / 2)]
				ifFalse: [nbCols := (0 max: (2 * nbCols - nbLines) / 2)]."
			"ne fonctionne pas encore... a finir !"
			gridCellShape := #irregular.
			true ifTrue: [^cell1 wayTo: cell2].
			firstCell numCol < lastCell numCol
				ifTrue: [by := 1]
				ifFalse: [by := -1].
			0
				to: (nbLines min: 2 * nbCols)
				do:
					[:i | 
					way
						add:
							(cellsIntoRectangle
								detect:
									[:c | 
									c numLine = (firstCell numLine + i)
										and:
											[c numCol
												=
													(firstCell numCol
														+
															((firstCell numLine + i) odd
																ifTrue: [(i - 1) / 2 * by]
																ifFalse: [i / 2 * by]))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numCol = lastCell numCol and: [c numLine > way last numLine]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numLine = lastCell numLine and: [by * c numCol > (by * way last numCol)]])]].
	invert ifTrue: [way := way reverse].
	^way