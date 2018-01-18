control
swell
	"super swell ifTrue:[self getSkins do: [:coll | coll do: [:c| c tree: true]]]"
	
	^super swell
		ifTrue:
			[self components do: [:c | c tree: true].
			true]
		ifFalse: [false]