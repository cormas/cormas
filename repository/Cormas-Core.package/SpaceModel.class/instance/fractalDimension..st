landscape indices
fractalDimension: aClass
	| aCollection aggregates |
	aggregates := self cormasModel perform: ('the' , aClass name asString , 's') asSymbol.
	aCollection := aggregates collect: [ :a | Array with: a size ln with: (a perimeter / 4) ln ].
	^ ((Cormas linearRegression: aCollection) at: 2) * 2