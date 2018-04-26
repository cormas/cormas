resources
textFigureCreationImage
	"UIMaskEditor new openOnClass: self andSelector: #textFigureCreationImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 255 0 0 255 255 0 0 255 255 0 0 192 3 0 0 192 3 0 0 222 123 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 123 0 0 252 49 0 0 255 238 0 0])