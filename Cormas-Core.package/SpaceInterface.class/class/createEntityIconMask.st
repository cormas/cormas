resources
createEntityIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createEntityIconMask"
	
	<resource: #image>
	^Image
		extent: 20 @ 18
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 240 0 0 15 255 0 0 15 255 0 0 15 255 0 0 15 255 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 0 0 0 0 0 0 0 0 0 0 0]