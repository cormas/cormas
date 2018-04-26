images - bitmap
man4Image
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man4Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 50
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
					'**************** @@@@J*********"*****(@@@@B**********J*****@@@@@**********(***** @@@@J**********B****(@@@@B**********(J****@@@@@***********"**** @@@@J*****(J***(J***(@@@@B*****(TJ***B****@@@@@*****(UTJ**(**** @@@@J*****EUT***B***(@@@@B*****!UT*** ****@@@@@*****(UUJ**(J*** @@@@J*****!UJ***B***(@@@@B*****(UR*** ****@@@@@******ER***(R*** @@@@J*****!T****D***(@@@@B*****(UJ**(AJ***@@@@@******ER**@UR*** @@@@J****(EU@@D@R***(@@@@B****(UUUT@* ****@@@@@****(TUUP**(J*** @@@@J*** TEUT**(R***(@@@@B***!T!UUJ**D****@@@@@*** EPUUJ** **** @@@@J***(@EUR**(J***(@@@@B***** UT***B****@@@@@******EUJ**D**** @@@@J*****!UJ** ****(@@@@B*****(UR**(J****@@@@@******ET***B**** @@@@J*****!UR**B****(@@@@B*****(UT** *****@@@@@*****(UUR* ***** @@@@J*****EQT*(*****(@@@@B*****!RER(J*****@@@@@*****(T(T*J***** @@@@J****(T*ER******(@@@@B*****EJ(T*******@@@@@*****!J*!R****** @@@@J****!R*(T******(@@@@B****(R*(T*******@@@@@****(T**EJ****** @@@@J****D**!R******(@@@@B****EJ*(T*******@@@@@****!J*(T******* @@@@J***!R**EJ******(@@@@B***(T**ET*******@@@@@***(@B*"******** @@@@J***************(@@@@@b')