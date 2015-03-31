private - regular polygons
getSetsOfContiguous: baseEntity verifying: aBlock
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with: [:be :x1 :x2 | aBlock value: be]
				with: [:be :x1 :x2 :x3 | aBlock value: be]
				with:
					[:be :setOfContiguousBe :x1 :x2 :x3 | (aBlock value: be) and: [(setOfContiguousBe includes: be) not]])
		conditionalArguments: (Array with: nil with: nil)