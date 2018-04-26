images - bitmap
snake1Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #snake1Image"
	
	<resource: #image>
	^Image
		extent: 76 @ 29
		depth: 5
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2569 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 353 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@AXMAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@ZAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTT@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTT@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SAPTEAPD@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FP@@@@@@@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@APTEAPTE@@@@@@@@APTEAPT@@@@@@@@@@@@@APTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A@TO@@@@@@@@@@TD@@@@@@@@@@@@@@@@@@@@@@TEAQ @@@@@@@@@@@@@CPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0T@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAP@@@@@@@@@V@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAQ(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@QAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ATEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAP@@@@@@@@@@@@@@@@@@E TEAPTEAPTEAQH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@T@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\E@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ATFAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EAPT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HAPTEAPTEAPTEAPTEAPTEAPTEAPTI@@@@@@@@@@@@@@@@@@@@@@@@@@HEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEEP@@@@@@@A EAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@E0TEAPTEAPTEAPTEAPTEAPTEE@@@@@@@@@@@@@@@APTE@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@C@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@(EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEB0@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTb')