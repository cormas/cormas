helping
arrayFrom: anElementOrArray
	" return an array for the argument "

	 ^ anElementOrArray isArray
			ifTrue: [ anElementOrArray ]
			ifFalse: [	Array with: anElementOrArray ]