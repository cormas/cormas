private
refreshAfterStep
	"self fromStep value: (self startAt0 ifTrue:[ 0] ifFalse:[1])."
	
	self toStep value: self nbPts - 1.
	self zoom