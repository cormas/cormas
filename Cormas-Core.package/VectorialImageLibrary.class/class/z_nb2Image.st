images - bitmap
z_nb2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb2Image"
	
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
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'**************** @@@@J***************(@@@@B*********@J*****@@@@@******** ETB**** @@@@J******(AUUT****(@@@@B****** UUUUR****@@@@@******!UUUUT**** @@@@J*****(UUUUUJ***(@@@@B*****(UUUUUT****@@@@@*****(UUUUUUJ*** @@@@J*****EUU@UUR***(@@@@B*****EUTJ!UR****@@@@@*****!UT*(UT**** @@@@J****!UUJ*EUJ***(@@@@B****(UUJ*!UJ****@@@@@****(UUR*!UR**** @@@@J****EUR*(UT****(@@@@B****EUT*(UT*****@@@@@**** @@**EUJ**** @@@@J********EUJ****(@@@@B********!UR*****@@@@@********!UR***** @@@@J*******(UT*****(@@@@B*******(UT******@@@@@********EUJ***** @@@@J*******EUJ*****(@@@@B*******!UR******@@@@@*******!UR****** @@@@J******(UT******(@@@@B******(UT*******@@@@@*******EUJ****** @@@@J******!UR******(@@@@B******!UR*******@@@@@******(UT******* @@@@J*****(UT*******(@@@@B******EUJ*******@@@@@******EUJ******* @@@@J*****!UR*******(@@@@B*****!UR********@@@@@*****(UT******** @@@@J****(UT********(@@@@B*****EUJ********@@@@@*****EUJ******** @@@@J****!UP@@@@@***(@@@@B****!UUUUUUUJ***@@@@@****(UUUUUUUR*** @@@@J***(UUUUUUUT***(@@@@B****EUUUUUUUJ***@@@@@****EUUUUUUUR*** @@@@J*** @@@@@@@@***(@@@@B****************@@@@@')