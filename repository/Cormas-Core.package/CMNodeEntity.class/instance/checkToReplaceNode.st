+ add-remove
checkToReplaceNode
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