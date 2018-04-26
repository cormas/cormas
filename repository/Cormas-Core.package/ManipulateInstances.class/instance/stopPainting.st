actions while painting
stopPainting
	"self linkedSpaceInterface enableAllTools."
	
	self linkedSpaceInterface
		activateToolNamed: self initialTool initialState name.
	self initialTool: nil.	"self linkedSpaceInterface currentTool initialize; selected; cursor: Cursor normal."
	self linkedSpaceInterface view stopClicToChangeAttribute.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder componentAt: #mainApplyButton) isVisible: true.
	(self builder componentAt: #stopPainting)
		disable;
		isVisible: false