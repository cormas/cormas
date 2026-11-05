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
- `members` answers what was directly added to me.
- `links` answers all the links inside me, at any depth.
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

I have no dead state: `isDead` only answers false because the model asks it of every entity.
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
	<seeAlso: #( members includes: )>
	| seen reached |
	seen := IdentitySet new.
	reached := OrderedCollection new.
	self linksAsMember do: [ :each |
			(seen includes: each) ifFalse: [
					seen add: each.
					reached add: each ] ].
	^ reached
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
