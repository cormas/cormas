aspects
selectedHisto
	
	^selectedHisto isNil
		ifTrue: [selectedHisto := self histoList selection asText asValue]
		ifFalse: [selectedHisto]