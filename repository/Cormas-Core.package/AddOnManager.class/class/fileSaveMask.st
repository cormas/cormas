resources
fileSaveMask
	"UIMaskEditor new openOnClass: self andSelector: #fileSave20x20mask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 31 254 0 0 31 255 0 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 0 0 0 0 0 0 0 0 0 0 0 0])