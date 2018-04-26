accessing
seed
	
	seed isNil ifTrue: [self seed: self Rand class Ui].
	^seed