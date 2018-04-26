zooming
applyZoom
	
	| doZoom doTranslate |
	zoomFactor = 1 | (zoomFactor = (1 @ 1))
		ifTrue: [doZoom := false]
		ifFalse: [doZoom := true].
	translationVector = (0 @ 0)
		ifTrue: [doTranslate := false]
		ifFalse: [doTranslate := true].
	self components
		do:
			[:fig | 
			doTranslate ifTrue: [fig translateBy: translationVector].
			doZoom ifTrue: [fig scaleBy: zoomFactor]]