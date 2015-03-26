resources-icons
helpIcon
	"UIMaskEditor new openOnClass: self andSelector: #imageAide"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 32
				depth: 1
				bitsPerPixel: 1
				palette:
					(MappedPalette
						withColors:
							((Array new: 2)
								at: 1
									put: (ColorValue scaledRed: 0 scaledGreen: 4112 scaledBlue: 4112);
								at: 2
									put: ColorValue green;
								yourself))
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 7 0 0 0 15 0 1 128 7 0 7 224 0 0 31 248 0 0 63 248 3 128 48 120 3 128 48 56 7 128 48 56 15 128 0 120 31 0 0 124 30 0 0 248 28 0 0 240 24 12 0 224 28 252 1 192 31 252 1 128 15 240 0 0 7 224 0 0 0 0 3 192 16 0 3 192 30 0 3 128 63 128 3 0 255 192 0 0 239 224 0 1 192 240 0 1 192 103 0 1 192 7 0 1 192 7 0 1 240 0 0 0 240 0 0 0 0 0])