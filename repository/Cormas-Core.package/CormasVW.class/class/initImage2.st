resources-icons
initImage2
	"Tools.UIMaskEditor new openOnClass: self andSelector: #initImage2"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 8191 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 160 4272)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 0 0 0 170 170 170 170 170 0 0 0 170 170 170 170 170 0 0 0 170 170 170 170 170 0 0 0 170 170 255 170 170 0 0 0 170 175 170 250 170 0 0 0 170 186 170 174 170 0 0 0 170 186 0 174 170 0 0 0 170 232 20 43 170 0 0 0 170 232 85 43 170 0 0 0 170 232 85 43 170 0 0 0 170 232 20 43 170 0 0 0 170 186 0 170 170 0 0 0 170 186 174 170 170 0 0 0 170 175 175 170 170 0 0 0 170 170 255 234 170 0 0 0 170 170 175 170 170 0 0 0 170 170 174 170 170 0 0 0 170 170 170 170 170 0 0 0 170 170 170 170 170 0 0 0])