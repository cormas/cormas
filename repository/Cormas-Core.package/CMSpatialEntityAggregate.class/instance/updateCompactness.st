+ metrics
updateCompactness
	"Purpose: computes and stores the compactness index of the receiver (4* pi *area / perimeter squared)
Return value: <Float>"
	
	| p |
	p := self perimeter.
	self
		compactness:
			(p = 0
				ifTrue: [0]
				ifFalse: [4 * Float pi * self size / p squared]).
	^self compactness