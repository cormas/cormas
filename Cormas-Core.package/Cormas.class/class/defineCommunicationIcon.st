resources-icons
defineCommunicationIcon
	"UIMaskEditor new openOnClass: self andSelector: #imageDefinirCommunication"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 32
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							((Array new: 3)
								at: 1
									put: ColorValue black;
								at: 2
									put: ColorValue blue;
								at: 3
									put:
										(ColorValue scaledRed: 5548 scaledGreen: 5548 scaledBlue: 5548);
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'******(@B******** @J********@@***(@B**(@B*** @J** @J***@@***@@***(@B***%**** @F***V****@@V**)Z****)ZV**%*****)ZV**V*****)ZV*)Z*****)ZV(@B*****)ZV @J*****)ZU@@******)ZT@B******)UP@J******)Z@@*******UZ********%)Z*******)Z)Z*******V*)Z******%**)Z****@@Z**)Z***(@B***)Z*** @J***@@***@@UUUT@B**(@AUUUP@J** @J***@@********(@B******** @J*********** @a'))