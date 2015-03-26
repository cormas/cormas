displaying
adaptColorAndText
	"do nothing except for the info"
	
	self pov = #nil ifTrue: [^self].
	self info = #nil
		ifFalse: [self setText: (self model entity getInfoFor: info)]