accessing
bitmap: aBitmap ratio: aPoint
	"store the full original bitmap and a logical ratio that should be used for displaying"
	
	cache := bitmap := aBitmap.
	ratio := aPoint.
	cacheScaleFactor := 1.
	self computeCache