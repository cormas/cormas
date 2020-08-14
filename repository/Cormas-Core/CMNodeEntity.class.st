"
NodeEntity is a kind of located entity (located on a SpatialEntityElement).
As an component of a network, it is connected to other Nodes through ArcEntities.
It is so associated to at least one oriented ArcEntity as startNode or endNode of this arc.
A node knows all the incoming arcs it belongs to (#incomingArcs) as well as the outgoing arcs (#outgoingArcs).
Thus, by recursivity, a NodeEntity is connected to an oriented graph (#fullNetwork).


"
Class {
	#name : #CMNodeEntity,
	#superclass : #CMNetworkComponentEntity,
	#instVars : [
		'arcs',
		'replaceNodeWhileMoving'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #image }
CMNodeEntity class >> defaultImage [
	
	| im |
	im := super defaultImage.
	im sizeRatio: 0.1.
	^im
]

{ #category : #'- testing' }
CMNodeEntity class >> isNodeClass [
	
	^true
]

{ #category : #'- way' }
CMNodeEntity >> addCyclicNodesOf: cw forArc: arc waysToMe: waysToMe fullWays: fullWays [
	| bifurcationNodes waysToNextBifurcation noneCyclicNodes |
	arc stopNode = (cw at: (cw indexOf: self) + 1)
		ifTrue: [ bifurcationNodes := cw
				select: [ :bifNode | bifNode outgoingArcs size > 1 ].
			bifurcationNodes
				do: [ :bifNode | 
					waysToNextBifurcation := OrderedCollection new.
					waysToMe do: [ :wtm | waysToNextBifurcation add: wtm copy ].
					waysToNextBifurcation
						do: [ :wtnb | 
							| partOfCycle start end |
							start := 1 + (cw indexOf: self).
							end := cw indexOf: bifNode.
							start > end
								ifTrue: [ end := cw lastIndexOf: bifNode ].
							partOfCycle := start > end
								ifTrue: [ #() ]
								ifFalse: [ cw copyFrom: start to: end ].
							wtnb addAll: partOfCycle.
							noneCyclicNodes := bifNode outgoingNodes
								reject: [ :outNode | cw includes: outNode ].
							noneCyclicNodes isEmpty
								ifTrue: [ fullWays addAll: waysToNextBifurcation.
									^ fullWays ].	"this node have no noneCyclic output arc"
							noneCyclicNodes
								do:
									[ :ncn | fullWays addAll: (ncn downstreamWays: waysToNextBifurcation) ] ] ] ]
		ifFalse: [ fullWays addAll: (arc stopNode downstreamWays: waysToMe) ]
]

{ #category : #'+ accessing' }
CMNodeEntity >> arcs [
	
	^arcs ifNil: [arcs := OrderedCollection new]
]

{ #category : #'+ accessing' }
CMNodeEntity >> arcs: anObject [
	
	arcs := anObject
]

{ #category : #'star testing' }
CMNodeEntity >> belongsToCyclicWay [
	"answers if the Node is part of a cyclic way of nodes"
	self isNetworkStartNode ifTrue:[^false].
	self isNetworkStopNode ifTrue:[^false].
	^self belongsToCyclicWay: OrderedCollection new
]

{ #category : #'- way' }
CMNodeEntity >> belongsToCyclicWay: previousWay [
	"answers if the Node is part of a cyclic way of nodes.
	Recursivity"

	self isNetworkStartNode
		ifTrue: [ ^ false ].
	self isNetworkStopNode
		ifTrue: [ ^ false ].
	(previousWay includes: self)
		ifTrue: [ ^ true ].
	^ self outgoingArcs
		anySatisfy: [ :arc | 
			previousWay add: self.
			arc stopNode belongsToCyclicWay: previousWay ]
]

{ #category : #'- way' }
CMNodeEntity >> checkOrientedWay: aCollOfNodes [
	
	| nodeCurrent nodeNext |
	1
		to: aCollOfNodes size - 1
		do:
			[:i | 
			nodeCurrent := aCollOfNodes at: i.
			nodeNext := aCollOfNodes at: i + 1.
			(nodeCurrent outgoingNodes includes: nodeNext) ifFalse: [^false]].
	^true
]

{ #category : #'+ add-remove' }
CMNodeEntity >> checkToReplaceNode [
	"Verify if the node must be replaced by previous node (and does it if necessary)"
	
	| sameNodes |
	self replaceNodeWhileMoving ifFalse: [^nil].
	patch ifNil: [^nil].
	sameNodes := (self patch occupants: self class) copy.
	sameNodes
		remove: self
		ifAbsent: [nil].
	sameNodes isEmpty
		ifFalse:
			["self arcs isEmpty ifTrue:[self destroyed: true]. "
			sameNodes
				do:
					[:nod | 
					self incomingArcs reverseDo: [:arc | arc replaceStopNodeBy: nod].
					self outgoingArcs reverseDo: [:arc | arc replaceStartNodeBy: nod]]]
]

{ #category : #'+ network' }
CMNodeEntity >> cyclicWays [
	"return a collection of cyclic ways that the Node belongs to. Each cyclic way is an ordered collection of nodes, starting with the receiver node.
	An empty collection means that the node doesn't belong to any cyclic way. But one node may belong to several cyclic ways"
	
	| ways |
	self isNetworkStartNode ifTrue: [^#()].
	self isNetworkStopNode ifTrue: [^#()].
	ways := self cyclicWays: OrderedCollection new.
	ways removeAllSuchThat: [:w | (w last outgoingNodes includes: self) not].
	^ways
]

{ #category : #'- way' }
CMNodeEntity >> cyclicWays: previousWay [
	"return a collection of cyclic ways that the Node belongs to"
	
	| nextWays nextWay previousWayMemory |
	self isNetworkStartNode ifTrue: [^#()].
	self isNetworkStopNode ifTrue: [^#()].
	(previousWay includes: self) ifTrue: [^previousWay].
	previousWay add: self.
	previousWayMemory := previousWay copy.
	nextWays := OrderedCollection new.
	self outgoingArcs
		do:
			[:arc | 
			nextWay := arc stopNode cyclicWays: previousWayMemory.
			nextWay isEmpty
				ifFalse:
					[nextWay first isCollection
						ifTrue: [nextWays addAll: nextWay]
						ifFalse: [nextWays add: nextWay].
					previousWayMemory := previousWay copy]].
	^nextWays
]

{ #category : #'+ accessing' }
CMNodeEntity >> cyclicsArcs [
	
	^ self arcs select: #isCyclic
]

{ #category : #'+ network' }
CMNodeEntity >> downstreamWay [
	"returns the shortest way from this Node towards the down stream direction (taking into account the orientation of the network).
	The way is an ordered collection of nodes, starting with the receiver node.
	Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use downstreamWays that returns all the ways then compare them. "
	
	| sortedWays |
	sortedWays := self downstreamWays
		asSortedCollection: [:a :b | a size < b size].
	sortedWays := sortedWays select: [:w | w size = sortedWays first size].
	^sortedWays first
]

{ #category : #'+ network' }
CMNodeEntity >> downstreamWays [
	"returns a collection of all the ways from this Node towards the down stream direction (taking into account the orientation of the network). Each way is an ordered collection of nodes, starting with the receiver node. "
	
	| ways waysWithoutDuplicated |
	ways := self downstreamWays: (OrderedCollection with: OrderedCollection new).
	waysWithoutDuplicated := OrderedCollection new.
	ways do: [ : aWay | 
		(waysWithoutDuplicated anySatisfy: [ : coll | coll = aWay ])
			ifFalse: [ waysWithoutDuplicated add: aWay ] ].
	^ waysWithoutDuplicated
]

{ #category : #'- way' }
CMNodeEntity >> downstreamWays: previousWays [
	"returns a collection of ways towards the down stream direction (taking into account the orientation of the network) .
	Recursivity ! "
	
	| fullWays downArcs waysToMe newWay cyclicWays |
	waysToMe := OrderedCollection new.
	previousWays
		do:
			[:w | 
			newWay := w copy.
			newWay add: self.
			waysToMe add: newWay].
	downArcs := self outgoingArcs.
	downArcs isEmpty ifTrue: [^waysToMe].
	fullWays := OrderedCollection new.	"if is cylic, so do not use this way"
	cyclicWays := previousWays select: [:w | w includes: self].
	downArcs
		do:
			[:arc | 
			cyclicWays isEmpty
				ifTrue: [fullWays addAll: (arc stopNode downstreamWays: waysToMe)]
				ifFalse:
					[cyclicWays
						do:
							[:cw | 
							self addCyclicNodesOf: cw forArc: arc waysToMe: waysToMe fullWays:
									fullWays]]].
	^fullWays
]

{ #category : #'+ network' }
CMNodeEntity >> fullNetwork [
	"returns an instance of NetworkEntity containing all the connected arcs of the network it belongs to, as well as all the nodes"
	
	^ CMNetworkEntity newFromNode: self
]

{ #category : #'+ network' }
CMNodeEntity >> fullNetworkType: aNetworkClass [
	"returns an instance of aNetworkClass containing all the connected arcs of the network it belongs to, as well as all the nodes.
aNetworkClass is a subclass of NetworkEntity"
	
	^aNetworkClass newFromNode: self
]

{ #category : #'star testing' }
CMNodeEntity >> hasNoneCyclicOutput [
	"Answer if the node has none cyclic output nodes  (ie. nodes that do not belongs to the cycles of the node receiver)"

	"^self noneCyclicOutputs isEmpty not"

	| allCyclicNodes |
	allCyclicNodes := OrderedCollection new.
	self cyclicWays do: [ :cw | allCyclicNodes addAll: cw ].
	allCyclicNodes isEmpty
		ifTrue: [ ^ true ].
	allCyclicNodes
		do: [ :node | 
			node outgoingNodes
				do: [ :outNode | 
					(allCyclicNodes includes: outNode)
						ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #'+ accessing' }
CMNodeEntity >> incomingArcs [
	"return a list of arcs for whom this node is an endNode"
	
	^self arcs select: [:arc | arc stopNode = self]
]

{ #category : #'+ accessing' }
CMNodeEntity >> incomingNodes [
	"return a list of nodes for whom this node is a endNode"
	
	^self incomingArcs collect: [:arc | arc startNode]
]

{ #category : #'- testing' }
CMNodeEntity >> isConnectedTo: anotherNode [
	"answers if anotherNode is a component of its network (without taking into account the orientation of the network)"
	
	^self fullNetwork nodes includes: anotherNode
]

{ #category : #'- testing' }
CMNodeEntity >> isDownstreamFrom: anotherNode [
	"answers if anotherNode is a component of its network towards the down stream direction (taking into account the orientation of the network)"

	| orderedNodes |
	orderedNodes := self fullNetwork nodes.
	(orderedNodes includes: anotherNode)
		ifFalse: [ ^ false ].
	^ anotherNode downstreamWays anySatisfy: [ :w | w includes: self ]
]

{ #category : #'+ moving' }
CMNodeEntity >> isMovedTo: aSpatialEntity [
	"Purpose: moves to a given location. If replaceNodeWhileMoving = true, then it will replace its own nodes by the previous ones.
Argument: aSpatialEntity = <SpatialEntity>
Example: self isMovedTo: self patch neighbourN"
	
	super isMovedTo: aSpatialEntity.
	self incomingArcs do: [:anArc | anArc newStopPosition: self patch].
	self outgoingArcs do: [:anArc | anArc newStartPosition: self patch].
	self checkToReplaceNode
]

{ #category : #'star testing' }
CMNodeEntity >> isNetworkStartNode [
	^self incomingArcs isEmpty
]

{ #category : #'star testing' }
CMNodeEntity >> isNetworkStopNode [
	^self outgoingArcs isEmpty
]

{ #category : #'- testing' }
CMNodeEntity >> isUpstreamOf: anotherNode [
	"answers if anotherNode is a component of its network towards the down stream direction (taking into account the orientation of the network)"

	| orderedNodes |
	orderedNodes := self fullNetwork nodes.
	(orderedNodes includes: anotherNode)
		ifFalse: [ ^ false ].
	^ self downstreamWays anySatisfy: [ :w | w includes: anotherNode ]
]

{ #category : #'+ network' }
CMNodeEntity >> noneCyclicOutputs [
	"Returns a collection of nodes that are none cyclic output nodes (ie. nodes that do not belongs to the cycles of the node receiver)"
	
	| allCyclicNodes noneCyclicOutputs cyclicWays |
	cyclicWays := self cyclicWays.
	cyclicWays isEmpty ifTrue: [^self outgoingNodes].
	noneCyclicOutputs := OrderedCollection new.
	allCyclicNodes := OrderedCollection new.
	cyclicWays do: [:cw | allCyclicNodes addAll: cw].
	allCyclicNodes
		do:
			[:node | 
			node outgoingNodes
				do:
					[:outNode | 
					(allCyclicNodes includes: outNode)
						ifFalse: [noneCyclicOutputs add: outNode]]].
	^noneCyclicOutputs
]

{ #category : #'+ accessing' }
CMNodeEntity >> outgoingArcs [
	"return a list of arcs for whom this node is a startNode"
	
	^self arcs select: [:arc | arc startNode = self]
]

{ #category : #'+ accessing' }
CMNodeEntity >> outgoingNodes [
	"return a list of nodes for whom this node is a startNode"
	
	^self outgoingArcs collect: [:arc | arc stopNode]
]

{ #category : #'+ add-remove' }
CMNodeEntity >> removeArc: anArc [
	
	self arcs
		remove: anArc
		ifAbsent: [nil].
	self arcs isEmpty
		ifTrue:
			[self
				leave;
				destroyed: true].
	self changed
]

{ #category : #'+ accessing' }
CMNodeEntity >> replaceNodeWhileMoving [
	"If true, then "
	
	^replaceNodeWhileMoving ifNil: [replaceNodeWhileMoving := true]
]

{ #category : #'+ accessing' }
CMNodeEntity >> replaceNodeWhileMoving: aBoolean [
	
	replaceNodeWhileMoving := aBoolean
]

{ #category : #'+ network' }
CMNodeEntity >> upstreamWay [
	"returns the shortest way from this Node towards the up stream direction (taking into account the orientation of the network).
	The way is an ordered collection of nodes, starting with the receiver node.
	Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use upstreamWays that returns all the ways then compare them. "
	
	| sortedWays |
	sortedWays := self upstreamWays
		asSortedCollection: [:a :b | a size < b size].
	sortedWays := sortedWays select: [:w | w size = sortedWays first size].
	^sortedWays first
]

{ #category : #'+ network' }
CMNodeEntity >> upstreamWays [
	"returns a collection of all the ways from this Node towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of nodes, starting with the receiver node. "
	
	| ways waysWithoutDuplicated |
	ways := self upstreamWays: (OrderedCollection with: OrderedCollection new).
	waysWithoutDuplicated := OrderedCollection new.
	ways
		do:
			[:aWay | 
			(waysWithoutDuplicated anySatisfy: [:coll | coll = aWay])
				ifFalse: [waysWithoutDuplicated add: aWay]].
	^waysWithoutDuplicated
]

{ #category : #'- way' }
CMNodeEntity >> upstreamWays: previousWays [
	"returns a collection of ways towards the up stream direction (taking into account the orientation of the network) .
	Recursivity ! "
	
	| fullWays upArcs waysToMe newWay cyclicWays noneCyclicNodes bifurcationNodes waysToNextBifurcation |
	waysToMe := OrderedCollection new.
	previousWays
		do:
			[:w | 
			newWay := w copy.
			newWay add: self.
			waysToMe add: newWay].
	upArcs := self incomingArcs.
	upArcs isEmpty ifTrue: [^waysToMe].
	fullWays := OrderedCollection new.	"if is cylic, so do not use this way"
	cyclicWays := previousWays select: [:w | w includes: self].
	upArcs
		do:
			[:arc | 
			cyclicWays isEmpty
				ifTrue: [fullWays addAll: (arc startNode upstreamWays: waysToMe)]
				ifFalse:
					[cyclicWays
						do:
							[:cw | 
							arc startNode = (cw at: (cw indexOf: self) + 1)
								ifTrue:
									[bifurcationNodes := cw select: [:bifNode | bifNode incomingArcs size > 1].
									bifurcationNodes
										do:
											[:bifNode | 
											waysToNextBifurcation := OrderedCollection new.
											waysToMe do: [:wtm | waysToNextBifurcation add: wtm copy].
											waysToNextBifurcation
												do:
													[:wti | 
													| partOfCycle start end |
													start := 1 + (cw indexOf: self).
													end := cw indexOf: bifNode.
													start > end ifTrue: [end := cw lastIndexOf: bifNode].
													start > end
														ifTrue: [partOfCycle := #()]
														ifFalse: [partOfCycle := cw copyFrom: start to: end].
													wti addAll: partOfCycle].
											noneCyclicNodes := bifNode incomingNodes
												select: [:outNode | (cw includes: outNode) not].
											noneCyclicNodes
												do:
													[:ncn | fullWays addAll: (ncn upstreamWays: waysToNextBifurcation)]]]
								ifFalse: [fullWays addAll: (arc startNode upstreamWays: waysToMe)]]]].
	^fullWays
]
