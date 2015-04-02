resources
sendToBackIconMask
	"UIMaskEditor new openOnClass: self andSelector: #sendToBackIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 192 0 0 127 240 0 0 127 248 0 0 127 156 0 0 127 142 0 0 127 134 0 0 127 150 0 0 127 182 0 0 127 254 0 0 127 252 0 0 127 176 0 0 127 144 0 0 127 128 0 0 0 0 0 0 0 0 0 0])