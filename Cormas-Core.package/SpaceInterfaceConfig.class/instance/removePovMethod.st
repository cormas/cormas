actions
removePovMethod
	
	| aList |
	self povMethodsList selections isEmpty
		ifTrue: [^self cormas warn: 'No method selected'].
	self povMethodsList selections
		do:
			[:m | 
			(self isItDefault: m)
				ifTrue:
					[self defaultPov
						at: self observedEntitiesList selection
						put: nil]].
	aList := self povMethodsList list copy.
	aList removeAll: self povMethodsList selections.
	self povMethodsList
		setList: aList
		selecting: Array new.
	self povMethods
		at: self observedEntitiesList selection
		put: self povMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuPov