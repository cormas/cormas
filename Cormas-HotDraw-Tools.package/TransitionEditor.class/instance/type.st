accessing
type
	
	| newType |
	newType := (TransitionType withAllSubclasses
		detect: [:each | each transition == self transition value]) new.
	newType event: self eventType value.
	newType figureClasses: self figureList selections asArray.
	newType characters: self charactersForType.
	(newType isKindOf: ToolConditionType)
		ifTrue: [newType toolConditionResult: self conditionList selection].
	^newType