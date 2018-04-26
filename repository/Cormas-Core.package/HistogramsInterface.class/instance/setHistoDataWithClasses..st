procedures
setHistoDataWithClasses: definedCasses
	
	self yUnit value = #yunitOccurence
		ifTrue:
			[self data
				value:
					(self
						histogramOf: (cormasModel perform: self histoList selection) first
						withClasses: definedCasses asList)]
		ifFalse:
			[self yUnit value = #yunitPerc
				ifTrue:
					[self data
						value:
							(self
								histogramInPercOf:
									(cormasModel perform: self histoList selection) first
								withClasses: definedCasses asList)]
				ifFalse: [self halt]]