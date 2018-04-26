images - bitmap
tree2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree2Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J********@*******(@@@B*******(EPB******@@@@******* UUUB***** @@@J******!UUUUJ****(@@@B******AUUUUR*****@@@@******EUUUUUJ**** @@@J*****EUUUUUR****(@@@B*****EUUUUUUJ****@@@@*****EUUUUUUR**** @@@J****EUUUUUUUJ***(@@@B****EUUUUUUUR****@@@@****EUUUUUUUT**** @@@J***!UUUUUUUUR***(@@@B***!UUUUUUUUT****@@@@***(UUUUUUUUUJ*** @@@J***EUUUUUUUUR***(@@@B***EUUUUUUUUUJ***@@@@***!UUUUUUUUUR*** @@@J**(UUUUUUUUUT***(@@@B**(UUUUUUUUUUJ***@@@@***EUUUUUUUUUR*** @@@J**!UUUUUUUUUT***(@@@B***EUUUUUUUUUJ***@@@@***!UUUUUUUUUR*** @@@J***EUUUUUUUUT***(@@@B***!UUUUUUUUUJ***@@@@****EUUUUUUUUJ*** @@@J***!UUUUUUUUR***(@@@B****EUUUUP@@B****@@@@**** ET@UT******* @@@J****(@*EUJ******(@@@B*******!UR*******@@@@*******!UR******* @@@J******(UT*******(@@@B*******EUJ*******@@@@*******!UR******* @@@J******(UT*******(@@@B******(UUJ*******@@@@*******EUR******* @@@J******!UT*******(@@@B******!UUJ*******@@@@******!UUR******* @@@J*****!UUT*******(@@@B*****!UUUR*******@@@@*****(UUUT******* @@@J****(UUUUR******(@@@B****(UPEUT*******@@@@****(PB!TER****** @@@J***(B*(T(D******(@@@B******(P*(B******@@@@*******B**(****** @@@J******"*********(@@@@b')