action
actionUnTour
	
	| b |
	b := false.
	agents
		do: [:a | (fonction estPresent: a level) ifTrue: [b := b | a bouger]].
	b ifTrue: [self displayOn: vue graphicsContext].
	^b