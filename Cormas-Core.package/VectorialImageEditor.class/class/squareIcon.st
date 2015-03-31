resources
squareIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #squareIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 22 @ 20
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
					#[170 170 170 170 170 160 0 0 128 0 0 0 0 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 128 0 0 0 0 32 0 0 170 170 170 170 170 160 0 0])