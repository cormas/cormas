images - bitmap
z_nb9Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb9Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 4625 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'**************** @@@@J***************(@@@@B*******@B*******@@@@@****** EU@****** @@@@J*****AUUUR*****(@@@@B*****EUUUUJ*****@@@@@*****!UUUUT***** @@@@J****!UU@EUR****(@@@@B****(UTJ(EUJ****@@@@@****(UT**(UT**** @@@@J****ET***EUJ***(@@@@B****EUJ**(UR****@@@@@****!UR***ET**** @@@@J***(UR***!UJ***(@@@@B***(UT***(UR****@@@@@****EUJ***ET**** @@@@J***!UR***!UJ***(@@@@B***(UT***(UR****@@@@@****EUJ***ET**** @@@@J***(UP***@UJ***(@@@@B****EUP*@DER****@@@@@****(UUPEUAT**** @@@@J****EUUUUPUJ***(@@@@B****(UUUUTER****@@@@@*****!UUU@ET**** @@@@J*****AUTJ!UJ***(@@@@B******E@*(UR****@@@@@******(J**ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J****"****EUJ***(@@@@B****(B***!UJ****@@@@@*****EJ**!UR**** @@@@J****!TB*@UR****(@@@@B****(UU@EUR*****@@@@@*****EUUUUR***** @@@@J****(EUUUT*****(@@@@B*****(UUUP******@@@@@****** ETB****** @@@@J******(@*******(@@@@B****************@@@@@')