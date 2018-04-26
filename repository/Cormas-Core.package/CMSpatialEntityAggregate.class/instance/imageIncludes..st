- obsolete
imageIncludes: aPoint
	
	^self image notNil
		ifTrue: [self image component regionIntersects: (aPoint extent: 1)]
		ifFalse: [false]