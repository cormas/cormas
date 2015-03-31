resources
iconIrregular
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconIrregular"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 20
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
					#[170 170 170 170 170 128 0 0 170 170 170 170 170 128 0 0 170 128 42 128 42 128 0 0 170 21 72 21 74 128 0 0 168 85 81 85 74 128 0 0 161 85 85 85 82 128 0 0 161 85 85 85 82 128 0 0 161 85 85 85 82 128 0 0 168 85 85 85 82 128 0 0 170 21 85 85 74 128 0 0 170 21 85 85 42 128 0 0 170 133 85 85 42 128 0 0 170 161 85 84 170 128 0 0 170 161 85 82 170 128 0 0 170 168 85 74 170 128 0 0 170 170 21 42 170 128 0 0 170 170 133 42 170 128 0 0 170 170 132 170 170 128 0 0 170 170 162 170 170 128 0 0 170 170 170 170 170 128 0 0])