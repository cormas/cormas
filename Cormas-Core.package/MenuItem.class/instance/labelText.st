labeling-text
labelText
	"Answer any specific label Text specified for the receiver (answer nil if none)."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment labelText]