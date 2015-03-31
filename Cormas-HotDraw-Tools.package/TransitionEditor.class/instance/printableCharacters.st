private
printableCharacters
	
	^String withAll: ((32 to: 127) collect: [:each | Character value: each])