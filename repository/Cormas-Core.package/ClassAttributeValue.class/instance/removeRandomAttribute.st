random
removeRandomAttribute
	"' Compile #randomAttributes as class method into targetClass by removing an array: #(#attribute scopeLevel #randFloat min max) "
	
	| aList theClass |
	self targetClass isMeta
		ifTrue:
			[theClass := self targetClass instanceBehavior.
			aList := List
				with: self targetAttribute
				with: #class
				with: self intOrFloat value]
		ifFalse:
			[theClass := self targetClass.
			aList := List
				with: self targetAttribute
				with: #instance
				with: self intOrFloat value].
	aList
		add: self minValueHolder value;
		add: self maxValueHolder value.
	theClass removeRandomAttributes: (Array withAll: aList)