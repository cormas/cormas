ESE (regular) - special locations
cellsBetweenColumn1: colNumber1 andColumn2: colNumber2
	"Return the cells between the colNumber1 and the colNumber2 of the spatial grid.
colNumber1   <Integer> lineNumber = Positive Integer
colNumber2   <Integer> colNumber = Positive Integer"

	| cells byStep |
	byStep := colNumber1 > colNumber2
		ifTrue: [ -1 ]
		ifFalse: [ 1 ].
	cells := OrderedCollection new.
	colNumber1 to: colNumber2 by: byStep do: [ :i | cells addAll: (self cellsOfColumn: i) ].
	^ cells