resources
vectorMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #vectorMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 1 224 0 0 1 248 56 0 1 255 248 0 1 255 248 0 3 248 248 0 7 232 240 0 60 99 224 0 56 127 128 0 56 127 0 0 56 124 0 0 56 125 0 0 56 124 0 0 56 126 0 0 56 7 0 0 56 7 240 0 56 1 240 0 127 255 240 0 127 255 240 0 127 255 240 0])