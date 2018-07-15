Class {
	#name : #DecisionPointModel,
	#superclass : #AbstractActivityModel,
	#instVars : [
		'outgoingTrue',
		'outgoingFalse'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #ressources }
DecisionPointModel class >> diamondFigure [
	
	^VectorialElementaryPOV diamond
]

{ #category : #ressources }
DecisionPointModel class >> diamondIm [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diamondIm"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 121 @ 94
				depth: 7
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 2826 546)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 674)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 3340 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4593 289)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 642)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 867)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 289)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 3340 2826)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1188)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 2312 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 385)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3147)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3854 353)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5460)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1284 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1284 610)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 2312 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1060)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 738)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 770)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2280)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 3693)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 1991)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4304)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4336 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 2601)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 610)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 963)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1413)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3597 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1284 674)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1284 353)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 160)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS,,C#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP,CDC8+D#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSL#CBH"M2TWLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1IB04H"H"H"H0N@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1J" PH"H"H"H"H!T5M D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1C 4DH"H"H"H"H"H"H"$TA#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDRK!0"H"H"H"H"H"H"H"H"I"\/LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD*C4L"H"H"H"H"H"H"H"H"H"HL@!,ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD B#4"H"H"H"H"H"H"H"H"H"H"H"HIOC,1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LQH+BAT"H"H"H"H"H"H"H"H"H"H"H"H"H!(CB3D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LPX%M2H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"CBL-LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR<]LBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"FR0$LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@QLBERH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HPJB(1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1N1PQH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H PMC#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1G L&H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!0.D#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1F0TLH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"P0<*LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD$P $"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H=B"@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE@JA("H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!THJ1H1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD-E P"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#\%A#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LQHXFRH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"LA4@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR(?A2H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HUMQLALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP8JABH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HQE@X1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1D"8>ERH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"X''G#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1E2UCH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"C@T[@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@C 0H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"BS0$LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDAM#TUH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HZHP,1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDFEB$"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H 0#KSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD/I2X"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!$,D#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LPD[@ 0"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"DC<*LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS,<BRH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HDCP81LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LP,CF"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H>K!H1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LR4#CBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H$LOE3D1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1IB0YH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"OS  LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1J" PH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HUBB,ALSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1C 4DH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H7NPX1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSDRK!0"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#@]K3D1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD*C4L"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"EPHS@SD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD B#4"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"DQP;LSD1LSD1LSD1@@@@LSD1LSD1LSD1LPD+BAT"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H&@181LSD1LSD1LP@@@CD1LSD1LSD1LPX9M2H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H 0EF3D1LSD1LSD@@@@1LSD1LSD1LR<]LBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H %BICD1LSD1@@@@LSD1LSD1@QLBERH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"F"E@LSD1LP@@@CD1LSD1N1PQH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HLE"41LSD@@@@1LSD1G L&H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HYKAH1@@@@LSD1@DDLH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#(_@P@@@CD1LPD[AP0"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!@?J#D@@@@1LSD1LQ8''I"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!$,D#D1@@@@LSD1LSD1A!PQH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"CAX-LSD1LP@@@CD1LSD1LSDAD3TUH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"F"E@LSD1LSD@@@@1LSD1LSD1LSD@GS@"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"BTH$LSD1LSD1@@@@LSD1LSD1LSD1LPX%M2H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HLAQ,1LSD1LSD1LP@@@CD1LSD1LSD1LSD1D",HERH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H&@181LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1H@(=H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HQEC,1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD*C4L"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!TBD0D1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LQH.GBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#@]K3D1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LP8MABH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#\9A#D1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1J" PH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"EP +@SD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD$KA$"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"OS  LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD-H00"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"P0<WLSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP,!F"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"O"8RLSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1IC0IH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HDCP81LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDAF0TLH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HGO2(1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD^I2X"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HYFAH1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LPXTDRH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H PVKSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@QL5ERH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!((PCD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@A40H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#QBICD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDFIS\"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"C@T3LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LQH+BAT"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"F L^LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR@JORH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"DS0;LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1J =CH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"HL@!LALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDRK!0"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H0I2<1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDNCPP"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H)NPX1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR((DBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!THM D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1IB0YH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H#@8HCD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1KRLLH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H$L%E3D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDKHQ("H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"ES8.D#D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LRP<BRH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"OP(NLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@Q,ECBH"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"A0<*LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1G"\&H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"GA RLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDFEB$"H"H"H"H"H"H"H"H"H"H"H"H"H"HDE 81LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LPD6MQT"H"H"H"H"H"H"H"H"H"H"H"HPJD@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@8LBH"H"H"H"H"H"H"H"H"H"H4KBP1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1E2T7H"H"H"H"H"H"H"H"H 0#L3D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDRJ38UH"H"H"H"H"H"H!(CB3D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDNB#4"H"H"H"H"H $<N3D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR(OA2H"H"H"C@H[@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1D! \H"H"I"\/LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@CD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1C!XDJQPFLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD@@@@1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE@O3XALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@@@@LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LQH1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LP@@@@@a'))
]

