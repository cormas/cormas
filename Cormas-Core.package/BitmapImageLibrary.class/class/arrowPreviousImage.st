resources
arrowPreviousImage
	
	<resource: #image>
	^Image
		extent: 29 @ 15
		depth: 5
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3597 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3790 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 3147 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3244 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3340 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7869 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4400 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3469 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4657 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7227 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4111 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3469 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4625 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4529 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4561 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4721 1927)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'APTEAPTEAPTPAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTEAPTED@LEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@TEAPTEAQ@C@0TEAPTEAPTEAPTEAPTEAPTEAPTE@@@@APTEAPTP@0LCAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTED@LD@0LC@0LC@0LC@0LC@0LC@0LC@0LMB0@@@@TEAQ@CA@ C@0LC@0LC@0LC@0LC@0LC@0LCCP,E@@@@APTP@0PHDQDQDQDQDQDQDQDQDQDQDP(@@04KAPT@@@@ED@LDBADQDQDQDQDQDQDQDQDQDQDJ@@LMB0TEAP@@@@DB@0$NDQDQDQDQDQDQDQDQDQDQDP<F@00GAPTE@@@@APDB@0$NDQDQDQDQDQDQDQDQDQDQDP<F@00GAPT@@@@EAPDB@0$N@0LC@0LC@0LC@0LC@0LC@0LC@00GAP@@@@TEAPDB@0$C@0LC@0LC@0LC@0LC@0LC@0LC@00G@@@@APTEAPDB@0LCAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTEAPDB@0LEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@TEAPTEAPDB@0TEAPTEAPTEAPTEAPTEAPTEAPTE@@@@')