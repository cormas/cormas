default values
newSensitivitySetter: aSensitivityClass
	
	^sensitivitySetter := aSensitivityClass newOn: self	"sensitivitySetter isNil
		ifTrue: [sensitivitySetter := aSensitivityClass newOn: self]
		ifFalse:
			[(sensitivitySetter isKindOf: SensitivitySetter)
				ifTrue:
					[sensitivitySetter := aSensitivityClass newFromPreviousSetter:
							sensitivitySetter]
				ifFalse: [sensitivitySetter := aSensitivityClass newOn: self]].
	^sensitivitySetter"