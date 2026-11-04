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

{ #category : 'tests - lifecycle' }
CMLinkTest >> roadsOfModel [

	^ model entitiesOfClass: CMMockRoad
]

{ #category : 'tests - direct links' }
CMLinkTest >> testChangingTheAnswerOfAQueryDoesNotChangeTheLinks [

	| cell road |
	cell := model cellAt: 1 at: 1.
	road := model
		        newEntity: CMMockRoad
		        from: cell
		        to: (model cellAt: 1 at: 2).

	cell links removeAll.
	cell outgoingLinks removeAll.
	(cell linksOfClass: CMMockRoad) removeAll.

	self assert: cell links asArray equals: { road }
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

{ #category : 'tests - lifecycle' }
CMLinkTest >> testCreatingANewGridRemovesLinksToTheOldCells [

	| agentRoad |
	agentRoad := model
		             newEntity: CMMockRoad
		             from: self newCow
		             to: (model newEntity: CMMockGoat).
	model
		newEntity: CMMockRoad
		from: (model cellAt: 1 at: 1)
		to: (model cellAt: 1 at: 2).

	model
		createGridNumberOfRows: 2
		numberOfColumns: 2
		neighbourhood: 4
		closed: true.

	self assert: self roadsOfModel asArray equals: { agentRoad }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testDeadAndOffGridEndsStillHaveTheirLinks [

	| dead offGrid cell road otherRoad |
	dead := self newCow.
	offGrid := model newEntity: CMMockGoat.
	cell := model cellAt: 2 at: 2.
	road := model newEntity: CMMockRoad from: dead to: cell.
	otherRoad := model newEntity: CMMockRoad from: offGrid to: cell.

	dead isDead: true.

	self assert: dead links asArray equals: { road }.
	self assert: offGrid links asArray equals: { otherRoad }.
	self assert: cell links asArray equals: {
			road.
			otherRoad }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testDeletedLinkLeavesBothEnds [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.
	road := model newEntity: CMMockRoad from: cellA to: cellB.

	road delete.

	self assertEmpty: cellA links.
	self assertEmpty: cellB links
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testDeletingALinkDoesNotAffectItsEnds [

	| cow goat road |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.
	road := model newEntity: CMMockRoad from: cow to: goat.

	road delete.

	self deny: cow isDead.
	self deny: goat isDead.
	self assert: cow isOnGrid.
	self assert: ((model entitiesOfClass: CMMockCow) includes: cow).
	self assert: ((model entitiesOfClass: CMMockGoat) includes: goat)
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testDeletingALinkRemovesItFromTheModelImmediately [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	road delete.

	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testDeletingALinkTwiceIsHarmless [

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).

	road delete.
	road delete.

	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - direct links' }
CMLinkTest >> testDirectedAndUndirectedLinksCanBeMixed [

	| cell other road friendship |
	cell := model cellAt: 1 at: 1.
	other := model cellAt: 1 at: 2.

	road := model newEntity: CMMockRoad from: other to: cell.
	friendship := model newEntity: CMMockFriendship from: cell to: other.

	self assert: cell links asArray equals: {
			road.
			friendship }.
	self assert: cell outgoingLinks asArray equals: { friendship }.
	self assert: cell incomingLinks asArray equals: {
			road.
			friendship }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testDirectedLinkIsOutgoingFromItsStartAndIncomingToItsEnd [

	| cellA cellB road |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	road := model newEntity: CMMockRoad from: cellA to: cellB.

	self assert: cellA links asArray equals: { road }.
	self assert: cellB links asArray equals: { road }.
	self assert: cellA outgoingLinks asArray equals: { road }.
	self assertEmpty: cellA incomingLinks.
	self assert: cellB incomingLinks asArray equals: { road }.
	self assertEmpty: cellB outgoingLinks
]

{ #category : 'tests - direct links' }
CMLinkTest >> testDirectionIsAskedEachTime [

	| cellA cellB highway |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.
	highway := model newEntity: CMMockHighway from: cellA to: cellB.
	self assertEmpty: cellB outgoingLinks.

	highway isOneWay: false.

	self assert: cellB outgoingLinks asArray equals: { highway }.
	self assert: cellA incomingLinks asArray equals: { highway }
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

{ #category : 'tests - direct links' }
CMLinkTest >> testEntityWithoutLinksAnswersEmptyCollections [

	| cell |
	cell := model cellAt: 1 at: 1.

	self assertEmpty: cell links.
	self assertEmpty: cell outgoingLinks.
	self assertEmpty: cell incomingLinks
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

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkGoesWhenACellEndIsRemoved [

	| cell |
	cell := model cellAt: 1 at: 1.
	model newEntity: CMMockRoad from: cell to: (model cellAt: 2 at: 2).

	cell isDead: true.
	self assert: self roadsOfModel size equals: 1.

	model removeDestroyedEntities.
	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkGoesWhenAnAggregateEndIsRemoved [

	| aggregate |
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 1 at: 1) }.
	model
		newEntity: CMMockRoad
		from: aggregate
		to: (model cellAt: 2 at: 2).

	aggregate isDead: true.
	self assert: self roadsOfModel size equals: 1.

	model removeDestroyedEntities.
	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkGoesWhenAnEndDies [

	| cow |
	cow := self newCow.
	model newEntity: CMMockRoad from: (model cellAt: 2 at: 2) to: cow.

	cow die.

	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkGoesWhenAnEndIsDeleted [

	| cow |
	cow := self newCow.
	model newEntity: CMMockRoad from: cow to: (model cellAt: 2 at: 2).

	cow delete.

	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkGoesWhenAnEndIsRemovedWithoutBeingFlaggedDead [

	| cow |
	cow := self newCow.
	model newEntity: CMMockRoad from: cow to: (model cellAt: 2 at: 2).

	model removeEntity: cow.

	self deny: cow isDead.
	self assertEmpty: self roadsOfModel
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

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkSurvivesAnEndFlaggedDeadUntilItIsRemoved [

	| cow road |
	cow := self newCow.
	road := model
		        newEntity: CMMockRoad
		        from: cow
		        to: (model cellAt: 2 at: 2).

	cow isDead: true.
	self assert: self roadsOfModel asArray equals: { road }.

	model removeDestroyedEntities.
	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testLinkSurvivesAnEndLeavingTheGrid [

	| cow road |
	cow := self newCow.
	road := model
		        newEntity: CMMockRoad
		        from: cow
		        to: (model cellAt: 2 at: 2).

	cow leave.

	self assert: self roadsOfModel asArray equals: { road }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testLinksCanBeDeletedWhileLoopingOverAQuery [

	| cell |
	cell := model cellAt: 1 at: 1.
	model newEntity: CMMockRoad from: cell to: (model cellAt: 1 at: 2).
	model newEntity: CMMockRoad from: cell to: (model cellAt: 2 at: 1).
	model newEntity: CMMockRoad from: cell to: (model cellAt: 2 at: 2).

	cell links do: [ :each | each delete ].

	self assertEmpty: cell links.
	self assertEmpty: (model entitiesOfClass: CMMockRoad)
]

{ #category : 'tests - direct links' }
CMLinkTest >> testLinksOfClassFilterByClassIncludingSubclasses [

	| cell other road highway friendship |
	cell := model cellAt: 1 at: 1.
	other := model cellAt: 1 at: 2.
	road := model newEntity: CMMockRoad from: cell to: other.
	highway := model newEntity: CMMockHighway from: cell to: other.
	friendship := model newEntity: CMMockFriendship from: cell to: other.

	self assert: (cell linksOfClass: CMMockRoad) asArray equals: {
			road.
			highway }.
	self
		assert: (cell linksOfClass: CMMockHighway) asArray
		equals: { highway }.
	self
		assert: (cell linksOfClass: CMMockFriendship) asArray
		equals: { friendship }
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

{ #category : 'tests - direct links' }
CMLinkTest >> testOutgoingAndIncomingLinksOfClassFilterByClassAndDirection [

	| cell other outgoing incoming friendship |
	cell := model cellAt: 1 at: 1.
	other := model cellAt: 1 at: 2.
	outgoing := model newEntity: CMMockHighway from: cell to: other.
	incoming := model newEntity: CMMockRoad from: other to: cell.
	friendship := model newEntity: CMMockFriendship from: cell to: other.

	self
		assert: (cell outgoingLinksOfClass: CMMockRoad) asArray
		equals: { outgoing }.
	self
		assert: (cell incomingLinksOfClass: CMMockRoad) asArray
		equals: { incoming }.
	self
		assert: (cell outgoingLinksOfClass: CMMockFriendship) asArray
		equals: { friendship }.
	self
		assert: (cell incomingLinksOfClass: CMMockFriendship) asArray
		equals: { friendship }
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testReinitializingEntitiesRemovesLinksToCellsAndAgents [

	| cow |
	cow := self newCow.
	model
		newEntity: CMMockRoad
		from: (model cellAt: 1 at: 1)
		to: (model cellAt: 1 at: 2).
	model newEntity: CMMockRoad from: cow to: (model cellAt: 1 at: 2).

	model initEntities.

	self assertEmpty: self roadsOfModel
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testRemovingAnEndRemovesAllItsLinksAndNoOthers [

	| cow cellA cellB other |
	cow := self newCow.
	cellA := model cellAt: 2 at: 2.
	cellB := model cellAt: 2 at: 3.
	model newEntity: CMMockRoad from: cow to: cellA.
	model newEntity: CMMockRoad from: cellB to: cow.
	other := model newEntity: CMMockRoad from: cellA to: cellB.

	cow delete.

	self assert: self roadsOfModel asArray equals: { other }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testRemovingAnEndRemovesTheLinkFromTheOtherEnd [

	| cow cell |
	cow := self newCow.
	cell := model cellAt: 2 at: 2.
	model newEntity: CMMockRoad from: cow to: cell.

	cow delete.

	self assertEmpty: cell links
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> testRemovingAnEndWithLinksOfSeveralClassesRemovesThemAll [

	| cow |
	cow := self newCow.
	model newEntity: CMMockRoad from: cow to: (model cellAt: 2 at: 2).
	model
		newEntity: CMMockFriendship
		from: cow
		to: (model cellAt: 2 at: 3).

	cow delete.

	self assertEmpty: self roadsOfModel.
	self assertEmpty: (model entitiesOfClass: CMMockFriendship)
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

{ #category : 'tests - direct links' }
CMLinkTest >> testUndirectedLinkIsBothOutgoingAndIncomingForBothEnds [

	| cow goat friendship |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.

	friendship := model newEntity: CMMockFriendship from: cow to: goat.

	{
		cow.
		goat } do: [ :each |
			self assert: each links asArray equals: { friendship }.
			self assert: each outgoingLinks asArray equals: { friendship }.
			self assert: each incomingLinks asArray equals: { friendship } ]
]
