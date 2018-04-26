resources
removeEntityIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 96 0 0 37 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 112 0 0 53 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0])