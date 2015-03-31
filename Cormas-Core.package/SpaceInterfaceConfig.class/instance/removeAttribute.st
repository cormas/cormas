actions
removeAttribute
	
	| aList |
	self attributesList selections isEmpty
		ifTrue: [^self cormas warn: 'No attribute selected'].
	aList := self attributesList list copy.
	aList removeAll: self attributesList selections.
	self attributesList
		setList: aList
		selecting: Array new.
	self attributes
		at: self observedEntitiesList selection
		put: self attributesList list	"	self spaceInterface initMenuInfo."