resources
removeEntityIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0])