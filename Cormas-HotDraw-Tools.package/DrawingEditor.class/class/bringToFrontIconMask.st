resources
bringToFrontIconMask
	"UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 192 0 0 127 224 0 0 127 240 0 0 127 248 0 0 127 184 0 0 127 152 0 0 127 152 0 0 127 152 0 0 127 176 0 0 127 192 0 0 127 128 0 0 0 0 0 0 0 0 0 0])