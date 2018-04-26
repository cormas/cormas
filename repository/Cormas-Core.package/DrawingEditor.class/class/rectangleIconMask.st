resources
rectangleIconMask
	"UIMaskEditor new openOnClass: self andSelector: #rectangleIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])