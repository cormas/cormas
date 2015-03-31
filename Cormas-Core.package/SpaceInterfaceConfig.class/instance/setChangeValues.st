actions
setChangeValues
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self canChangeValues
		at: anEntity
		put: self canChangeValuesCheckBox value