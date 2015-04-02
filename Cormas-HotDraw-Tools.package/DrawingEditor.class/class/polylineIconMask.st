resources
polylineIconMask
	"UIMaskEditor new openOnClass: self andSelector: #polylineIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 128 0 0 1 192 0 0 3 96 0 0 6 48 0 0 12 24 0 0 24 48 0 0 48 96 0 0 96 192 0 0 56 128 0 0 14 0 0 0 3 128 0 0 0 224 0 0 0 56 0 0 0 48 0 0 0 96 0 0 0 192 0 0 0 0 0 0])