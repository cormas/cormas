deprecated
valueOfValueInString: aString
	"DEPRECATED.
Should use #stringAsType:aStrings"
	
	aString ifNil: [^nil].
	aString first isDigit ifTrue: [^aString asNumber].
	aString first = $#
		ifTrue:
			[^(aString
				copyFrom: 2
				to: aString size) asSymbol].
	(aString = 'true' or: [aString = 'false']) ifTrue: [^aString asBoolean].
	^aString