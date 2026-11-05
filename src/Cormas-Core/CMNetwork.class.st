"
I represent any set of links as one object, with my own attributes and points of view: a street made of road segments, a city made of streets, or a river with tributaries. I do not have to be connected: my links can have any shape, and they can be scattered across the map.

To use me, create a subclass of me in your model, as with cells, agents and links.

A thing such as a cell or an agent is connected to another thing by a link, and a network collects those connections. A network is not a thing, so it cannot be an end of a link.

## Responsibility:

- Hold links and other networks, in the order they were added.
- Answer all the links inside me, at any depth, each of them once.
- Tell whether a link or a network is inside me.

## Collaborators:

- `CMLink`: my main kind of member.
- `TCMNetworkMember`: lets my members, including other networks, know that they are in me.
- `CMModel`: creates me.

## Public API and Key Messages

- `CMModel>>newEntity:` creates me.
- `add:` and `addAll:` add links and networks. Adding one that I already hold directly changes nothing. Adding a thing, or a network that I am inside of, is an error.
- `addChainOf:through:` creates a link from each thing to the next one and adds them.
- `remove:` takes out a direct member, which stays in the model.
- `delete` removes me from the model, and what I hold stays there.
- `members` answers what was directly added to me.
- `links` answers all the links inside me, at any depth.
- `entities` answers the things at the ends of those links.
- `sources` and `sinks` answer the things where none of my links arrives, or leaves. There can be several or none.
- `terminals` answers the things touching exactly one of my links, whatever its direction, such as the two ends of a two-way street.
- `includes:` tells whether a link or a network is inside me, at any depth.
- `networks` and `networksOfClass:` answer the networks directly containing me.

```
street := self newEntity: Street.
street addAll: { road1. road2 }.
city := self newEntity: City.
city add: street.
city add: lonelyRoad.

city members. ""street, lonelyRoad""
city links. ""road1, road2, lonelyRoad""
city includes: road1. ""true""
```

## Internal Representation

- `members`: an `OrderedCollection` of links and networks.

### Implementation Points

I store nothing about the shape of my links. Anything about their shape is worked out from the links when asked, so it cannot become stale.

I have no dead state: `isDead` only answers false because the model asks it of every entity. A link that is removed from the model leaves me at that moment, so I never hold a removed link unless it was added after its removal, which is not checked.
"
Class {
	#name : 'CMNetwork',
	#superclass : 'CMEntity',
	#traits : 'TCMNetworkMember',
	#classTraits : 'TCMNetworkMember classTrait',
	#instVars : [
		'members'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'examples' }
CMNetwork class >> exampleCityWithOneStreet [

	<sampleInstance>
	| model street city |
	model := CMMockModel new.
	model initFixed.
	street := model newEntity: CMMockStreet.
	street add: (model
			 newEntity: CMMockRoad
			 from: (model cellAt: 1 at: 1)
			 to: (model cellAt: 2 at: 2)).
	street add: (model
			 newEntity: CMMockRoad
			 from: (model cellAt: 2 at: 2)
			 to: (model cellAt: 3 at: 2)).
	city := model newEntity: CMMockCity.
	city add: street.
	^ city
]

