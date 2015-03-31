resources
diskIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diskIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 25 @ 20
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
					#[170 170 170 170 170 170 128 0 170 170 128 2 170 170 128 0 170 160 21 84 10 170 128 0 170 5 85 85 80 170 128 0 168 85 85 85 85 42 128 0 161 85 85 85 85 74 128 0 133 85 85 85 85 82 128 0 133 85 85 85 85 82 128 0 21 85 85 85 85 82 128 0 21 85 85 85 85 84 128 0 21 85 85 85 85 84 128 0 21 85 85 85 85 88 128 0 21 85 85 85 85 82 128 0 133 85 85 85 85 82 128 0 133 85 85 85 85 98 128 0 161 85 85 85 85 138 128 0 168 85 85 85 86 42 128 0 170 5 85 85 96 170 128 0 170 160 37 104 10 170 128 0 170 170 128 2 170 170 128 0])