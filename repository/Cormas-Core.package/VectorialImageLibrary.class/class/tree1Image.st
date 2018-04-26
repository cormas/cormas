images - bitmap
tree1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree1Image"
	
	<resource: #image>
	^Image
		extent: 51 @ 51
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
					'*****************@@@@J****** @B******* @@@B****(@AUU@@*****(@@@@****@UUUUUUPB****@@@@J***EUUUUUUUUJ*** @@@B***EUUUUUUUUT***(@@@@***EUUUUUUUUUR***@@@@J**EUUUUUUUUUT*** @@@B**!UUUUUUUUUUR**(@@@@**!UUUUUUUUUUUJ**@@@@J*!UUUUUUUUUUUT** @@@B*!UUUUUUUUUUUUJ*(@@@@*(UUUUUUUUUUUUR**@@@@J*EUUUUUUUUUUUT** @@@B*!UUUUUUUUUUUUR*(@@@@*(UUUUUUUUUUUUT**@@@@J*EUUUUUUUUUUUUJ* @@@B*!UUUUUUUUUUUUR*(@@@@**EUUUUUUUUUUUR**@@@@J*!UUUUUUUUUUUR** @@@B*(UUUUUUUUUUUT**(@@@@**EUUUUUUUUUUP***@@@@J*!UUUUUUUUUPB*** @@@B*(AUUUUUUU@B****(@@@@***@@@AUU@J******@@@@J*****(UUR******* @@@B******EUT*******(@@@@******!UUJ*******@@@@J*****!UUR******* @@@B*****(UUT*******(@@@@******EUUJ*******@@@@J*****!UUR******* @@@B*****(UUT*******(@@@@******EUUR*******@@@@J*****!UUT******* @@@B*****(UUUJ******(@@@@*****(UUUR*******@@@@J*****EUUT******* @@@B*****!UUUJ******(@@@@*****(UUUR*******@@@@J****(UUUT******* @@@B*****EUUUJ******(@@@@*****EUUUT*******@@@@J****!UUUUJ****** @@@B****!UUUUT******(@@@@****(UUUUUJ******@@@@J***(UUUUUT****** @@@B****EUU@@@J*****(@@@@****@@@J*********@@@@J**************** @@@B****************(@@@@')