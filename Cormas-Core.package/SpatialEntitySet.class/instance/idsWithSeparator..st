- accessing
idsWithSeparator: aChar
	"Purpose: returns the id of receiver and all the id of the components
Argument: aChar = <Character>
ReturnValue: <ByteString>"
	
	| string |
	string := self id printString , aChar asSymbol asString
		, self components size printString.
	self components
		do: [:i | string := string , aChar asSymbol asString , i id printString].
	^string