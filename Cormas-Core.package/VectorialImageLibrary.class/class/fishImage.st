images - bitmap
fishImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fishImage"
	
	<resource: #image>
	^Image
		extent: 82 @ 66
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@******* J****************** @@@@*******EP@J**************** @@@@****** UUUP**************"* @@@@******EUUUUT************(B* @@@@*****(UUUUUUB***********!J* @@@@*****!UUUUUUT***********EJ* @@@@*****EUUUUUUUB********* T** @@@@**** UUUUUUUUT*********ET** @@@@****EUUUUUUUUUJ******* UR** @@@@***(UUUUUUUUUUP*******EUR** @@@@***(UUUUUUUUUUUJ*****(UUR** @@@@***!UUUUUUUUUUUP*****AUUJ** @@@@***!UUUUUUUUUUUUJ***(UUUJ** @@@@***EUUUUUUUUUUUUP***AUUT*** @@@@***EUUUUUUUUUUUUUJ*(UUUT*** @@@@**(UUUUUUUUUUUUUUR*!UUUT*** @@@@**(UUUUUUUUUUUUUUTHEUUUR*** @@@@**!UUUUUUUUUUUUUUUQUUUUR*** @@@@**!UUUUUUUUUUUUUUUUUUUUJ*** @@@@**EUUUUUUUUUUUUUUUUUUUUJ*** @@@@**AUUUUUUUUUUUUUUUUUUUT**** @@@@**(@UUUUUUUUUUUUUUUUUUT**** @@@@****@EUUUUUUUUUUUUUUUUT**** @@@@***** AUUUUUUUUUUUUUUUR**** @@@@******(@UUUUUUUUUUUUUUR**** @@@@*******(AUUUUUUUUUUUUUJ**** @@@@****** AUUUUUUUUUUUUUUJ**** @@@@*****@EUUUUUUUUUUUUUUUJ**** @@@@***(@UUUUUUUUUUUUUUUUUR**** @@@@** AUUUUUUUUUUUUUUUUUUR**** @@@@*(EUUUUUUUUUUUUUUUUUUUR**** @@@@**EUUUUUUUUUUUUUUUUUUUT**** @@@@**!UUUUUUUUUUUUUUUUUUUT**** @@@@**(UUUUUUUUUUUUUUTEUUUT**** @@@@***EUUUUUUUUUUUUUB!UUUUJ*** @@@@***!UUUUUUUUUUUUP*(UUUUJ*** @@@@***!UUUUUUUUUUUTJ**EUUUJ*** @@@@***(UUUUUUUUUUUB***!UUUR*** @@@@****EUUUUUUUUUP****(EUUR*** @@@@****!UUUUUUUUTJ*****!UUR*** @@@@****(UUUUUUUUB******(UUT*** @@@@*****@@@AUUUP********EUT*** @@@@********(@@@J********!UUJ** @@@@*********************(UUJ** @@@@**********************EUJ** @@@@**********************!UR** @@@@**********************(UR** @@@@***********************AR** @@@@***********************(T** @@@@************************D** @@@@************************ ** @@@@************************(J* @@@@*************************J* @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@')