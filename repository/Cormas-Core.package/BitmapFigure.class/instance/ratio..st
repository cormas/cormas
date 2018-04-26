accessing
ratio: aPoint
	"set a ratio which should be applyed to bitmap before displaying"
	
	| newRatio |
	newRatio := aPoint asPoint.
	newRatio = ratio
		ifFalse:
			[ratio := newRatio.
			self computeCache]