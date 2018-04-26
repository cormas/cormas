images - bitmap
z_nb6Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb6"
	
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
						#scaledRed:scaledGreen:scaledBlue: #(8191 4593 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUT@@@@@AUUUUT@@@@UUUUUP******AUUUU@@@@EUUUUR*******AUUUP@@@AUUUUB** @J***EUUT@@@@UUUUJ*(AUT@B*!UUU@@@@EUUUR* UUUUU@HUUUP@@@AUUUR*!UUUUUUTEUUT@@@@UUUT*!UUUUUUUUUUU@@@@EUUT*(UUUUUUUUUUUP@@@AUUUJ(UUUUUUUUUUUT@@@@UUUR(UUUUUUUUUUUU@@@@EUUT*EUUUUUUUUUUUP@@@AUUT*EUUUUUUUUUUUT@@@@UUUJ!UUUUUUUUUUUU@@@@EUUR!UUUUUUUUUUUUP@@@AUUT(UUUUUUUUUUUUT@@@@UUUJEUUUUUUUUUUUU@@@@EUUR!UUUUUUUUUUUUP@@@AUUR(UUUUUUUUUUUUT@@@@UUT*EUUUUUUUUUUUU@@@@EUUJ!T@@@@AUUUUUUP@@@AUUR(P*****@@UUUUT@@@@UUT*B******* EUUU@@@@EUUB****(B***!UUUP@@@AUUP***(@UB***EUUT@@@@UUT"(@@UUUB**!UUU@@@@EUUH UUUUUUB**EUUP@@@AUUR!UUUUUUUB*!UUT@@@@UUUHUUUUUUUUB*EUU@@@@EUUREUUUUUUUUB!UUP@@@AUUT!UUUUUUUUT*EUT@@@@UUUHUUUUUUUUUR!UU@@@@EUUREUUUUUUUUT(UUP@@@AUUT!UUUUUUUUUJEUT@@@@UUUHUUUUUUUUUR!UU@@@@EUUR!UUUUUUUUR(UUP@@@AUUT(UUUUUUUUT*EUT@@@@UUUJEUUUUUUUUJ!UU@@@@EUUT!UUUUUUUUR!UUP@@@AUUUJEUUUUUUUB!UUT@@@@UUUR!UUUUUUTJ(UUU@@@@EUUT*EUUUUUP*(UUUP@@@AUUUJ!UUUUUB* UUUT@@@@UUUT*AUUUPJ*AUUUU@@@@EUUUJ*@EPB**EUUUUP@@@AUUUT**(B**(EUUUUT@@@@UUUU@@***@@UUUUUU@@@@EUUUUUP@@EUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@')