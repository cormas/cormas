"
I give an entity the ability to be an end of a link, and to answer questions about the links that connect it. Things such as cells, agents and aggregates use me. Links do not, because a link is a connection and not a thing that can be linked.

## Responsibility:

- Know the links that have this entity at one of their ends.
- Answer what those links reach, one step away or by following them all the way.
- Remove those links when this entity is removed from the model.

## Collaborators:

- `CMLink`: tells me when it starts and stops connecting me, and tells me which way it goes.
- `CMModel`: tells me when I have been removed.
- `CMNetwork`: tells me which links it includes, for the forms limited to a network.

## Public API and Key Messages

- `isLinkable` answers true, and false on entities that do not use me.
- `links`, `outgoingLinks` and `incomingLinks` answer the links of this entity.
- `linkedEntities`, `nextEntities` and `previousEntities` answer the entities at their other ends.
- `allLinks`, `allDownstreamLinks`, `allUpstreamLinks`, `allLinkedEntities`, `allDownstreamEntities` and `allUpstreamEntities` follow links repeatedly.
- Each of these has a form limited to a class of links, such as `outgoingLinksOfClass:` and `nextEntitiesLinkedBy:`, and a form limited to a network, such as `outgoingLinksIn:` and `nextEntitiesIn:`.

```
road := self newEntity: Road from: cellA to: cellB.
cellA outgoingLinks.
cellA nextEntitiesLinkedBy: Road.
cellA nextEntitiesIn: mainStreet
```

## Internal Representation

- `links`: an `OrderedCollection` of links in the order they were created, or nil until the first one.

### Implementation Points

There is one list of links, filtered when asked, so that a direction that changes cannot leave stale lists. Every query answers a new collection, because links can be removed while a modeler loops over them.
"
Trait {
	#name : 'TCMLinkable',
	#instVars : [
		'links'
	],
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'links - private' }
TCMLinkable >> addLink: aLink [

	links ifNil: [ links := OrderedCollection new ].
	links add: aLink
]

{ #category : 'links - all entities' }
TCMLinkable >> allDownstreamEntities [

	<api>
	<returnType: #OrderedCollection description:
	'All the entities that can be reached following the direction of links'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following outgoing links repeatedly. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allDownstreamEntitiesLinkedBy: to follow only one kind. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allDownstreamEntities'>
	<seeAlso: #( allDownstreamEntitiesLinkedBy:
	   allUpstreamEntities allLinkedEntities nextEntities allDownstreamLinks )>
	^ self entitiesReachedBy: [ :each | each nextEntities ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allDownstreamEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the entities that can be reached following the direction of links inside the given network'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following outgoing links inside the given network, at any depth, repeatedly. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways. Two rivers of one class that cross stay separate, unlike with allDownstreamEntitiesLinkedBy:. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allDownstreamEntitiesIn: river'>
	<example:
	'(self allDownstreamEntitiesIn: river) do: [ :cell | cell receivePollution: amount ]'>
	<seeAlso: #( allDownstreamEntities allDownstreamEntitiesLinkedBy:
	   allUpstreamEntitiesIn: allLinkedEntitiesIn: nextEntitiesIn: allDownstreamLinksIn: )>
	^ self entitiesReachedBy: [ :each | each nextEntitiesIn: aNetwork ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allDownstreamEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the entities that can be reached following the direction of links of the given class'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following outgoing links of the given class, or of its subclasses, repeatedly. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allDownstreamEntitiesLinkedBy: River'>
	<example:
	'(self allDownstreamEntitiesLinkedBy: River) do: [ :cell | cell receivePollution: amount ]'>
	<seeAlso: #( allDownstreamEntities allUpstreamEntitiesLinkedBy:
	   allEntitiesLinkedBy: nextEntitiesLinkedBy: allDownstreamLinksOfClass: )>
	^ self entitiesReachedBy: [ :each |
		  each nextEntitiesLinkedBy: aLinkClass ]
]

{ #category : 'links - all links' }
TCMLinkable >> allDownstreamLinks [

	<api>
	<returnType: #OrderedCollection description:
	'All the links that can be followed from this entity in their direction'>
	<doc:
	'Answer a new collection with all the links that can be reached from this entity by following outgoing links repeatedly. Each link appears once, the nearest first. A link leading back to this entity is included. Undirected links are followed both ways.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allDownstreamLinksOfClass: to follow only one kind.'>
	<example: 'self allDownstreamLinks'>
	<seeAlso:
	#( allDownstreamLinksOfClass: allUpstreamLinks allLinks outgoingLinks
	   allDownstreamEntities )>
	^ self
		  linksOfSelfAnd: self allDownstreamEntities
		  followedBy: [ :each | each outgoingLinks ]
]

