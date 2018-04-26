images - bitmap
sheepImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sheepImage"
	
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
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUP@@@EUUUUUUUUUUUUUUUUT@@@AUUUUUUUUUUUUUUUUU@@@@UUUUUUUUUUUUT@@EUP@@@EUUUUUUUUUUUP@@AUT@@@AUUUUUUUUUUUPB* UU@@@@UUUUUUUUUUUTJ*(EUP@@@EUUUUUUUUUUTB**AUT@@@AUUUUUUUUUUTB** AU@@@@UUUUUUUUUUUB*** EP@@@EUUUUUUUUUU@****AT@@@AUP@@@EUUUU@**** E@@@@UP@@@@@@@@@*****AP@@@EP****@@@@B***** T@@@A@**************@U@@@@P*************(AUP@@@DJ*************@UT@@@AB*************@UU@@@@P*************@UUP@@@DJ************ EUT@@@AB************ EUU@@@@P************ EUUP@@@DJ***********(EUUT@@@AB************AUUU@@@@P************@UUUP@@@DJ*********** UUUT@@@AB*********** EUUU@@@@PJ**********(EUUUP@@@EB***********AUUUT@@@APJ**********@UUUU@@@@UB********** UUUUP@@@EP********** EUUUT@@@ATB*********(EUUUU@@@@UP**********AUUUUP@@@ETJ*********@UUUUT@@@AU@*@@@@@@B* UUUUU@@@@UTJ(@@@@@@* EUUUUP@@@EU@*AUUUUUB(EUUUUT@@@AUTJ UUUUUP(EUUUUU@@@@UUB(EUUUUTHAUUUUUP@@@EUPJAUUUUUB UUUUUT@@@AUUB UUUUUPHEUUUUU@@@@UUP*AUUUUUBAUUUUUP@@@EUTJ UUUUUP EUUUUT@@@AUU@(EUUUUTJAUUUUU@@@@UUTJAUUUUUB UUUUUP@@@EUUB UUUUUPHEUUUUT@@@AUUPHEUUUUUB@UUUUU@@@@UUUB@UUUUUP(EUUUUP@@@EUUP@AUUUUT@AUUUUT@@@AUUT@@UUUUU@@UUUUU@@@@UUUUUUUUUUUUUUUUUP@@@EUUUUUUUUUUUUUUUUT@@@@b')