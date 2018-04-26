resources
manipulateIconMask
	"UIMaskEditor new openOnClass: self andSelector: #handIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[1 128 0 0 27 240 0 0 63 248 0 0 63 250 0 0 31 255 0 0 31 255 0 0 111 255 0 0 255 255 0 0 255 254 0 0 127 254 0 0 63 254 0 0 31 252 0 0 31 252 0 0 15 248 0 0 7 248 0 0 7 248 0 0])