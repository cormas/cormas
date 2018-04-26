obsolete
Rand
	
	self halt	"obsolete"	"	RandomNumber isNil ifTrue: [RandomNumber := RandomGenerator fromGenerator: 1 seededWith: Time millisecondClockValue].



	^RandomNumber next"