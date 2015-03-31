- accessing
outline
	" return a Polyline arround the spatialEntity"
	
	^outline ifNil: [outline := self defaultPOV outline]