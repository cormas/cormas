resources
iconHexagonImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconHexagon"
	
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
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 168 0 0 170 160 0 0 170 161 85 84 170 160 0 0 170 161 85 85 42 160 0 0 170 133 85 85 42 160 0 0 170 133 85 85 74 160 0 0 170 21 85 85 74 160 0 0 170 21 85 85 82 160 0 0 168 85 85 85 82 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 82 160 0 0 170 21 85 85 82 160 0 0 170 21 85 85 74 160 0 0 170 133 85 85 74 160 0 0 170 133 85 85 42 160 0 0 170 161 85 85 42 160 0 0 170 161 85 84 170 160 0 0 170 168 0 0 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0])