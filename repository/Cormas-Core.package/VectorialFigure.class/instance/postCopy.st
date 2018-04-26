copying
postCopy
	"self class new: (self asGeometric)."
	
	| newFig |
	newFig := super postCopy.
	newFig points: points copy.	"newFig model: self model."
	^newFig