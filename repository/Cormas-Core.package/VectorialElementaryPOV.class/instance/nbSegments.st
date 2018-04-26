accessing
nbSegments
	^ nbSegments ifNil: [ nbSegments := self polyline vertices size - 1 ]