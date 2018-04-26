initialize-release
changeEntity
	
	| aList compoForSituated methodsForControlUsed |
	nbExistingEntities value: self entitiesCollection size.
	self nbEntitiesSelected value: nil.
	self nbEntitiesSelectedSituated value: nil.
	self selectedEntities: nil.
	self class entitiesToCreateForSpaceView: nil.	"enable or disable components for situated entities"
	compoForSituated := #(#LabelSituated #nbExistingEntitiesSituated #setColorOfEntities #LabelNb_situated #nbEntitiesSelectedSituated #locateCreatedEntities_Rand #locateCreatedEntities_No #Region1).
	self isSituatedEntity
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compoForSituated refersToLiteral: k)
						ifTrue:
							[v
								enable;
								isVisible: true]].
			entityImage
				figure: (self entityClass imageAtPov: self entityClass name) asFigure.
			entityImage invalidate.
			nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]
		ifFalse:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compoForSituated refersToLiteral: k)
						ifTrue:
							[v
								disable;
								isVisible: false]].
			nbExistingEntitiesSituated value: 0.
			entityImage figure: nil.
			entityImage invalidate].	"enable or disable components for changing color"
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#setColorOfEntities #resetColorOfEntities) refersToLiteral: k)
				ifTrue:
					[(self linkedSpaceInterface isNil not
						and: [self isSpatialEntity or: [self isSituatedEntity]])
						ifTrue:
							[v
								enable;
								isVisible: true]
						ifFalse:
							[v
								disable;
								isVisible: false]]].	"set menu for executing methods"
	aList := List new.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[methodsForControlUsed := self linkedSpaceInterface siConfig
				manipMethodsFor: self entityClass]
		ifFalse: [methodsForControlUsed := self entityClass methodsForControl].
	methodsForControlUsed isEmpty
		ifFalse:
			[aList add: '--control--'.
			aList addAll: methodsForControlUsed].
	self entityClass methodsForInit isEmpty
		ifFalse:
			[aList add: '--init--'.
			aList addAll: self entityClass methodsForInit].
	controlMethodChoices value: aList.
	controlMethod value
		ifNotNil:
			[(controlMethodChoices value includes: controlMethod value asSymbol)
				ifFalse: [controlMethod value: nil]].	"set menu for selecting a subset of instances"
	aList := List new.
	aList add: '--attribute--'.
	(DefaultAttributesSetter attributsFromClass: self entityClass) isEmpty
		ifFalse:
			[aList
				addAll:
					(DefaultAttributesSetter attributsFromClass: self entityClass) sorted].
	aList
		addAll:
			(self entityClass methodsOfProtocolStartingWith: '* accessing') sorted.
	self entityClass methodsForTesting isEmpty
		ifFalse:
			[aList add: '--testing--'.
			aList addAll: self entityClass methodsForTesting sorted].
	testElementChoices value: aList.
	testElement value
		ifNotNil:
			[(testElementChoices value includes: testElement value)
				ifFalse:
					[testElement value: nil.
					testValue value: nil]].	"set menu for changing attribute value"
	aList := List with: ''.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[aList
				addAll:
					(self linkedSpaceInterface siConfig attributesFor: self entityClass).
			#(#setValueLabel #attributeToChangeChoices #valueForAttribute #setAttributeValue)
				do:
					[:acomName | 
					(self linkedSpaceInterface siConfig canChangeValuesFor: self entityClass)
						ifTrue:
							[(self builder namedComponents at: acomName)
								enable;
								isVisible: true]
						ifFalse:
							[(self builder namedComponents at: acomName)
								disable;
								isVisible: false]]]
		ifFalse:
			[aList
				addAll: (DefaultAttributesSetter attributsFromClass: self entityClass)].
	attributeToChangeChoices value: aList.
	attributeToChange value
		ifNotNil:
			[(attributeToChangeChoices value includes: attributeToChange value asSymbol)
				ifFalse: [attributeToChange value: nil]]