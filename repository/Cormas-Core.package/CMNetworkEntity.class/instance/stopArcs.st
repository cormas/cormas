+ ways
stopArcs
	" Returns the arcs located at the end of the Network "
	
	^ self arcs select: #isNetworkStopArc