{ #category : 'adding' }
CMNetwork >> add: aLinkOrNetwork [

	<api>
	<argument: #aLinkOrNetwork type: #CMEntity description:
	'The link or the network to add'>
	<returnType: #CMEntity description:
	'The link or the network that was added'>
	<doc:
	'Add a link or another network to this network, and answer it. Links and networks can be mixed, and each can belong to several networks. Adding one that this network already holds directly changes nothing.

Signal an error for a thing such as a cell or an agent, because a network collects connections, and for a network that this one is inside of, because a network cannot contain itself.'>
	<example: 'street add: road'>
	<example: 'city add: street'>
	<seeAlso: #( addAll: members links includes: )>
	self checkCanAdd: aLinkOrNetwork.
	(aLinkOrNetwork networks identityIncludes: self) ifFalse: [
			members add: aLinkOrNetwork.
			aLinkOrNetwork addNetwork: self ].
	^ aLinkOrNetwork
]

{ #category : 'adding' }
CMNetwork >> addAll: aCollection [

	<api>
	<argument: #aCollection type: #Collection description:
	'The links and networks to add'>
	<returnType: #Collection description: 'The given collection'>
	<doc:
	'Add each link or network of the collection to this network, and answer the collection. The ones this network already holds directly are skipped, so the collections can overlap.'>
	<example: 'street addAll: { road1. road2 }'>
	<example: 'city addAll: mainStreet links'>
	<seeAlso: #( add: members links )>
	aCollection do: [ :each | self add: each ].
	^ aCollection
]

{ #category : 'adding' }
CMNetwork >> addChainOf: aLinkClass through: aCollectionOfThings [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of the links to create. Must be a subclass of #CMLink'>
	<argument: #aCollectionOfThings type: #SequenceableCollection
	description: 'The things to connect, in the order the links go'>
	<returnType: #OrderedCollection description:
	'The new links, in order'>
	<doc:
	'Create a link from each thing of the collection to the next one, add those links to this network, and answer them, for example to set their attributes. A chain through fewer than two things creates nothing.

The same rules apply as when creating any link, so a thing cannot be followed by itself. Signal an error otherwise, keeping the links made before that point.

A network does not have to be one chain. Use this message several times to make branches that join, and add: for any other link.'>
	<example: 'river addChainOf: RiverSegment through: { a. b. d. e. f }'>
	<example: 'river addChainOf: RiverSegment through: { c. d }'>
	<seeAlso: #( add: addAll: links )>
	| chain |
	chain := OrderedCollection new.
	aCollectionOfThings overlappingPairsDo: [ :start :end |
			chain add:
				(self add: (cormasModel newEntity: aLinkClass from: start to: end)) ].
	^ chain
]

{ #category : 'adding - private' }
CMNetwork >> checkCanAdd: aLinkOrNetwork [
	"Signal an error unless I can hold it. Only things are linkable, so what is not linkable is a link or a network"

	aLinkOrNetwork isLinkable ifTrue: [
			self error: aLinkOrNetwork printString
				,
				' cannot be added to a network because only links and networks can be added' ].
	(aLinkOrNetwork == self or: [ self isInside: aLinkOrNetwork ])
		ifTrue: [
				self error:
					aLinkOrNetwork printString , ' cannot be added to '
					, self printString , ' because a network cannot contain itself' ]
]

{ #category : 'controlling' }
CMNetwork >> delete [

	<api>
	<doc:
	'Remove the network from the model immediately. It leaves the networks that contain it. Its links and the networks inside it stay in the model, because a network only collects them and they can belong to other networks.

To delete the links too: street links do: [ :road | road delete ].'>
	<example: 'street delete'>
	<seeAlso: #( remove: members )>
	cormasModel removeEntity: self
]

{ #category : 'accessing' }
CMNetwork >> entities [

	<api>
	<returnType: #OrderedCollection description:
	'The things at the ends of the links inside this network'>
	<doc:
	'Answer a new collection with the things at the ends of all the links inside this network, at any depth. Each one appears once, in the order of the links. Things are not added to a network: they belong to it through its links, so a place without a link in this network is not included.'>
	<example: 'river entities'>
	<example: 'river entities size'>
	<seeAlso: #( links members sources sinks terminals )>
	^ self withoutRepetitions:
		  (self links flatCollect: [ :each | each ends ])
]

{ #category : 'shape - private' }
CMNetwork >> entitiesWithoutLinkSuchThat: aBlock [
	"Answer my entities that none of my links makes aBlock true for, when given that link and that entity"

	| excluded |
	excluded := IdentitySet new.
	self links do: [ :eachLink |
			eachLink ends do: [ :eachEnd |
					(aBlock value: eachLink value: eachEnd) ifTrue: [
						excluded add: eachEnd ] ] ].
	^ self entities reject: [ :each | excluded includes: each ]
]

{ #category : 'testing' }
CMNetwork >> includes: aLinkOrNetwork [

	<api>
	<argument: #aLinkOrNetwork type: #CMEntity description:
	'The link or the network to look for'>
	<returnType: #Boolean description:
	'Whether it is inside this network, at any depth'>
	<doc:
	'Answer whether a link or another network is inside this network, directly or through the networks it contains.'>
	<example: 'city includes: road'>
	<example: 'city includes: mainStreet'>
	<seeAlso: #( members links add: )>
	^ aLinkOrNetwork isInside: self
]

{ #category : 'initialization' }
CMNetwork >> initialize [

	super initialize.
	members := OrderedCollection new
]

{ #category : 'testing' }
CMNetwork >> isDead [
	"A network either exists or not. The model asks this of every entity when it removes the dead ones"

	^ false
]

{ #category : 'accessing' }
CMNetwork >> links [

	<api>
	<returnType: #OrderedCollection description:
	'All the links inside this network, at any depth'>
	<doc:
	'Answer a new collection with all the links inside this network, including the ones inside the networks it contains, however deep. Each link appears once, in the order the links were added, entering each nested network where it appears.'>
	<example: 'city links'>
	<example: 'street links average: [ :road | road wear ]'>
	<seeAlso: #( members entities includes: )>
	^ self withoutRepetitions: self linksAsMember
]

{ #category : 'networks - private' }
CMNetwork >> linksAsMember [
	"Answer all the links inside me, possibly with repetitions. A link answers itself"

	^ members flatCollect: [ :each | each linksAsMember ]
]

{ #category : 'accessing' }
CMNetwork >> members [

	<api>
	<returnType: #OrderedCollection description:
	'What was directly added to this network'>
	<doc:
	'Answer a new collection with the links and the networks directly added to this network, in the order they were added. Use links to get all the links inside it, at any depth.'>
	<example: 'city members'>
	<seeAlso: #( links add: includes: )>
	^ members copy
]

{ #category : 'removing' }
CMNetwork >> remove: aLinkOrNetwork [

	<api>
	<argument: #aLinkOrNetwork type: #CMEntity description:
	'The link or the network to take out, which must be a direct member'>
	<returnType: #CMEntity description:
	'The link or the network that was taken out'>
	<doc:
	'Take a link or a network out of this network, and answer it. It stays in the model and in any other network it belongs to.

Signal an error if it is not a direct member, including when it is only inside a network that this one contains.'>
	<example: 'street remove: road'>
	<example: 'city remove: street'>
	<seeAlso: #( add: members delete )>
	members remove: aLinkOrNetwork ifAbsent: [
			self error: aLinkOrNetwork printString
				, ' cannot be removed because it is not a direct member of '
				, self printString ].
	aLinkOrNetwork removeNetwork: self.
	^ aLinkOrNetwork
]

{ #category : 'initialize-release' }
CMNetwork >> removedFromModel [

	super removedFromModel.
	self leaveAllNetworks.
	self members do: [ :each | self remove: each ]
]

{ #category : 'shape' }
CMNetwork >> sinks [

	<api>
	<returnType: #OrderedCollection description:
	'The things that no link of this network leaves from'>
	<doc:
	'Answer a new collection with the things where no link of this network leaves, in the order of the links. Links outside this network do not count.

There can be several sinks or none. An undirected link leaves from both of its ends, so a two-way street or a ring has no sinks.'>
	<example: 'river sinks'>
	<example: 'river sinks size'>
	<seeAlso: #( sources terminals entities links )>
	^ self entitiesWithoutLinkSuchThat: [ :link :end |
		  link isOutgoingFrom: end ]
]

{ #category : 'shape' }
CMNetwork >> sources [

	<api>
	<returnType: #OrderedCollection description:
	'The things that no link of this network arrives at'>
	<doc:
	'Answer a new collection with the things where no link of this network arrives, in the order of the links. Links outside this network do not count.

There can be several sources or none. An undirected link arrives at both of its ends, so a two-way street or a ring has no sources.'>
	<example: 'river sources'>
	<example: 'river sources size'>
	<seeAlso: #( sinks terminals entities links )>
	^ self entitiesWithoutLinkSuchThat: [ :link :end |
		  link isIncomingTo: end ]
]

{ #category : 'shape' }
CMNetwork >> terminals [

	<api>
	<returnType: #OrderedCollection description:
	'The things touching exactly one link of this network'>
	<doc:
	'Answer a new collection with the things touching exactly one link of this network, in the order of the links. The direction of the links does not matter, and links outside this network do not count.

Use this to find the ends of a two-way street, which has no sources or sinks. There can be several terminals or none, as on a ring.'>
	<example: 'street terminals'>
	<example: 'street terminals size'>
	<seeAlso: #( sources sinks entities links )>
	| counts |
	counts := IdentityDictionary new.
	self links do: [ :eachLink |
			eachLink ends do: [ :eachEnd |
				counts at: eachEnd put: (counts at: eachEnd ifAbsent: [ 0 ]) + 1 ] ].
	^ self entities select: [ :each | (counts at: each) = 1 ]
]

{ #category : 'accessing - private' }
CMNetwork >> withoutRepetitions: aCollection [
	"Answer the elements of aCollection, each once, in their order. The set only remembers what was seen, so the order does not depend on hashes"

	| seen unique |
	seen := IdentitySet new.
	unique := OrderedCollection new.
	aCollection do: [ :each |
			(seen includes: each) ifFalse: [
					seen add: each.
					unique add: each ] ].
	^ unique
]
