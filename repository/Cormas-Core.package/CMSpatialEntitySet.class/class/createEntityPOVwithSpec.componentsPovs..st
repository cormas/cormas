- displaying
createEntityPOVwithSpec: aSpec componentsPovs: componentsPovs
	"Returns an EntityPOV according to aSpec and set of povs of component spatial entity
	componentsPovs should be -> aCollecOfEntities collect: [:spatialEntity | spatialEntity defaultPOV]."
	
	| anEntityPOV aSymbolOrColorValue selectorName |
	aSymbolOrColorValue := aSpec povResult.
	selectorName := aSpec povSelector.
	anEntityPOV := VectorialCompositePOV newFrom: componentsPovs.
	selectorName = #nil
		ifFalse:
			[selectorName = #delimitors
				ifTrue:
					[anEntityPOV isStroked: true.
					anEntityPOV lineWidth: 3]
				ifFalse:
					[aSymbolOrColorValue cormasHelper isTypeColorValue
						ifTrue: [anEntityPOV color: aSymbolOrColorValue]
						ifFalse: [anEntityPOV color: (self colorAtPov: aSymbolOrColorValue)]]].
	anEntityPOV name: selectorName.
	anEntityPOV povResult: aSymbolOrColorValue.
	anEntityPOV infoName: aSpec infoName.
	anEntityPOV infoResult: aSpec infoResult.
	^anEntityPOV