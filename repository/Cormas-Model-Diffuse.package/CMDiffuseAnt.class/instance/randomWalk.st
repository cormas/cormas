control
randomWalk
	(self patch neighbourhood anySatisfy: [ :c | c qty > 60 ])
		ifFalse: [ super randomWalk ]
		ifTrue: [ self
				moveTo: (Cormas selectRandomlyFrom: (self patch layerOfRadius: 5)) ]