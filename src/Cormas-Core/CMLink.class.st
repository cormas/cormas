"
I represent a connection between two entities, as an object with its own attributes and points of view: a road between two cells, the trust between two farmers, or a farmer's attachment to a home cell.

To use me, create a subclass of me in your model, as with cells and agents.

## Responsibility:

- Connect exactly two different things that exist in the model, such as cells, agents or aggregates, alive or dead.
- Know my two ends, and tell the other end from one of them.
- Tell whether I have a direction. By default I go from my first end to my second one.

## Collaborators:

- `CMModel`: creates me and checks that my ends can be linked.
- `TCMLinkable`: the things that can be my ends.

## Public API and Key Messages

- `CMModel>>newEntity:from:to:` creates me. This is the only way to create a link.
- `from` and `to` answer my ends.
- `ends` answers both of them.
- `otherEndOf:` answers the end that is not the given one.
- `length` answers the number of cells between my ends, or signals an error if one of them is not on the grid.
- `isDirected` answers whether I have a direction. Override it to answer false, or an attribute of mine.
- `delete` removes me from the model immediately, and does not affect my ends.

```
road := self newEntity: Road from: cellA to: cellB.
road otherEndOf: cellA. ""cellB""
```

## Internal Representation

- `from`: the first end given when I was created.
- `to`: the second end given when I was created.

### Implementation Points

My ends never change. To connect something else, delete me and create a new link.

An undirected link still has a `from` and a `to`, which are just the order given at creation.

I do not know whether my ends are alive. I am removed when one of them is removed from the model, by any route, and not before. I have no dead state: `isDead` only answers false because the model asks it of every entity.
"
Class {
	#name : 'CMLink',
	#superclass : 'CMEntity',
	#traits : 'TCMNetworkMember',
	#classTraits : 'TCMNetworkMember classTrait',
	#instVars : [
		'from',
		'to'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'examples' }
CMLink class >> exampleBetweenTwoAgents [

	<sampleInstance>
	| model |
	model := CMModel new.
	^ model
		  newEntity: self
		  from: (model newEntity: CMAgent)
		  to: (model newEntity: CMAgent)
]

{ #category : 'controlling' }
CMLink >> delete [

	<api>
	<doc:
	'Remove the link from the model immediately. Its ends are not affected. A link has no dead state: it either exists or not.

A link is also removed when one of its ends is removed from the model.'>
	<example: 'road delete'>
	<seeAlso: #( from to )>
	cormasModel removeEntity: self
]

{ #category : 'accessing' }
CMLink >> ends [

	<api>
	<returnType: #Array description:
	'The two ends of the link, from first'>
	<doc:
	'Answer a new collection with the two entities connected by the link.'>
	<example: 'road ends'>
	<example: '(road ends select: [ :each | each isOnGrid ]) size'>
	<seeAlso: #( from to otherEndOf: )>
	^ {
		  from.
		  to }
]

{ #category : 'accessing' }
CMLink >> from [

	<api>
	<returnType: #CMEntity description:
	'The first end given when the link was created'>
	<doc:
	'Answer the entity at the start of the link. On an undirected link this is just the first end given at creation, so use otherEndOf: to reach the far end from a given entity.'>
	<example: 'road from'>
	<seeAlso: #( to ends otherEndOf: )>
	^ from
]

{ #category : 'testing' }
CMLink >> isDead [
	"A link either exists or not. The model asks this of every entity when it removes the dead ones"

	^ false
]

{ #category : 'testing' }
CMLink >> isDirected [

	<api>
	<returnType: #Boolean description:
	'Whether the link goes only from its first end to its second end'>
	<doc:
	'Answer whether the link has a direction. Links are directed by default. Override this method in a subclass to answer false, or to answer an attribute, such as for a road that may be one-way.

An undirected link counts as going both ways.'>
	<example: 'road isDirected'>
	<seeAlso: #( from to otherEndOf: )>
	^ true
]

{ #category : 'testing' }
CMLink >> isIncomingTo: anEntity [
	"An undirected link goes both ways, so it arrives at both of its ends"

	^ self isDirected not or: [ to == anEntity ]
]

{ #category : 'testing' }
CMLink >> isLink [

	^ true
]

{ #category : 'testing' }
CMLink >> isOutgoingFrom: anEntity [
	"An undirected link goes both ways, so it leaves both of its ends"

	^ self isDirected not or: [ from == anEntity ]
]

{ #category : 'accessing' }
CMLink >> length [

	<api>
	<returnType: #Number description:
	'The number of cells between the two ends of the link'>
	<doc:
	'Answer the number of cells between the two ends of the link, measured as distanceTo: does on the grid. It is worked out when asked, so it follows an agent that moves.

Signal an error if an end is not on the grid. A link between things off the grid has no length, so use a cost: block with wayTo:in:cost: and distanceTo:in:cost: instead.'>
	<example: 'road length'>
	<example: 'river links sum: [ :segment | segment length ]'>
	<seeAlso: #( from to ends )>
	self ends do: [ :each |
			each isOnGrid ifFalse: [
					self error:
						self printString , ' has no length because ' , each printString
						, ' is not on the grid. Use a cost: block instead' ] ].
	^ from placeOnGrid distanceTo: to placeOnGrid
]

{ #category : 'networks - private' }
CMLink >> linksAsMember [
	"A network answers all the links inside it, and I am a single link"

	^ { self }
]

{ #category : 'accessing' }
CMLink >> otherEndOf: anEntity [

	<api>
	<argument: #anEntity type: #CMEntity description:
	'One of the two ends of the link'>
	<returnType: #CMEntity description:
	'The end of the link that is not the given entity'>
	<doc:
	'Answer the entity at the other end of the link from the given one. Signal an error if the given entity is not an end of the link.'>
	<example: 'road otherEndOf: self'>
	<seeAlso: #( from to ends )>
	anEntity == from ifTrue: [ ^ to ].
	anEntity == to ifTrue: [ ^ from ].
	self error:
		anEntity printString , ' is not an end of ' , self printString
]

{ #category : 'initialize-release' }
CMLink >> removedFromModel [

	super removedFromModel.
	self leaveAllNetworks.
	from removeLink: self.
	to removeLink: self
]

{ #category : 'private' }
CMLink >> setFrom: anEntity to: anotherEntity [

	from := anEntity.
	to := anotherEntity.
	from addLink: self.
	to addLink: self
]

{ #category : 'accessing' }
CMLink >> to [

	<api>
	<returnType: #CMEntity description:
	'The second end given when the link was created'>
	<doc:
	'Answer the entity at the end of the link. On an undirected link this is just the second end given at creation, so use otherEndOf: to reach the far end from a given entity.'>
	<example: 'road to'>
	<seeAlso: #( from ends otherEndOf: )>
	^ to
]
