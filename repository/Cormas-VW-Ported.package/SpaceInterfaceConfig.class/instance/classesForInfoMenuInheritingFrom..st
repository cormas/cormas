overwrite spaceInterface
classesForInfoMenuInheritingFrom: aClass
	
	| list infolist |
	list := OrderedCollection new.
	(self observedEntitiesList list select: [:c | c inheritsFrom: aClass])
		do:
			[:c | 
			infolist := self infoMethodsFor: c.
			infolist isEmpty
				ifFalse:
					[(self isSingleDefaultInfoShown not
						and:
							[infolist size = 1 and: [(infolist at: 1) = (self defaultInfoFor: c)]])
						ifFalse: [list add: c]]].
	^list