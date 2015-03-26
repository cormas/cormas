probes - recording
updateLocalData
	
	| res collec className aValue |
	self class allClasses
		do:
			[:cl | 
			className := cl name.
			(self data includesKey: className)
				ifTrue:
					[(self data at: className)
						keysAndValuesDo:
							[:name :dict | 
							res := OrderedCollection new.
							(self perform: (self getterForEntityClass: cl))
								do:
									[:c | 
									aValue := c perform: name.
									aValue isSymbol
										ifTrue:
											["The local probe is a reference to a global probe"
											aValue := self lastValueOfGlobalDataNamed: name].
									res
										add:
											(Array
												with: aValue
												with: c id)].
							res
								do:
									[:x | 
									(dict keys includes: x last)
										ifFalse:
											[collec := OrderedCollection new.
											self timeStep timesRepeat: [collec add: 0]]
										ifTrue: [collec := dict at: x last].
									collec add: x first.
									dict
										at: x last
										put: collec]]]]