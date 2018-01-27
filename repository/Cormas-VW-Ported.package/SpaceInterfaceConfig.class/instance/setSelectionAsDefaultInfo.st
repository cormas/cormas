actions
setSelectionAsDefaultInfo
	
	| aList anEntity |
	self infoMethodsList selections isEmpty
		ifTrue: [^self cormas warn: 'No info selected'].
	anEntity := self observedEntitiesList selection.
	self infoMethodsList selections size > 1
		ifTrue: [^self cormas warn: 'Only one info can be set as default'].
	(self isItDefault: self infoMethodsList selections first)
		ifTrue: [^self cormas warn: 'This info is already set as default'].
	aList := self infoMethodsList_WithoutDefaultSign list copy.
	self defaultInfo
		at: anEntity
		put: self infoMethodsList selections first.
	aList remove: (self defaultInfo at: anEntity).
	aList add: (self defaultInfo at: anEntity) , ' ->D'.
	aList sort: [:x :y | x < y].
	self infoMethodsList
		setList: aList
		selecting: (Array with: (self defaultInfo at: anEntity) , ' ->D')