labeling
filteredLabel
	"Answer the true 'visual' label as a CharacterArray (Text or String, depending on what was set originally) instance, which is the label minus any accelerator key indicators (&'s)."
	
	| source index |
	source := self rawLabel asCharacterArray.
	source isEmpty ifTrue: [^source].
	index := 1.
	[index := source
		nextIndexOf: $&
		from: index
		to: source size - 1.
	index isNil]
		whileFalse:
			[source := source copyReplaceFrom: index to: index with: ''.
			[index < source size and: [(source at: index) = $&]]
				whileTrue: [index := index + 1]].
	^source