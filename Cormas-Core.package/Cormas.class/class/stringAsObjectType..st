+ utilities - string
stringAsObjectType: aString
	"Pupose: convert aString into a Number, a Boolean, a Symbol, or a String depending of the content.
Examples: 
	Cormas stringAsType: '12.3' => 12.3   or '12,3' => 12.3
	Cormas stringAsType: 'true' => true
	Cormas stringAsType: '#truc' => #truc
	Cormas stringAsType: 'abc' => 'abc' "
	
	aString isEmpty ifTrue: [^nil].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $.]])
		ifTrue: [^aString asNumber].
	aString first = $#
		ifTrue: [^(self removeFirstCharacterOfString: aString) asSymbol].
	aString = 'true' ifTrue: [^true].
	aString = 'false' ifTrue: [^false].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $,]])
		ifTrue: [^(aString copyReplaceAll: ',' with: '.') asNumber].
	^aString