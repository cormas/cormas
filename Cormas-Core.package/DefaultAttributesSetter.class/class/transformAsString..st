compiling
transformAsString: defaultValue
	"return the defaultValue as a string.
	defaultValue: <Number or String or Boolean or Dictionary or Array or Collection>"
	
	| defaultString coll |
	defaultValue isNil ifTrue: [^'nil'].
	defaultValue isString
		ifTrue:
			["((defaultValue findString: 'randomFloat' startingAt: 1) = 1) ifTrue:[^defaultValue].
((defaultValue findString: 'randomInteger' startingAt: 1) = 1) ifTrue:[^defaultValue]."
			^defaultValue printString].
	(defaultValue isKindOf: Boolean) ifTrue: [^defaultValue asString].
	(defaultValue isKindOf: Number) ifTrue: [^defaultValue asString].
	(defaultValue isKindOf: Dictionary)
		ifTrue:
			[defaultValue isEmpty
				ifTrue: [defaultString := defaultValue class name asString , ' new']
				ifFalse: [self halt].
			^defaultString].
	(defaultValue isKindOf: Array)
		ifTrue:
			[defaultString := 'Array withAll: ' , defaultValue asString.
			^defaultString].	"because Array is immutable in VW7.6, cannot write  defaultValue asString !"
	(defaultValue isKindOf: Collection)
		ifTrue:
			[defaultValue isEmpty
				ifTrue: [defaultString := defaultValue class name asString , ' new']
				ifFalse:
					[defaultString := ''.
					coll := defaultValue asString asArrayOfSubstrings asOrderedCollection.
					coll add: 'withAll:' beforeIndex: 2.
					coll do: [:sub | defaultString := defaultString , sub , ' ']].
			^defaultString].
	^defaultValue asString