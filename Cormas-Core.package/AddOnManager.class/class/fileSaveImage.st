resources
fileSaveImage
	"UIMaskEditor new openOnClass: self andSelector: #fileSave20x20"
	
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
							((Array new: 7)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue scaledRed: 5548 scaledGreen: 5548 scaledBlue: 5548);
								at: 3
									put:
										(ColorValue scaledRed: 6869 scaledGreen: 6869 scaledBlue: 6869);
								at: 4
									put:
										(ColorValue scaledRed: 3170 scaledGreen: 3170 scaledBlue: 3170);
								at: 5
									put: ColorValue white;
								at: 6
									put:
										(ColorValue scaledRed: 5548 scaledGreen: 7398 scaledBlue: 7926);
								at: 7
									put:
										(ColorValue scaledRed: 2113 scaledGreen: 2113 scaledBlue: 2113);
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDY&@@@@@@QDQ@@@QDX"H@@QDAADQ@@@QDX!D@@QDADDQ@@@QDX!D@@QDADDQ@@@QDX!D@@@@QDDQ@@@QDX!DQDQDQDDQ@@@QDX!L3L3L1DDQ@@@QDX#QDQDQSDDQ@@@QDX#QDQDUCDDQ@@@QDX#QDQEQSDDQ@@@QDX#QDQTUSDDQ@@@QDX#QDUEUS@DQ@@@QDX#QEQUUSPDQ@@@QD@@@@@@@@@DQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@'))