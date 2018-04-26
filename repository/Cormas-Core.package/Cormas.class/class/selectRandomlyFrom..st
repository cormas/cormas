+ utilities - random
selectRandomlyFrom: aCollection
	aCollection isEmpty
		ifTrue: [ ^ nil ].
	^ aCollection atRandom