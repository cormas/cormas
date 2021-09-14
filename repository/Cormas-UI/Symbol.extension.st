Extension { #name : #Symbol }

{ #category : #'*Cormas-UI' }
Symbol >> asColorForPoV: aCMEntity [

	| colorSelector entityMetaclass |
	
	colorSelector := ('SpatialEntityPOV_' , self) asSymbol.
	entityMetaclass := aCMEntity class.
	^ (entityMetaclass classSide includesSelector: colorSelector)
		ifFalse: [ Color perform: self ]
		ifTrue: [ Color fromArray: (entityMetaclass perform: colorSelector) ]
]
