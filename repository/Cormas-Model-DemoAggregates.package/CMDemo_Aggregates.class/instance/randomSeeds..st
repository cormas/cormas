seeds
randomSeeds: n
	"Spreads randomly n seeds on the space"

	| newSeed |
	self seeds: OrderedCollection new.
	[self seeds size < n]
		whileTrue: 
			[newSeed := Cormas selectRandomlyFrom: self thePlots.
			(self seeds includes: newSeed)
				ifFalse: 
					[self seeds add: newSeed.
					newSeed seed: true]].
	^self seeds