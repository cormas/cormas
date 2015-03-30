procedures
setHistoDataForAttribute: aSymbol for: aClass
	
	| dataCollec |
	self histoName
		value:
			self activeEntity name asString , ' : ' , self activeAttribute asString ,
					'	-	timestep ' , self cormasModel timeStep printString.
	dataCollec := (cormasModel allTheEntities: aClass) asOrderedCollection
		collect: [:i | i perform: aSymbol].
	self attributeType = #NotNumeric
		ifFalse:
			[self yUnit value = #yunitOccurence
				ifTrue:
					[self data
						value:
							(self
								histogramOf: dataCollec
								withClasses: (self autoClassesFor: dataCollec) asList)]
				ifFalse:
					[self yUnit value = #yunitPerc
						ifTrue:
							[self data
								value:
									(self
										histogramInPercOf: dataCollec
										withClasses: (self autoClassesFor: dataCollec) asList)]
						ifFalse: [self halt]]]
		ifTrue:
			[self nbClasses: dataCollec asSet size.
			self yUnit value = #yunitOccurence
				ifTrue:
					[self data
						value:
							(self
								histogramOf: dataCollec
								withTextClasses: dataCollec asSet asList)]
				ifFalse:
					[self yUnit value = #yunitPerc
						ifTrue:
							[self data
								value:
									(self
										histogramInPercOf: dataCollec
										withTextClasses: dataCollec asSet asList asList)]
						ifFalse: [self halt]]]