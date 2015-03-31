accessing
aggregatesEntities
	
	| aList |
	aList := OrderedCollection new.
	self aggregateClasses
		do:
			[:cl | 
			aList
				addAll:
					(self spatialEntities
						at: cl name
						ifAbsent: [OrderedCollection new])].
	^aList