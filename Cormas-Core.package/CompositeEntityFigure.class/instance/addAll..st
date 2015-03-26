add-remove
addAll: aCollection
	"For efficiency"
	
	aCollection isEmpty ifTrue: [^aCollection].
	aCollection
		do:
			[:fig | 
			fig opaque.
			fig lineWidth: 0].
	^super addAll: aCollection