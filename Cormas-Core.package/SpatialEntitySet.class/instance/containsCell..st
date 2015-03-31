- testing
containsCell: aCell
	"Purpose: "
	
	self components isEmpty ifTrue: [^false].
	(self at: 1) isElementary
		ifTrue: [^self components includes: aCell]
		ifFalse: [^self components containsCell: aCell]	"!! recursiv"