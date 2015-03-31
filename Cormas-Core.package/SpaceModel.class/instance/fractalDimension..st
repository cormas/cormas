landscape indices
fractalDimension: aClass
	
	| l aggregates |
	l := List new.
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	aggregates
		do:
			[:a | 
			l
				add:
					(Array
						with: a size ln
						with: (a perimeter / 4) ln)].
	^((Cormas linearRegression: l) at: 2) * 2