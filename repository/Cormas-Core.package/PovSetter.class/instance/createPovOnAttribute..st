action
createPovOnAttribute: att
	
	selectedClass
		compile:
			('pov' , (Cormas upperCaseFirstChar: att) ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word '
				, att ,
					'"
	self ' , att , ' isString ifTrue:[^self ' , att ,
					' asSymbol].
	self ' , att , ' isLiteral ifTrue:[^ (''' , att , ''' , self ' , att ,
					' printString) asSymbol].
	^self ' , att , '') withCRs
		classified: '* pov'
		notifying: nil