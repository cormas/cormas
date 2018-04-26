accessing
oldBounds
	
	^oldBounds ifNil: [oldBounds := self preferredBounds]