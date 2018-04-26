navigation
lastLine
	"return the last line for which a value exists."
	
	self currentLine: 1.
	[self getCellValue isNil] whileFalse: [self incrLine].
	self currentLine = 1 ifTrue: [^0].
	self currentLine: currentLine - 1.
	^self currentLine