resources
eyeIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #eyeIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 9
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 4111 4111)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 168 0 170 2 168 0 171 255 168 0 143 87 200 0 61 85 240 0 143 87 200 0 171 255 168 0 170 2 168 0 170 170 168 0])