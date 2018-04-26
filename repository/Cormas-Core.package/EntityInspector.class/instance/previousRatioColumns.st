accessing
previousRatioColumns
	
	^previousRatioColumns
		ifNil: [previousRatioColumns := self ratioColumns value]