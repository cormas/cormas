Extension { #name : #Class }

{ #category : #'*Cormas-UI' }
Class >> asColorForPoV [ 

	| selectorForColor |
	
	self flag: #toReview.
	selectorForColor := ('SpatialEntityPOV_' , self name) asSymbol.
	^ (self selectors includes: selectorForColor)
		ifTrue: [ Color fromArray: (self perform: selectorForColor) ]
		ifFalse: [ self colorsDict at: selectorForColor ifAbsent: [ Color veryLightGray ] ]
]
