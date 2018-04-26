+ accessing
patchID
	"Purpose: returns ID of patch
Return value: <Integer>"
	
	self patch ifNil: [^0].
	^self patch id