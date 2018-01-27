replay-private
setSimName
	"set the simName attribute to the current time"
	
	self simName: self newSimName.
	^simName