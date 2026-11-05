"
I let a connection, which is a link or a network, belong to networks and know which ones.

## Responsibility:

- Know the networks that directly contain this connection.
- Answer those networks, or only the ones of a given class.
- Tell whether this connection is inside a given network, directly or through other networks.

## Collaborators:

- `CMNetwork`: tells me when it contains me.
- `CMLink` and `CMNetwork`: use me.

## Public API and Key Messages

- `networks` answers the networks directly containing this connection.
- `networksOfClass:` answers only those of a class or its subclasses.

```
street add: road.
city add: street.
road networks. ""street""
street networksOfClass: City. ""city""
```

## Internal Representation

- `networks`: an `OrderedCollection` of networks in the order this connection joined them, or nil until the first one.

### Implementation Points

Most links belong to few networks, so walking up through these lists is cheap. That is how a network tells whether it includes something, without walking down through all its members.
"
Trait {
	#name : 'TCMNetworkMember',
	#instVars : [
		'networks'
	],
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'networks - private' }
TCMNetworkMember >> addNetwork: aNetwork [

	networks ifNil: [ networks := OrderedCollection new ].
	networks add: aNetwork
]

{ #category : 'networks - private' }
TCMNetworkMember >> isInside: aNetwork [
	"Answer whether aNetwork contains me, directly or through other networks"

	^ self networks anySatisfy: [ :each |
		  each == aNetwork or: [ each isInside: aNetwork ] ]
]

{ #category : 'networks' }
TCMNetworkMember >> networks [

	<api>
	<returnType: #OrderedCollection description:
	'The networks directly containing this link or network'>
	<doc:
	'Answer a new collection with the networks that directly contain this link or network, in the order it joined them. A network that contains it only through another network is not included.'>
	<example: 'self networks'>
	<example: 'self networks size'>
	<seeAlso: #( networksOfClass: )>
	^ networks
		  ifNil: [ OrderedCollection new ]
		  ifNotNil: [ networks copy ]
]

{ #category : 'networks' }
TCMNetworkMember >> networksOfClass: aNetworkClass [

	<api>
	<argument: #aNetworkClass type: #Class description:
	'The class of the networks to answer. Its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The networks of the given class directly containing this link or network'>
	<doc:
	'Answer a new collection with the networks of the given class, or of its subclasses, that directly contain this link or network, in the order it joined them.'>
	<example: 'self networksOfClass: Street'>
	<example: '(self networksOfClass: Street) first speedLimit'>
	<seeAlso: #( networks )>
	^ self networks select: [ :each | each isKindOf: aNetworkClass ]
]
