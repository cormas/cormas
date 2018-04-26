resources
bringToFrontIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 26
				depth: 4
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1220 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6552 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 7195 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 417 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQDQDQ@@@@D @@@@@@HQDQDQDQDP@@@A@L3L3L3LDQDQDQDQD@@@@PCL3L3L3ADQDQDQDQ@@@@D@3L3L3L0QDQDQDQDP@@@A@L3L3L3LDQDQDQDQD@@@@PCL1@@@@@@@@@HQDQ@@@@D@3LBH"H"H"H"HDQDP@@@A@L3@"H"H"H"H"ADQD@@@@PCL0H"H"H"H"H QDQ@@@@D@3LBH"H"H"H"HDQDP@@@A@L3@"H"H"H"H"ADQD@@@@PCL0H"H"H"H"H QDQ@@@@DT@@BH"H"H"H"H@@HP@@@ADQD@"H"H"H"H"@3LD@@@@QDQ@H"H"H"H"H L3A@@@@DQDPBH"H"H"H"HCL0P@@@ADQD@"H"H"H"H"@3LD@@@@QDQ@H"H"H"H"H L3A@@@@DQDPBH"H"H"H"HCL0P@@@ADQDX@@@@@@@@@\3LD@@@@QDQDQDQDPCL3L3L3A@@@@DQDQDQDQD@3L3L3L0P@@@ADQDQDQDQ@L3L3L3LD@@@@QDQDQDQDQP@@@@@@U@@@@DQDQDQDQDQDQDQDQDP@@@@b'))