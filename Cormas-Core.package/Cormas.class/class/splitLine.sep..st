+ utilities - files
splitLine: stream sep: aSepChar
	"Purpose: Used when loading an external file. Split a read stream according to a given separator character
Example: Cormas splitLine: aStream sep: $,   "
	
	| wordsList line item |
	wordsList := OrderedCollection new.
	line := (stream upTo: Character cr) readStream.
	[line atEnd]
		whileFalse:
			[item := line upTo: aSepChar.
			wordsList add: item].
	line close.
	^wordsList