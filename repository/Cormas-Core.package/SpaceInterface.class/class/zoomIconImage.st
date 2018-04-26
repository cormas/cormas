resources
zoomIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #zoom"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 6617 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 2120 2120)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'L3L3L3L3L3L3L0@@L3L3L3L3L3L3L0@@L3L3L3L3L3L3L0@@L3L3L@@CL3L3L0@@L3L0@RI@@3L3L0@@L3LAH"H"PCL3L0@@L3LBH2H"HCL3L0@@L3@RL3H"I@L3L0@@L3@"H2H"H L3L0@@L3@"H"H"H L3L0@@L3ABH"H"HPL3L0@@L3LBH"H"HCL3L0@@L3LDH"H"DCL3L0@@L3L0ABHPAUL3L0@@L3L3L@@CLDT3L0@@L3L3L3L3L0QSL0@@L3L3L3L3L3AEL0@@L3L3L3L3L3LDT0@@L3L3L3L3L3L0@0@@L3L3L3L3L3L3L0@@'))