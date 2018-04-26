resources
imageIconMask
	"UIMaskEditor new openOnClass: self andSelector: #imageIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 112 28 0 0 64 4 0 0 64 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 64 4 0 0 64 4 0 0 112 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])