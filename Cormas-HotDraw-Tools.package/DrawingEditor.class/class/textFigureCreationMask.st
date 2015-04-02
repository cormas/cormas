resources
textFigureCreationMask
	"UIMaskEditor new openOnClass: self andSelector: #textFigureCreationMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 63 252 0 0 63 252 0 0 33 132 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 132 0 0 3 206 0 0 0 17 0 0])