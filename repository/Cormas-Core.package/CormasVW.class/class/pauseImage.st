resources-icons-Sim
pauseImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #pauseImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 20
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 4111 4111)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[51 51 51 51 51 51 51 48 48 0 19 51 48 0 19 48 48 34 16 51 48 34 16 48 52 34 16 3 52 34 16 48 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 52 34 16 3 52 34 16 0 49 17 16 3 49 17 16 0 51 0 0 3 51 0 0 0 51 51 0 3 51 51 0 0 51 51 51 51 51 51 51 48 51 51 51 51 51 51 51 48])