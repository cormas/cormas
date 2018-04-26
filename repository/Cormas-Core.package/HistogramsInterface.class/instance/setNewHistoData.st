actions
setNewHistoData
	
	self isHistoOnEntityAttribute
		ifFalse:
			[self histoList selection isNil
				ifTrue: [self data value: List new]
				ifFalse:
					[self
						setHistoDataWithClasses:
							(cormasModel perform: self histoList selection) last]]
		ifTrue:
			[self
				setHistoDataForAttribute: self activeAttribute asSymbol
				for: self activeEntity]