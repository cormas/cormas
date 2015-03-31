resources
squareIconOLD
	"Tools.UIMaskEditor new openOnClass: self andSelector: #squareIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 27 @ 34
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
							'*********@B********(@J******** @*********@B********(@J******** @*********@B********(@J(@@@@@@J @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*@@@@@@B(@J******** @*********@B********(@J******** @*********@B********(@J******** @*********@@b'))