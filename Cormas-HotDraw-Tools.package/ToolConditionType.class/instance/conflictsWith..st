verifying
conflictsWith: aTransitionType
	
	(aTransitionType isKindOf: ToolConditionType) ifFalse: [^false].
	^self toolConditionResult = aTransitionType toolConditionResult