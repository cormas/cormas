- displaying
createEntityPOVwithSpec: aSpec defaultPov: aDefaultPov
	"Returns an EntityPOV according to selectorName and aSymbolOrColorValue"
	
	| anEntityPOV aSymbolOrColorValue selectorName |
	aSymbolOrColorValue := aSpec povResult.
	selectorName := aSpec povSelector.
	anEntityPOV := aDefaultPov copy.
	anEntityPOV
		color:
			(aSymbolOrColorValue cormasHelper isTypeColorValue
				ifTrue: [aSymbolOrColorValue]
				ifFalse: [self colorAtPov: aSymbolOrColorValue]).
	anEntityPOV name: selectorName.
	anEntityPOV povResult: aSymbolOrColorValue.
	anEntityPOV infoName: aSpec infoName.
	anEntityPOV infoResult: aSpec infoResult.
	^anEntityPOV