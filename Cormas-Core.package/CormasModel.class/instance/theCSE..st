accessing - entities
theCSE: aSet
	
	| coll |
	coll := self class compoundSpatialClasses.
	coll size = 0
		ifTrue: [^self cormas warn: 'Pas d''entites spatiales composees !'].
	coll size > 1
		ifTrue:
			[^self cormas warn:
					'Il y a plusieurs classes d''entites spatiales composees !'].
	^self
		setTheEntity: self class compoundSpatialClasses first
		with: aSet