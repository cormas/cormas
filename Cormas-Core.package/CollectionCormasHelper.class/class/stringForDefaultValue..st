helping
stringForDefaultValue: aDefaultValue
	"return a string that is used to save a default value depending on its type"
	
	| defaultString coll |
	aDefaultValue isEmpty
		ifTrue: [defaultString := aDefaultValue class name asString , ' new']
		ifFalse:
			[defaultString := ''.
			coll := aDefaultValue asString asArrayOfSubstrings asOrderedCollection.
			coll add: 'withAll:' beforeIndex: 2.
			coll do: [:sub | defaultString := defaultString , sub , ' ']].
	^defaultString