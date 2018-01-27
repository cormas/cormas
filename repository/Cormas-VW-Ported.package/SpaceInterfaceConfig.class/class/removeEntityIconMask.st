resources
removeEntityIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 255 192 0 7 255 192 0 7 255 192 0 7 255 192 0 7 255 192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])