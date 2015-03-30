NodeEntity is a kind of located entity (located on a SpatialEntityElement).
As an component of a network, it is connected to other Nodes through ArcEntities.
It is so associated to at least one oriented ArcEntity as startNode or endNode of this arc.
A node knows all the incoming arcs it belongs to (#incomingArcs) as well as the outgoing arcs (#outgoingArcs).
Thus, by recursivity, a NodeEntity is connected to an oriented graph (#fullNetwork).

