accessing
internalLines
	"internalLines = the internal contours of a ring-like aggregate."
	
	^internalLines ifNil: [internalLines := OrderedCollection new]