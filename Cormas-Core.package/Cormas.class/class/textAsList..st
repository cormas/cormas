+ utilities - string
textAsList: aText
	"Purpose: Returns a list of strings corresponding to each line of a given text.
Examples: Cormas textAsList: 'Hello world\Bonjour le monde\Bom dia Mundo\Buenos Dias Mundo' withCRs
Cormas textAsList:'Hello world
Bonjour le monde
		Bom dia Mundo
Buenos Dias Mundo' withCRs "
	
	| stream list |
	list := List new.
	stream := ReadStream on: aText asString.
	[stream atEnd] whileFalse: [list add: (stream upTo: Character cr)].
	stream close.
	^list