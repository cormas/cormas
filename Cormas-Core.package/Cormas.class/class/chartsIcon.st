resources-icons
chartsIcon
	"UIMaskEditor new openOnClass: self andSelector: #imageGraphiques"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 26
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 8)
								at: 1
									put: ColorValue black;
								at: 2
									put: ColorValue white;
								at: 3
									put: (ColorValue scaledRed: 0 scaledGreen: 0 scaledBlue: 3699);
								at: 4
									put:
										(ColorValue scaledRed: 6605 scaledGreen: 6605 scaledBlue: 6605);
								at: 5
									put: (ColorValue scaledRed: 0 scaledGreen: 3699 scaledBlue: 0);
								at: 6
									put:
										(ColorValue scaledRed: 3699 scaledGreen: 3699 scaledBlue: 3699);
								at: 7
									put: (ColorValue scaledRed: 7662 scaledGreen: 0 scaledBlue: 0);
								at: 8
									put: ColorValue blue;
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@DQDQDQDQDQDQDQDU@@@@@AL3L3L3L3L3L3L3MP@@@@@SL3L3L3L3L3L3L3T@@@@@D0@@@@@@@@@@@@@5@@@@@ALADQDQDQDQDQDPMP@@@@@S@QDQDQDREAXWDCT@@@@@D0DQDQDQD@@@@A@5@@@@@ALADQDQDQDQDQDPMP@@@@@S@AH"DQDQDQDQDCT@@@@@D0DRH!DQDQDQDQ@5@@@@@ALAD"HQDQDQE7\PMP@@@@@S@QH"DQDQDQ]7DCT@@@@@D0@RH!QDDQDW]1@5@@@@@ALAD"HTQADQE7\PMP@@@@@S@QH"EDPQDQ]7DCT@@@@@D0DRH!QDDQDW]1@5@@@@@AL@D"HTQAY&E7\PMP@@@@@S@QH"EDPVY!]7DCT@@@@@D0DRH!QDE&XW]1@5@@@@@ALAD"HTQAY&E7\PMP@@@@@S@QH"EDPVY!]7DCT@@@@@D0@@@@@@@@@@@@@5@@@@@AL3L3L3L3L3L3L3MP@@@@AUUUUUUUUUUUUUUUT@@@@@@@@@@@@@@@@@@@@@@@@@@b'))