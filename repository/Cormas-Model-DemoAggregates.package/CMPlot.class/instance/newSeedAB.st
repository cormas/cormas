control
newSeedAB
	self seed isNil ifTrue:[
			Cormas random < 0.01 ifTrue:[self seed: #newA]].
	self seed isNil ifTrue:[
			Cormas random < 0.02 ifTrue:[self seed: #newB]].