resources
iconPhoto
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconPhoto"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 29
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6167)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6809 6681 6424)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'0@@@@@@@@@C@@@@@@@@@@L@@@@@@@@@@0@@@@@@@@@C@@@@@@@@@@L@@@UU@@@@@0@@D@A@@@@C@EAAUA@AT@LAUPDDAUUU@0D@@UP@@@DC@QU@@AQUTPLAETEUAF*Q@0DUA@A@Z)DC@QPPUAAUTPLAEDEUA@@A@0DTQYUDUUDC@QQF%TQUTPLAEDVUQEUQ@0DTPUTDUUDC@QPPUAAUTPLAEPP@PUUQ@0DUPUTEUUDC@P@@@@@@@PLAUUUUUUUU@0@@@@@@@@@C@@@@@@@@@@L@@@@@@@@@@0@@@@@@@@@C@@@@@@@@@@@@a'))