resources
createIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createIconMask"
	
	<resource: #image>
	^Image
		extent: 25 @ 22
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]