images - bitmap
casa2Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #casa2Image"
	
	<resource: #image>
	^Image
		extent: 53 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 3597 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUT@@@EUUUUUUUUUUUUUUUUU@@@AUUUUUUUPEUUUUUUUUP@@@UUUUUUUP@UUUUUUUUT@@@EUUP@@EP@AUUUUUUUU@@@AUUT@@APB@EUUUUUUUP@@@UUU@@@PB(@UUUUUUUT@@@EUUPJ @B* AUUUUUUU@@@AUUTB(@B**@EUUUUUUP@@@UUU@*@B**(@UUUUUUT@@@EUUPJ B*** AUUUUUU@@@AUUTB(B****@EUUUUUP@@@UUU@*B****(@UUUUUT@@@EUUPJ****** AUUUUU@@@AUUTB*******@EUUUUP@@@UUU@*******(@UUUUT@@@EUU@******** AUUUU@@@AUU@J********@EUUUP@@@UU@J********(@UUUT@@@EUPJ********* AUUU@@@AUPJ**********@EUUP@@@UPJ**********(@UUT@@@EPB*********** AUU@@@APB************@EUP@@@TB************(@UT@@@D@@@B*******(@@@AU@@@@@@@@******** @@@EP@@@@@@@********(@@@@T@@@EUUPJ******** EUUU@@@AUUPB********(AUUUP@@@UUTB*********@EUUT@@@EUU@*********(AUUU@@@AUU@J*********@UUUP@@@UUPJ********* EUUT@@@EUTB*********(AUUU@@@AUU@**********@UUUP@@@UUPJ********* EUUT@@@EUTB*********(AUUU@@@AUU@**********@UUUP@@@UUP********** EUUT@@@EUPB*********(AUUU@@@AUU@**********@UUUP@@@UUPJ********* EUUT@@@EUT@*********(AUUU@@@AUUPJ********(@UUUP@@@UUTB*********@UUUT@@@EUU@J******** EUUU@@@AUUT@@@@@@@@@@AUUUP@@@UUU@@@@@@@@@@@UUUT@@@EUUP@@@@@@@@@@UUUU@@@AUUUUUUUUUUUUUUUUUP@@@UUUUUUUUUUUUUUUUUT@@@@@a')