seeds
givenSeeds
"set 5 particular seeds on the space"
	self seeds: OrderedCollection new.
	self seeds add: self spaceModel centralLocation;
		add: self spaceModel upperRightLocation;
		add: self spaceModel upperLeftLocation;
		add: self spaceModel lowerRightLocation;
		add: self spaceModel lowerLeftLocation.
	self seeds do: [:c | c seed: true].
	^self seeds