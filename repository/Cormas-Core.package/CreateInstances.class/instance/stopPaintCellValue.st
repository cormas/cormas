interact with spaceInterface
stopPaintCellValue
	
	self linkedSpaceInterface enableAllTools.
	self linkedSpaceInterface
		activateToolNamed: self initialTool initialState name.
	self initialTool: nil.
	self linkedSpaceInterface view stopClicToChangeAttribute.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder componentAt: #setAttributeValue) isVisible: true.
	(self builder componentAt: #stopPaintCellValue)
		disable;
		isVisible: false