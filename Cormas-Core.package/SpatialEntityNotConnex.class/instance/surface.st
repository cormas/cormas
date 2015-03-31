+ metrics
surface
	"Purpose: returns the number of elementary components
Return value: <Integer>"
	
	| surface |
	surface := 0.
	self components do: [:n1 | surface := surface + n1 surface].
	^surface