{ #category : 'links - all links' }
TCMLinkable >> allDownstreamLinksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the links inside the given network that can be followed from this entity in their direction'>
	<doc:
	'Answer a new collection with all the links inside the given network, at any depth, that can be reached from this entity by following outgoing links inside it repeatedly. Each link appears once, the nearest first. A link leading back to this entity is included. Undirected links are followed both ways. Two rivers of one class that cross stay separate, unlike with allDownstreamLinksOfClass:.'>
	<example: 'self allDownstreamLinksIn: river'>
	<example:
	'(self allDownstreamLinksIn: river) do: [ :segment | segment receivePollution: amount ]'>
	<seeAlso: #( allDownstreamLinks allDownstreamLinksOfClass:
	   allUpstreamLinksIn: allLinksIn: outgoingLinksIn: allDownstreamEntitiesIn: )>
	^ self
		  linksOfSelfAnd: (self allDownstreamEntitiesIn: aNetwork)
		  followedBy: [ :each | each outgoingLinksIn: aNetwork ]
]

{ #category : 'links - all links' }
TCMLinkable >> allDownstreamLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the links of the given class that can be followed from this entity in their direction'>
	<doc:
	'Answer a new collection with all the links of the given class, or of its subclasses, that can be reached from this entity by following outgoing links of that class repeatedly. Each link appears once, the nearest first. A link leading back to this entity is included. Undirected links are followed both ways.'>
	<example: 'self allDownstreamLinksOfClass: River'>
	<example:
	'(self allDownstreamLinksOfClass: River) sum: [ :each | each pollution ]'>
	<seeAlso: #( allDownstreamLinks allUpstreamLinksOfClass:
	   allLinksOfClass: outgoingLinksOfClass: allDownstreamEntitiesLinkedBy: )>
	^ self
		  linksOfSelfAnd: (self allDownstreamEntitiesLinkedBy: aLinkClass)
		  followedBy: [ :each | each outgoingLinksOfClass: aLinkClass ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the other entities reachable from this entity through links of the given class'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following links of the given class, or of its subclasses, repeatedly, ignoring their direction. The entity itself is not included. Each entity appears once, the nearest first. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allEntitiesLinkedBy: River'>
	<seeAlso: #( allLinkedEntities allDownstreamEntitiesLinkedBy:
	   allUpstreamEntitiesLinkedBy: entitiesLinkedBy: allLinksOfClass: )>
	^ self entitiesReachedBy: [ :each |
		  each entitiesLinkedBy: aLinkClass ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allLinkedEntities [

	<api>
	<returnType: #OrderedCollection description:
	'All the other entities reachable from this entity'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following links repeatedly, ignoring their direction. The entity itself is not included. Each entity appears once, the nearest first.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allEntitiesLinkedBy: to follow only one kind. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allLinkedEntities'>
	<seeAlso:
	#( allEntitiesLinkedBy: allDownstreamEntities allUpstreamEntities
	   linkedEntities allLinks )>
	^ self entitiesReachedBy: [ :each | each linkedEntities ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allLinkedEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the other entities reachable from this entity through links inside the given network'>
	<doc:
	'Answer a new collection with all the entities that can be reached from this one by following links inside the given network, at any depth, repeatedly, ignoring their direction. The entity itself is not included. Each entity appears once, the nearest first. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allLinkedEntitiesIn: river'>
	<seeAlso:
	#( allLinkedEntities allEntitiesLinkedBy: allDownstreamEntitiesIn:
	   allUpstreamEntitiesIn: linkedEntitiesIn: allLinksIn: )>
	^ self entitiesReachedBy: [ :each | each linkedEntitiesIn: aNetwork ]
]

{ #category : 'links - all links' }
TCMLinkable >> allLinks [

	<api>
	<returnType: #OrderedCollection description:
	'All the links reachable from this entity'>
	<doc:
	'Answer a new collection with all the links that can be reached from this entity by following links repeatedly, ignoring their direction. Each link appears once, the nearest first.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allLinksOfClass: to follow only one kind.'>
	<example: 'self allLinks'>
	<seeAlso: #( allLinksOfClass: allDownstreamLinks allUpstreamLinks
	   links allLinkedEntities )>
	^ self
		  linksOfSelfAnd: self allLinkedEntities
		  followedBy: [ :each | each links ]
]

