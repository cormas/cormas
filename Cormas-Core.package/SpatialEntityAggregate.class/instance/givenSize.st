- accessing
givenSize
	"Purpose: stores the target size.
by default, a very large givenSize"
	
	^givenSize isNil
		ifTrue: [999999999999]
		ifFalse: [givenSize]