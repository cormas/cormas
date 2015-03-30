save
fillColumnWith: anOrderedCollection
	"Copy aValue on the right Excel cell then increase the current line."
	
	| lastCell anArray |
	lastCell := self currentCol
		, (self currentLine + anOrderedCollection size - 1) printString.	"conversion en Array d'Array. ex: #(#('Time\ECEC>>meanEnergy') #(0) #(1) #(2) #(3))"
	anArray := Array new: anOrderedCollection size.
	1
		to: anOrderedCollection size
		do:
			[:i | 
			anArray
				at: i
				put: (Array with: (anOrderedCollection at: i))].
	sheet
		setRange: self currentCell , ':' , lastCell
		to: anArray.
	self incrColumn.
	self currentLine: 1