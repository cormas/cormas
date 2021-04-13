"
NetworkEntity is an oriented Network composed of a set of Arcs and a set of Nodes.
From an instance of Arc (or of Node), we access the network it belongs to, by sending the #fullNetwork method.
NetworkEntity is oriented because the Arcs are oriented. Each arc has a startNode and a stopNode.

Instance Variables:
	arcs	<IndexedSet>	collection of arcs
	nodes	<IndexedSet>	collection of nodes


"
Class {
	#name : #CMNetworkEntity,
	#superclass : #CMPassiveObject,
	#instVars : [
		'nodes',
		'arcs'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'instance creation' }
CMNetworkEntity class >> newFromArc: anArc [
	"returns an instance of NetworkEntity containing all the connected arcs of the network of anArc, as well as all the nodes"
	
	| network |
	network := self new.
	network arcs: (anArc fullNetworkWithout: OrderedCollection new).
	^network
]

{ #category : #'instance creation' }
CMNetworkEntity class >> newFromArcs: arcsCollection [
	"returns an instance of NetworkEntity containing all the connected arcs of the network of arcsCollection (all starting as the same location), as well as all the nodes"
	
	| network |
	network := self new.
	arcsCollection isEmpty ifTrue: [^network].
	network arcs: (arcsCollection first fullNetworkWithout: OrderedCollection new).
	arcsCollection removeFirst.
	arcsCollection
		do: [:a | network arcs addAll: (a fullNetworkWithout: OrderedCollection new)].
	^network
]

{ #category : #'instance creation' }
CMNetworkEntity class >> newFromNode: aNode [
	"returns an instance of NetworkEntity containing all the connected arcs of the network of anArc, as well as all the nodes"
	
	| network |
	aNode arcs isEmpty
		ifTrue:
			[network := self new.
			network nodes add: aNode.
			^network].
	^self newFromArcs: aNode arcs copy
]

{ #category : #accessing }
CMNetworkEntity >> arcs [
	
	^arcs ifNil: [arcs := OrderedCollection new]
]

{ #category : #accessing }
CMNetworkEntity >> arcs: anObject [
	
	arcs := anObject
]

{ #category : #ways }
CMNetworkEntity >> getNodes [
	" Calculates and returns the nodes of the network"
	
	nodes := OrderedCollection new.
	self arcs do: [ : arc | 
			arc startNode isNil ifFalse: [ nodes add: arc startNode ].
			arc stopNode isNil ifFalse: [ nodes add: arc stopNode ] ].
	^ nodes
]

{ #category : #accessing }
CMNetworkEntity >> nodes [
	
	^ nodes 
		ifNil: [ nodes := self getNodes ]
]

{ #category : #accessing }
CMNetworkEntity >> nodes: anObject [
	
	nodes := anObject
]

{ #category : #ways }
CMNetworkEntity >> startArcs [
	" Returns the arcs located at the start of the Network "
	
	^ self arcs select: #isNetworkStartArc
]

{ #category : #ways }
CMNetworkEntity >> startNodes [
	" Returns the nodes located at the start of the Network "
	
	^ self startArcs collect: #startNode
]

{ #category : #ways }
CMNetworkEntity >> stopArcs [
	" Returns the arcs located at the end of the Network "
	
	^ self arcs select: #isNetworkStopArc
]

{ #category : #ways }
CMNetworkEntity >> stopNodes [
	"Purpose: returns the nodes located at the end of the Network"
	
	^ self stopArcs collect: #stopNode
]
