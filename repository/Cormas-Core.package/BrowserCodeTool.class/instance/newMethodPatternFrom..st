private
newMethodPatternFrom: node
	
	| argName ws |
	ws := String new writeStream.
	argName := 'anObject'.
	node
		selectorPartsDo: [:selectorPart | ws nextPutAll: selectorPart value]
		argumentsDo:
			[:argument | 
			ws space.
			argument isVariable
				ifTrue: [ws nextPutAll: argument name]
				ifFalse:
					[ws nextPutAll: argName.
					(argName anySatisfy: #isDigit)
						ifTrue:
							[argName := (argName reject: #isDigit)
								, ((argName select: #isDigit) asNumber + 1) printString]
						ifFalse: [argName := 'anObject2']].
			ws space].
	^self formattedText: ws contents