resources
diveIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #eyeIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 9
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6617 6617 4753)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 6070)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[67 51 51 51 48 64 0 0 66 68 68 68 16 64 0 0 68 37 85 81 4 64 0 0 68 49 85 81 4 64 0 0 68 66 85 16 68 64 0 0 68 67 21 16 68 64 0 0 68 68 33 4 68 64 0 0 68 68 49 4 68 64 0 0 68 68 64 68 68 64 0 0])