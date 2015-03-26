resources
cormasFr
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 8
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							((Array new: 3)
								at: 1
									put: ColorValue blue;
								at: 2
									put: ColorValue red;
								at: 3
									put: ColorValue white;
								yourself))
				usingBits:
					#[0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0])