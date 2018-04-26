interact with spaceInterface
changeAttributeByPainting
	
	self linkedSpaceInterface activeSpatialEntity notNil ifFalse: [self halt].	"self linkedSpaceInterface buttons view controller "
	self linkedSpaceInterface view
		clicToChangeAttribute: self attributeToChange value
		withValue: self valueForAttribute value.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v disable]].
	(self builder componentAt: #setAttributeValue) isVisible: false.
	(self builder componentAt: #stopPaintCellValue)
		enable;
		isVisible: true.
	self initialTool: self linkedSpaceInterface view controller currentTool.	"self linkedSpaceInterface disableAllTools."
	self linkedSpaceInterface activateToolNamed: 'ChangeAttribute Tool'