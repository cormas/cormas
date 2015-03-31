click
detectSpatialEntityImageIncluding22: aPoint
	
	| collec |
	collec := self model cormasModel
		perform: ('the' , self activeSpatialEntity name asString , 's') asSymbol.
	^collec
		detect:
			[:p | 
			self
				image: (self getImageForEntity: p)
				includes: aPoint]
		ifNone: []