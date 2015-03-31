refresh display methods
displayMethodsAndOptionsForManipEntity
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity
		ifNil:
			[self moveEntityCheckBox value: false.
			self manipWholePopCheckBox value: false.
			self canChangeValuesCheckBox value: false.
			^self manipMethodsList
				setList: List new
				selecting: Array new].
	self manipMethodsList
		setList: (self manipMethodsFor: anEntity)
		selecting: Array new.
	anEntity isSituatedClass
		ifTrue:
			[(self builder namedComponents at: #moveEntityCheckBox)
				enable;
				isVisible: true.
			self moveEntityCheckBox value: (self canBeMovedFor: anEntity)]
		ifFalse:
			[(self builder namedComponents at: #moveEntityCheckBox)
				disable;
				isVisible: false].
	self manipWholePopCheckBox value: (self manipWholePopFor: anEntity).
	self canChangeValuesCheckBox value: (self canChangeValuesFor: anEntity)