{ #category : 'links - all links' }
TCMLinkable >> allLinksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the links inside the given network reachable from this entity'>
	<doc:
	'Answer a new collection with all the links inside the given network, at any depth, that can be reached from this entity by following such links repeatedly, ignoring their direction. A network does not have to be connected, so links in another piece of it are not included. Use links on the network to get all of them. Each link appears once, the nearest first.'>
	<example: 'self allLinksIn: river'>
	<seeAlso: #( allLinks allLinksOfClass: allDownstreamLinksIn:
	   allUpstreamLinksIn: linksIn: allLinkedEntitiesIn: )>
	^ self
		  linksOfSelfAnd: (self allLinkedEntitiesIn: aNetwork)
		  followedBy: [ :each | each linksIn: aNetwork ]
]

{ #category : 'links - all links' }
TCMLinkable >> allLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the links of the given class reachable from this entity'>
	<doc:
	'Answer a new collection with all the links of the given class, or of its subclasses, that can be reached from this entity by following such links repeatedly, ignoring their direction. Each link appears once, the nearest first.'>
	<example: 'self allLinksOfClass: River'>
	<seeAlso:
	#( allLinks allDownstreamLinksOfClass: allUpstreamLinksOfClass:
	   linksOfClass: allEntitiesLinkedBy: )>
	^ self
		  linksOfSelfAnd: (self allEntitiesLinkedBy: aLinkClass)
		  followedBy: [ :each | each linksOfClass: aLinkClass ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allUpstreamEntities [

	<api>
	<returnType: #OrderedCollection description:
	'All the entities that can reach this one following the direction of links'>
	<doc:
	'Answer a new collection with all the entities from which this one can be reached by following links in their direction. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allUpstreamEntitiesLinkedBy: to follow only one kind. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allUpstreamEntities'>
	<seeAlso: #( allUpstreamEntitiesLinkedBy:
	   allDownstreamEntities allLinkedEntities previousEntities
	   allUpstreamLinks )>
	^ self entitiesReachedBy: [ :each | each previousEntities ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allUpstreamEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the entities that can reach this one following the direction of links inside the given network'>
	<doc:
	'Answer a new collection with all the entities from which this one can be reached by following links inside the given network, at any depth, in their direction. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways. Two rivers of one class that cross stay separate, unlike with allUpstreamEntitiesLinkedBy:. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allUpstreamEntitiesIn: river'>
	<seeAlso: #( allUpstreamEntities allUpstreamEntitiesLinkedBy:
	   allDownstreamEntitiesIn: allLinkedEntitiesIn: previousEntitiesIn: allUpstreamLinksIn: )>
	^ self entitiesReachedBy: [ :each |
		  each previousEntitiesIn: aNetwork ]
]

{ #category : 'links - all entities' }
TCMLinkable >> allUpstreamEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the entities that can reach this one following the direction of links of the given class'>
	<doc:
	'Answer a new collection with all the entities from which this one can be reached by following links of the given class, or of its subclasses, in their direction. Each entity appears once, the nearest first, and the entity itself is not included, even if a cycle leads back to it. Undirected links are followed both ways. Dead entities appear and are followed until they are removed from the model.'>
	<example: 'self allUpstreamEntitiesLinkedBy: River'>
	<seeAlso: #( allUpstreamEntities allDownstreamEntitiesLinkedBy:
	   allEntitiesLinkedBy: previousEntitiesLinkedBy:
	   allUpstreamLinksOfClass: )>
	^ self entitiesReachedBy: [ :each |
		  each previousEntitiesLinkedBy: aLinkClass ]
]

{ #category : 'links - all links' }
TCMLinkable >> allUpstreamLinks [

	<api>
	<returnType: #OrderedCollection description:
	'All the links that can be followed to this entity in their direction'>
	<doc:
	'Answer a new collection with all the links that lead to this entity when followed in their direction. Each link appears once, the nearest first. A link starting from this entity is included if a cycle leads back to it. Undirected links are followed both ways.

This follows every kind of link, so adding a new link class to a model changes the answer. Use allUpstreamLinksOfClass: to follow only one kind.'>
	<example: 'self allUpstreamLinks'>
	<seeAlso:
	#( allUpstreamLinksOfClass: allDownstreamLinks allLinks incomingLinks
	   allUpstreamEntities )>
	^ self
		  linksOfSelfAnd: self allUpstreamEntities
		  followedBy: [ :each | each incomingLinks ]
]

