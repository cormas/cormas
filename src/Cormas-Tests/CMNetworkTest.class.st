"
I test `CMNetwork`: what it holds and answers, whatever the shape of its links.
"
Class {
	#name : 'CMNetworkTest',
	#superclass : 'CMTestObject',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'helpers' }
CMNetworkTest >> newCity [

	^ model newEntity: CMMockCity
]

{ #category : 'helpers' }
CMNetworkTest >> newStreet [

	^ model newEntity: CMMockStreet
]

{ #category : 'helpers' }
CMNetworkTest >> roadNumber: aNumber [

	^ model
		  newEntity: CMMockRoad
		  from: (model cellAt: 1 at: aNumber)
		  to: (model cellAt: 2 at: aNumber)
]

{ #category : 'tests - membership' }
CMNetworkTest >> testALinkCanBelongToSeveralNetworksInTheOrderItJoinedThem [

	| street city road |
	road := self roadNumber: 1.
	street := self newStreet.
	city := self newCity.
	city add: road.
	street add: road.
	self assert: road networks asArray equals: {
			city.
			street }
]

{ #category : 'tests - contents' }
CMNetworkTest >> testALinkInsideSeveralMembersIsAnsweredOnce [

	| street1 street2 city road |
	road := self roadNumber: 1.
	street1 := self newStreet.
	street1 add: road.
	street2 := self newStreet.
	street2 add: road.
	city := self newCity.
	city addAll: {
			street1.
			street2.
			road }.
	self assert: city links asArray equals: { road }
]

{ #category : 'tests - errors' }
CMNetworkTest >> testAddAllStopsAtAThing [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	self
		should: [
				street addAll: {
						road.
						(model cellAt: 3 at: 3) } ]
		raise: Error
		withExceptionDo: [ :error |
		self deny: (error isKindOf: MessageNotUnderstood) ].
	self assert: street members asArray equals: { road }
]

{ #category : 'tests - contents' }
CMNetworkTest >> testAddAnswersTheMember [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	self assert: (street add: road) identicalTo: road
]

{ #category : 'tests - contents' }
CMNetworkTest >> testAddingAMemberTwiceChangesNothing [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	street add: road.
	street add: road.
	self assert: street members size equals: 1.
	self assert: road networks size equals: 1
]

{ #category : 'tests - errors' }
CMNetworkTest >> testCannotAddAThing [

	| street aggregate |
	street := self newStreet.
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 3 at: 3) }.
	{
		(model cellAt: 1 at: 1).
		(model newEntity: CMMockCow).
		aggregate } do: [ :each |
			self
				should: [ street add: each ]
				raise: Error
				withExceptionDo: [ :error |
				self deny: (error isKindOf: MessageNotUnderstood) ] ].
	self assert: street members isEmpty
]

{ #category : 'tests - removing' }
CMNetworkTest >> testCannotRemoveAMemberOfANestedNetwork [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: street.
	self
		should: [ city remove: road ]
		raise: Error
		withExceptionDo: [ :error |
		self deny: (error isKindOf: MessageNotUnderstood) ].
	self assert: street members asArray equals: { road }.
	self assert: road networks asArray equals: { street }
]

{ #category : 'tests - removing' }
CMNetworkTest >> testCannotRemoveWhatWasNeverAdded [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	self
		should: [ street remove: road ]
		raise: Error
		withExceptionDo: [ :error |
		self deny: (error isKindOf: MessageNotUnderstood) ]
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainCanFollowAgentsAndCellsTogether [

	| street cow cell chain |
	street := self newStreet.
	cow := model newEntity: CMMockCow.
	cell := model cellAt: 1 at: 1.
	chain := street addChainOf: CMMockFriendship through: {
			         cow.
			         cell }.
	self assert: chain first from identicalTo: cow.
	self assert: chain first to identicalTo: cell.
	self deny: chain first isDirected
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainCannotLinkAPlaceToItself [

	| street cell |
	street := self newStreet.
	cell := model cellAt: 1 at: 1.
	self
		should: [
				street addChainOf: CMMockRoad through: {
						cell.
						cell } ]
		raise: Error
		withExceptionDo: [ :error |
		self deny: (error isKindOf: MessageNotUnderstood) ].
	self assert: street members isEmpty.
	self assert: (model entitiesOfClass: CMMockRoad) isEmpty
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainLinksEachPlaceToTheNextAndAddsTheLinks [

	| street a b c chain |
	street := self newStreet.
	a := model cellAt: 1 at: 1.
	b := model cellAt: 1 at: 2.
	c := model cellAt: 2 at: 2.
	chain := street addChainOf: CMMockRoad through: {
			         a.
			         b.
			         c }.
	self assert: chain size equals: 2.
	self assert: chain first from identicalTo: a.
	self assert: chain first to identicalTo: b.
	self assert: chain second from identicalTo: b.
	self assert: chain second to identicalTo: c.
	self assert: street members asArray equals: chain asArray.
	self assert: (model entitiesOfClass: CMMockRoad) size equals: 2
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainThroughNoPlaceHasNoLinks [

	| street |
	street := self newStreet.
	self assert: (street addChainOf: CMMockRoad through: #(  )) isEmpty
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainThroughOnePlaceHasNoLinks [

	| street chain |
	street := self newStreet.
	chain := street
		         addChainOf: CMMockRoad
		         through: { (model cellAt: 1 at: 1) }.
	self assert: chain isEmpty.
	self assert: street members isEmpty.
	self assert: (model entitiesOfClass: CMMockRoad) isEmpty
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChainsCanJoinAtAPlaceToMakeATributary [

	| river a b c d e f |
	river := self newStreet.
	a := model cellAt: 1 at: 1.
	b := model cellAt: 1 at: 2.
	c := model cellAt: 3 at: 1.
	d := model cellAt: 2 at: 2.
	e := model cellAt: 2 at: 3.
	f := model cellAt: 3 at: 3.
	river addChainOf: CMMockRoad through: {
			a.
			b.
			d.
			e.
			f }.
	river addChainOf: CMMockRoad through: {
			c.
			d }.
	self assert: river links size equals: 5.
	self assert: (d incomingLinksOfClass: CMMockRoad) size equals: 2.
	self assert: (d outgoingLinksOfClass: CMMockRoad) size equals: 1
]

{ #category : 'tests - contents' }
CMNetworkTest >> testChangingAnAnswerDoesNotChangeTheNetwork [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	street add: road.
	street members removeAll.
	street links removeAll.
	road networks removeAll.
	self assert: street members size equals: 1.
	self assert: street links size equals: 1.
	self assert: road networks size equals: 1
]

{ #category : 'tests - chains' }
CMNetworkTest >> testChangingTheAnswerOfAChainDoesNotChangeTheNetwork [

	| street chain |
	street := self newStreet.
	chain := street addChainOf: CMMockRoad through: {
			         (model cellAt: 1 at: 1).
			         (model cellAt: 1 at: 2) }.
	chain removeAll.
	self assert: street links size equals: 1
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testDeletedLinkLeavesEveryNetwork [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: road.
	road delete.
	self assert: street members isEmpty.
	self assert: city links isEmpty
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testDeletedNetworkIsRemovedFromTheModel [

	| street |
	street := self newStreet.
	street delete.
	self deny:
		((model entitiesOfClass: CMMockStreet) identityIncludes: street)
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testDeletedNetworkKeepsItsContentsInTheModel [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: street.
	city delete.
	self assert: street networks isEmpty.
	self assert: street links asArray equals: { road }.
	self assert:
		((model entitiesOfClass: CMMockStreet) identityIncludes: street).
	self assert:
		((model entitiesOfClass: CMMockRoad) identityIncludes: road)
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testDeletedNetworkLeavesTheNetworksContainingIt [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: street.
	street delete.
	self assert: city members isEmpty.
	self assert: city links isEmpty.
	self assert: road networks isEmpty.
	self assert:
		((model entitiesOfClass: CMMockRoad) identityIncludes: road)
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testEmptyNetworkStaysInTheModel [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	street add: road.
	road delete.
	self assert: street links isEmpty.
	self assert:
		((model entitiesOfClass: CMMockStreet) identityIncludes: street)
]

{ #category : 'tests - shape' }
CMNetworkTest >> testEntitiesAnswersANewCollection [

	| street |
	street := self newStreet.
	street add: (self roadNumber: 1).
	street entities removeAll.
	self assert: street entities size equals: 2
]

{ #category : 'tests - shape' }
CMNetworkTest >> testEntitiesAreTheEndsOfTheLinksEachOnce [

	| street a b c cow |
	street := self newStreet.
	a := model cellAt: 1 at: 1.
	b := model cellAt: 1 at: 2.
	c := model cellAt: 2 at: 2.
	cow := model newEntity: CMMockCow.
	street addChainOf: CMMockRoad through: {
			a.
			b.
			c }.
	street add: (model newEntity: CMMockFriendship from: cow to: a).
	self assert: street entities asArray equals: {
			a.
			b.
			c.
			cow }
]

{ #category : 'tests - shape' }
CMNetworkTest >> testEntitiesIncludeThoseOfNestedNetworks [

	| street city a b c d |
	street := self newStreet.
	city := self newCity.
	a := model cellAt: 1 at: 1.
	b := model cellAt: 1 at: 2.
	c := model cellAt: 2 at: 1.
	d := model cellAt: 2 at: 2.
	street add: (model newEntity: CMMockRoad from: a to: b).
	city add: street.
	city add: (model newEntity: CMMockRoad from: c to: d).
	self assert: city entities asArray equals: {
			a.
			b.
			c.
			d }
]

{ #category : 'tests - shape' }
CMNetworkTest >> testEntitiesOfAnEmptyNetworkIsEmpty [

	self assert: self newStreet entities isEmpty
]

{ #category : 'tests - contents' }
CMNetworkTest >> testIncludesFindsMembersAtAnyDepth [

	| street city road other |
	road := self roadNumber: 1.
	other := self roadNumber: 2.
	street := self newStreet.
	street add: road.
	city := self newCity.
	city add: street.
	self assert: (street includes: road).
	self assert: (city includes: road).
	self assert: (city includes: street).
	self deny: (city includes: other).
	self deny: (street includes: city).
	self deny: (city includes: city)
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testLinkLeavesItsNetworksWhenACellEndIsRemoved [

	| street cell road other |
	street := self newStreet.
	cell := model cellAt: 1 at: 1.
	road := model
		        newEntity: CMMockRoad
		        from: cell
		        to: (model cellAt: 2 at: 1).
	other := self roadNumber: 2.
	street addAll: {
			road.
			other }.
	model removeEntity: cell.
	self assert: street members asArray equals: { other }
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testLinkLeavesItsNetworksWhenAnAgentEndDies [

	| street cow road |
	street := self newStreet.
	cow := model newEntity: CMMockCow.
	road := model
		        newEntity: CMMockRoad
		        from: cow
		        to: (model cellAt: 1 at: 1).
	street add: road.
	cow die.
	self assert: street members isEmpty
]

{ #category : 'tests - contents' }
CMNetworkTest >> testLinksAreAnsweredInTheOrderTheyWereAdded [

	| street road1 road2 road3 |
	street := self newStreet.
	road1 := self roadNumber: 1.
	road2 := self roadNumber: 2.
	road3 := self roadNumber: 3.
	street add: road3.
	street addAll: {
			road1.
			road2 }.
	self assert: street links asArray equals: {
			road3.
			road1.
			road2 }.
	self assert: street members asArray equals: {
			road3.
			road1.
			road2 }
]

{ #category : 'tests - contents' }
CMNetworkTest >> testLinksAreFlattenedAtAnyDepthAndMembersAreNot [

	| district street city road1 road2 road3 |
	road1 := self roadNumber: 1.
	road2 := self roadNumber: 2.
	road3 := self roadNumber: 3.
	street := self newStreet.
	street add: road1.
	district := self newCity.
	district add: street.
	district add: road2.
	city := self newCity.
	city add: district.
	city add: road3.
	self assert: city links asArray equals: {
			road1.
			road2.
			road3 }.
	self assert: city members asArray equals: {
			district.
			road3 }
]

{ #category : 'tests - contents' }
CMNetworkTest >> testLinksCanBeOfAnyClassAndAnyShape [

	| street road friendship |
	street := self newStreet.
	road := self roadNumber: 1.
	friendship := model
		              newEntity: CMMockFriendship
		              from: (model cellAt: 3 at: 1)
		              to: (model cellAt: 3 at: 3).
	street addAll: {
			road.
			friendship }.
	self assert: street links asArray equals: {
			road.
			friendship }
]

{ #category : 'tests - contents' }
CMNetworkTest >> testNetworkAddedLaterIsSeenByTheNetworkContainingIt [

	| street city road |
	street := self newStreet.
	city := self newCity.
	city add: street.
	road := self roadNumber: 1.
	street add: road.
	self assert: city links asArray equals: { road }
]

{ #category : 'tests - as an entity' }
CMNetworkTest >> testNetworkCannotBeAnEndOfALink [

	| street cell |
	street := self newStreet.
	cell := model cellAt: 1 at: 1.
	self deny: street isLinkable.
	self
		should: [ model newEntity: CMMockRoad from: street to: cell ]
		raise: Error.
	self
		should: [ model newEntity: CMMockRoad from: cell to: street ]
		raise: Error.
	self assert: (model entitiesOfClass: CMMockRoad) isEmpty
]

{ #category : 'tests - errors' }
CMNetworkTest >> testNetworkCannotContainItself [

	| street |
	street := self newStreet.
	self should: [ street add: street ] raise: Error.
	self assert: street members isEmpty.
	self assert: street networks isEmpty
]

{ #category : 'tests - errors' }
CMNetworkTest >> testNetworkCannotContainItselfThroughAnotherNetwork [

	| street district city |
	street := self newStreet.
	district := self newCity.
	city := self newCity.
	city add: district.
	district add: street.
	self should: [ street add: city ] raise: Error.
	self should: [ street add: district ] raise: Error.
	self should: [ district add: city ] raise: Error.
	self assert: street members isEmpty.
	self assert: district members asArray equals: { street }
]

{ #category : 'tests - as an entity' }
CMNetworkTest >> testNetworkDoesNotAnswerQuestionsAboutWhatLinksReach [

	| street |
	street := self newStreet.
	self should: [ street outgoingLinks ] raise: MessageNotUnderstood.
	self should: [ street allLinks ] raise: MessageNotUnderstood
]

{ #category : 'tests - as an entity' }
CMNetworkTest >> testNetworkIsNotOnTheGrid [

	| street |
	street := self newStreet.
	street add: (self roadNumber: 1).
	self deny: street isOnGrid
]

{ #category : 'tests - as an entity' }
CMNetworkTest >> testNetworkSurvivesTheRemovalOfDeadEntities [

	| street |
	street := self newStreet.
	model removeDestroyedEntities.
	self assert:
		((model entitiesOfClass: CMMockStreet) identityIncludes: street)
]

{ #category : 'tests - membership' }
CMNetworkTest >> testNetworksAnswersOnlyThoseDirectlyContaining [

	| street city road |
	road := self roadNumber: 1.
	street := self newStreet.
	street add: road.
	city := self newCity.
	city add: street.
	self assert: road networks asArray equals: { street }.
	self assert: street networks asArray equals: { city }.
	self assert: city networks isEmpty
]

{ #category : 'tests - membership' }
CMNetworkTest >> testNetworksOfClassIncludesSubclasses [

	| street city road |
	road := self roadNumber: 1.
	street := self newStreet.
	city := self newCity.
	street add: road.
	city add: road.
	self
		assert: (road networksOfClass: CMMockStreet) asArray
		equals: { street }.
	self assert: (road networksOfClass: CMNetwork) asArray equals: {
			street.
			city }.
	self assert: (street networksOfClass: CMMockCity) isEmpty
]

{ #category : 'tests - contents' }
CMNetworkTest >> testNewNetworkIsEmptyAndInTheModel [

	| street |
	street := self newStreet.
	self assert: street members isEmpty.
	self assert: street links isEmpty.
	self assert:
		((model entitiesOfClass: CMMockStreet) identityIncludes: street)
]

{ #category : 'tests - lifecycle' }
CMNetworkTest >> testReinitializingEntitiesRemovesNetworks [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: street.
	model initEntities.
	self assertEmpty: (model entitiesOfClass: CMMockStreet).
	self assertEmpty: (model entitiesOfClass: CMMockCity).
	self assertEmpty: (model entitiesOfClass: CMMockRoad)
]

{ #category : 'tests - removing' }
CMNetworkTest >> testRemoveAnswersTheMember [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	street add: road.
	self assert: (street remove: road) identicalTo: road
]

{ #category : 'tests - removing' }
CMNetworkTest >> testRemovedLinkCanBeAddedAgain [

	| street road |
	street := self newStreet.
	road := self roadNumber: 1.
	street add: road.
	street remove: road.
	street add: road.
	self assert: street members asArray equals: { road }.
	self assert: road networks asArray equals: { street }
]

{ #category : 'tests - removing' }
CMNetworkTest >> testRemovedLinkStaysInTheModelAndInItsOtherNetworks [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: road.
	street remove: road.
	self assert: street members isEmpty.
	self assert: road networks asArray equals: { city }.
	self assert: (city includes: road).
	self assert:
		((model entitiesOfClass: CMMockRoad) identityIncludes: road)
]

{ #category : 'tests - removing' }
CMNetworkTest >> testRemovedNetworkTakesItsLinksOutOfTheNetworkThatHeldIt [

	| street city road |
	street := self newStreet.
	city := self newCity.
	road := self roadNumber: 1.
	street add: road.
	city add: street.
	city remove: street.
	self assert: city links isEmpty.
	self deny: (city includes: road).
	self assert: street links asArray equals: { road }.
	self assert: street networks isEmpty
]

{ #category : 'tests - errors' }
CMNetworkTest >> testSeveralNetworksCanShareANetwork [

	| street city1 city2 |
	street := self newStreet.
	city1 := self newCity.
	city2 := self newCity.
	city1 add: street.
	city2 add: street.
	self assert: street networks asArray equals: {
			city1.
			city2 }
]
