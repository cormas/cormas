mustache-templates
templateForPovOnAttribute: attribute

	^ 'pov' , attribute capitalized ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word {1} "
	self {1} isString ifTrue:[ ^ self {1} asSymbol ].
	self {1}	isLiteral ifTrue:[ ^ (''{1}'' , self {1} printString) asSymbol ].
	^ self {1}' format: { attribute }