ArcEntity is a entity located on 2 SpatialEntityElement.It is usefull to describe canals, roads or arcRivers...
ArcEntity is an oriented arc with 2 nodes: startNode and endNode.
An ArcEntity knows all the incomingArcs it is connected to (#incomingArcs) as well as the outgoing arcs (#outgoingArcs).
Thus, by recursivity, an ArcEntity is also connected to an oriented graph (#fullNetwork).
As an component of a network, it is connected to other Arcs through ArcEntities.

ArcEntity defines the #nodeType method that returns the class of the node. By default, nodeType is NodeEntity. This methode may be redefined to determine wath kind of nodes the arc is composed of.

