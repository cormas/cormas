resources
sendToBackIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sendToBackIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 24
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
								#scaledRed:scaledGreen:scaledBlue: #(1124 1349 1381)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQDQDQ@@@@D$@@@@@BDQDQDQDQDP@@@A@L3L3L3ADQDQDQDQD@@@@PCL3L3L0QDQDQDQDQ@@@@D@3L3L3LDQDQDQDQDP@@@A@L3L3L3@@@@@@EDQD@@@@PCL3L3L0H"H"H QDQ@@@@D@3L3L3LBH"H"HDQDP@@@A@L3L3L3@"H"H"ADQD@@@@PCL3L3L0H"H"H QDQ@@@@D@3L3L3LBH"H"HDQDP@@@AE@@@@@@X"H"H"ADQD@@@@QDQ@H"H"H"H"H QDQ@@@@DQDPBH"H"HP@@@@@IP@@@ADQD@"H"H"@3L3L3LD@@@@QDQ@H"H"H L3L3L3A@@@@DQDPBH"H"HCL3L3L0P@@@ADQD@"H"H"@3L3L3LD@@@@QDQ@H"H"H L3L3L3A@@@@DQDPBH"H"HCL3L3L0P@@@ADQDT@@@@@@3L3L3LD@@@@QDQDQDQDQ@L3L3L3A@@@@DQDQDQDQDPCL3L3L0P@@@ADQDQDQDQDT@@@@@A4@@@@'))