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

{ #category : 'tests - all entities' }
CMLinkTest >> cells: aCollectionOfPoints [

	^ aCollectionOfPoints collect: [ :each |
		  model cellAt: each x at: each y ]
]

{ #category : 'tests - creating' }
CMLinkTest >> newCow [

	^ model newEntity: CMMockCow locatedAt: (model cellAt: 1 at: 1)
]

{ #category : 'tests - all entities' }
CMLinkTest >> road: aCell to: anotherCell [

	^ model newEntity: CMMockRoad from: aCell to: anotherCell
]

{ #category : 'tests - lifecycle' }
CMLinkTest >> roadsOfModel [

	^ model entitiesOfClass: CMMockRoad
]

{ #category : 'tests - all entities' }
CMLinkTest >> testAgentsCellsAndAggregatesCanBeInOneNetwork [

	| cow cell aggregate |
	cow := self newCow.
	cell := model cellAt: 2 at: 2.
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 3 at: 3) }.
	self road: cow to: cell.
	self road: cell to: aggregate.

	self assert: cow allDownstreamEntities asArray equals: {
			cell.
			aggregate }
]

{ #category : 'tests - all links' }
CMLinkTest >> testAllDownstreamLinksFollowDirectionAllTheWay [

	| cells first second |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	first := self road: cells first to: cells second.
	second := self road: cells second to: cells third.

	self assert: cells first allDownstreamLinks asArray equals: {
			first.
			second }.
	self
		assert: cells second allDownstreamLinks asArray
		equals: { second }.
	self assertEmpty: cells third allDownstreamLinks
]

{ #category : 'tests - all entities' }
CMLinkTest >> testAllLinkedEntitiesIgnoresDirection [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3).
			         (2 @ 3) }.
	self road: cells first to: cells second.
	self road: cells third to: cells second.
	self road: cells third to: cells fourth.

	self
		assert: cells first allDownstreamEntities asArray
		equals: { cells second }.
	self assert: cells first allLinkedEntities asArray equals: {
			cells second.
			cells third.
			cells fourth }
]

{ #category : 'tests - all links' }
CMLinkTest >> testAllLinksIgnoreDirection [

	| cells first second |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	first := self road: cells first to: cells second.
	second := self road: cells third to: cells second.

	self assert: cells first allDownstreamLinks asArray equals: { first }.
	self assert: cells first allLinks asArray equals: {
			first.
			second }
]

{ #category : 'tests - all links' }
CMLinkTest >> testAllLinksOfClassFollowOnlyTheGivenClassAndItsSubclasses [

	| cells road highway friendship |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3).
			         (2 @ 3) }.
	road := self road: cells first to: cells second.
	highway := model
		           newEntity: CMMockHighway
		           from: cells second
		           to: cells third.
	friendship := model
		              newEntity: CMMockFriendship
		              from: cells third
		              to: cells fourth.

	self
		assert: (cells first allDownstreamLinksOfClass: CMMockRoad) asArray
		equals: {
				road.
				highway }.
	self
		assert: (cells third allUpstreamLinksOfClass: CMMockRoad) asArray
		equals: {
				highway.
				road }.
	self
		assert: (cells second allLinksOfClass: CMMockRoad) asArray
		equals: {
				road.
				highway }.
	self
		assert: (cells first allLinksOfClass: CMMockFriendship) asArray
		equals: #(  ).
	self
		assert: (cells fourth allLinksOfClass: CMMockFriendship) asArray
		equals: { friendship }
]

{ #category : 'tests - all links' }
CMLinkTest >> testAllLinksWithoutAClassFollowEveryKindOfLink [

	| cells road friendship |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	road := self road: cells first to: cells second.
	friendship := model
		              newEntity: CMMockFriendship
		              from: cells second
		              to: cells third.

	self assert: cells first allDownstreamLinks asArray equals: {
			road.
			friendship }.
	self assert: cells first allLinks asArray equals: {
			road.
			friendship }
]

{ #category : 'tests - all links' }
CMLinkTest >> testAllUpstreamLinksFollowDirectionBackwardsAllTheWay [

	| cells first second |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	first := self road: cells first to: cells second.
	second := self road: cells second to: cells third.

	self assert: cells third allUpstreamLinks asArray equals: {
			second.
			first }.
	self assert: cells second allUpstreamLinks asArray equals: { first }.
	self assertEmpty: cells first allUpstreamLinks
]

{ #category : 'tests - all entities' }
CMLinkTest >> testBranchesThatRejoinGiveEachEntityOnce [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (2 @ 1).
			         (2 @ 2) }.
	self road: cells first to: cells second.
	self road: cells first to: cells third.
	self road: cells second to: cells fourth.
	self road: cells third to: cells fourth.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third.
			cells fourth }
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

{ #category : 'tests - all links' }
CMLinkTest >> testChangingTheAnswerOfAllLinksDoesNotChangeTheLinks [

	| cells road |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2) }.
	road := self road: cells first to: cells second.

	cells first allLinks removeAll.

	self assert: cells first allLinks asArray equals: { road }
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

{ #category : 'tests - all entities' }
CMLinkTest >> testCycleEndsAndExcludesTheReceiver [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	self road: cells first to: cells second.
	self road: cells second to: cells third.
	self road: cells third to: cells first.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third }.
	self assert: cells first allUpstreamEntities asArray equals: {
			cells third.
			cells second }.
	self assert: cells first allLinkedEntities size equals: 2
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

{ #category : 'tests - direct entities' }
CMLinkTest >> testDeadAndOffGridEntitiesAreLinkedEntities [

	| cell dead offGrid |
	cell := model cellAt: 2 at: 2.
	dead := self newCow.
	offGrid := model newEntity: CMMockGoat.
	model newEntity: CMMockRoad from: cell to: dead.
	model newEntity: CMMockRoad from: cell to: offGrid.

	dead isDead: true.

	self assert: cell nextEntities asArray equals: {
			dead.
			offGrid }
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

{ #category : 'tests - direct entities' }
CMLinkTest >> testDirectedLinkLeadsFromItsStartToItsEnd [

	| cellA cellB |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	model newEntity: CMMockRoad from: cellA to: cellB.

	self assert: cellA nextEntities asArray equals: { cellB }.
	self assertEmpty: cellA previousEntities.
	self assert: cellB previousEntities asArray equals: { cellA }.
	self assertEmpty: cellB nextEntities.
	self assert: cellA linkedEntities asArray equals: { cellB }.
	self assert: cellB linkedEntities asArray equals: { cellA }
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

{ #category : 'tests - all entities' }
CMLinkTest >> testDownstreamFollowsDirectionAllTheWay [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3).
			         (2 @ 3) }.
	self road: cells first to: cells second.
	self road: cells second to: cells third.
	self road: cells third to: cells fourth.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third.
			cells fourth }.
	self
		assert: cells third allDownstreamEntities asArray
		equals: { cells fourth }.
	self assertEmpty: cells fourth allDownstreamEntities
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

{ #category : 'tests - direct entities' }
CMLinkTest >> testEntitiesAreInTheOrderTheirLinksWereCreated [

	| cell first second third |
	cell := model cellAt: 1 at: 1.
	first := model cellAt: 3 at: 3.
	second := model cellAt: 1 at: 2.
	third := model cellAt: 2 at: 1.

	model newEntity: CMMockRoad from: cell to: first.
	model newEntity: CMMockRoad from: cell to: second.
	model newEntity: CMMockRoad from: cell to: third.

	self assert: cell nextEntities asArray equals: {
			first.
			second.
			third }
]

{ #category : 'tests - all entities' }
CMLinkTest >> testEntitiesInAnotherNetworkAreNotReached [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (3 @ 1).
			         (3 @ 2) }.
	self road: cells first to: cells second.
	self road: cells third to: cells fourth.

	self
		assert: cells first allLinkedEntities asArray
		equals: { cells second }
]

{ #category : 'tests - direct entities' }
CMLinkTest >> testEntitiesLinkedByFollowOnlyTheGivenClassAndItsSubclasses [

	| cell roadEnd highwayEnd friend |
	cell := model cellAt: 1 at: 1.
	roadEnd := model cellAt: 1 at: 2.
	highwayEnd := model cellAt: 2 at: 1.
	friend := model cellAt: 2 at: 2.
	model newEntity: CMMockRoad from: cell to: roadEnd.
	model newEntity: CMMockHighway from: highwayEnd to: cell.
	model newEntity: CMMockFriendship from: cell to: friend.

	self assert: (cell entitiesLinkedBy: CMMockRoad) asArray equals: {
			roadEnd.
			highwayEnd }.
	self
		assert: (cell entitiesLinkedBy: CMMockHighway) asArray
		equals: { highwayEnd }.
	self
		assert: (cell nextEntitiesLinkedBy: CMMockRoad) asArray
		equals: { roadEnd }.
	self
		assert: (cell previousEntitiesLinkedBy: CMMockRoad) asArray
		equals: { highwayEnd }.
	self
		assert: (cell nextEntitiesLinkedBy: CMMockFriendship) asArray
		equals: { friend }.
	self
		assert: (cell previousEntitiesLinkedBy: CMMockFriendship) asArray
		equals: { friend }
]

{ #category : 'tests - direct entities' }
CMLinkTest >> testEntityLinkedSeveralTimesAppearsOnce [

	| cellA cellB |
	cellA := model cellAt: 1 at: 1.
	cellB := model cellAt: 1 at: 2.

	model newEntity: CMMockRoad from: cellA to: cellB.
	model newEntity: CMMockRoad from: cellA to: cellB.
	model newEntity: CMMockRoad from: cellB to: cellA.

	self assert: cellA nextEntities asArray equals: { cellB }.
	self assert: cellA previousEntities asArray equals: { cellB }.
	self assert: cellA linkedEntities asArray equals: { cellB }
]

{ #category : 'tests - direct links' }
CMLinkTest >> testEntityWithoutLinksAnswersEmptyCollections [

	| cell |
	cell := model cellAt: 1 at: 1.

	self assertEmpty: cell links.
	self assertEmpty: cell outgoingLinks.
	self assertEmpty: cell incomingLinks
]

{ #category : 'tests - direct entities' }
CMLinkTest >> testEntityWithoutLinksHasNoLinkedEntities [

	| cell |
	cell := model cellAt: 1 at: 1.

	self assertEmpty: cell linkedEntities.
	self assertEmpty: cell nextEntities.
	self assertEmpty: cell previousEntities
]

{ #category : 'tests - all links' }
CMLinkTest >> testEntityWithoutLinksHasNoLinksToFollow [

	| cell |
	cell := model cellAt: 1 at: 1.

	self assertEmpty: cell allLinks.
	self assertEmpty: cell allDownstreamLinks.
	self assertEmpty: cell allUpstreamLinks
]

{ #category : 'tests - all entities' }
CMLinkTest >> testEntityWithoutLinksReachesNothing [

	| cell |
	cell := model cellAt: 1 at: 1.

	self assertEmpty: cell allLinkedEntities.
	self assertEmpty: cell allDownstreamEntities.
	self assertEmpty: cell allUpstreamEntities
]

{ #category : 'tests - ends' }
CMLinkTest >> testExampleConnectsTwoAgents [

	| link |
	link := CMLink exampleBetweenTwoAgents.

	self assert: link from class equals: CMAgent.
	self assert: link to class equals: CMAgent.
	self assert: (link otherEndOf: link from) identicalTo: link to
]

{ #category : 'tests - direct entities' }
CMLinkTest >> testFormsWithoutAClassFollowEveryKindOfLink [

	| cell roadEnd friend |
	cell := model cellAt: 1 at: 1.
	roadEnd := model cellAt: 1 at: 2.
	friend := model cellAt: 2 at: 2.
	model newEntity: CMMockRoad from: cell to: roadEnd.
	model newEntity: CMMockFriendship from: cell to: friend.

	self assert: cell nextEntities asArray equals: {
			roadEnd.
			friend }.
	self assert: cell linkedEntities asArray equals: {
			roadEnd.
			friend }
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

{ #category : 'tests' }
CMLinkTest >> testLinkDoesNotAnswerLinkQueries [
	"A link is a connection and not a thing that can be linked, so asking for its links is a mistake that must show at once"

	| road |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).
	self should: [ road links ] raise: MessageNotUnderstood.
	self should: [ road nextEntities ] raise: MessageNotUnderstood.
	self should: [ road allLinks ] raise: MessageNotUnderstood
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

{ #category : 'tests - all links' }
CMLinkTest >> testLinkLeadingBackToTheReceiverIsIncluded [

	| cells first second third |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	first := self road: cells first to: cells second.
	second := self road: cells second to: cells third.
	third := self road: cells third to: cells first.

	self assert: cells first allDownstreamLinks asArray equals: {
			first.
			second.
			third }
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

{ #category : 'tests - all entities' }
CMLinkTest >> testLinkedByFollowsOnlyTheGivenClassAndItsSubclasses [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3).
			         (2 @ 3) }.
	self road: cells first to: cells second.
	model newEntity: CMMockHighway from: cells second to: cells third.
	model newEntity: CMMockFriendship from: cells third to: cells fourth.

	self
		assert:
		(cells first allDownstreamEntitiesLinkedBy: CMMockRoad) asArray
		equals: {
				cells second.
				cells third }.
	self
		assert:
		(cells first allDownstreamEntitiesLinkedBy: CMMockHighway) asArray
		equals: #(  ).
	self
		assert:
		(cells third allUpstreamEntitiesLinkedBy: CMMockRoad) asArray
		equals: {
				cells second.
				cells first }.
	self
		assert: (cells fourth allEntitiesLinkedBy: CMMockRoad) asArray
		equals: #(  ).
	self
		assert: (cells second allEntitiesLinkedBy: CMMockRoad) asArray
		equals: {
				cells first.
				cells third }
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

{ #category : 'tests - all links' }
CMLinkTest >> testLinksCanBeDeletedWhileLoopingOverAllLinks [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	self road: cells first to: cells second.
	self road: cells second to: cells third.

	cells first allLinks do: [ :each | each delete ].

	self assertEmpty: cells first allLinks.
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

{ #category : 'tests - model' }
CMLinkTest >> testModelAnswersLinksOfEveryClass [

	| cow goat cell road highway friendship |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.
	cell := model cellAt: 2 at: 2.
	road := model newEntity: CMMockRoad from: cow to: cell.
	highway := model newEntity: CMMockHighway from: goat to: cell.
	friendship := model newEntity: CMMockFriendship from: cow to: goat.

	self assert: model links size equals: 3.
	self assert: (model links includesAll: {
				 road.
				 highway.
				 friendship })
]

{ #category : 'tests - model' }
CMLinkTest >> testModelNoLongerAnswersARemovedLink [

	| road other |
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 1 at: 1)
		        to: (model cellAt: 1 at: 2).
	other := model
		         newEntity: CMMockRoad
		         from: (model cellAt: 2 at: 1)
		         to: (model cellAt: 2 at: 2).

	road delete.

	self assert: model links asArray equals: { other }
]

{ #category : 'tests - model' }
CMLinkTest >> testModelWithoutLinksAnswersAnEmptyCollection [

	self assertEmpty: model links
]

{ #category : 'tests - all entities' }
CMLinkTest >> testNearestEntitiesComeFirst [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3).
			         (2 @ 1).
			         (2 @ 2) }.
	"The first branch is longer, and is created first"
	self road: cells first to: cells second.
	self road: cells second to: cells fifth.
	self road: cells first to: cells third.
	self road: cells third to: cells fourth.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third.
			cells fifth.
			cells fourth }
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

{ #category : 'tests - all links' }
CMLinkTest >> testParallelLinksAreAllIncluded [

	| cells first second |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2) }.
	first := self road: cells first to: cells second.
	second := self road: cells first to: cells second.

	self assert: cells first allDownstreamLinks asArray equals: {
			first.
			second }
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

{ #category : 'tests - all entities' }
CMLinkTest >> testRemovedEntityBreaksThePath [

	| cow cellA cellB |
	cow := self newCow.
	cellA := model cellAt: 2 at: 2.
	cellB := model cellAt: 2 at: 3.
	self road: cellA to: cow.
	self road: cow to: cellB.

	cow delete.

	self assertEmpty: cellA allDownstreamEntities
]

{ #category : 'tests - direct entities' }
CMLinkTest >> testRemovedEntityIsNoLongerALinkedEntity [

	| cell cow |
	cell := model cellAt: 2 at: 2.
	cow := self newCow.
	model newEntity: CMMockRoad from: cell to: cow.

	cow delete.

	self assertEmpty: cell nextEntities
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

{ #category : 'tests - creating' }
CMLinkTest >> testThingsAreLinkableButLinksAreNot [

	| cell cow aggregate road |
	cell := model cellAt: 1 at: 1.
	cow := self newCow.
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 2 at: 1) }.
	road := model
		        newEntity: CMMockRoad
		        from: cell
		        to: (model cellAt: 1 at: 2).

	self assert: cell isLinkable.
	self assert: cow isLinkable.
	self assert: aggregate isLinkable.
	self deny: road isLinkable
]

{ #category : 'tests - all entities' }
CMLinkTest >> testTraversalGoesThroughDeadAndOffGridEntities [

	| dead offGrid cellA cellB |
	dead := self newCow.
	offGrid := model newEntity: CMMockGoat.
	cellA := model cellAt: 2 at: 2.
	cellB := model cellAt: 2 at: 3.
	self road: cellA to: dead.
	self road: dead to: offGrid.
	self road: offGrid to: cellB.

	dead isDead: true.

	self assert: cellA allDownstreamEntities asArray equals: {
			dead.
			offGrid.
			cellB }
]

{ #category : 'tests - all entities' }
CMLinkTest >> testTraversalWithoutAClassFollowsEveryKindOfLink [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	self road: cells first to: cells second.
	model newEntity: CMMockFriendship from: cells second to: cells third.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third }.
	self assert: cells first allLinkedEntities asArray equals: {
			cells second.
			cells third }
]

{ #category : 'tests - all links' }
CMLinkTest >> testUndirectedLinkAppearsOnceInAllLinks [

	| cow goat friendship |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.
	friendship := model newEntity: CMMockFriendship from: cow to: goat.

	self assert: cow allLinks asArray equals: { friendship }.
	self assert: cow allDownstreamLinks asArray equals: { friendship }.
	self assert: cow allUpstreamLinks asArray equals: { friendship }
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

{ #category : 'tests - direct entities' }
CMLinkTest >> testUndirectedLinkLeadsBothWays [

	| cow goat |
	cow := self newCow.
	goat := model newEntity: CMMockGoat.

	model newEntity: CMMockFriendship from: cow to: goat.

	self assert: cow nextEntities asArray equals: { goat }.
	self assert: cow previousEntities asArray equals: { goat }.
	self assert: goat nextEntities asArray equals: { cow }.
	self assert: goat previousEntities asArray equals: { cow }
]

{ #category : 'tests - all entities' }
CMLinkTest >> testUndirectedLinksAreFollowedBothWays [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	model newEntity: CMMockFriendship from: cells second to: cells first.
	self road: cells second to: cells third.

	self assert: cells first allDownstreamEntities asArray equals: {
			cells second.
			cells third }.
	self assert: cells third allUpstreamEntities asArray equals: {
			cells second.
			cells first }
]

{ #category : 'tests - all entities' }
CMLinkTest >> testUpstreamFollowsDirectionBackwardsAllTheWay [

	| cells |
	cells := self cells: {
			         (1 @ 1).
			         (1 @ 2).
			         (1 @ 3) }.
	self road: cells first to: cells second.
	self road: cells second to: cells third.

	self assert: cells third allUpstreamEntities asArray equals: {
			cells second.
			cells first }.
	self assertEmpty: cells first allUpstreamEntities
]
