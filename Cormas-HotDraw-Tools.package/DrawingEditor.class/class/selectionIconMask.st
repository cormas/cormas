resources
selectionIconMask
	"UIMaskEditor new openOnClass: self andSelector: #selectionIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 16 0 0 0 24 0 0 0 28 0 0 0 30 0 0 0 31 0 0 0 31 128 0 0 31 192 0 0 31 224 0 0 31 240 0 0 31 128 0 0 31 192 0 0 25 192 0 0 17 224 0 0 0 224 0 0 0 192 0 0 0 0 0 0 0 0 0 0])