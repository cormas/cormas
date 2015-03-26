accessing
onCondition: boolCollection goto: aToolState
	
	conditionMap ifNil: [conditionMap := OrderedCollection new].
	conditionMap add: boolCollection -> aToolState