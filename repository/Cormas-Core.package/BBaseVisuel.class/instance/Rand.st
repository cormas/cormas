obsolete
Rand
	
	self halt	"obsolete"	"	Rand isNil ifTrue: [Rand := RandomGenerator fromGenerator: 1 seededWith: Time millisecondClockValue].



	^Rand next"