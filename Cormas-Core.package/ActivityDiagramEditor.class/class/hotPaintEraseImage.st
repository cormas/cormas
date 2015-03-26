resources
hotPaintEraseImage
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 5)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 0);
								at: 3
									put: ColorValue yellow;
								at: 4
									put: ColorValue white;
								at: 5
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 3 / 4);
								yourself))
				usingBits:
					#[51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 48 0 0 3 51 51 51 51 3 35 35 32 51 51 51 48 50 50 50 0 51 51 51 3 35 35 32 16 51 51 48 50 50 50 1 16 51 51 3 35 35 32 17 3 51 48 50 50 50 1 16 51 51 4 68 68 64 17 3 51 51 4 68 68 64 16 51 51 51 4 68 68 64 3 51 51 51 48 0 0 0 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51])