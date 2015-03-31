images - bitmap
man1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man1Image"
	
	<resource: #image>
	^Image
		extent: 45 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2955 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************@*****(@@*****J*@*****(UUB****J*@*****!UUR****J*@*****!UUT***(J*@*****EUUT***(J*@*****EUUUJ**(J*@*****EUUUJ**(J*@*****EUUT***(J*@*****EUUT***(J*@*****!UUR***!J*@*****!UUR***!J*@*****!UUJ @@AJ*@****(EUU@EUUUJ*@****AUUUUUUUUJ*@*** UUUUUUUUPJ*@**(EUUUUUUU@HJ*@**AUUUUUUT@*(J*@* UU@EUUUB**(J*@*ET@*EUUUJ**(J*@*!T**EUUUJ**(J*@*(UJ*EUUUJ**(J*@**EJ*EUUUJ**(J*@**!J*EUUUJ**(J*@**!R*EUUUJ**(J*@**(R*!UUUJ**(B*@***B*!UUT****B*@*** *!UUT****B*@***(*!UUT****B*@*****!UUT****B*@*****!UUT****B*@*****!UUT****B*@*****!TUT****B*@*****ETUT****B*@*****ERET****B*@*****ERET****B*@*****ERET****B*@****(UR!UJ***B*@****(UJ!UJ***B*@****(UJ!UJ***B*@****(UJ(UJ***"*@****!UJ(UJ***"*@****!T*(UJ***"*@****!T**EJ***"*@****!T**EJ***"*@****ET**ER***"*@****ER**!R***"*@****@B** B***"*@***************@***************@***************@')