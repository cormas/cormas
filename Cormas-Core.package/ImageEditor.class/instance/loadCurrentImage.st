actions
loadCurrentImage
	
	| image |
	(self observer imageOS model isKindOf: VectorialPOV) ifTrue: [^self].
	image := self observer imageOS figure cache figure.
	(image isKindOf: CachedImage)
		ifTrue:
			[image := image image.
			useCachedImage value: true]
		ifFalse: [useCachedImage value: false].
	storeMask value: image paintBasis == CoverageValue.
	Cursor execute
		showWhile:
			[storeMask value ifTrue: [image palette: MonoMappedPalette whiteBlack].
			image := image
				convertToPalette: Screen default colorPalette
				bitsPerPixel: Screen default colorDepth
				renderedBy: NearestPaint new
				paintTransfer: nil.
			magnifiedBitView
				model: image;
				changedPreferredBounds: nil;
				invalidate.
			directBitView
				model: image;
				changedPreferredBounds: nil;
				invalidate.
			self accept].
	self magnifiedBitView controller imageHasChanged: false.
	self modified: false