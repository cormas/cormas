accessing
color: aColor
	
	aColor isNil ifTrue: [^color := self color].
	aColor class = ColorValue ifFalse: [self halt].
	color := aColor