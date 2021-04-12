"
NetworkComponentEntity is the superclass of NodeEntity and AcrEntity belonging to a NetworkEntity.


"
Class {
	#name : #CMNetworkComponentEntity,
	#superclass : #CMObjectLocation,
	#category : #'Cormas-Core-Entities'
}

{ #category : #network }
CMNetworkComponentEntity >> cyclicWays [
	"Purpose: returns a collection of cyclic ways . Each cyclic way is an ordered collection of arcs or nodes, starting with the receiver element.
An empty collection means that the element doesn't belong to any cyclic way. But one element may belong to several cyclic ways"
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> downstreamWay [
	"Purpose: returns the shortest way from this element towards the down stream direction (taking into account the orientation of the network).
The way is an ordered collection of elements, starting with the receiver node.
Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use downstreamWays that returns all the ways then compare them. "
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> downstreamWays [
	"Purpose: returns a collection of all the ways from this element towards the down stream direction (taking into account the orientation of the network). Each way is an ordered collection of elements, starting with the receiver. "
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> fullNetwork [
	"Purpose: returns an instance of NetworkEntity containing all the connected arcs of the network it belongs to, as well as all the nodes"
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> fullNetworkType: aNetworkClass [
	"Purpose: returns an instance of aNetworkClass containing all the connected arcs of the network it belongs to, as well as all the nodes.
aNetworkClass is a subclass of NetworkEntity"
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> upstreamWay [
	"Purpose: returns a collection of all the ways from this element towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of elements, starting with the receiver. "
	
	self subclassResponsibility
]

{ #category : #network }
CMNetworkComponentEntity >> upstreamWays [
	"Purpose: returns a collection of all the ways from this element towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of elements, starting with the receiver. "
	
	self subclassResponsibility
]
