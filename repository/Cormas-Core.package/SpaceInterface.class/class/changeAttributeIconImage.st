resources
changeAttributeIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #changeAttributeIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 1 @ 2
				depth: 1
				bitsPerPixel: 1
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits: #[0 0 0 0 0 0 0 0])