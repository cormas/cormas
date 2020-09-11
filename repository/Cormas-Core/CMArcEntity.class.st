"
ArcEntity is a entity located on 2 SpatialEntityElement.It is usefull to describe canals, roads or arcRivers...
ArcEntity is an oriented arc with 2 nodes: startNode and endNode.
An ArcEntity knows all the incomingArcs it is connected to (#incomingArcs) as well as the outgoing arcs (#outgoingArcs).
Thus, by recursivity, an ArcEntity is also connected to an oriented graph (#fullNetwork).
As an component of a network, it is connected to other Arcs through ArcEntities.

ArcEntity defines the #nodeType method that returns the class of the node. By default, nodeType is NodeEntity. This methode may be redefined to determine wath kind of nodes the arc is composed of.


"
Class {
	#name : #CMArcEntity,
	#superclass : #CMNetworkComponentEntity,
	#instVars : [
		'startNode',
		'stopNode'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #image }
CMArcEntity class >> defaultImage [
	
	| im |
	im := ArcPOV new.
	^im
]

{ #category : #'- testing' }
CMArcEntity class >> isArcClass [
	
	^true
]

{ #category : #'instance creation' }
CMArcEntity class >> newFromCell: startCell toCell: endCell [
	
	| inst |
	inst := self newAndCollect.
	inst initFromCell: startCell toCell: endCell.
	^inst
]

{ #category : #'instance creation' }
CMArcEntity class >> newFromNode: startNode toNode: endNode [
	
	| inst |
	inst := self newAndCollect.
	inst initFrom: startNode to: endNode.
	^inst
]

{ #category : #'+ add-arc' }
CMArcEntity >> changeStartNode: anotherStartNode [
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStartNode |
	anotherStartNode patch ifNil: [^nil].
	oldStartNode := self startNode.
	self startNode: anotherStartNode.
	self newStartPosition: anotherStartNode patch.
	oldStartNode removeArc: self
]

{ #category : #'+ add-arc' }
CMArcEntity >> changeStopNode: anotherStopNode [
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStopNode |
	oldStopNode := self stopNode.
	self stopNode: anotherStopNode.
	self newStopPosition: anotherStopNode patch.
	oldStopNode removeArc: self
]

{ #category : #'+ network' }
CMArcEntity >> cyclicWays [
	"return a collection of cyclic ways that the Arc belongs to. Each cyclic way is an ordered collection of arcs, starting with the receiver arc.
	An empty collection means that the arc doesn't belong to any cyclic way. But one arc may belong to several cyclic ways"
	
	| cyclicNodesWays cyclicArcWays wayOfArcs outputNodeIndex |
	self isNetworkStartArc ifTrue: [^#()].
	self isNetworkStopArc ifTrue: [^#()].
	cyclicNodesWays := self stopNode cyclicWays.
	cyclicArcWays := OrderedCollection new.
	cyclicNodesWays
		do:
			[:won | 
			wayOfArcs := OrderedCollection new.
			cyclicArcWays add: wayOfArcs.
			1
				to: won size
				do:
					[:i | 
					i = won size
						ifTrue: [outputNodeIndex := 1]
						ifFalse: [outputNodeIndex := i + 1].
					wayOfArcs
						add:
							((won at: i) outgoingArcs
								detect: [:a | (won at: outputNodeIndex) incomingArcs includes: a])].
			wayOfArcs addFirst: wayOfArcs last.
			wayOfArcs removeLast].
	^cyclicArcWays
]

{ #category : #'- initialize-release' }
CMArcEntity >> destroyed: aBoolean [
	
	super destroyed: aBoolean.
	aBoolean
		ifTrue:
			[startNode isNil ifFalse: [self startNode removeArc: self].
			stopNode isNil ifFalse: [self stopNode removeArc: self]]
]

{ #category : #'+ testing' }
CMArcEntity >> doesCrossCell: aCell [
	"answer if aCell is crossed by this Arc"
	
	^aCell isCrossedByArc: self
]

{ #category : #'+ network' }
CMArcEntity >> downstreamWay [
	"returns the shortest way from this Arc towards the down stream direction (taking into account the orientation of the network).
	The way is an ordered collection of arcs, starting with the receiver node.
	Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use downstreamWays that returns all the ways then compare them. "
	
	| sortedWays |
	sortedWays := self downstreamWays
		asSortedCollection: [:a :b | a size < b size].
	sortedWays := sortedWays select: [:w | w size = sortedWays first size].
	^sortedWays first
]

{ #category : #'+ network' }
CMArcEntity >> downstreamWays [
	"returns a collection of all the ways from this Arc towards the down stream direction (taking into account the orientation of the network). Each way is an ordered collection of arcs, starting with the receiver arc. "
	
	| nodesWays arcWays wayOfArcs |
	nodesWays := self startNode downstreamWays.
	arcWays := OrderedCollection new.
	nodesWays
		do:
			[:won | 
			wayOfArcs := OrderedCollection new.
			arcWays add: wayOfArcs.
			1
				to: won size - 1
				do:
					[:i | 
					wayOfArcs
						add:
							((won at: i) outgoingArcs
								detect: [:a | (won at: i + 1) incomingArcs includes: a])]].
	^arcWays
]

{ #category : #'+ network' }
CMArcEntity >> fullNetwork [
	"returns an instance of NetworkEntity containing all the connected arcs of the network I belong to, as well as all the nodes"
	
	| network |
	network := CMNetworkEntity new.
	network arcs: (self fullNetworkWithout: OrderedCollection new).
	network getNodes.
	^network
]

{ #category : #'+ network' }
CMArcEntity >> fullNetworkType: aNetworkClass [
	"returns an instance of aNetworkClass containing all the connected arcs of the network it belongs to, as well as all the nodes.
aNetworkClass is a subclass of NetworkEntity"
	
	| network |
	network := aNetworkClass new.
	network arcs: (self fullNetworkWithout: OrderedCollection new).
	network getNodes.
	^network
]

{ #category : #'- ways' }
CMArcEntity >> fullNetworkWithout: rejectedNetworkSet [
	"returns the main network. 
	rejectedCellsSet = <Set>
	! RECURSIVITY ! "
	
	| aMainNetwork allConnectedArcs |
	aMainNetwork := OrderedCollection with: self.
	allConnectedArcs := self incomingArcs.
	allConnectedArcs addAll: self outgoingArcs.
	allConnectedArcs := allConnectedArcs
		reject: [:arc | rejectedNetworkSet includes: arc].
	allConnectedArcs isEmpty ifTrue: [^aMainNetwork].
	allConnectedArcs
		do:
			[:arc | 
			rejectedNetworkSet add: self.
			aMainNetwork addAll: (arc fullNetworkWithout: rejectedNetworkSet)].
	^aMainNetwork
]

{ #category : #'+accessing' }
CMArcEntity >> incomingArcs [
	"returns a collection of adjacent arcs incoming to my startNode"
	
	^self startNode incomingArcs
]

{ #category : #'+ initialize-release' }
CMArcEntity >> initFrom: initNode to: endNode [
	
	self startNode: initNode.
	self stopNode: endNode.
	self
		isMovedFrom: initNode patch
		to: endNode patch
]

{ #category : #'+ initialize-release' }
CMArcEntity >> initFromCell: startCell toCell: endCell [
	
	| previousNodes initNode endNode |
	previousNodes := startCell occupants: self nodeType name.
	previousNodes isEmpty
		ifTrue: [initNode := self newNode	"initNode isMovedTo: startCell"]
		ifFalse: [initNode := previousNodes first].
	self startNode: initNode.
	previousNodes := endCell occupants: self nodeType name.
	previousNodes isEmpty
		ifTrue: [endNode := self newNode	"endNode isMovedTo: endCell"]
		ifFalse: [endNode := previousNodes first].
	self stopNode: endNode.
	self isMovedFrom: startCell to: endCell
]

{ #category : #'+ testing' }
CMArcEntity >> isArcEntity [
	
	^true
]

{ #category : #'+ testing' }
CMArcEntity >> isConnectedTo: anotherArc [
	"answers if anotherArc is a component of its network (without taking into account the orientation of the network)"
	
	^self fullNetwork arcs includes: anotherArc
]

{ #category : #'+ testing' }
CMArcEntity >> isCyclic [
	"answer if the Arc has the same target and source node"
	
	^self startNode = self stopNode
]

{ #category : #'+ testing' }
CMArcEntity >> isDownstreamFrom: anotherArc [
	"answers if anotherArc is a component of its network towards the down stream direction (taking into account the orientation of the network)"
	
	| orderedArcs |
	orderedArcs := self fullNetwork arcs.
	(orderedArcs includes: anotherArc) ifFalse: [^false].
	anotherArc downstreamWays do: [:w | (w includes: self) ifTrue: [^true]].
	^false
]

{ #category : #'+ procedures' }
CMArcEntity >> isMovedFrom: startCell to: endCell [
	"the startNode of the Arc is moved to aSpatialEntityElement.
	the stopNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"

	| alreadySituated_start |
	alreadySituated_start := self isSituated.	"Log the movement"
	startCell spaceModel logMovementOf: self from: patch to: startCell.
	endCell spaceModel logMovementOf: self from: patch to: endCell.
	self moveStartNodeTo: startCell.
	patch := startCell.
	self moveStopNodeTo: endCell.
	(startCell occupants: self class name) add: self.
	(endCell occupants: self class name) add: self.
	alreadySituated_start
		ifTrue: [ self halt.
			self flag:#TODO.
"a priori ca ne marche pas car la notification renvoi √† un moveOccupant qui n''a pas √©t√© pr√©vu pour des Arcs. D''un autre cot√© je ne vois pas pouquoi on devrait avoir des moving arcs puisqu''ils ne bougent pas d''eux memes, mais que lorsqu''un de leur node bouge'"
			self cormasModel
				registerEntityChange: #movingArc
				with: (EntityReference on: startCell) -> (EntityReference on: endCell)
				from: (EntityReference on: self) ]
		ifFalse: [ self cormasModel
				registerEntityChange: #newArc
				with: (EntityReference on: startCell) -> (EntityReference on: endCell)
				from: (EntityReference on: self) ]
]

{ #category : #'+ procedures' }
CMArcEntity >> isMovedTo: startCell [
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"

	"the entity is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"

	| alreadySituated_start |
	alreadySituated_start := self isSituated.	"Log the movement"
	startCell spaceModel logMovementOf: self from: patch to: startCell.
	self moveStartNodeTo: startCell.
	(startCell occupants: self class name) add: self.
	stopNode patch ifNil: [ ^ nil ].
	alreadySituated_start
		ifTrue: [ "self halt."
			self flag:#TODO.
				"a priori ca ne marche pas car la notification renvoi à un moveOccupant qui n a pas été prévu pour des Arcs. D un autre coté je ne vois pas pouquoi on devrait avoir des moving arcs puisqu''ils ne bougent pas d''eux memes, mais que lorsqu''un de leur node bouge"
			self cormasModel
				registerEntityChange: #movingArc
				with:
					(EntityReference on: startCell)
						-> (EntityReference on: stopNode patch)
				from: (EntityReference on: self) ]
		ifFalse: [ self cormasModel
				registerEntityChange: #newArc
				with:
					(EntityReference on: startCell)
						-> (EntityReference on: stopNode patch)
				from: (EntityReference on: self) ]
]

{ #category : #'+ testing' }
CMArcEntity >> isNetworkStartArc [
	
	^self startNode isNetworkStartNode
]

{ #category : #'+ testing' }
CMArcEntity >> isNetworkStopArc [
	
	^self stopNode isNetworkStopNode
]

{ #category : #'star testing' }
CMArcEntity >> isSituated [
	"Purpose: tests the location somewhere in the spatial grid"
	^super isSituated.
	"self startNode isNil ifTrue: [^false].
	self stopNode isNil ifTrue: [^false].
	^(self startNode isSituated and:[self stopNode isSituated ])"
]

{ #category : #'+ testing' }
CMArcEntity >> isUpstreamOf: anotherArc [
	"answers if anotherArc is a component of its network towards the up stream direction (taking into account the orientation of the network)"
	
	| orderedArcs |
	orderedArcs := self fullNetwork nodes.
	(orderedArcs includes: anotherArc) ifFalse: [^false].
	self downstreamWays do: [:w | (w includes: anotherArc) ifTrue: [^true]].
	^false
]

{ #category : #'+ procedures' }
CMArcEntity >> leaveWhileMoving: isBeingMoved [
	"The situated Arc is not located any more. But it is still 'alive'  "

	patch isNil
		ifTrue: [ ^ self ].
	patch := nil.
	startNode isNil
		ifFalse: [ startNode patch isNil
				ifFalse: [ (startNode patch occupants: self class name)
						remove: self
						ifAbsent: [  ] ].
			startNode removeArc: self ].
	stopNode isNil
		ifFalse: [ stopNode patch isNil
				ifFalse: [ (stopNode patch occupants: self class name)
						remove: self
						ifAbsent: [  ] ].
			stopNode removeArc: self ].
	isBeingMoved
		ifFalse: [ self cormasModel
				registerEntityChange: #leavingOccupant
				from: (EntityReference on: self) ]
]

{ #category : #'+ measures' }
CMArcEntity >> length_direct [
	"returns the euclidian distance between startNode and endNode"
	
	^self startNode patch euclideanDistanceTo: self stopNode patch
]

{ #category : #'+ measures' }
CMArcEntity >> length_inCells [
	"returns the distance between startNode and endNode, as a number of cells (also known as Manhattan distance)"
	
	^self startNode patch distanceTo: self stopNode patch
]

{ #category : #'star moving' }
CMArcEntity >> moveStartNodeRandomly [
	self moveStartNodeTo: self startNode patch randomNeighbour
]

{ #category : #'+ procedures' }
CMArcEntity >> moveStartNodeTo: aSpatialEntityElement [
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	
	self startNode destroyed: false.
	self startNode patch = aSpatialEntityElement ifTrue: [^nil].
	self startNode isMovedTo: aSpatialEntityElement
]

{ #category : #'star moving' }
CMArcEntity >> moveStopNodeRandomly [
	self moveStopNodeTo: self stopNode patch randomNeighbour
]

{ #category : #'+ procedures' }
CMArcEntity >> moveStopNodeTo: aSpatialEntityElement [
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	
	self stopNode patch = aSpatialEntityElement ifTrue: [^nil].
	self stopNode isMovedTo: aSpatialEntityElement
]

{ #category : #'+ add-arc' }
CMArcEntity >> newIncomingArcFromCell: initCell [
	"creates and add a new instance of Arc from initCell until my startNode. If there is no node on initCell, it creates it, otherwise it uses the current node  already located on initCell"
	
	| nodes initNode |
	nodes := initCell occupants: self nodeType name.
	nodes isEmpty
		ifTrue:
			[initNode := self newNode.
			initNode isMovedTo: initCell]
		ifFalse: [initNode := nodes first].
	self newIncomingArcFromNode: initNode
]

{ #category : #'+ add-arc' }
CMArcEntity >> newIncomingArcFromNode: initNode [
	"creates and add a new instance of Arc from initNode until my startNode"
	
	| newArc |
	newArc := self newEntity: self class.
	newArc
		initFrom: initNode
		to: self startNode
]

{ #category : #'+ add-arc' }
CMArcEntity >> newNode [
	
	self nodeType = CMNodeEntity
		ifTrue: [^CMNodeEntity new]
		ifFalse: [^self newEntity: self nodeType]
]

{ #category : #'+ add-arc' }
CMArcEntity >> newOutgoingArcToCell: endCell [
	"creates and add a new instance of Arc from my stopNode to another cell by creating a new instance of stopNode on endCell if there is none or using the current node if already located on endCell"
	
	| endNode endNodes |
	endNodes := endCell occupants: self nodeType name.
	endNodes isEmpty
		ifTrue:
			[endNode := self newNode.
			endNode isMovedTo: endCell]
		ifFalse: [endNode := endNodes first].
	self newOutgoingArcToNode: endNode
]

{ #category : #'+ add-arc' }
CMArcEntity >> newOutgoingArcToNode: endNode [
	"creates and add a new instance of Arc from my stopNode to another node: endNode"
	
	| newArc |
	newArc := self newEntity: self class.
	newArc
		initFrom: self stopNode
		to: endNode
]

{ #category : #'- dispatch' }
CMArcEntity >> newStartPosition: aCell [
	self cormasModel
		registerEntityChange: #newStartPosition
		with: (EntityReference on: aCell)
		from: (EntityReference on: self)
]

{ #category : #'- dispatch' }
CMArcEntity >> newStopPosition: aCell [
	self cormasModel
		registerEntityChange: #newStopPosition
		with: (EntityReference on: aCell)
		from: (EntityReference on: self)
]

{ #category : #'+accessing' }
CMArcEntity >> nodeType [
	"return the type of Node of the model. May be redefined"
	
	^CMNodeEntity
]

{ #category : #'+accessing' }
CMArcEntity >> outgoingArcs [
	"returns a collection of adjacent arcs starting from my endNode"
	
	^self stopNode outgoingArcs
]

{ #category : #'+accessing' }
CMArcEntity >> patch [
	"redefines #patch as the patch of the startNode"
	
	^self startNode patch
]

{ #category : #'+ acces' }
CMArcEntity >> patch: aCell [
	"redefines #patch as the patch of the startNode"
	
	patch := aCell.
	^self startNode patch: aCell
]

{ #category : #'+ procedures' }
CMArcEntity >> replaceStartNodeBy: anotherStartNode [
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStartNode |
	anotherStartNode = self startNode ifTrue: [^nil].
	anotherStartNode patch ifNil: [^nil].
	oldStartNode := self startNode.
	self startNode: anotherStartNode.
	self newStartPosition: anotherStartNode patch.
	oldStartNode isNil ifFalse: [oldStartNode removeArc: self]
]

{ #category : #'+ procedures' }
CMArcEntity >> replaceStopNodeBy: anotherStopNode [
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStopNode |
	anotherStopNode = self stopNode ifTrue: [^nil].
	oldStopNode := self stopNode.
	self stopNode: anotherStopNode.
	self newStopPosition: anotherStopNode patch.
	oldStopNode isNil ifFalse: [oldStopNode removeArc: self]
]

{ #category : #'+ procedures' }
CMArcEntity >> reverseDirection [
	"Reverse the direction of the arc (downstream -> upstream)"
	
	| oldStartNode oldStopNode |
	oldStartNode := self startNode.
	oldStopNode := self stopNode.
	self stopNode: oldStartNode.
	self startNode: oldStopNode.
	startNode changed.
	stopNode changed.
	self newStartPosition: self startNode patch.
	self patch: self startNode patch.
	self newStopPosition: self stopNode patch
]

{ #category : #'+ acces' }
CMArcEntity >> startCell [
	
	^self startNode patch
]

{ #category : #'+accessing' }
CMArcEntity >> startNode [
	
	^startNode
]

{ #category : #'+accessing' }
CMArcEntity >> startNode: aNode [
	
	startNode isNil ifFalse: [self startNode removeArc: self].
	startNode := aNode.
	aNode arcs add: self.
	aNode changed	"self changed"
]

{ #category : #'+accessing' }
CMArcEntity >> startNodeType [
	"return the Node type of the startNode of the model. May be redefined, ex:
	startNodeType
		^ Pump  "
	
	^self nodeType
]

{ #category : #'+ acces' }
CMArcEntity >> stopCell [
	
	^self stopNode patch
]

{ #category : #'+accessing' }
CMArcEntity >> stopNode [
	
	^stopNode
]

{ #category : #'+accessing' }
CMArcEntity >> stopNode: aNode [
	
	stopNode isNil ifFalse: [self stopNode removeArc: self].
	stopNode := aNode.
	aNode arcs add: self
]

{ #category : #'+accessing' }
CMArcEntity >> stopNodeType [
	"return the Node type of the stopNode of the model. May be redefined"
	
	^self nodeType
]

{ #category : #'+ network' }
CMArcEntity >> upstreamWay [
	"returns the shortest way from this Arc towards the up stream direction (taking into account the orientation of the network).
	The way is an ordered collection of arcs, starting with the receiver arc.
	Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use upstreamWays that returns all the ways then compare them. "
	
	| sortedWays |
	sortedWays := self upstreamWays
		asSortedCollection: [:a :b | a size < b size].
	sortedWays := sortedWays select: [:w | w size = sortedWays first size].
	^sortedWays first
]

{ #category : #'+ network' }
CMArcEntity >> upstreamWays [
	"returns a collection of all the ways from this Arc towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of arcs, starting with the receiver arc. "
	
	| nodesWays arcWays wayOfArcs |
	nodesWays := self stopNode upstreamWays.
	arcWays := OrderedCollection new.
	nodesWays
		do:
			[:won | 
			wayOfArcs := OrderedCollection new.
			arcWays add: wayOfArcs.
			1
				to: won size - 1
				do:
					[:i | 
					wayOfArcs
						add:
							((won at: i) incomingArcs
								detect: [:a | (won at: i + 1) outgoingArcs includes: a])]].
	^arcWays
]
