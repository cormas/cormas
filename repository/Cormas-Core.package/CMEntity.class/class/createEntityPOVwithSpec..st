- displaying
createEntityPOVwithSpec: aSpec
	"Returns an EntityPOV according to selectorName and aSymbolOrColorValue"
	
	| anEntityPOV aSymbolOrColorValue selectorName |
	aSymbolOrColorValue := aSpec povResult.
	selectorName := aSpec povSelector.
	aSymbolOrColorValue cormasHelper isTypeColorValue
		ifTrue:
			[anEntityPOV := (self imageAtPov: selectorName) copy.
			anEntityPOV color: aSymbolOrColorValue]
		ifFalse: [anEntityPOV := (self imageAtPov: aSymbolOrColorValue) copy].
	anEntityPOV name: selectorName.
	anEntityPOV povResult: aSymbolOrColorValue.
	anEntityPOV infoName: aSpec infoName.
	anEntityPOV infoResult: aSpec infoResult.
	^anEntityPOV