accessing
Rand
	
	Rand isNil
		ifTrue:
			[Rand := RandFishmanMoore new.
			seed := Rand class Ui].
	Rand class Ui isNil
		ifTrue:
			[Rand := RandFishmanMoore new.
			seed := Rand class Ui].
	^Rand