actions
setManipWholePop
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self manipWholePop
		at: anEntity
		put: self manipWholePopCheckBox value