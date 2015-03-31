actions
setSelectionAsDefaultPov
	
	| aList anEntity |
	self povMethodsList selections isEmpty
		ifTrue: [^self cormas warn: 'No pov selected'].
	anEntity := self observedEntitiesList selection.
	self povMethodsList selections size > 1
		ifTrue: [^self cormas warn: 'Only one pov can be set as default'].
	(self isItDefault: self povMethodsList selections first)
		ifTrue: [^self cormas warn: 'This pov is already set as default'].
	aList := self povMethodsList_WithoutDefaultSign list copy.
	self defaultPov
		at: anEntity
		put: self povMethodsList selections first.
	aList remove: (self defaultPov at: anEntity).
	aList add: (self defaultPov at: anEntity) , ' ->D'.
	aList sort: [:x :y | x < y].
	self povMethodsList
		setList: aList
		selecting: (Array with: (self defaultPov at: anEntity) , ' ->D')