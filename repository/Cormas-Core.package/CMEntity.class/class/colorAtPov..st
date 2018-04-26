- image
colorAtPov: aSymbolPOV
	"Returns a ColorValue according to the a Symbol (aSymbolPOV).
aSymbolPOV = <Symbol> "
	
	aSymbolPOV isNil
		ifTrue:
			[^self colorsDict
				at: #nil
				ifAbsentPut: [ColorValue gray]].
	^self colorsDict
		at: aSymbolPOV
		ifAbsentPut: [nil]