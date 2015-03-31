resources
hexagonIconOLD
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 33
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
							'********* B*********@J********(@********* B*********@J********(@********* B****"****@J*** P***(@*** UTJ** B** UUUJ**@J* UUUUB*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J* UUUUB*(@**(EUUB** B***AUR***@J*** P***(@****(**** B*********@J********(@********* B*********@J********(@'))