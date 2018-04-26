actions
removeManipMethod
	| aList |
	self manipMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	aList := self manipMethodsList list copy.
	aList removeAll: self manipMethodsList selections.
	self manipMethodsList setList: aList selecting: Array new.
	self manipMethods
		at: self manipEntitiesList selection
		put: self manipMethodsList list