{ #category : #ressources }
DecisionPointModel class >> diamondImage [
	
	^OpaqueImage
		figure: self diamondIm
		shape: self diamondMask
]

{ #category : #ressources }
DecisionPointModel class >> diamondMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diamondMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 121 @ 94
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N@@@@@@@@@@@@@@@@@@@@G8@@@@@@@@@@@@@@@@@@@C?@@@@@@@@@@@@@@@@@@@C?8@@@@@@@@@@@@@@@@@@A?? @@@@@@@@@@@@@@@@@@??<@@@@@@@@@@@@@@@@@@??? @@@@@@@@@@@@@@@@@_??>@@@@@@@@@@@@@@@@@O???0@@@@@@@@@@@@@@@@O???>@@@@@@@@@@@@@@@@G????0@@@@@@@@@@@@@@@C?????@@@@@@@@@@@@@@@C?????8@@@@@@@@@@@@@@A??????@@@@@@@@@@@@@@@??????<@@@@@@@@@@@@@@_?????? @@@@@@@@@@@@@_??????<@@@@@@@@@@@@@O???????0@@@@@@@@@@@@G???????>@@@@@@@@@@@@G????????0@@@@@@@@@@@C?????????@@@@@@@@@@@A?????????8@@@@@@@@@@A??????????@@@@@@@@@@@??????????<@@@@@@@@@@_?????????? @@@@@@@@@_??????????<@@@@@@@@@O??????????? @@@@@@@@G???????????>@@@@@@@@G????????????0@@@@@@@C????????????>@@@@@@@A?????????????8@@@@@@@??????????????@@@@@@@??????????????8@@@@@@_?????????????? @@@@@O??????????????<@@@@@O??????????????? @@@@G???????????????>@@@@C????????????????0@@@C????????????????>@@@A?????????????????0@@@??????????????????@@@??????????????????8@@_??????????????????@@O??????????????????<@G??????????????????? A???????????????????0@G??????????????????8@@??????????????????8@@G?????????????????<@@@_????????????????>@@@C????????????????>@@@@_????????????????@@@@A???????????????? @@@@O???????????????0@@@@A???????????????0@@@@@G??????????????8@@@@@@??????????????<@@@@@@G?????????????<@@@@@@@_????????????>@@@@@@@C?????????????@@@@@@@@_????????????@@@@@@@@C???????????? @@@@@@@@O???????????0@@@@@@@@A???????????0@@@@@@@@@O??????????8@@@@@@@@@@??????????<@@@@@@@@@@G?????????<@@@@@@@@@@@?????????>@@@@@@@@@@@C?????????@@@@@@@@@@@@_???????? @@@@@@@@@@@C???????? @@@@@@@@@@@@O???????0@@@@@@@@@@@@A???????8@@@@@@@@@@@@@O??????8@@@@@@@@@@@@@@??????<@@@@@@@@@@@@@@G?????>@@@@@@@@@@@@@@@?????>@@@@@@@@@@@@@@@G?????@@@@@@@@@@@@@@@@_???? @@@@@@@@@@@@@@@C???? @@@@@@@@@@@@@@@@_???0@@@@@@@@@@@@@@@@A???8@@@@@@@@@@@@@@@@@O??8@@@@@@@@@@@@@@@@@A??<@@@@@@@@@@@@@@@@@@G?>@@@@@@@@@@@@@@@@@@@??@@@@@@@@@@@@@@@@@@@G?@@@@@@@@@@@@@@@@@@@@_ @@@@@@@@@@@@@@@@@@@C0@@@@@@@@@@@@@@@@@@@@P@@@@@@@@@@@@a'))
]

{ #category : #'interface specs' }
DecisionPointModel class >> setterWindows [
	"Tools.UIPainter new openOnClass: self andSelector: #setterWindows"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Testing activity setter' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1147 669) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 3072)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 201 29 416 52) 
				#name: #InputFieldActivity 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 8191 6143)) 
				#model: #selectedActivity 
				#helpText: 'Right click to display the code' 
				#menu: #menuInspect) #(SequenceViewSpec 
				#layout: #(Rectangle 8 7 186 215) 
				#name: #List1 
				#model: #listActivity 
				#helpText: 'Choose a method' 
				#menu: #menuInspect 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(Rectangle 283 193 341 216) 
				#name: #ActionButton1 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 201 8) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black)) 
				#label: 'Test:') #(TextEditorSpec 
				#layout: #(Rectangle 199 76 416 183) 
				#name: #purposeEditor 
				#flags: 5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 8191 7167)) 
				#model: #purpose 
				#helpText: 'Right click to display the code' 
				#menu: #menuInspect 
				#style: #small 
				#tabRequiresControl: true) #(GroupBoxSpec 
				#layout: #(Rectangle 195 57 420 191) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black)) 
				#label: 'Test purpose:'))))
]

{ #category : #'interface specs' }
DecisionPointModel class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 5 5) 
			#max: #(Point 0 20) 
			#bounds: #(Rectangle 720 450 885 470) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle -1 2 449 22) 
				#name: #InputField1 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionForegroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #selectedActivity 
				#tabable: false 
				#isReadOnly: true 
				#type: #string))))
]

{ #category : #'interface specs' }
DecisionPointModel class >> windowSpec2 [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1443 534 1680 671) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(AlignmentOrigin 0 0.5 0 0.5 0.5 0.5) 
				#name: #Label1 
				#label: #diamondImage 
				#hasCharacterOrientedLabel: false) #(ComboBoxSpec 
				#layout: #(LayoutFrame 0 0.0833333 -10 0.5 0 0.916666 9 0.5) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #selectedActivity 
				#helpText: 'Choose a test method' 
				#comboList: #activityChoices))))
]

{ #category : #'interface specs' }
DecisionPointModel class >> windowSpecTest [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpecTest"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1443 525 1680 662) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(AlignmentOrigin 0 0.5 0 0.5 0.5 0.5) 
				#name: #Label1 
				#label: #diamondImage 
				#hasCharacterOrientedLabel: false) #(ComboBoxSpec 
				#layout: #(LayoutFrame 2 0 -10 0.5 0 1 9 0.5) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #selectedActivity 
				#helpText: 'Choose a test method' 
				#comboList: #activityChoices) #(RegionSpec 
				#layout: #(Rectangle 35 7 204 125) 
				#name: #Region1 
				#lineWidth: 1 
				#regionType: #ellipse))))
]

{ #category : #connection }
DecisionPointModel >> connectToDestination: destinationModel [
	
	self halt
]

{ #category : #connection }
DecisionPointModel >> connectToDestinationFalse: destinationModel [
	
	self outgoingFalse isNil ifFalse: [self halt].
	self outgoingFalse: destinationModel.
	destinationModel incoming add: self
]

{ #category : #connection }
DecisionPointModel >> connectToDestinationTrue: destinationModel [
	
	self outgoingTrue isNil ifFalse: [self halt].
	self outgoingTrue: destinationModel.
	destinationModel incoming add: self
]

{ #category : #'initialize-release' }
DecisionPointModel >> delete [
	
	self outgoingTrue isNil ifFalse: [self outgoingTrue removeIncoming: self].
	self outgoingFalse isNil
		ifFalse: [self outgoingFalse removeOutgoing: self].
	super delete
]

{ #category : #connection }
DecisionPointModel >> disconnectFromDestination: destinationModel [
	
	destinationModel = outgoingFalse ifTrue: [outgoingFalse := nil].
	destinationModel = outgoingTrue ifTrue: [outgoingTrue := nil].
	destinationModel incoming remove: self
]

{ #category : #accessing }
DecisionPointModel >> figureType [
	
	^DiamondFigure
]

{ #category : #'initialize-release' }
DecisionPointModel >> initialize [
	" Set the listActivity as simple methods of the target class "
	
	| list list2 |
	list := List new.
	list addAll: self targetClass methodsForTesting.
	self listActivity list: list.
	listActivity selectionIndexHolder onChangeSend: #activityChanged to: self.
	list2 := list copy.
	list2 addFirst: self class defaultName.
	self selectedActivity value: list2 first.
	self activityChoices value: list2
]

{ #category : #accessing }
DecisionPointModel >> outgoingFalse [
	
	^outgoingFalse
]

{ #category : #accessing }
DecisionPointModel >> outgoingFalse: anObject [
	
	outgoingFalse := anObject
]

{ #category : #accessing }
DecisionPointModel >> outgoingTrue [
	
	^outgoingTrue
]

{ #category : #accessing }
DecisionPointModel >> outgoingTrue: anObject [
	
	outgoingTrue := anObject
]

{ #category : #connection }
DecisionPointModel >> removeOutgoing: anOutgoingActivity [
	
	self outgoingTrue = anOutgoingActivity ifTrue: [self outgoingTrue: nil].
	self outgoingFalse = anOutgoingActivity ifTrue: [self outgoingFalse: nil]
]

{ #category : #printing }
DecisionPointModel >> storeOn: aStream [
	
	| deps outgo incom build uiSess outTrue outFalse |
	deps := self myDependents.
	self myDependents: nil.
	outgo := self outgoing.
	outgoing := nil.
	incom := self incoming.
	incoming := nil.
	build := builder.
	builder := nil.
	uiSess := uiSession.
	uiSession := nil.
	outTrue := outgoingTrue.
	outgoingTrue := nil.
	outFalse := outgoingFalse.
	outgoingFalse := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			outgoing := outgo.
			incoming := incom.
			builder := build.
			uiSession := uiSess.
			outgoingTrue := outTrue.
			outgoingFalse := outFalse]
]
