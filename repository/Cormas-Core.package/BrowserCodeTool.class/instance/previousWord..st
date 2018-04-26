autocomplete extension
previousWord: aParagraphEditor
	
	| rs mark |
	rs := (aParagraphEditor text
		first: aParagraphEditor selectionStartIndex - 1) asString reverse
		readStream.
	rs skipWhile: [:char | char isAlphaNumeric].
	rs skipWhile: [:char | char isAlphaNumeric not].
	mark := rs position + 1.
	rs skipWhile: [:char | char = $. or: [char isAlphaNumeric]].
	^(rs collection
		copyFrom: mark
		to: rs position) reverse