{ #category : 'links - all links' }
TCMLinkable >> allUpstreamLinksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to stay in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'All the links inside the given network that can be followed to this entity in their direction'>
	<doc:
	'Answer a new collection with all the links inside the given network, at any depth, that lead to this entity when followed in their direction. Each link appears once, the nearest first. A link starting from this entity is included if a cycle leads back to it. Undirected links are followed both ways. Two rivers of one class that cross stay separate, unlike with allUpstreamLinksOfClass:.'>
	<example: 'self allUpstreamLinksIn: river'>
	<seeAlso:
	#( allUpstreamLinks allUpstreamLinksOfClass: allDownstreamLinksIn:
	   allLinksIn: incomingLinksIn: allUpstreamEntitiesIn: )>
	^ self
		  linksOfSelfAnd: (self allUpstreamEntitiesIn: aNetwork)
		  followedBy: [ :each | each incomingLinksIn: aNetwork ]
]

{ #category : 'links - all links' }
TCMLinkable >> allUpstreamLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'All the links of the given class that can be followed to this entity in their direction'>
	<doc:
	'Answer a new collection with all the links of the given class, or of its subclasses, that lead to this entity when followed in their direction. Each link appears once, the nearest first. A link starting from this entity is included if a cycle leads back to it. Undirected links are followed both ways.'>
	<example: 'self allUpstreamLinksOfClass: River'>
	<seeAlso: #( allUpstreamLinks allDownstreamLinksOfClass:
	   allLinksOfClass: incomingLinksOfClass: allUpstreamEntitiesLinkedBy: )>
	^ self
		  linksOfSelfAnd: (self allUpstreamEntitiesLinkedBy: aLinkClass)
		  followedBy: [ :each | each incomingLinksOfClass: aLinkClass ]
]

{ #category : 'links - direct entities' }
TCMLinkable >> entitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities directly linked to this one by links of the given class, in either direction'>
	<doc:
	'Answer a new collection with the entities at the other end of the links of the given class, or of its subclasses, in either direction. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self entitiesLinkedBy: Trust'>
	<seeAlso:
	#( linkedEntities nextEntitiesLinkedBy: previousEntitiesLinkedBy:
	   allEntitiesLinkedBy: linksOfClass: )>
	^ self otherEndsOf: (self linksOfClass: aLinkClass)
]

{ #category : 'links - private' }
TCMLinkable >> entitiesReachedBy: aBlock [
	"Answer the entities reached by repeatedly asking aBlock for the entities one step away from an entity. Each one appears once, the nearest first, and I am not among them. The set only remembers what was seen, so the order does not depend on hashes"

	| seen waiting reached |
	seen := IdentitySet with: self.
	waiting := OrderedCollection with: self.
	reached := OrderedCollection new.
	[ waiting isEmpty ] whileFalse: [
			(aBlock value: waiting removeFirst) do: [ :each |
					(seen includes: each) ifFalse: [
							seen add: each.
							reached add: each.
							waiting add: each ] ] ].
	^ reached
]

{ #category : 'links - direct links' }
TCMLinkable >> incomingLinks [

	<api>
	<returnType: #OrderedCollection description:
	'The links that lead to the entity'>
	<doc:
	'Answer a new collection with the links that lead to this entity, of every class. These are the directed links ending here and all the undirected links, which go both ways.'>
	<example: 'self incomingLinks'>
	<example: 'self incomingLinks isEmpty'>
	<seeAlso:
	#( incomingLinksOfClass: outgoingLinks links previousEntities )>
	^ self links select: [ :each | each isIncomingTo: self ]
]

{ #category : 'links - direct links' }
TCMLinkable >> incomingLinksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The links inside the given network that lead to the entity'>
	<doc:
	'Answer a new collection with the links inside the given network, at any depth, that lead to this entity. These are the directed links ending here and all the undirected links, which go both ways. Two rivers of one class that cross here stay separate, unlike with incomingLinksOfClass:.'>
	<example: 'self incomingLinksIn: river'>
	<seeAlso: #( incomingLinks incomingLinksOfClass:
	   outgoingLinksIn: linksIn: allUpstreamLinksIn: previousEntitiesIn: )>
	^ self incomingLinks select: [ :each | aNetwork includes: each ]
]

{ #category : 'links - direct links' }
TCMLinkable >> incomingLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the given class that lead to the entity'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that lead to this entity. These are the directed links ending here and all the undirected links, which go both ways.'>
	<example: 'self incomingLinksOfClass: River'>
	<example: '(self incomingLinksOfClass: River) isEmpty'>
	<seeAlso:
	#( incomingLinks outgoingLinksOfClass: linksOfClass: previousEntitiesLinkedBy: )>
	^ self incomingLinks select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'testing' }
TCMLinkable >> isLinkable [

	^ true
]

{ #category : 'links - direct entities' }
TCMLinkable >> linkedEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities directly linked to this one, in either direction'>
	<doc:
	'Answer a new collection with the entities at the other end of the links of this entity, in either direction. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use entitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self linkedEntities'>
	<seeAlso:
	#( entitiesLinkedBy: nextEntities previousEntities allLinkedEntities
	   links )>
	^ self otherEndsOf: self links
]

