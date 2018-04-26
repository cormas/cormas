menu - actions
reopenFrom: parentInterface
	"Open a new spatial grid with same properties than parentInterface"
	
	| interface |
	"interface := self copy open. √ßa se serait la solution id√©ale mais il reste des pbs de dependents et de drawing selections √† r√©gler..."
	interface := self class
		openAndDisplayFigures: parentInterface drawing displayedFigures.
	^interface