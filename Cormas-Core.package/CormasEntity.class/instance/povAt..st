- displaying
povAt: selectorName
	"Returns the povSymbol for a selectorName"
	" ^(self class imageAtPov: selectorName) copy."
	
	^self class
		createEntityPOVwithSpec:
			(self getPovSpecForSelector: selectorName andInfo: #nil)