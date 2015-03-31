+ accessing
patchID
	"return ID of patch"
	
	self patch ifNil: [^0].
	^self patch id