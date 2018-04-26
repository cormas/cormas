resources
hotPaintEraseMask
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 126 0 0 0 255 0 0 1 255 0 0 3 255 0 0 7 255 0 0 15 254 0 0 31 252 0 0 63 248 0 0 63 240 0 0 63 224 0 0 31 192 0 0 0 0 0 0 0 0 0 0])