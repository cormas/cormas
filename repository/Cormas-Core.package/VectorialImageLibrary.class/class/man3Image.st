images - bitmap
man3Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man3Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************************************@@J************ UUP************EUUT***********(UUUUJ**********(UUUUJ**********(UUUUJ**********(UUUUJ**********!UUUTJ**********!QUUTR**********!AUUTB********** !UURB**********"!UUR"***********EUUR***********(UUUR***********!UUUT***********EUUUUB*********(UUUUUT*********!UUUUUUJ********EUAUUTER*******(UP!UUT T*******!PJEUUUJAB******DJ*EUUUJ(D*****(B*(UUUUJ* J**** **(UUUUR**B*******!UUUUR**********!UUUUR**********!UUUUT**********EUUUUT**********EUUUUUJ********(UUUUUUJ********(UUUUUUR********(UUUUUUT********!UUUUUUT********!UUUUUUUJ*******EUUUUUUUR*******EUUUUUUUT******(UUUUUUUUT******(AUUTAUUT@J******(@UB(E B**********AJ*EZ***********!J*EZ***********D**!Z***********D**!Z**********(T**!Z**********(T**!Z**********(R**(Z**********!R**(Z********** B**(B*********************')