{ #category : 'links - direct entities' }
TCMLinkable >> linkedEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The entities directly linked to this one by links inside the given network, in either direction'>
	<doc:
	'Answer a new collection with the entities at the other end of the links inside the given network, at any depth, in either direction. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self linkedEntitiesIn: river'>
	<seeAlso:
	#( linkedEntities entitiesLinkedBy: nextEntitiesIn: previousEntitiesIn:
	   linksIn: )>
	^ self otherEndsOf: (self linksIn: aNetwork)
]

{ #category : 'links - direct links' }
TCMLinkable >> links [

	<api>
	<returnType: #OrderedCollection description:
	'All the links of the entity, in either direction'>
	<doc:
	'Answer a new collection with all the links that have this entity at one of their ends, of every class and in either direction.'>
	<example: 'self links'>
	<example: 'self links size'>
	<seeAlso: #( linksOfClass: outgoingLinks incomingLinks allLinks )>
	^ links ifNil: [ OrderedCollection new ] ifNotNil: [ links copy ]
]

{ #category : 'links - direct links' }
TCMLinkable >> linksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The links of the entity inside the given network, in either direction'>
	<doc:
	'Answer a new collection with the links inside the given network, at any depth, that have this entity at one of their ends, in either direction. An entity with no link in the network answers an empty collection.'>
	<example: 'self linksIn: river'>
	<seeAlso: #( links linksOfClass: outgoingLinksIn: incomingLinksIn: allLinksIn: )>
	^ self links select: [ :each | aNetwork includes: each ]
]

{ #category : 'links - direct links' }
TCMLinkable >> linksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the entity of the given class, in either direction'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that have this entity at one of their ends, in either direction.'>
	<example: 'self linksOfClass: Road'>
	<seeAlso: #( links outgoingLinksOfClass: incomingLinksOfClass:
	   allLinksOfClass: )>
	^ self links select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'links - private' }
TCMLinkable >> linksOfSelfAnd: aCollectionOfEntities followedBy: aBlock [
	"Answer the links that aBlock answers for me and for each of the given entities, each link once, in the order of the entities"

	| seen reached |
	seen := IdentitySet new.
	reached := OrderedCollection new.
	{ self } , aCollectionOfEntities do: [ :eachEntity |
			(aBlock value: eachEntity) do: [ :eachLink |
					(seen includes: eachLink) ifFalse: [
							seen add: eachLink.
							reached add: eachLink ] ] ].
	^ reached
]

{ #category : 'links - direct entities' }
TCMLinkable >> nextEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities that the links of this entity lead to'>
	<doc:
	'Answer a new collection with the entities that the outgoing links of this entity lead to, one step away. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use nextEntitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self nextEntities'>
	<seeAlso: #( nextEntitiesLinkedBy: previousEntities linkedEntities
	   allDownstreamEntities outgoingLinks )>
	^ self otherEndsOf: self outgoingLinks
]

{ #category : 'links - direct entities' }
TCMLinkable >> nextEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The entities that the links inside the given network lead to'>
	<doc:
	'Answer a new collection with the entities that the outgoing links inside the given network, at any depth, lead to, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self nextEntitiesIn: river'>
	<seeAlso: #( nextEntities nextEntitiesLinkedBy: previousEntitiesIn:
	   linkedEntitiesIn: outgoingLinksIn: )>
	^ self otherEndsOf: (self outgoingLinksIn: aNetwork)
]

{ #category : 'links - direct entities' }
TCMLinkable >> nextEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities that the links of the given class lead to'>
	<doc:
	'Answer a new collection with the entities that the outgoing links of the given class, or of its subclasses, lead to, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self nextEntitiesLinkedBy: River'>
	<seeAlso:
	#( nextEntities previousEntitiesLinkedBy: entitiesLinkedBy:
	   allDownstreamEntitiesLinkedBy: outgoingLinksOfClass: )>
	^ self otherEndsOf: (self outgoingLinksOfClass: aLinkClass)
]

