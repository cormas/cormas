resources
arcIconMask
	"UIMaskEditor new openOnClass: self andSelector: #arcIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 128 0 0 31 224 0 0 63 192 0 0 63 128 0 0 127 0 0 0 127 0 0 0 63 128 0 0 63 192 0 0 31 224 0 0 7 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])