initialize-release
initialize
	
	| image buffer white colorImage |
	super initialize.
	Screen default colorDepth == 1
		ifTrue: [storeMask := ValueHolder with: true]
		ifFalse: [storeMask := ValueHolder with: false].
	useCachedImage := ValueHolder with: true.
	colorImage := self class colorPaletteImage image.
	image := Image
		extent: 63 @ 63
		depth: colorImage depth
		palette: colorImage palette.
	buffer := Array new: image width.
	white := image palette indexOf: ColorValue white.
	1
		to: buffer size
		do: [:colIndex | buffer at: colIndex put: white].
	0
		to: image height - 1
		do: [:rowIndex | image rowAt: rowIndex putAll: buffer].
	acceptedState := image copy.
	magnifiedBitView := ColorBitView model: image.
	magnifiedBitView scale: 4 @ 4.
	magnifiedBitView controller
		currentColor: (image palette indexOf: ColorValue black).
	directBitView := DirectBitView model: image.
	magnifiedBitView changedPreferredBounds: nil.
	modified := false.
	storeMask onChangeSend: #storeMaskChanged to: self