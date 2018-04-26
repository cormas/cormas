resources
chartIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #chartIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 9 @ 8
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3822 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[192 255 192 0 192 255 192 0 192 213 192 0 192 213 192 0 192 213 192 0 192 213 192 0 192 213 192 0 170 170 128 0])