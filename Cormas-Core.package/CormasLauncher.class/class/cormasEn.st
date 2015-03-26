resources
cormasEn
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 13 @ 11
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							((Array new: 3)
								at: 1
									put: ColorValue red;
								at: 2
									put: ColorValue blue;
								at: 3
									put: ColorValue white;
								yourself))
				usingBits:
					#[37 98 85 0 73 98 84 128 82 98 82 64 84 162 73 64 85 34 42 128 0 0 0 0 170 2 21 64 88 98 133 64 97 98 97 64 133 98 88 64 21 98 86 0])