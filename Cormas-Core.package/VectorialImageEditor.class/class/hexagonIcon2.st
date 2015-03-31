resources
hexagonIcon2
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 21
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 162 170 170 128 0 0 170 170 4 42 170 128 0 0 170 160 85 66 170 128 0 0 170 5 85 84 170 128 0 0 160 85 85 85 10 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 160 85 85 85 10 128 0 0 170 5 85 80 170 128 0 0 170 160 85 74 170 128 0 0 170 170 4 42 170 128 0 0 170 170 162 170 170 128 0 0])