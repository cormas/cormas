resources
bezierIconMask
	"UIMaskEditor new openOnClass: self andSelector: #bezierIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 12 0 0 0 12 0 0 0 12 0 0 0 24 0 0 0 48 0 0 0 224 0 0 3 128 0 0 14 0 0 0 24 0 0 0 48 0 0 0 96 0 0 0 96 0 0 0 96 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])