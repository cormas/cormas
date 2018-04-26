actions
mainApply
	
	self toBePerformed value = #execute
		ifTrue:
			[self controlMethod value isNil
				ifTrue: [^Dialog warn: 'Please select a method to be performed'].
			^self targetEntities value = #byClicking
				ifFalse: [self executeMethodOnEntities]
				ifTrue: [self executeMethodByPainting]].
	self toBePerformed value = #setValue
		ifTrue:
			[self attributeToChange value isNil
				ifTrue: [^Dialog warn: 'Please select an attribute'].
			self valueForAttribute value isNil
				ifTrue: [^Dialog warn: 'Please enter a value'].
			^self targetEntities value = #byClicking
				ifFalse: [self setAttributeValue]
				ifTrue: [self changeAttributeByPainting]].
	self toBePerformed value = #inspect
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self inspectSelectedEntities]
				ifTrue: [self inspectByPainting]].
	self toBePerformed value = #changeColor
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self setColorOfEntities]
				ifTrue: [self setColorByPainting]].
	self toBePerformed value = #resetColor
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self resetColorOfEntities]
				ifTrue: [self resetColorByPainting]]