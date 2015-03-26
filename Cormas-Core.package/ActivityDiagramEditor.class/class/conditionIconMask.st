resources
conditionIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #conditionIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 27
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 7 0 0 0 15 128 0 0 31 192 0 0 63 224 0 0 127 240 0 0 255 248 0 1 255 252 0 1 255 254 0 3 255 255 0 7 255 255 128 15 255 255 192 31 255 255 224 63 255 255 240 127 255 255 240 63 255 255 224 31 255 255 192 15 255 255 128 7 255 255 0 1 255 254 0 0 255 252 0 0 127 248 0 0 63 240 0 0 31 224 0 0 15 192 0 0 7 128 0 0 3 0 0])