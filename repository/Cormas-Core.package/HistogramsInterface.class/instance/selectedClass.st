aspects
selectedClass
	
	^selectedClass isNil
		ifTrue: [selectedClass := nil asValue]
		ifFalse: [selectedClass]