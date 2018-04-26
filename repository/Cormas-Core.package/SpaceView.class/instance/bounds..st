adapting
bounds: newBounds
	"The receiver's bounds are being changed to newBounds.
	Inform the controller (if there is one) that any information it was retaining regarding bounds are invalid."
	
	super bounds: newBounds.
	self setBoundsTo: newBounds.
	self components isEmpty ifFalse: [self adaptComponentsForNewBounds].	"je ne sais pas pourquoi mais parfois bounds (cad oldBounds avant le changement, est d√©j√† √©gale √† newBounds, ou a peu pres egale. ???? c'est pour √ßa que je memorise oldBounds"
	oldBounds := newBounds