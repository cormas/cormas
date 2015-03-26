resources-icons
addOnIcon
	"Tools.UIMaskEditor new openOnClass: self andSelector: #addOnIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 27 @ 20
				depth: 5
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5942 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 3693 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5749 2055)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2023 1220 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 5524 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 353 128)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7580 6681)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2537 1509 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7387 6167)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3565 2152 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5107 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 6617 5846)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4914 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7998 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 2441 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(995 674 192)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7805 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 4978 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5524 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 2762 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 4304 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 289 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5332 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 5075 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5075 3051 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 4593 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6970 5139)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'C0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<O@@<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0@OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<@C0<OC0<OC0<OC0<OG@<OC0<OC1HXC0<XD <O@@<OC0<OC0<OC0<OC0@BC0<OC0<@@ <O@ @OC0@OC0<OC0<OC0<OC1\@AP<OC0<O@@HOC0H@C0<@C0<C@0LCC0<OC0<@@A$OC0<@@@@BF@@@@@<O@@<C@0LC@0LOC0<O@@<@G@<@@@@@@ @@@@@OC0@O@0LOC0(CC0<OC0@O@@0O@@<O@@H@C0<@C0<@@0LOC0<VC0<OC0@@AQ$@C0@OC0@B@@<O@@<O@@LCC0<OC0<OC0<@@@@@@@<@C0<@@ @BC0@OC0@C@0<OC0<O@0LO@ATCC @C@@@H@A,@@@<@E@L@@0LOC0<O@0LC@0@PA@DKC08@@@@FD0@G@@(O@@LCC0<OC0LOC1POB <O@0<O@1 DC0<PCPLOC0@C@0<OC0<CC0<JC0LOC0LOC0LOC0<V@0<C@0<@@0LOC0<O@0<OB <JC0<CC0<CC0<C@0LOC0LC@@<CCP<OC0LMC0(OB <O@0<O@0<C@0<CA@<O@0@O@1DC@0LCE@L^C0(OC0LOC0LO@0LO@0<C@0L@C04H@0LOC1DTCQ(CC0<CF!(TC0<C@1DO@0LO@@<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0<OC0@b'))