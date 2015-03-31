resources
temp
	"Tools.UIMaskEditor new openOnClass: self andSelector: #temp"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7484 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[85 85 85 84 85 85 85 84 85 69 85 84 85 65 85 84 85 72 85 84 85 74 21 84 85 74 133 84 85 74 161 84 85 74 168 84 85 74 170 20 85 74 160 4 85 74 33 84 85 72 40 84 85 65 72 84 85 69 74 20 85 85 82 20 85 85 80 84 85 85 85 84])