manipulate instances
chooseEntityForManipulation
	
	| list eValues choice choicesList |
	list := OrderedCollection new.
	self siConfig
		ifNil:
			[list add: self activeSpatialEntity name.
			((self drawing components collect: [:c | c entityType]) asSet
				select: [:e | e ~= self activeSpatialEntity])
				do: [:e | list add: e name]]
		ifNotNil:
			[((self drawing components collect: [:c | c entityType]) asSet
				select: [:e | self siConfig manipEntitiesList list includes: e])
				do: [:e | list add: e name]].
	list isEmpty ifTrue: [^self entityForManipulation: nil].
	list size = 1
		ifTrue: [^self entityForManipulation: list asOrderedCollection first].
	choicesList := OrderedCollection new.
	choicesList add: 'Any kind'.
	choicesList add: '-------'.
	choicesList addAll: list.
	eValues := choicesList copy asOrderedCollection.
	eValues removeFirst.
	eValues addFirst: #any.
	choice := Dialog choose: 'Select an entity' fromList: choicesList values:
			eValues lines: 8 cancel: nil.
	choice = '-------' ifTrue: [choice := nil].
	self entityForManipulation: choice