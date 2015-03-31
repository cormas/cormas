overwrite spaceInterface
classesForPovMenuInheritingFrom: aClass
	
	| list povlist |
	list := OrderedCollection new.
	(self observedEntitiesList list select: [:c | c inheritsFrom: aClass])
		do:
			[:c | 
			povlist := self povMethodsFor: c.
			povlist isEmpty
				ifFalse:
					[(self isSingleDefaultPovShown not
						and:
							[povlist size = 1 and: [(povlist at: 1) = (self defaultPovFor: c)]])
						ifFalse: [list add: c]]].
	^list