Extension { #name : 'CMSpatialEntityAggregate' }

{ #category : '*Cormas-Bloc' }
CMSpatialEntityAggregate >> linkEndIn: aLinkElement [

	^ aLinkElement centerOfCells: self elementaryComponents
]
