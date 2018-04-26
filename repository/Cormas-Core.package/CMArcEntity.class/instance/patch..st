+ acces
patch: aCell
	"redefines #patch as the patch of the startNode"
	
	patch := aCell.
	^self startNode patch: aCell