{ #category : 'links - private' }
TCMLinkable >> otherEndsOf: aCollectionOfLinks [
	"Answer the entities at the far end of the given links, each one once, in the order of the links"

	| entities |
	entities := OrderedCollection new.
	aCollectionOfLinks do: [ :each |
			| otherEnd |
			otherEnd := each otherEndOf: self.
			(entities identityIncludes: otherEnd) ifFalse: [
				entities add: otherEnd ] ].
	^ entities
]

{ #category : 'links - direct links' }
TCMLinkable >> outgoingLinks [

	<api>
	<returnType: #OrderedCollection description:
	'The links that lead away from the entity'>
	<doc:
	'Answer a new collection with the links that lead away from this entity, of every class. These are the directed links starting here and all the undirected links, which go both ways.'>
	<example: 'self outgoingLinks'>
	<seeAlso: #( outgoingLinksOfClass: incomingLinks links nextEntities )>
	^ self links select: [ :each | each isOutgoingFrom: self ]
]

{ #category : 'links - direct links' }
TCMLinkable >> outgoingLinksIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The links inside the given network that lead away from the entity'>
	<doc:
	'Answer a new collection with the links inside the given network, at any depth, that lead away from this entity. These are the directed links starting here and all the undirected links, which go both ways. Two rivers of one class that cross here stay separate, unlike with outgoingLinksOfClass:.'>
	<example: 'self outgoingLinksIn: river'>
	<seeAlso: #( outgoingLinks outgoingLinksOfClass:
	   incomingLinksIn: linksIn: allDownstreamLinksIn: nextEntitiesIn: )>
	^ self outgoingLinks select: [ :each | aNetwork includes: each ]
]

{ #category : 'links - direct links' }
TCMLinkable >> outgoingLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the given class that lead away from the entity'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that lead away from this entity. These are the directed links starting here and all the undirected links, which go both ways.'>
	<example: 'self outgoingLinksOfClass: River'>
	<seeAlso:
	#( outgoingLinks incomingLinksOfClass: linksOfClass: nextEntitiesLinkedBy: )>
	^ self outgoingLinks select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'links - direct entities' }
TCMLinkable >> previousEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities whose links lead to this entity'>
	<doc:
	'Answer a new collection with the entities that the incoming links of this entity come from, one step away. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use previousEntitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self previousEntities'>
	<seeAlso: #( previousEntitiesLinkedBy: nextEntities linkedEntities
	   allUpstreamEntities incomingLinks )>
	^ self otherEndsOf: self incomingLinks
]

{ #category : 'links - direct entities' }
TCMLinkable >> previousEntitiesIn: aNetwork [

	<api>
	<argument: #aNetwork type: #CMNetwork description:
	'The network to look in. The networks inside it are included'>
	<returnType: #OrderedCollection description:
	'The entities whose links inside the given network lead to this entity'>
	<doc:
	'Answer a new collection with the entities that the incoming links inside the given network, at any depth, come from, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self previousEntitiesIn: river'>
	<seeAlso: #( previousEntities previousEntitiesLinkedBy:
	   nextEntitiesIn: linkedEntitiesIn: incomingLinksIn: )>
	^ self otherEndsOf: (self incomingLinksIn: aNetwork)
]

{ #category : 'links - direct entities' }
TCMLinkable >> previousEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities whose links of the given class lead to this entity'>
	<doc:
	'Answer a new collection with the entities that the incoming links of the given class, or of its subclasses, come from, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self previousEntitiesLinkedBy: River'>
	<seeAlso:
	#( previousEntities nextEntitiesLinkedBy: entitiesLinkedBy:
	   allUpstreamEntitiesLinkedBy: incomingLinksOfClass: )>
	^ self otherEndsOf: (self incomingLinksOfClass: aLinkClass)
]

{ #category : 'links - private' }
TCMLinkable >> removeLink: aLink [

	links remove: aLink ifAbsent: [ ]
]

{ #category : 'initialize-release' }
TCMLinkable >> removedFromModel [
	"The model has just stopped holding me, so my links can no longer exist. This holds for every way of removing an entity"

	super removedFromModel.
	links ifNotNil: [ links copy do: [ :each | each delete ] ]
]
