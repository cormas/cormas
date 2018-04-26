accessing
aggregatesEntities
	
	| aCollection |
	aCollection := OrderedCollection new.
	self aggregateClasses
		do:
			[:cl | 
			aCollection
				addAll:
					(self spatialEntities
						at: cl name
						ifAbsent: [OrderedCollection new])].
	^aCollection