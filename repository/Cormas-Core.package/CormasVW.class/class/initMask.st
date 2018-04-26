resources-icons
initMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #initMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 240 0 0 3 12 0 0 4 2 0 0 4 242 0 0 9 249 0 0 9 249 0 0 9 249 0 0 9 249 0 0 4 240 0 0 4 32 0 0 3 48 0 0 0 248 0 0 0 48 0 0 0 32 0 0 0 0 0 0 0 0 0 0])