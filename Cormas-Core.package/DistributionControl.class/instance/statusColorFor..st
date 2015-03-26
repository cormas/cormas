utiles
statusColorFor: aBoolean
	
	aBoolean ifNil: [^ColorValue gray].
	^aBoolean
		ifTrue: [ColorValue green]
		ifFalse: [ColorValue red]