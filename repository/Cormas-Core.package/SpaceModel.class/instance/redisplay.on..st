private - display
redisplay: aCollec on: aGC
	"aGC paint: self vue backgroundColor.
	aGC displayRectangle: aGC clippingBounds."
	
	(aCollec isNil or: [aCollec isEmpty]) ifFalse: [aCollec do: [:e | e show]]