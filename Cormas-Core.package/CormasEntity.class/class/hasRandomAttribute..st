- accessing
hasRandomAttribute: anAttributeName
	"' Answer if anAttributeName defined at class or instance level is a random attribute"
	
	^self randomAttributes contains: [:line | (line at: 1) = anAttributeName]