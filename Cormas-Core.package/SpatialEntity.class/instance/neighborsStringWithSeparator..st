- environment - sensing - space
neighborsStringWithSeparator: aChar
	"Purpose: returns a string made of 'self id' as first element and the id of all neighbors separated by aChar
Argument: aChar = <Character>
Return value: <ByteString>"
	
	| string |
	string := self id printString.
	self neighbourhood isNil
		ifFalse:
			[self neighbourhood
				do:
					[:i | string := string , aChar asSymbol asString , i id printString]].
	^string