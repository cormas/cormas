actions while painting
initializeByPainting
	"The user has just click on 'Apply' button to paint, some components of the interface must be disable.
	The activateToolNamed is set to 'ChangeAttribute Tool' "
	
	self entityClass isNil ifTrue: [^nil].
	self linkedSpaceInterface view manipulatedEntity: self entityClass.
	self linkedSpaceInterface activeSpatialEntity notNil ifFalse: [self halt].
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v disable]].
	(self builder componentAt: #mainApplyButton) isVisible: false.
	(self builder componentAt: #stopPainting)
		enable;
		isVisible: true.
	self initialTool: self linkedSpaceInterface view controller currentTool.	"self linkedSpaceInterface disableAllTools."	"self linkedSpaceInterface activateToolNamed: 'Manipulate Tool'"
	self linkedSpaceInterface activateToolNamed: 'ChangeAttribute Tool'