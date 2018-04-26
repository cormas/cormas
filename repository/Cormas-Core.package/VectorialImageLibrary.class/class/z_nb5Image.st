images - bitmap
z_nb5Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb5"
	
	<resource: #image>
	^Image
		extent: 48 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'******************** @@@@@@D********!UUUUUUT********!UUUUUUT********!UUUT@@@********!T@@B***********ET**************ET**************ET**************ER**************ER**************ER**************ER**************ER**************ER**************ER*************(UR*************(UJ*************(UJ*************(UJ(@B**********(U@AUTJ*********(UUUUUP**********EUUUUUJ*********EUUUUUJ*********!UU@UUR*********!T@*EUR*********(B** UT**************ET**************!UJ*************!UJ*************(UR*************(UR**************ER**************ER**************!R**************!R**************ER**************ER**************ER**************ER*************(UR*************(UR*************AUJ************ UUJ*******(@@@@EUUJ*******(UUUUUUP********!UUUUUUJ********!UUUUUP********* @@@@@J**************************************')