images - bitmap
cow1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #cow1Image"
	
	<resource: #image>
	^Image
		extent: 51 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5332 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*****************@@@@J**************** @@@B****************(@@@@*****************@@@@J**************** @@@B* **************(@@@@**@**************@@@@J*(P J*********** @@@B**EQR***********(@@@@**!UR************@@@@J*!UT************ @@@B*(UUJ***********(@@@@*(UUT************@@@@J*EUUP*********** @@@B*EUUUR**********(@@@@*!UUUUJ**********@@@@J!UUUUTJ********* @@@B(UUUUUT@@@@@@@@J(@@@@(UUUUUUUUUUUUUUT*@@@@JEUUUUUUUUUUUUUUJ @@@B!@@EUUUUUUUUUUUR(@@@@*J*!UUUUUUUUUUUUJ@@@@J**(UUUUUUUUUUUUB @@@B***EUUUUUUUUUUUP(@@@@***!UUUUUUUUUUUTJ@@@@J***EUUUUUUUUUUU@ @@@B***!UUUUUUUUUUUPH@@@@***(UUUUUUUUUUURB@@@@J***EUUUUUUUUUUT  @@@B***!UUUUUUUUUUUHH@@@@****EUUUUUUUUUUR"@@@@J***!UUUUUUUUUUT( @@@B****EUUUUUUUUUUJH@@@@****(UUUUUUUUUUR*@@@@J****ETUUUUUUUUT* @@@B****!U@UUUPEUUT*(@@@@****(UR @@B!UQUJ*@@@@J****ER*****ETUR* @@@B****!T*****!UET*(@@@@****(UJ*****E@UJ*@@@@J****ER*****!HER* @@@B****!R******J!T*(@@@@****(T*******(UJ*@@@@J****EJ*******!R* @@@B****!R*******(R*(@@@@****(T********D**@@@@J***(T********EJ* @@@B****EJ******* R*(@@@@**** B******** **@@@@J**************** @@@B****************(@@@@*****************@@@@@@a')