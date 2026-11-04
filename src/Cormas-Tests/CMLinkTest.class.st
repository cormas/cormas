"
I test `CMLink` through a mock model: what can be linked, and what a link knows about its ends.
"
Class {
	#name : 'CMLinkTest',
	#superclass : 'CMTestObject',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests - creating' }
CMLinkTest >> newCow [

	^ model newEntity: CMMockCow locatedAt: (model cellAt: 1 at: 1)
]

{ #category : 'tests - ends' }
CMLinkTest >> testChangingTheAnswerOfEndsDoesNotChangeTheLink [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.
	road := model newEntity: CMMockRoad from: cellA to: cellB.

	road ends at: 1 put: cellB.

	self assert: road from identicalTo: cellA.
	self assert: road ends asArray equals: {
			cellA.
			cellB }
]

{ #category : 'tests - creating' }
CMLinkTest >> testCreatedLinkIsRegisteredInTheModel [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	self assert: road cormasModel identicalTo: model.
	self
		assert: (model entitiesOfClass: CMMockRoad) asArray
		equals: { road }
]

{ #category : 'tests - creating' }
CMLinkTest >> testCreatedLinkKnowsItsEnds [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	road := model newEntity: CMMockRoad from: cellA to: cellB.

	self assert: road class equals: CMMockRoad.
	self assert: road from identicalTo: cellA.
	self assert: road to identicalTo: cellB
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndCanBeDeadButNotYetRemoved [

	| cow road |
	cow := self newCow.
	cow isDead: true.

	road := model
		        newEntity: CMMockRoad
		        from: cow
		        to: (model cellAt: 1 at: 1).

	self assert: road from identicalTo: cow
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndCanBeOffTheGrid [

	| cow road |
	cow := model newEntity: CMMockCow.

	road := model
		        newEntity: CMMockRoad
		        from: cow
		        to: (model cellAt: 1 at: 1).

	self assert: road from identicalTo: cow
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndCannotBeALink [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.
	road := model newEntity: CMMockRoad from: cellA to: cellB.

	self
		should: [ model newEntity: CMMockRoad from: road to: cellA ]
		raise: Error.
	self
		should: [ model newEntity: CMMockRoad from: cellA to: road ]
		raise: Error.

	self assert: (model entitiesOfClass: CMMockRoad) size equals: 1
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndCannotBeAnEntityAlreadyRemoved [

	| cow |
	cow := self newCow.
	cow delete.

	self
		should: [
		model newEntity: CMMockRoad from: cow to: (model cellAt: 1 at: 1) ]
		raise: Error.

	self assertEmpty: (model entitiesOfClass: CMMockRoad)
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndCannotBeInAnotherModel [

	| otherModel otherCow |
	otherModel := self newTestModel.
	otherModel initFixed.
	otherCow := otherModel newEntity: CMMockCow.

	self
		should: [
			model
				newEntity: CMMockRoad
				from: (model cellAt: 1 at: 1)
				to: otherCow ]
		raise: Error.
	self
		should: [
			model
				newEntity: CMMockRoad
				from: otherCow
				to: (model cellAt: 1 at: 1) ]
		raise: Error.

	self assertEmpty: (model entitiesOfClass: CMMockRoad)
]

{ #category : 'tests - ends' }
CMLinkTest >> testEndsAnswersBothEnds [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	road := model newEntity: CMMockRoad from: cellA to: cellB.

	self assert: road ends asArray equals: {
			cellA.
			cellB }
]

{ #category : 'tests - creating' }
CMLinkTest >> testEndsCannotBeTheSameEntity [

	| cell |
	cell := model cellAt: 1 at: 1.

	self
		should: [ model newEntity: CMMockRoad from: cell to: cell ]
		raise: Error.

	self assertEmpty: (model entitiesOfClass: CMMockRoad)
]

{ #category : 'tests - ends' }
CMLinkTest >> testExampleConnectsTwoAgents [

	| link |
	link := CMLink exampleBetweenTwoAgents.

	self assert: link from class equals: CMAgent.
	self assert: link to class equals: CMAgent.
	self assert: (link otherEndOf: link from) identicalTo: link to
]

{ #category : 'tests - creating' }
CMLinkTest >> testLinkCanConnectAnyTypesOfEntities [

	| cow goat cell aggregate |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.
	cell := model cellAt: 2 at: 2.
	aggregate := model createAggregate: CMMockAggregate from: { cell }.

	{
		(cow -> goat).
		(cow -> cell).
		(cell -> cow).
		(cell -> (model cellAt: 2 at: 3)).
		(aggregate -> cell).
		(aggregate -> cow) } do: [ :ends |
			| link |
			link := model newEntity: CMMockRoad from: ends key to: ends value.
			self assert: link from identicalTo: ends key.
			self assert: link to identicalTo: ends value ]
]

{ #category : 'tests - ends' }
CMLinkTest >> testLinkIsDirectedByDefault [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	self assert: road isDirected
]

{ #category : 'tests - ends' }
CMLinkTest >> testOtherEndOfAnEntityThatIsNotAnEndIsAnError [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	self
		should: [ road otherEndOf: (model cellAt: 2 at: 2) ]
		raise: Error
]

{ #category : 'tests - ends' }
CMLinkTest >> testOtherEndOfAnswersTheOtherEnd [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	road := model newEntity: CMMockRoad from: cellA to: cellB.

	self assert: (road otherEndOf: cellA) identicalTo: cellB.
	self assert: (road otherEndOf: cellB) identicalTo: cellA
]

{ #category : 'tests - ends' }
CMLinkTest >> testRemovingDeadEntitiesKeepsALinkBetweenLivingEntities [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	model removeDestroyedEntities.

	self
		assert: (model entitiesOfClass: CMMockRoad) asArray
		equals: { road }
]

{ #category : 'tests - creating' }
CMLinkTest >> testSameEntitiesCanBeLinkedSeveralTimes [

	| cellA cellB first second |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	first := model newEntity: CMMockRoad from: cellA to: cellB.
	second := model newEntity: CMMockRoad from: cellA to: cellB.

	self deny: first identicalTo: second.
	self assert: (model entitiesOfClass: CMMockRoad) size equals: 2
]

{ #category : 'tests - ends' }
CMLinkTest >> testSubclassCanBeUndirected [

	| friendship |
	friendship := model
		              newEntity: CMMockFriendship
		              from: self newCow
		              to: (model newEntity: CMMockGoat).

	self deny: friendship isDirected
]
