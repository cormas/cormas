access as String
randomAsString
	"'example: 'randFloat: ]0 ; 10.2['   "
	
	| text |
	text := self intOrFloat value asString , ': '.
	text := text , self lowerConstraint value.
	text := text , self minValueHolder value printString , ' ; '.
	text := text , self maxValueHolder value printString.
	text := text , self upperConstraint value.
	^text