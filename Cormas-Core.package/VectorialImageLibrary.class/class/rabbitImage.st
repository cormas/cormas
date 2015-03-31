images - bitmap
rabbitImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #rabbitImage"
	
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
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'****************(@@@@J****************@@@@B**************** @@@@****************(@@@@J****************@@@@B*****"********** @@@@*****"**********(@@@@J**** ***********@@@@B**** *********** @@@@****!J**********(@@@@J***(J*@@B*******@@@@B***(R(ETJ******* @@@@***(R UP********(@@@@J**@T!UB*********@@@@B* ETAUJ********* @@@@*!UUETJ*********(@@@@J!UUUT***********@@@@B!UUUT*********** @@@@(UUUT***********(@@@@HUUUUJ***********@@@@BEUUUR*********** @@@@!UUUUJ* @@@J****(@@@@HUUUUP@AUUUT@B***@@@@B!UUUUUUUUUUUT(J* @@@@(@@UUUUUUUUUUPR*(@@@@J*(UUUUUUUUUUUUJ*@@@@B**EUUUUUUUUUUUR* @@@@**EUUUUUUUUUUUB*(@@@@J*!UUUUUUUUUUUJ**@@@@B*!UUUUUUUUUUUR** @@@@*(UUUUUUUUUUUR**(@@@@J(UUUUUUUUUUUT***@@@@B*EQUUUUUUUUUUJ** @@@@*EQUUUUUUUUUUT**(@@@@J!PTUUUUUUUUUUJ**@@@@B!@T!UUUUUUUUUT** @@@@(JD*EUUUUUUUUUR*(@@@@HJD*(EUUUUUUUUT**@@@@BJD**(EUUUUPEUUR* @@@@* ***(EUUPB(UEUJ(@@@@J ****(EPB*(UHUR*@@@@B(*****(B**(UJ UJ @@@@(*********(PJ*!T(@@@@J*********(B***EJ@@@@B**************(T @@@@***************D(@@@@J**************!J@@@@B***************J @@@@***************"(@@@@J****************@@@@B**************** @@@@')