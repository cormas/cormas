accessing
referencedBounds
	
	referencedBounds
		ifNil:
			[referencedBounds := Rectangle
				origin: 0 @ 0
				corner: 65 @ 65].
	^referencedBounds