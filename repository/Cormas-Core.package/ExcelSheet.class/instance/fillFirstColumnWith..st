save
fillFirstColumnWith: anOrderedCollection
	"Copy aValue on the right Excel cell then increase the current line."
	
	| lastCell anArray |
	lastCell := self currentCol , anOrderedCollection size printString.	"conversion en Array d'Array. ex: #(#('Time\ECEC>>meanEnergy') #(0) #(1) #(2) #(3))"
	anArray := Array new: anOrderedCollection size.
	1
		to: anOrderedCollection size
		do:
			[:i | 
			anArray
				at: i
				put: (Array with: (anOrderedCollection at: i))].
	sheet
		setRange: 'A1:' , lastCell
		to: anArray.
	self incrColumn