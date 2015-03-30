labeling-access character
accessCharacterPosition
	"Answer the index position of the access character in the label (or labelText if there is one).  Answer nil if undefined."
	
	| str i |
	str := self rawLabel asString readStream.
	i := 0.
	[str atEnd]
		whileFalse:
			[i := i + 1.
			str next = $&
				ifTrue:
					[str atEnd ifTrue: [^nil].
					(str peekFor: $&) ifFalse: [^i]]].
	^nil