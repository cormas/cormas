accessing
addRandomAttributes: anArray
	"' Compile #randomAttributes by adding anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code oldLine |
	list := self randomAttributes asList.
	oldLine := list
		detect:
			[:line | (line at: 1) = (anArray at: 1) and: [(line at: 2) = (anArray at: 2)]]
		ifNone: [nil].
	oldLine isNil
		ifTrue: [list add: anArray]
		ifFalse:
			[oldLine := oldLine asArray.
			oldLine
				at: 3
				put: (anArray at: 3).
			oldLine
				at: 4
				put: (anArray at: 4).
			oldLine
				at: 5
				put: (anArray at: 5)].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randomFloat min max) #(...) #(...) ... ].

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