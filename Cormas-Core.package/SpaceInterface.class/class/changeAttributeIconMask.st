resources
changeAttributeIconMask
	"Tools.UIMaskEditor new openOnClass: self andSelector: #changeAttributeIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 1 @ 2
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits: #[0 0 0 0 0 0 0 0])