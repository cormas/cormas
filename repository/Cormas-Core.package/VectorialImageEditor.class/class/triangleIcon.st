resources
triangleIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #triangleIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 22
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
					#[170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 168 170 170 168 0 0 170 170 161 42 170 168 0 0 170 170 133 74 170 168 0 0 170 170 133 74 170 168 0 0 170 170 21 82 170 168 0 0 170 170 21 82 170 168 0 0 170 168 85 84 170 168 0 0 170 168 85 84 170 168 0 0 170 161 85 85 42 168 0 0 170 133 85 85 74 168 0 0 170 133 85 85 74 168 0 0 170 21 85 85 82 168 0 0 170 21 85 85 82 168 0 0 168 85 85 85 84 168 0 0 161 85 85 85 85 40 0 0 128 0 0 0 0 8 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0])