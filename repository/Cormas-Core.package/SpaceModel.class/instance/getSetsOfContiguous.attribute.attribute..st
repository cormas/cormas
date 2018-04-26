private - regular polygons
getSetsOfContiguous: baseEntity attribute: attributeName1 attribute: attributeName2
	"Return a collection of sets of contiguous components holding the same value for both attributes"
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with:
					[:be :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) isNil not
						and: [(be perform: getAttribute2) isNil not]]
				with:
					[:be :seed :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) = (seed perform: getAttribute1)
						and: [(be perform: getAttribute2) = (seed perform: getAttribute2)]]
				with:
					[:be :setOfContiguousBe :seed :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) = (seed perform: getAttribute1)
						and:
							[(be perform: getAttribute2) = (seed perform: getAttribute2)
								and: [(setOfContiguousBe includes: be) not]]])
		conditionalArguments: (Array with: attributeName1 with: attributeName2)