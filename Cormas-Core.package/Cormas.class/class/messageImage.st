resources-icons
messageImage
	"UIMaskEditor new openOnClass: self andSelector: #messageImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 36 @ 25
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
										(ColorValue scaledRed: 3950 scaledGreen: 3950 scaledBlue: 3950);
								at: 3
									put:
										(ColorValue scaledRed: 6070 scaledGreen: 6070 scaledBlue: 6070);
								at: 4
									put: ColorValue white;
								at: 5
									put:
										(ColorValue scaledRed: 6713 scaledGreen: 6713 scaledBlue: 6713);
								at: 6
									put:
										(ColorValue scaledRed: 1830 scaledGreen: 1830 scaledBlue: 1830);
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'QCL3L3L3L3L3L3L3L3L3L3MD@@ADL3L3L3L3L3L3L3L3L3L3L4P@@DP3L3L3L3L3L3L3L3L3L3L3Q@@@Q@@@@@@@@@@@@@@@@@@@@@AD@@AD@@T3L3L3L3L3L3L3L3L5@DP@@DP@LAL3L3L3L3L3L3L3L1@0Q@@@Q@@3ASL3L3L3L3L3L3L5@3AD@@AD@CL0@3L3L3L3L3L3L0@3LDP@@DP@L3LEL3L3L3L3L3L5@3L0Q@@@Q@@3L3@CL3L3L3L3L0@3L3AD@@AD@CL3L0@3L3L3L3L0@3L3LDP@@DP@L3L3L@L3L3L3L0@3L3L0Q@@@Q@@3L3L3@CL3L3L0@3L3L3AD@@AD@CL3L3L0@3L3L0@3L3L3LDP@@DP@L3L3L0@@L3L0@@L3L3L0Q@@@Q@@3L3L0@3@BLP@3@CL3L3AD@@AD@CL3L0D3L3@@L3L5@3L3LDP@@DP@L3LPL3L3L3L3L3LPD3L0Q@@@Q@@3L@L3L3L3L3L3L3L@L3AD@@AD@CL@L3L3L3L3L3L3L3@CLDP@@DP@L@L3L3L3L3L3L3L3L0@0Q@@@Q@@CL3L3L3L3L3L3L3L3LPAD@@AD@@@@@@@@@@@@@@@@@@@@@DP@@DP@@@@@@@@@@@@@@@@@@@@@Q@@@QCL3L3L3L3L3L3L3L3L3L3MD@@@b'))