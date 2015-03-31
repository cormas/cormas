images - bitmap
fence1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fence1Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 47
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*********************************************************************************(@@@@@@@@@@@@J**(AUUUUUUUUUUUJ**(TEUUUUUUUUUUJ**(UP@@@@@@@@AUJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UP@@@@@@@@AUJ**(UUUUUUUUUUUUJ**(UUUUUUUUUUUUJ**(@@@@@@@@@@@@J*****************************************************************')