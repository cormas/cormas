as yet unclassified
colorAtPov: aSymbolPOV 
	"Returns a ColorValue according to the a Symbol (aSymbolPOV).
aSymbolPOV = <Symbol> "

	^self colorsDict at: aSymbolPOV ifAbsentPut: [nil]