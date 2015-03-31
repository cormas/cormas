resources
manipulateIconMaskOLD
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fingerPointerMask"
	
	<resource: #image>
	^Image
		extent: 16 @ 16
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[6 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 128 0 0 55 224 0 0 63 248 0 0 63 252 0 0 31 252 0 0 31 252 0 0 15 252 0 0 15 252 0 0 15 248 0 0 7 248 0 0 7 240 0 0 7 240 0 0]