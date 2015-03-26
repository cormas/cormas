initialize-release
changeEntity
	
	| aList compo |
	nbExistingEntities value: self entitiesCollection size.
	compo := #(#LabelSituated #nbExistingEntitiesSituated #LabelLocate1 #LabelLocate2 #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained #entityImage #Region1).
	self isSituatedEntity
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compo refersToLiteral: k)
						ifTrue:
							[v
								enable;
								isVisible: true]].
			self nbExistingEntitiesSituated
				ifNotNil:
					[nbExistingEntitiesSituated
						value: (self entitiesCollection select: [:a | a isSituated]) size].
			entityImage
				figure: (self entityClass imageAtPov: self entityClass name) asFigure.
			entityImage invalidate.	"invalidate message will ask the view to update its display"
			self linkedSpaceInterface
				ifNotNil:
					[self nbEntitiesToCreate value: 'x' asText.
					self locateCreatedEntities value: #manually]
				ifNil:
					[self nbEntitiesToCreate value: '0' asText.
					self locateCreatedEntities value: #no.
					(self builder namedComponents at: #locateCreatedEntities_SpaceView)
						disable;
						isVisible: false]]
		ifFalse:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compo refersToLiteral: k)
						ifTrue:
							[v
								disable;
								isVisible: false]].
			self nbExistingEntitiesSituated value: 0].
	aList := List with: ''.
	aList addAll: self entityClass methodsForInit.
	self initMethodChoices value: aList.
	initMethod value: nil	"self initMethod value isNil ifFalse:[(initMethodChoices value includes: initMethod value asSymbol) ifFalse:[initMethod value:nil]] "