private-icons
buttonImage
	
	self isNumber ifTrue: [^self class chartIcon].
	self isCollection ifTrue: [^self class diveIcon].
	self isBoolean ifTrue: [^self class chartIcon].
	self isAssociation ifTrue: [^self class eyeIcon].
	self isString ifTrue: [^self class chartIcon].
	self isSymbol ifTrue: [^self class chartIcon].
	^self class blankIcon