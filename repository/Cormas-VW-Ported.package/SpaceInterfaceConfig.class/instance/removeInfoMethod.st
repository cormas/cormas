actions
removeInfoMethod
	
	| aList |
	self infoMethodsList selections isEmpty
		ifTrue: [^self cormas warn: 'No method selected'].
	self infoMethodsList selections
		do:
			[:m | 
			(self isItDefault: m)
				ifTrue:
					[self defaultInfo
						at: self observedEntitiesList selection
						put: nil]].
	aList := self infoMethodsList list copy.
	aList removeAll: self infoMethodsList selections.
	self infoMethodsList
		setList: aList
		selecting: Array new.
	self infoMethods
		at: self observedEntitiesList selection
		put: self infoMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuInfo