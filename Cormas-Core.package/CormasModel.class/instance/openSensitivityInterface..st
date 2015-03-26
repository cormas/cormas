default values
openSensitivityInterface: aSensitivityClass
	
	sensitivitySetter isNil
		ifTrue: [sensitivitySetter := aSensitivityClass newOn: self].
	(self sensitivitySetter isKindOf: aSensitivityClass)
		ifFalse: [self newSensitivitySetter: aSensitivityClass].
	self sensitivitySetter mainWindow isNil
		ifTrue:
			[self sensitivitySetter open.
			^self sensitivitySetter].
	self sensitivitySetter mainWindow isOpen
		ifTrue:
			[(self sensitivitySetter mainWindow)
				raise;
				expand]
		ifFalse: [self sensitivitySetter open].
	(self sensitivitySetter isKindOf: SensitivitySetter)
		ifTrue: [self sensitivitySetter reinitDefaultValues].
	^self sensitivitySetter