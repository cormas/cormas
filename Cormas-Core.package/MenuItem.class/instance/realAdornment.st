private-adornment
realAdornment
	"Answer a MenuItemAdornment object for the receiver.  If one doesn't already exist, make one."
	
	adornment == nil ifTrue: [adornment := MenuItemAdornment new].
	^adornment