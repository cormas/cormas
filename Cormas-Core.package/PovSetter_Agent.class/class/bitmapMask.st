resources
bitmapMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bitmapMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192])