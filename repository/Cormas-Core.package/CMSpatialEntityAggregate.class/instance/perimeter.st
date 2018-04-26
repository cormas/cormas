+ metrics
perimeter
	"return the number of segments of the skin"
	
	| counter nb |
	counter := 0.
	self outline isEmpty ifTrue: [self setOutline].
	self outline
		do:
			[:a | 
			"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
			nb := a at: 2.
			self spaceModel gridCellShape = #hexagonal
				ifTrue: [counter := counter + nb size]
				ifFalse:
					[nb
						do:
							[:e | e = #S | (e = #N) | (e = #E) | (e = #W) ifTrue: [counter := counter + 1]]]].
	^counter