resources-icons
parametersIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #parametersIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 22
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 6)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue scaledRed: 6360 scaledGreen: 6360 scaledBlue: 6360);
								at: 3
									put: (ColorValue scaledRed: 0 scaledGreen: 0 scaledBlue: 4240);
								at: 4
									put: ColorValue white;
								at: 5
									put: ColorValue cyan;
								at: 6
									put: (ColorValue scaledRed: 0 scaledGreen: 4240 scaledBlue: 4240);
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'L3L3L3L3L3L3L3L3L3L3L3MUUUUUUUUUUUUUUUUUUUL5MCP4MCP4MCP4MCP4MCP MTUP@@@@@@@@@EUUUUUUHCT5TADQDQDQDQEUUUUUUR@5QU@3L3L3L3L1UUUUUUT MSUPDQDQDQDQDUUUUUUUHCUEUUUUUUUUUUUUUUUUUR@5MUL0T3ASLEL0T3ASLET MTUSDELPT1ASDELPT1AUHCT5T@AP@E@@T@AP@E@@UR@5QUUUUUUUUUUUUUUUUUT MSUSLEL0T3ASLEL0T3AUHCUET1ASDELPT1ASDELPUR@5MU@@T@AP@E@@T@AP@ET MTUUUUUUUUUUUUUUUUUUHCT5T3ASLEL0T3ASL3L0UR@5QULPT1ASDELPT1DQDET MSUP@E@@T@AP@E@@@@AUHCUEUUUUUUUUUUUUUUUUUR@5T"H"H"H"H"H"H"H"H"H L0@@@@@@@@@@@@@@@@@@@0@a'))