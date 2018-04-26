resources
hexagonIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 22 @ 22
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
					#[170 170 170 170 170 160 0 0 170 170 168 170 170 160 0 0 170 170 129 10 170 160 0 0 170 168 21 80 170 160 0 0 170 129 85 85 42 160 0 0 168 21 85 85 66 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 168 21 85 85 66 160 0 0 170 129 85 84 42 160 0 0 170 168 21 82 170 160 0 0 170 170 129 10 170 160 0 0 170 170 168 170 170 160 0 0])