click
image: anImage includes: aPoint
	
	^anImage notNil
		ifFalse: [false]
		ifTrue: [anImage bounds regionIntersects: (aPoint extent: 1)]