resources
diskIconOLD
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diskIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 31 @ 35
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
					(ByteArray fromPackedString:
							'**********"**********J*********(**********"**********J*********(**********"**********J***(@B***(*** EUPJ**"** UUUUB**J*(UUUUUR*(**EUUUUUR*"*!UUUUUUR*J*EUUUUUUJ(*!UUUUUUT*"*EUUUUUUT*J(UUUUUUUR(*!UUUUUUVJ"*EUUUUUUR*J*EUUUUUUJ(*(UUUUUUX*"*(UUUUUVJ*J*(UUUUU"*(**(EUUU **"***@%Z@***J***(@B***(**********"**********J*********(**********"**********J*********(**********"**********@@a'))