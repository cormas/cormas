resources
arrowNextImage
	
	<resource: #image>
	^Image
		extent: 28 @ 16
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
						#scaledRed:scaledGreen:scaledBlue: #(2762 3469 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4111 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4400 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4657 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7227 6906)) #(ColorValue 
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
					'APTEAPTEAPTEAPTEAPTEAPTEAP$GAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTCBP\EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@0LIA0TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPLC@0$GAPTEAPHC@0LC@0LC@0LC@0LC@0LC@0LC@0XCBP\EAPTA@ LC@0LC@0LC@0LC@0LC@0LC@0LOA LIA0TEAPDB@0 NDQDQDQDQDQDQDQDQDQDQDP<F@0$GAPTE@PHCB@8QDQDQDQDQDQDQDQDQDQDQC0XCBP\EAPTP@0PJDQDQDQDQDQDQDQDQDQDQDP,@@04LAPTP@0PJDQDQDQDQDQDQDQDQDQDQDP,@@04LAPTP@0LC@0LC@0LC@0LC@0LC@0LC@0,@@04LAPTP@0LC@0LC@0LC@0LC@0LC@0LC@0L@@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPLC@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTC@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP4LAPTEAPTEAP@a')