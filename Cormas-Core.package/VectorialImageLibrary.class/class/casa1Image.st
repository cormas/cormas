images - bitmap
casa1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #casa1Image"
	
	<resource: #image>
	^Image
		extent: 63 @ 70
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 0 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*********************J********************"********************(*********************J*********T**********"*********ER*********(*********EUJ*********J********EUT*********"********EUUJ********(********EUUT*********J*******EUUUR********"*******EUUUUJ*******(*******!UUUUT********J******!UUUUUR*******"******!UUUUUUJ******(******!UUUUUUR*******J*****!UUUUUUUJ******"*****!UUUUUUUT******(*****!UUUUUUUUR******J****!UUUUUUUUUJ*****"****!UUUUUUUUUT*****(****!UUUUUUUUUUR*****J***!UUUUUUUUUUUJ****"***!UUUUUUUUUUUR****(***!UUUUUUUUUUUUJ****J**!UUUUUUUUUUUUT****"**(UUUUUUUUUUUUUR***(**(UUUUUUUUUUUUUUJ***J*(UUUUUUUUUUUUUUT***"*(UUUUUUUUUUUUUUUR**(*(UUUUUUUUUUUUUUUT***J(UUUUUUUUUUUUUUUUR**"(@@UUUUUUUUUUUUUUUJ*(*** @EUUUUUUUUU@@@@**J****!UUUUUUUUUR*****"****(UUUUUUUUUT*****(*****EUUUUUUUUUJ*****J****!UUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****EUUUUUUUUUUJ*****J***!UUUUUUUUUUR*****"***(UUUUUUUUUUT*****(****EUUUUUUUUUUJ*****J*** @@@@@@@@@@B*****"********************(*********************J********************"********************(*********************J********************"********************(*********************@@a')