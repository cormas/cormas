images - bitmap
cow2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #cow2Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J****************(@@@B*****************@@@@*J**(************ @@@J"***J***********(@@@B(***"************@@@@(J**(J*********** @@@JB**(R***********(@@@B ***D************@@@@(R**EJ*********** @@@J!J*!J***********(@@@B(T@AR************@@@@*!UUR************ @@@J(UUT************(@@@B*EUUJ************@@@@*EUUT************ @@@J!UUUJ***********(@@@B(EUUT************@@@@*EUUUJ**** @@@@** @@@J!UUUT@@@@AUUUUP*(@@@B*EUUUUUUUUUUUUUJ*@@@@*!UUUUUUUUUUUUUR* @@@J(UUUUUUUUUUUUUUJ(@@@B*!UUUUUUUUUUUUTR*@@@@*(UUUUUUUUUUUUUD* @@@J*EUUUUUUUUUUUUPJ(@@@B*!UUUUUUUUUUUUTB*@@@@**EUUUUUUUUUUUUHJ @@@J*!UUUUUUUUUUUURB(@@@B**EUUUUUUUUUUUT *@@@@**!UUUUUUUUUUUUJJ @@@J**EUUUUUUUUUUUR (@@@B**!UUUUUUUUUUUT*J@@@@***EUUUUUUUUUUT*" @@@J**!UUUUUUUUUUUJ*(@@@B**(UUUUUUUUTEUR**@@@@***ETEUUUUUP!UT** @@@J**!UHAUUU@B(UUJ*(@@@B**(UJ*@@@J**EUR**@@@@***ER*******!UT** @@@J**!T*******(UT**(@@@B***EJ*******!UJ**@@@@***!J*******(UR** @@@J**(R********!T**(@@@B***D********(UJ**@@@@***!J********!R** @@@J**(R********(T**(@@@B***D********* ***@@@@*** *********(J** @@@J**!J********(R**(@@@B**(B*********@***@@@@***************** @@@J****************(@@@@b')