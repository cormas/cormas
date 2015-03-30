NetworkEntity is an oriented Network composed of a set of Arcs and a set of Nodes.
From an instance of Arc (or of Node), we access the network it belongs to, by sending the #fullNetwork method.
NetworkEntity is oriented because the Arcs are oriented. Each arc has a startNode and a stopNode.

Instance Variables:
	arcs	<IndexedSet>	collection of arcs
	nodes	<IndexedSet>	collection of nodes

