resources
conditionIconImage
	"Tools.UIMaskEditor new openOnClass: self andSelector: #conditionIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 27
				depth: 5
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1413)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 2505)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 1991)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 3822)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1060)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 192)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DD@P@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAP$EA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAQPNE@TD@@@@@@@@@@@@@@@@@@@@@@@@@@@DAQPNC 8T@0(@@@@@@@@@@@@@@@@@@@@@@@@DAQPNC 8NC ,OB @@@@@@@@@@@@@@@@@@@@@DAQPNC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@DAQPNC 8NC 8NC 8HC0(@@@@@@@@@@@@@@@@@A 4NC 8NC 8NC 8NC  OB @@@@@@@@@@@@@@A 4NC 8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@A 4NC 8NC 8NC 8NC 8NC 8HDQH@@@@@@@@@A 4NC 8NC 8NC 8NC 8NC 8NC \SD @@@@@@A 4NC 8NC 8NC 8NC 8NC 8NC 8N@!LR@@@@A 4NC 8NC 8NC 8NC 8NC 8NC 8NC 8BD1H@A@TTC 8NC 8NC 8NC 8NC 8NC 8NC 8NE@TD@@@DAQPNC 8NC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@PEE@8NC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@@@A@TAC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@@@@@@DC@4NC 8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@FCP8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@XMC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@A 4NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@FCP8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@XMC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@A 4NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FBP<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A@J@@@@@@@@@@@@@@@@'))