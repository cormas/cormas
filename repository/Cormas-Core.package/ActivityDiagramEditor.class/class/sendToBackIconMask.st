resources
sendToBackIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sendToBackIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 24
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 240 0 0 127 240 0 0 127 240 0 0 127 240 0 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 7 255 248 0 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 0 3 255 128 0 3 255 128 0 3 255 128])