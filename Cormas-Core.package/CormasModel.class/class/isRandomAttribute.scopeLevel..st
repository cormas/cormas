testing
isRandomAttribute: anAttributeName scopeLevel: level
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self randomAttributes
		contains:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]]