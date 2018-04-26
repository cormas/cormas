- accessing
removeRandomAttributes: anArray
	"' Compile #randomAttributes by removing anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code |
	list := self randomAttributes asList.
	list
		remove: anArray
		ifAbsent: [nil].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randFloat min max) #(...) #(...) ... ].

	This method is automatically redefined when creating new random attributes" 	\'
		withCRs.
	code := code ,
			'	| list |
	list := List new. \'.
	list do: [:line | code := code , '	list add: ' , line printString , '. \'].
	code := (code , '	^list') withCRs.
	self class
		compile: code
		classified: '- accessing' asString
		notifying: nil