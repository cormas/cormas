ESE (regular) - special locations
centralLocation
	
	(line odd not or: [column odd not])
		ifTrue:
			[^self cormas
				warn: (UserMessage defaultString: '' key: #gridDimensionsNotOdd)].
	^self elementaryEntities at: (line * column / 2) asInteger + 1