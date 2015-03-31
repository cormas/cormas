images - bitmap
z_nb1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb1Image"
	
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
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 4111 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUP@@EUUUT@@@@UUUUUUUUUR**!UUUU@@@@EUUUUUUUUR**(UUUUP@@@AUUUUUUUUR***EUUUT@@@@UUUUUUUUR***!UUUU@@@@EUUUUUUUR***(UUUUP@@@AUUUUUUUR****EUUUT@@@@UUUUUUUR****!UUUU@@@@EUUUUUUR****(UUUUP@@@AUUUUUUR**"**EUUUT@@@@UUUUUUT** **!UUUU@@@@EUUUUUT**!J*(UUUUP@@@AUUUUUT**!R**EUUUT@@@@UUUUUT**AT**!UUUU@@@@EUUUUT**EUJ*(UUUUP@@@AUUUUT**EUR**EUUUT@@@@UUUUT**EUT**!UUUU@@@@EUUUT(@EUUJ*(UUUUP@@@AUUUT@UUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUU@@@UUUUP@@@AUUUUUUUUUUUUUUUUT@@@@')