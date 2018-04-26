changed
listSymbolsChanged
	
	| anImage aColor |
	self listSymbols selection ifNil: [^nil].
	anImage := selectedClass imageAtPov: listSymbols selection asSymbol.
	imageOS model: anImage copy.	"The model is the copy of the stored image and is be used to store the parameters of the bitmapPov"
	imageOS figure: imageOS model asFigure.	"imageOS figure is resized according to the sizeRatio of the image. It is used for the display on the povSetter view"
	self tailleSlider value: anImage sizeRatio.
	self isDistortable value: anImage isDistortable.
	anImage isBitmapPOV
		ifTrue: [(self builder componentAt: #CacheBitmap) beVisible]
		ifFalse:
			[aColor := anImage color.
			imageOS model color: aColor.
			self updateSlidersFromColor: aColor.
			(self builder componentAt: #CacheBitmap) beInvisible.
			(self builder componentAt: #tailleSlider) beVisible].
	self occupantPosition value: anImage position.
	imageOS invalidate