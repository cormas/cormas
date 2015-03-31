images - bitmap
z_nb8Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb8Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 50
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
					'****************(@@@@J****************@@@@B****(@@@@@****** @@@@**** UUUUUP*****(@@@@J***!UUUUUUP*****@@@@B***!UUUUUUUP**** @@@@***!UUUUUUUUP***(@@@@J**!UUU@@EUUUJ***@@@@B**!UUPJ*(@UUT*** @@@@**!UUB**** UUJ**(@@@@J*(UTJ***** UT***@@@@B**ET*******!UJ** @@@@**!UJ******(UR**(@@@@J*(UR*******ET***@@@@B**ET*******!T*** @@@@**@@J******(UJ**(@@@@J*!UR*******ER***@@@@B**ET******(ET*** @@@@**!UR***** UP***(@@@@J**ETJ****AUR****@@@@B** UTB** EUR**** @@@@*** UU@*AUUB****(@@@@J*** UUPEUTJ*****@@@@B**** UUEUP****** @@@@***** UQUUPB****(@@@@J*****ATUUUUB****@@@@B****@EUEUUUUB*** @@@@***(EUU@UUUUUJ**(@@@@J**(UUTJ AUUUT***@@@@B***EUP***@UUUJ** @@@@***EUB**** UUT**(@@@@J**EUJ***** EUR**@@@@B**!UJ******(ET** @@@@**!UJ*******(UJ*(@@@@J*(UR********ER**@@@@B**ET********!UJ* @@@@**!UJ*******(UR*(@@@@J*(UR********ET**@@@@B**ET********!UJ* @@@@**!UB******* UJ*(@@@@J*(UU@J*****AUR**@@@@B**EUUT@** @EUT** @@@@**!UUUUP@AUUUT**(@@@@J*(UUUUUUUUUUUJ**@@@@B**!UUUUUUUUUTJ** @@@@***EUUUUUUUUT***(@@@@J**(UUUUUUUUT****@@@@B*** EUUUUUUP**** @@@@****(@EUUP@B****(@@@@J*****(@@B*******@@@@@b')