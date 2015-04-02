resources
deleteIconMask
	"UIMaskEditor new openOnClass: self andSelector: #deleteIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 64 0 0 0 224 0 0 1 240 0 0 3 248 0 0 7 252 0 0 15 252 0 0 31 252 0 0 63 252 0 0 127 248 0 0 255 240 0 0 255 224 0 0 255 192 0 0 255 128 0 0 127 0 0 0 62 0 0 0 28 0 0 0 8 0 0 0])