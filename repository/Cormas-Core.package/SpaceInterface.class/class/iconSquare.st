resources
iconSquare
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconSquare"
	
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
								#scaledRed:scaledGreen:scaledBlue: #(6552 3276 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:t1 | 
									(t1 at: 1) value
										perform: (t1 at: 2)
										withArguments: (t1 at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 168 0 0 0 0 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 0 0 0 0 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0])