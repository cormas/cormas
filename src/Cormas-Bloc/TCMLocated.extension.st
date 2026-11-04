Extension { #name : 'TCMLocated' }

{ #category : '*Cormas-Bloc' }
TCMLocated >> linkEndIn: aLinkElement [

	^ aLinkElement positionOfLocatedEntity: self
]
