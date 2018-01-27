actions
setMoveEntity
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self canBeMoved
		at: anEntity
		put: self moveEntityCheckBox value