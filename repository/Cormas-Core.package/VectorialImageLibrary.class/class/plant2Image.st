images - bitmap
plant2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #plant2Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 50
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5492 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUPUUUUUUUUP@@@@EUUUUUUV UUUUUUUT@@@@AUUUUUTU* UUUUUUU@@@@@UUUUUU@Z*!UUUUUUP@@@@EUUUUUT"*(UUUUUUT@@@@AUUUUUUJ**!UUUUUU@@@@@UUUUUUR**!UU@AUUP@@@@EUUUUAUJ*(UUR(UUT@@@@AUUUTHUR*(UUT*EUU@@@@@UUUP*ET**EUUJ!UUP@@@@EUUUB!UJ*EUUR(UUT@@@@AUUUUJAR*!UUR(UUU@@@@@UUUUJ*D*!UUT(UUUP@@@@EUUUR*!J(UUT(UUUT@@@@AUUUPB(R*EUUHUUUU@@@@@UUUUT*D*!UUJEUUUP@@@@EQUUUR(J(@EREUUAT@@@@ATATUT*B**EREUUJA@@@@@T*DEUJ **!T!UUJ(P@@@@EJ((UR(J*!T!UTJ*D@@@@AR**ET*B*!T!T@**!@@@@@R**(UR *(UH@***(P@@@@DJ**ET*J(UHJ****D@@@@ATB*(UJ"*EJ*****!@@@@@UUB*@B(*!R****@!P@@@@EUB****J(R***(EPT@@@@AUJ******B*** UUU@@@@@UJ****** ***!UUUP@@@@DJ@B****(***!UUUT@@@@@@EUB*******!UUUU@@@@@UUUUB******!UUUUP@@@@EUUUUJ*****!UUUUT@@@@AUUUUTJ****(UUUUU@@@@@UUUUUT****(UUUUUP@@@@EUUUUUJ***(UUUUUT@@@@AUUUUUT***(UUUUUU@@@@@UUUUUU@J*@UUUUUUP@@@@EUUUUUUT@EUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@@b')