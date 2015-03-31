images - bitmap
z_nb3Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb3"
	
	<resource: #image>
	^Image
		extent: 50 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'****************(@@@@J****************@@@@B**************** @@@@******* @B******(@@@@J******!UT*******@@@@B******(UUR****** @@@@******(UUT******(@@@@J******EUUR******@@@@B******EUUT****** @@@@******!UAUJ*****(@@@@J*****(UJAR******@@@@B*****(UJ*D****** @@@@******EJ*!J*****(@@@@J*****!R*(R******@@@@B*****(R**D****** @@@@******D**!J*****(@@@@J***** **(R******@@@@B*****(J**B****** @@@@******B**D******(@@@@J********!J******@@@@B********!R****** @@@@********(R******(@@@@J*******(T*******@@@@B*******(T******* @@@@*******(UJ******(@@@@J******(TB*******@@@@B*******DEJ****** @@@@*******!UR******(@@@@J******(UUJ******@@@@B*******EUT****** @@@@*******!UUJ*****(@@@@J*******EUR******@@@@B*******(AT****** @@@@*********AJ*****(@@@@J********(R******@@@@B*****(J** ****** @@@@******B**(J*****(@@@@J***** ***D******@@@@B*****(J**!J***** @@@@******D**(R*****(@@@@J*****!J**D******@@@@B*****(R**!J***** @@@@******EB*!J*****(@@@@J*****!U@@R******@@@@B*****(UUUT****** @@@@******EUUUJ*****(@@@@J*****!UUUJ******@@@@B******EUUR****** @@@@******!UUT******(@@@@J*****(EUT*******@@@@B******(@@J****** @@@@****************(@@@@J****************@@@@@b')