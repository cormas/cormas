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
