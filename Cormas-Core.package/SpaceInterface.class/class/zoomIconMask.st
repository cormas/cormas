resources
zoomIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #zoomIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 1 224 0 0 7 248 0 0 15 252 0 0 15 252 0 0 31 254 0 0 31 254 0 0 31 254 0 0 31 254 0 0 15 252 0 0 15 252 0 0 7 254 0 0 1 231 0 0 0 3 128 0 0 1 192 0 0 0 224 0 0 0 96 0 0 0 0 0])