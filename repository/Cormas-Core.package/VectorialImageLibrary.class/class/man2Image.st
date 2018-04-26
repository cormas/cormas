images - bitmap
man2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man2Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 0 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUT@@EUUUUUUP@@@@UUUUUUT**(EUUUUUT@@@@EUUUUUT***!UUUUUU@@@@AUUUUUT****EUUUUUP@@@@UUUUUUJ***!UUUUUT@@@@EUUUUUJ****EUUUUU@@@@AUUUUUR****!UUUUUP@@@@UUUUUT****(UUUUUT@@@@EUUUUUJ****EUUUUU@@@@AUUUUUT****!UUUUUP@@@@UUUUUUJ***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ**(UUUUUUP@@@@UUUUUUT**(UUUUUUT@@@@D@@@@@@J**@@@EUUU@@@@AJ***********(@@@P@@@@TB************* T@@@@EU@J********** AU@@@@AUUT@******* @AUUP@@@@UUUUPB**** AUUUUT@@@@EUUUUU@***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUR**J(UUUUUU@@@@AUUUUUT**B*EUUUUUP@@@@UUUUUUJ*!J(UUUUUT@@@@EUUUUUR*!R*EUUUUU@@@@AUUUUUR*(T*!UUUUUP@@@@UUUUUT*(UJ(UUUUUT@@@@EUUUUUJ*ET*!UUUUU@@@@AUUUUUR*EUJ(UUUUUP@@@@UUUUUR*!UR*EUUUUT@@@@EUUUUT*!UUJ!UUUUU@@@@AUUUUUJ(UUR*EUUUUP@@@@UUUUUR(UUT*!UUUUT@@@@EUUUUR*EUUJ(UUUUU@@@@AUUUUT*EUUT*EUUUUP@@@@UUUUU@AUUU@@UUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUUUUUUUUUUUP@@@@')