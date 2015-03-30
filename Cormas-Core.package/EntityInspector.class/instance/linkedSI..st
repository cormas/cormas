accessing
linkedSI: aSpaceInterface
	
	aSpaceInterface == linkedSI ifTrue: [^self].
	aSpaceInterface ifNotNil: [aSpaceInterface removeDependent: self].
	linkedSI := aSpaceInterface.
	aSpaceInterface ifNotNil: [aSpaceInterface addDependent: self]