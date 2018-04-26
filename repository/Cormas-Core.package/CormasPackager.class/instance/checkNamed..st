accessing
checkNamed: aSymbol
	"return the check ideentified by aSymbol"
	
	^self checks
		detect: [:each | each name == aSymbol]
		ifNone: [nil]