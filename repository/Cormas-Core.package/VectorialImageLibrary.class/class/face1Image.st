images - bitmap
face1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #face1Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5332 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J****************(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@***************** @@@J***********J****(@@@B****@@@@@@@B*****@@@@**** @@@@@@@***** @@@J***(EUUUUUTJ****(@@@B****AUUUUUUB*****@@@@**** UUUUUUP***** @@@J***(EUUUUUTJ****(@@@B****AUUUUUUB*****@@@@**** UUUUUUP***** @@@J***(EUUUUUTJ****(@@@B@@@@AUUUUUU@@@@@@@@@@(@@@@UUUUUUP@@@@@@@@@JAUUUUUUUUUUUUUUP(@@@B(@@@AUUUUUUP@@@@*@@@@* @@@UUUUUUT@@@B* @@@J*** UUUUUUUB****(@@@B***(EUUUUUUP*****@@@@****AUUUUUUTJ**** @@@J***@UUUUUUUB****(@@@B*** UUUUUUUP*****@@@@***(EUUUUUUTJ**** @@@J***AUUUUUUUB****(@@@B*** UUUUUUUP*****@@@@***(EUUUUUUTJ**** @@@J***AUUUUUUUB****(@@@B*** EUUUUUUP*****@@@@****AUUUUUUTJ**** @@@J*** EUUUUUUB****(@@@B****AUUUUUUP*****@@@@**** UUUUUUP***** @@@J***(AUUUUUTJ****(@@@B**** UUUUUTB*****@@@@****(AUUUUTB***** @@@J**** UUUUTB*****(@@@B*****AUUUUB******@@@@*****(@@@@@****** @@@J***** @@@@******(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@')