Class {
	#name : #BitmapImageLibrary,
	#superclass : #Object,
	#instVars : [
		'observer'
	],
	#classInstVars : [
		'imLibPage'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #resources }
BitmapImageLibrary class >> VacaBitmapImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #VacaBitmapImage"
	
	<resource: #image>
	^Image
		extent: 44 @ 60
		depth: 6
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 289 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1638 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1830 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 256 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5685 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@TEDQDDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAPTQDPPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAB4-@@@@@@@@DA@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDKR4@@@@@@@@PD@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDDA@@@@@@@@@@@B@ A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PPD@@@@@@@@@@@HB@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA4]@@@@@@@@@@@WE0PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDGQ4@@@@@@@@@@A\WA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@\G@@@@@@@@GA0DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA0\@@@@@@@@\G@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@JB PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@(JA@PDA@PDA@PDA@@@A@PDA@PDA@PDA@PDA@PO@@@@A@PDA@PDA@P/K0@@FA ]GPLCC0<.K @@K"8@@@@@A@PDA@PDA@PDA@<@@@@DA@PDA@PDAB</@@@XFA4]@0LOC28.@@@.K @@@@@DA@PDA@@@@@@@@@@@@A$Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@PD@@@@@@@@@@@@FQ$@@@@@@@@@@@@@@@@@@@@@@@@#H0@@@@@@@@@@@@@@A@PDA@PDAA0\EP@@@@PDA@P@@@@@@@@@@@@@@@@DA@@@@@@DA@PDA@PDA@PDA@PDA@PDGA0UEP@@A@PDA@@@@@@@@@@@@@@@@@PD@@@@J@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@JB PD@@@@@@@@@@@@@@@@A@PVE PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@(JA@P@@@@@@@@@@@@@@@@DAAXVA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@(@@@@@@@@@@@@@@@@@@@@@@@@@KB0DA@PDA@PDA@PDA@PDA@PDA@PDA@PDB (@@@@@@@@@@@@@@@@@@@@@@@@,K@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@@@@@LC@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@@@@@0LA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P^G H@@@@@@@@@@@@@@@@@@P@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA8^@ H@@@@@@@@@@@@@@@@A@PPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@B</A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@K2<DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@UEPPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@ATUA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAAHR@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDD!H@@@@@@@@@@@@@@B$DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@J0PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@+A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA@P@@@@@@@@@@@@@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDDA@@@@@@@@@@@@@@@@@@@@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P.K @@@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAB8.@@@@@@@@@@@@@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@@@XFA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@@A XDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@@$I@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@@BP$A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@(J@@@HB@,KIRT@@@@IA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDB (@@@ HB0,%IP@@BP$DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P!HP@@I"XDA@4M@@@@E@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDABD!@@@&I PDCP4@@APTA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDG1<@@A(ZA@PC@0@@JB DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P_G0@@F!(DA@LC@@@(J@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@NC PDI2\@@A,[A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@8NA@P''I0@@F1,DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PSD0@@H"HDAA X@@@*J PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAALS@@@"H PDFA @@B(*A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@APTA@PD@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDABX&EAPDA@PDA@PQDPPDA@PDA@PDA@PDA@PD')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> agent1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #agent1Image"
	
	<resource: #image>
	^Image
		extent: 37 @ 70
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3437 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2087 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2858 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9NQXI@@@@H $9NS$9NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9NS$-@@@@@@@@LPD9NS$9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NS$''CP@@@@@@@@@ONS$9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$A@@@@@@@@@@@@@@D9NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9F!L@@@@@@@@@@@\=NS$9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NTIC@@@@@@@@@@@GQC$9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$DO0@@@@@@@@@@P1X9NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9J@@@@@@@@@@@@@@ANS$9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NS$=@ @@@@@@@@\XNS$9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9NTUC@@@@@@\UNS$9NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9NS$9D@@@@@@*NS$9NS$9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NS$9NTT@@@@+C#$9NS$9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9NT,@@@@@@@AKNS$9NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS%BL @@@@@@@@@@@B42P#$9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NQ @P0@@@@@@@@@@@@@@@DL@FC$9NS$9NS$9NP@@@C$9NS$9NS$9NQX@@@@@@@@@@@@@@@@@@@@@@@@^NS$9NS$9NS$@@@@9NS$9NS$9NS$I@@@@@@@@@@@@@@@@@@@@@@@@BS$9NS$9NS$9@@@@NS$9NS$9NS$(@@@@@@@@@@@@@@@@@@@@@@@@@CX9NS$9NS$9NP@@@C$9NS$9NS$9G0\@@@@@@@@@@@@@@@@@@@@@@@ACIC$9NS$9NS$@@@@9NS$9NS$9NR4@@@@@@@@@@@@@@@@@@@@@@@@@@C(9NS$9NS$9@@@@NS$9NS$9NRL@@@@@@@@@@@@@@@@@@@@@@@@@@@@@G#$9NS$9NP@@@C$9NS$9NS%N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$9NS$9NS$@@@@9NS$9NS$9@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@NS$9NS$9@@@@NS$9NS$9LBT@@@@P@@@@@@@@@@@@@@@@J0@P@@@@A0T9NS$9NP@@@C$9NS$9NR4@@D(0NTD@@@@@@@@@@@@@@@HVNP8;@@@LNS$9NS$@@@@9NS$9NQX@@@@@B#$V@@@@@@@@@@@@@@@@E#$9S@@@@@P9NS$9@@@@NS$9NS$C@@@@S#$9DP@@@@@@@@@@@@@@@@D9NT8@@@ANNS$9NP@@@C$9NS$V@@@@@@P9NR$@@@@@@@@@@@@@@@@ANS$V@@@@@@D9NS$@@@@9NS$9R@4@@@@9NS$5@@@@@@@@@@@@@@@@G#$9NS(@@@\0NS$9@@@@NS$9NP@@@@\=NS$9E @@@@@@@@@@@@@@@@D9NS$=A0@@@C$9NP@@@C$9NTIC@@@@NS$9NQD@@@@@@@@@@@@@@@AANS$9NP@@@DMKNS$@@@@9NS$!@@@@EC$9NS$Q@@@@@@@@@@@@@@@@G#$9NS$T@@@@RS$9@@@@NS$A@@@@@BL9NS$9DP@@@@@@@@@@@@@@@AD9NS$9H0@@@@@9NP@@@C$9B@@@@B49NS$9NQD@@@@@@@@@@@@@@@@VNS$9NS$L@@@@G3$@@@@9NP@@@@\=NS$9NS$V@@@@@@@@@@@@@@@@DS$9NS$9K1L@@AH9@@@@NS$@@@@@JC$9NS$9DP@@@@@@@@@@@@@@@AX9NS$9NS$@@@@@NP@@@C$9L@@@P#$9NS$9NTD@@@@@@@@@@@@@@AL#NS$9NS$9AP@@RC$@@@@9NS$V@S$9NS$9NS$)@@@@@@@@@@@@@@@SF#$9NS$9NS%AE#$9@@@@NS$9NS$9NS$9NS$9RA$@@@@@@@@@@@@@J4T9NS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9SPX@@@@@@@@@@@@@@@@:NS$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NT4@@@@@@@@@P0@@@@@@H D9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$/P0@@@@@@Q0T@@@@@@@\ENS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9P@@@@@@@EC$9I0@@@@@@S#$9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS\@@@@@A1\9NPTG@@@@@@,9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NQX@@@@@@@@ANS$A@@@@@@@@E#$9NS$9NS$9NP@@@C$9NS$9NS$9NS$0IP@@@@@:NS$9NTX@@@@@R$ 9NS$9NS$9NS$@@@@9NS$9NS$9NS$9Q @@@@@+QS$9NS%E@@@@@@@.NS$9NS$9NS$9@@@@NS$9NS$9NS$9NP@@@@@@@B$9NS$9R0@@@@@@@C$9NS$9NS$9NP@@@C$9NS$9NS$9NTH@@@@@@@@JNS$9NP(@@@@@@@@<NS$9NS$9NS$@@@@9NS$9NS$9NS%I@@@@@@@PNS$9NS$9@0@@@@@+QS$9NS$9NS$9@@@@NS$9NS$9NS$9N @@@@AJLC$9NS$9NS4G@@@@@@@9NS$9NS$9NP@@@C$9NS$9NS$9E @@@@@@@AX9NS$9NS$A@@@@@@@@@S$9NS$9NS$@@@@9NS$9NS$9NQ\G@@@@@CD9NS$9NS$9NSD@@@@@IS@9NS$9NS$9@@@@NS$9NS$9NP(ON0@@@@@INS$9NS$9NS%N@@@@@@@3NS$9NS$9NP@@@C$9NS$9NS%M@@@@@@ACJS$9NS$9NS$9AP\@@@@@KC$9NS$9NS$@@@@9NS$9NS$9PP@@@@@@@@D9NS$9NS$9NP(@@@@@@@@VNS$9NS$9@@@@NS$9NS$9NP8M@@@@@BD9NS$9NS$9NS$9D@@@@@@YRC$9NS$9NP@@@C$9NS$9NS$!@@@@@C,8NS$9NS$9NS$9NP +@@@@@BD9NS$9NS$@@@@9NS$9NS%M@@@@@@@?MS$9NS$9NS$9NS$V@@@@@@@]@S$9NS$9@@@@NS$9NS$9P#<@@@@@@C$9NS$9NS$9NS$9NP@@@@@@P2$9NS$9NP@@@C$9NS$9NT8@@@@@@B@9NS$9NS$9NS$9NS%N@@@@@@@INS$9NS$@@@@9NS$9NS$:@@@@@D(0NS$9NS$9NS$9NS$9ASP@@@@@D#$9NS$9@@@@NS$9NS%A@@@@@@@@G#$9NS$9NS$9NS$9NPD@@@@@@@@ANS$9NP@@@C$9NS$9OT(@@@@@@C$9NS$9NS$9NS$9NS$9KP@@@@@GOS$9NS$@@@@9NS$9NR@@@@@@J3H9NS$9NS$9NS$9NS$9NTTM@@@@@BX9NS$9@@@@NS$9NP(>@@@@@A1BNS$9NS$9NS$9NS$9NS$)@@@@@@@@NS$9NP@@@C$9NS$9M @@@@@@SS$9NS$9NS$9NS$9NS$9B @@@@@@@C$9NS$@@@@9NS$9NTT@@@@@RS$9NS$9NS$9NS$9NS$9NS%N@@@@D4T9NS$9@@@@NS$9NS$9F0@@BP(9NS$9NS$9NS$9NS$9NS$9NTT6@C@9NS$9NP@@@@@a')
]

{ #category : #resources }
BitmapImageLibrary class >> arrowNext [
	
	^OpaqueImage
		figure: self arrowNextImage
		shape: self arrowNextMask
]

{ #category : #resources }
BitmapImageLibrary class >> arrowNextImage [
	
	<resource: #image>
	^Image
		extent: 28 @ 16
		depth: 5
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3597 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3790 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 3147 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3244 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3340 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7869 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3469 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4111 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4400 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4657 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7227 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3469 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4625 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4529 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4561 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4721 1927)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'APTEAPTEAPTEAPTEAPTEAPTEAP$GAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTCBP\EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@0LIA0TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPLC@0$GAPTEAPHC@0LC@0LC@0LC@0LC@0LC@0LC@0XCBP\EAPTA@ LC@0LC@0LC@0LC@0LC@0LC@0LOA LIA0TEAPDB@0 NDQDQDQDQDQDQDQDQDQDQDP<F@0$GAPTE@PHCB@8QDQDQDQDQDQDQDQDQDQDQC0XCBP\EAPTP@0PJDQDQDQDQDQDQDQDQDQDQDP,@@04LAPTP@0PJDQDQDQDQDQDQDQDQDQDQDP,@@04LAPTP@0LC@0LC@0LC@0LC@0LC@0LC@0,@@04LAPTP@0LC@0LC@0LC@0LC@0LC@0LC@0L@@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPLC@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTC@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@04LAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP4LAPTEAPTEAP@a')
]

{ #category : #resources }
BitmapImageLibrary class >> arrowNextMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #arrowNextMask"
	
	<resource: #image>
	^Image
		extent: 28 @ 16
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240 255 255 255 240]
]

{ #category : #resources }
BitmapImageLibrary class >> arrowPrevious [
	
	^OpaqueImage
		figure: self arrowPreviousImage
		shape: self arrowPreviousMask
]

{ #category : #resources }
BitmapImageLibrary class >> arrowPreviousImage [
	
	<resource: #image>
	^Image
		extent: 29 @ 15
		depth: 5
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3597 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3790 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 3147 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3244 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3340 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7869 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4400 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3469 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4657 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7227 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4111 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3469 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4625 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4529 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4561 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4721 1927)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'APTEAPTEAPTPAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTEAPTED@LEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@TEAPTEAQ@C@0TEAPTEAPTEAPTEAPTEAPTEAPTE@@@@APTEAPTP@0LCAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTED@LD@0LC@0LC@0LC@0LC@0LC@0LC@0LMB0@@@@TEAQ@CA@ C@0LC@0LC@0LC@0LC@0LC@0LCCP,E@@@@APTP@0PHDQDQDQDQDQDQDQDQDQDQDP(@@04KAPT@@@@ED@LDBADQDQDQDQDQDQDQDQDQDQDJ@@LMB0TEAP@@@@DB@0$NDQDQDQDQDQDQDQDQDQDQDP<F@00GAPTE@@@@APDB@0$NDQDQDQDQDQDQDQDQDQDQDP<F@00GAPT@@@@EAPDB@0$N@0LC@0LC@0LC@0LC@0LC@0LC@00GAP@@@@TEAPDB@0$C@0LC@0LC@0LC@0LC@0LC@0LC@00G@@@@APTEAPDB@0LCAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@EAPTEAPDB@0LEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@TEAPTEAPDB@0TEAPTEAPTEAPTEAPTEAPTEAPTE@@@@')
]

{ #category : #resources }
BitmapImageLibrary class >> arrowPreviousMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #arrowPreviousMask"
	
	<resource: #image>
	^Image
		extent: 29 @ 15
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248 255 255 255 248]
]

{ #category : #resources }
BitmapImageLibrary class >> bike1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bike1Image"
	
	<resource: #image>
	^Image
		extent: 77 @ 45
		depth: 8
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6456 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(321 321 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7130 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5685 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4593 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4946 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2409 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2730 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5267 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 546 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7355 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1220 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6263 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7677 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5492 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6906 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5814 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3629 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2537 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1445 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6809 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1766 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2087 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6038 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3854 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6360 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4175 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4497 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3404 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 899 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2312 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6584 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7259 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7580 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5075 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2858 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5396 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5717 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3212 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3533 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7484 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 256 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1349 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6713 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1670 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5621 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7034 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4850 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3758 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6263 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5171 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2666 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1895 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3308 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 803 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2216 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6167 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6488 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 353 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6841 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7163 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4625 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4978 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2441 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5300 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2762 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 578 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7387 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1252 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3437 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7709 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5524 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4432 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5846 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3661 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5075 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2569 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1477 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1798 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 706 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6070 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7484 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2120 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3886 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4207 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4529 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2344 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4882 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6617 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4753 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7291 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7612 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2890 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5428 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5749 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3244 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1381 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 289 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1702 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6745 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7066 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5653 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5974 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6295 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3790 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5203 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2698 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4111 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3340 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 835 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2248 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6520 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6874 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4336 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7195 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5010 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2473 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5332 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2794 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3147 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 610 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3469 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7420 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1284 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1606 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5557 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4464 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6970 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5878 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6649 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3693 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2601 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1509 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4015 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2923 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1830 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 738 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5107 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2152 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6103 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7516 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6424 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 289 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4240 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7098 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2055 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4561 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2376 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4914 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 513 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4786 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7323 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1188 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7644 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6231 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5460 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6874 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5781 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4368 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3276 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3597 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3918 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1413 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6777 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1734 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5685 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6006 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6327 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5235 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4143 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1959 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3372 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2280 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 867 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6552 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7227 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4689 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7548 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5043 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5364 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2826 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3180 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2087 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3501 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7452 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1316 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6681 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1638 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5589 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4497 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 7002 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4818 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3726 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2633 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5139 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4047 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2955 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1863 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3276 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 770 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2184 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6135 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 1092 1124)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'MST5MST5MST5MST5MST5MST5MST5MST5MST5ZEFLH&PX^^I(MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5MST5MST5MST5MST5MZ7ZPSH-&E+C@A$5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MP@@@CT5MST5MST5MST5MST5MST5MST5MST5MST5* @ZS3T5S6WXV3T5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5@@@@MST5MST5MST5MST5MST5MST5MST5MST5MSVYCV 5MST5MST5MST5MST5MST5MZ6\.)?#+D7R%#K^)H$&MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5MST5MST5MST5MST5C7-IMST5MST5MST5MST5MST5MST5''#4@@@@@@@@@@@@@@AH5MST5MST5MST5MST5MST5MP@@@CT5MST5MST5MST5MST5MST5MST5MST5MST5[)&MMST5MST5MST5MST5MST5MST5@=@B@@@@@@@@@@A. #T5MST5MST5MST5MST5MST5@@@@MST5MST5MST5MST5MST5MST5MST5MST5MSTXVL$5MST5MST5MST5MST5MST5MST5MQG@P @@@@CT62X5MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5MST5MST5MST5MST5E* ^MST5MST5MST5MST5MST5MST5MST5MSU270@WD$<5MST5MST5MST5MST5MST5MST5MP@@@CT5MST5MST5MST5MST5MST5MST5MST5MSU]00D5MST5MST5MST5MST5MST5MST5MST5MSV406T5MST5MST5MST5MST5MST5MST5MST5@@@@MST5MST5MST5MST5MST5MST5MST5MST5I$.?#ST5MST5MST5MST5MST5MST5MST5MST5Y4*&MST5MST5MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5MST5MST5MST5MSWK@I@4MCP4MCP4MCP4MCP4MCP4MCP4MCP4MCR>@AH5MST5MST5MST5MST5MST5MST5MST5MP@@@CT5MST5MST5MST5MST5MST5MST5MST5MW0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AAACT5MST5MST5MST5MST5MST5MST5MST5@@@@MST5MST5MST5MST5MST5MST5MST5MSV7H,E^W%9^W%9^W%9^W%9^W%9^W%9^W%9^W%:&@@"6ZCT5MST5MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5MST5MST5MST5MW[C_#T5MST5MST5MST5MST5MST5MST5MST5S5^:W0B%MST5MST5MST5MST5MST5MST5MST5MP@@@CT5MST5MST5MST5MST5MST5MST5MSU(O[<5MST5MST5MST5MST5MST5MST5MST5MSTYPU:-X8#GMST5MST5MST5MST5MST5MST5MST5@@@@MST5MST5MST5MST5MST5MST5MST5MT @M#T5MST5MST5MST5MST5MST5MST5MST5M](#QCUR_\@5MST5MST5MST5MST5MST5MST5MST@@@@5MST5MST5MST5MST5M[W\]8@5MST5''@@M43T5MST5MST5MST5MST5MST5MST5MSTV*C05MSVU*D@5MX.1$EO@T=YRK#T5MST5MST5MP@@@CT5MST5MST5S7RT)K)$PP@@_QV2CCGC)G=X''ST5MST5MST5MST5MST5MST5MST5M]A"HST5MQX/8WND(P@@@@@@@@@B%[FMMST5MST5@@@@MST5MST5+VZ,@@@@@@@@@@@@@@BH/4D!+#4BRCT5MST5MST5MST5MST5MST5MSTL*T\5MST5MX\@@@@@@@@@@@@@@@@@@K> MST5MST@@@@5MST5MPFN@@A=#KLENUR2Z!=A@@@@J$P5E&8"$H45MST5MST5MST5MST5MST5MUEAD#T5MX6"X @@@@H>-PZ=)57N[0@@@F>%#ST5MP@@@CT5MSU+1PCC%S>MMST5MST5+X=W@@@@S[@51<9AKZ45MST5MST5MST5MST5MSTO''6NMMSTO,0@@@@@  #T5MST5MSV#7D(@@DDSS3T5@@@@MST5JP @^;$5MST5MST5MST5MP=V@@@@4,\5''" @6%,5MST5MST5MST5MST5MT @Q#T5MUL@@@@:\H"#MST5MST5MST556@@@DFWMST@@@@5MQ/E@MJ@MST5MST5MST5MST5YVH "@@@!D<5C7Y=7 L5MST5MST5MST5MST5N<KIMSV=_PAAF$=YH&45MST5MST5MST5C18@@BJOMP@@@CWII@@_,CT5MST5MST5MST5MSTS07:;K0AAI3T5M\"(S]L5MST5"4MCP<\5MS=A7CT5134@@LBMMSU**K05MST5MST5MST5S=4@@H(L@@@@MPT@02,5MST5MST5MST5MST5V36?#SV2@@B_''#T5MX<#&%$5MSWXPTEA0CT5BPIDMST7@@BNI#T5MQD#WD<5MST5MST5MST54]H@@I\@@@A(''0@IMST5MST5MST5MST5MSW[@I,5MZ66@@ATMST5MP;BP(T5MW9S@HRRMX@/3ST5SH @_Q$5MST5M]1A23T5MST5MST5MST5\4D@8@@@@K$@01,5MST5MST5MST5MST5MZP=V3T5MTX@@C85MST5MTN6H-ZMMV#OA3T5D75>MSW[@@CN#ST5MST5K)=)2ST5MST5MST5MSUO5@@@@@@@^ A##ST5MST5MST5MST5MST!H)P5MST5SLT@P$05MST5MV\XPR4OM\3ES@2H0ST5MY @@J\5MST5MST5]4F"MST5MST5MST5MSVP@@@@@@CT@AL5MST5MST5MST5MST5#]4H\ST5MST5F@@@8#T5MST5M\&X@M)[QPA## @3MSVM4 A=DST5MST5MSVM/2M2MST5MST5MST5MW9A@@@@@H @I3T5MST5MST5MST5M]DSPT85MST5MSVI@@CJMST5MST5MT<Z_UXB@@@@@I1[MY9?@E!(MST5MST5MST8H+ +MST5MST5MST5K"L@@@@@H @+MST5MST5MST5M[:\34FF2ST5MST5M[8@@A45MST5MST5MSV2@@@@@@@@@IP5CDD@#CTOK"V@/KDJY''&(@LU''MST5MST5MST50 @@@@CC@F05MST5MST5MST5!3CZTD<5MST5MST5G@@@GST5MST5MST5MQ4@@@@@@@@@B=&G@@A/Z^CEH @@@@@@PTD@@,\5MST5MST5MSWB@@@@@@,@&3T5MST5MST5MST5MST5MST5MST5MST-@@BCMST5MST5MST5S @@@@@@@@@@K4)J@FI &A:5$DXP.7:Q&=)+MST5MST5MST5V6P@@@@@I@@7MST5MST5MST5MST5MST5MST5MST5M^D@@E$5MST5MST5MST\@@@@@@@@@JD%''%$@0=\5MST5MST5MST5MST5MST5MST5MSU%PP@@@@@,@K 5MST5MST5MST5MST5MST5MST5MSWQY@@BCCT5MST5MST5MSE"@@@@@@@@Z#T5SG<@I3T5MST5MST5MST5MST5MST5MST5MPT@*P@@@A@@H"D5MST5MST5MST5MST5MST5MST5M],@@L85MST5MST5MST5MXEA@@@@@F&#MST5H@A<MST5MST5MST5MST5MST5MST5MSVM&PAU@@@@2\H@7ST5MST5MST5MST5MST5MST5MSUOX0@@XST5MST5MST5MST5MZ>?B6J_13T5MSTJ@LL8MST5MST5MST5MST5MST5MST5MYIA@E@@@@@5 PA"FST5MST5MST5MST5MST5MST5MTT@@A<.MST5MST5MST5MST5MST5,:D%MST5MV#R@I&-MST5MST5MST5MST5MST5MSWI1@CD+P@@@CU[#@B_(3T5MST5MST5MST5MST5MSU5@ @@*#T5MST5MST5MST5MST5MST3@C$5MST5MX==@M$5MST5MST5MST5MST5MST5#S0@H&05@@@@MSV](PA#(3T5MST5MST5MST5MST5F34@"!4OMST5MST5MST5MST5MST5MTM?6-^-MST5MV4@PZJMMST5MST5MST5MST5MX5]@@CPMST@@@@5MSUFH B_VST5MST5MST5MST5S9.)@FR.MST5MST5MST5MST5MST5MST5U @@@FT5MST52^D@PX^+MST5MST5MST5MST%! @@A2X5MP@@@CT5MSTF[0A"7RD5MST5MST5S;-<PPAX''ST5MST5MST5MST5MST5MST5MSV''(*J"IST5MST54P\@@K+H"3T5MST5MSV+GW,@@M)[MST5@@@@MST5MSUYCP@@H''@7I7OUM,BLPP@@)DL5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5+Y\/@@AJN+KKAHVAEFP@@JF"C3T5MST@@@@5MST5MSU[W#4@@@@@@@@@@@@@[%POMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5M\Y8*@@@@@@@@@@@@@"F$3T5MST5MP@@@CT5MST5MST5''"&G%*%=X%!W-GPOMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSTQ$D]Z[4F!''8P]$ST5MST5MST5@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> bird1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bird1Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 71
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTU@1HUEP(UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP,V5Q_BC9TF5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTG2MTV6UTK&@>IC1TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUB!%G6AOW3]FVPQLUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP>RQYIMD1"HP9"E%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTZ3]-P0P)BU -P2)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPLG00APR4IX#(]P$EKUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTV5LPPQUBP ABP$HUU%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUFX)K!4@@@@@@@ABERYTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ&T&U*P @@@@@@P%TZUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTHP<Q@@@@@@@@@@@''H -TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDXUI1T@@@@@@@@@UP<LUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUA=%ETH@@@@@@@@@@ETOAUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP>S4IB@@@@@@@@@@ABUPYTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTARUB@@@@@@@@@@@@P!TFUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUCI"@DH@@@@@@@@@@AT:N5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP.EP@@@@@@@@@@@DIBEVUTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTLDIBP @@@@@@@@AB@AU)UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTG0QB@@@@@@@@@@@@@DHUYUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD)MP @@@@@@@@@@@@ABP&UTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQLC4H@@@@@@@@@@@@@P%T<UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ^HAT@@@@@@@@@@@@@@AUBF@1TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTW3P@@@@@@@@@@@@@@@ABP"4BUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUF =@@@@@@@@@@@@@@@@@DHOV5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQLC0@@@@@@@@@@@@@@@@@@@@4_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTM @@@@@@@@@@@@@@@@@@@DHDO%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUBAB@@@@@@@@@@@@@@@@@@@@I4)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPSP @@@@@@@@@@@@@@@@@@P!4LUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTI @@@@@@@@@@@@@@@@@@@@AUMUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUC,''P @@@@@@@@@@@@@@@@ABI41TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQDX$H@@@@@@@@@@@@@@@@@@AT.UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTVPP@@@@@@@@@@@@@@@@@@DHUQ%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUF,XP @@@@@@@@@@@@@@@@@@@BYTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP_LDH@@@@@@@@@@@@@@@@@@ATXUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUBYU@@@@@@@@@@@@@@@@@DIBYUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQGI0@@@@@@@@@@@@@@@@@@EVUTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTN6(@@@@@@@@@@@@@@@@@P$H5UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUCT:@@@@@@@@@@@@@@@@@DIUN5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQVZ @@@@@@@@@@@@@@@@ABC6!TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTXQT@@@@@@@@@@@@@@@@@@@=_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTVU]B@@@@@@@@@@@@@@@@@DIOG5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTF6![@2D;N60O@@@@@@@@@@@@@@@@@@A*Y"=TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP_TV1"C5T''C0<UP @@@@@@@@@@@@@@@@@@[ ITUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTBFHUEUTUP$IB@@@@@@@@@@@@@@@@@@ABP%\LUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTG2@C[F8''EQT@P @@@@@@@@@@@@@@@@@@UTH0G5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ^UEQ(RV(U@DH@@@@@@@@@@@@@@@@@@AUUQ%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDT7P @@@@@@@@@@@@@@@@@@@@ABER-_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTE$DUP @@@@@@@@@@@@@@@@@@@@ABL6L_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEM"P @@@@@@@@@@@@@@@@@@@@@@P!UAC H_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTO&$^ETH@@@@@@@@@@@@@@@@@@@@@@@@@@EUMADX$W5QTUEQTUEQTUEQTUEQTUEQTUEP>SA0]P$IB@@@@@@@@@@@@@@@@@@@@@@@@@@@@P$IBX#\HE#9TUEQTUEQTUEQTUEQTG1\&U44UP ABP @@@@@@@@@@@@@@@@ABP @@@@@@P @@@AUBN$EIR%QTUEQTUEQTUEQTE#A"P$IBP @@@@@@@@@@@@@@@@@@@@@OJVACN AB@@@@@@@@@@@UC4]TUEQTUEQTUEQTT6QB@DH@@@@@@@@@@@@@@@@@@@@@@@@@PVL8J%Y"ETH@@@@@@@@@ETH4UEQTUEQTUEQTE#4UP AB@@@@@@@@@@@@@@@@@@@@@@@@C1P>UEQTRFXDZ @@@@@@P$H"Q%QTUEQTUEQTG4$@@@@@@@@@@@@@@@@@@@@@@@AB@@ABZ#@>UEQTUEQTA M\UQUBEQTUBA=TUEQTUEQTG2X:@@@@@@@@@@@@@@@@@@@@@@@@@DIBW@ >UEQTUEQTUEQTJ#EWPU\0O4)TUEQTUEQTUA)\@@@@@@@@@@ABP$H@@@ABP$H@ETH''FU4[UEQTUEQTUEQTUEQTCEDLUEQTUEQTUEQTUD0]EP@@@@@@@@@@P$IB@DH@P @@P $GS@1TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUAIA@@@@@@@@@@@@@DIBP AB@DIBBU]LNUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUB(DP @@@@@@@@@@@@@@@DIUUR\IH"8LUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTU@-+O&!WP$H@@@@@@@@@@DH@P%TDJ2XHY3!TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPLM$@TWDIB@@@@@@ABP$IUEVQPTQ=TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTKCHVCR\UP @@P$H@@DH:U3-_UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUBYVBC]"EQUBP$IB@@=IY&]TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQSN29SVE\"P!TOAF0JV"=TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPVYS,$U6H"YP1TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ_QBL_Q35SJ$9TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTG0!(UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP8UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPb')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> bird2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bird2Image"
	
	<resource: #image>
	^Image
		extent: 63 @ 47
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4207 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2858 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1830 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LB5!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSA9FR#!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD08HS%YK41LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSC,_YT<EJT1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LMA0SV$D4ND1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD04C"XSV&\GSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LKCQZI!LSV$5@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LMCTSD3(3H@D8SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSCH4H$8SN!L9A@]LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LQSQ)D3(@D09^@SILSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD02I08:N#(:D4$7RB1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSA)^N#(@N!L:C"H>B41LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LFTD&S$8:S!L&D4$HND1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD0GS6T:D0@:N!L:YQDGSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LU50IS!L:D0@:N#(&W&P8SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD0,WD<&D3(:@@@@N"X"XEALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1[T09%@@@@@@ANS%)SJD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD0MI#(@@@@@N#(:C$XJS@-M@S!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LJRH:N @@@@@@@AM%O%\ZO 81N41LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LS@)_L3(@@@@@@@@@N XGSB%OS"H4ND1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LN3T@@@@@@@@@N @+GT1LCVUNNT4KSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSB%K@@@@@@@@@AL:C!ILSD4NS#)ZP"%LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1XES(:N#(@@@@@N 9_SD1SS @@@CMOK41LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDLNN#(:@@@@N @NW41WY1L@@@ANS XTSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0/IC(@@@@@@AL@YQD,JPHS@C(:@ALNW41LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LY L&D0@@@@@:@BYFVB]ZN @:N#(&C%=LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0>C @S@@@@@ALSA$5OL3(:S#(:N X;SD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LM#TSN @@@@ANN 9ZL1L@N$8SI$P;U41LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSFHFN @@@@@:N#(:N!LSS @@C%=!SD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD02Q#L@@@@@N#(:N @:N ANQ25LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@EU@@@@@C(:N#(@@@@:I!Y"FU JSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD08PP@@@@@:N#(:@C(:@@9ODTYSK%XKSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@4:@@@@@@@@@@@@@@@:N#(:D3)Z@51ESD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1''D0@@@@@@@@@@@@@@@@@@N#(@N 8_X44GSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0<H @@@@@@@@@@@@@@@@@@@C(S@D9%C$]ZH!,]B41LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LUA0:@@@@N#(:N#(@@C(@@C(SD5U^MAP)H2$<RFHKSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1!UC@SN @@@C(:N#(@@C(@@@@SNUD]VD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSB ]Y4]NN!L@@@@:N#(:N#(SN"X"EQ]@SD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LU2)FNS(SN @:@@@:@@@:D1L@C"QMJ%!LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1LSD1LSD1LSD0ZK5<"D3(:N$8:@@@:@ALNWU8=UE0KSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD0,SB$4Y2IZQ00\Q10FT3PPYE1HJVYLF$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LJEI\UF!ADSPOA6H*X$(%B$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@ALSD1LSD1LSD1PA2(XO0E"ND1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LTE!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@D1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> bird3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bird3Image"
	
	<resource: #image>
	^Image
		extent: 61 @ 36
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4143 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4111 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JG@@@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)RT5,HX!1JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)SHBAMT$)JBFP-F5UDUS(LL%$6U2]SGD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR  6EQ<_Q4U\J1HJC0<OR4,OC3,OC4P[MDH+DP!JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JA0!\CUQ#QD-KR4,JK5DOC4-KR4-KR4-KID,;C0<OQA=]J0]JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$4MO$\UDA<EC2QKC4,;R2POC0=KR4-KR4-KR4-KR0<OR3,OC01YCQQJR$)JR$(VT2@ GAYRR$)J@@@@R$)JR!0QFPYNIVA$FV@NERPOR0<ON0<OR4-KR4-KR4,OC0<;N0=KR0=KB# PERINCQETET0/K4A]ACXHR @@@D)JR$)JR$)JR$)JR$)JPT0;IBQKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,>J!L5X30_KDPJB T:SAUYT4(@@@AJR$)JR$)JR$)JR$)JR$8OR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,7FS%JR$(9BE1$D586BA0VR$)J@@@@R$)JR$)JR$)JR$)JR$(KUT-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KC0U^L4)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JX$1KID-KR4-KR4,OC4,OR0<OC0<OR4-KR4-KC0=KF5]JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JGA!UC4-KR4-KR4-KR4,OC0<ER0<OR4-KR4-KR0<;R0(]X$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JL29UR0<$ID-KR4-KR4-KC0(US$P;N0=KR4-KR4,O@@<OKE=JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JNT$JR4,$R4-KR4-KR4,7N$0FGDEUN0<OR4-KR4-KC4,;ID,)T4)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JE#XAC0=KR4-KR4-KC4,$G1D9R$(''UP<OR4-KR4-KR4,OC0<OK35JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR#5@R0<$R4-KR4-KR4,$N!MJR$)JNQ=KC4-KR4-KR4-KR4-KR1(!R$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$(6F$,$R4-KR4-KR4-KG0YFR$)JR$()C0=KR4-KR4-KR2P$ID,7AAYJR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)SKP=KR3-KR4,$C4-KB"H&R$)JR$)JU#!KR4-KR4-KR4-KR4-KC4\\R$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JBCH$C4-KR4-KC6EKIAUAR$)JR$)JR!X%B$-KR4-KR4-KR4-KR2PABD)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$</N0=KID-KR4,OR5 MR$)JR$)JR$)JO6LOR4-KR4-KR4-KR4,OXQEJR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$(QUP<OR4-KR4-KN5TIR$)JR$)JR$)JR%HSB$-KR4-KR4-KR4,OR3-GR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JM$,OC4-KR4-KC0(>BD)JR$)JR$)JR$)JP4!KC4,$R4-KR4-KR0<;G45JR$)JR$)JR$)JR @@@D)JR$)JR$)JGB4;C0=KR4,$IC,4NT)JR$)JR$)JR$)JR%-#C0<OR4-KR4-KR0<;R0)WR$)JR$)JR$)JR$(@@@AJR$)JR$)JR#$BC4,OR4-KC0<_WD)JR$)JR$)JR$)JR$)RFA(;C4-KR4-KR4-KN4,7G$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)\B#,;N0=KR3\WOT)JR$)JR$)JR$)JR$)JR#42R4,OR4,OR4-KR4,;C6MFR$)JR$)JR$)JR @@@D)JR$)JR$)JS$,ON2P$XUT(WD)JR$)JR$)JR$)JR$)JR$)JFS(;N3,OC4-KR0<OC4-LST)JR$)JR$)JR$(@@@AJR$)JR$)JR%@;C4,OM1ANV4)JR$)JR$)JR$)JR$)JR$)JR$YYB#,;N0=KR4-KR0=KSEMJR$)JR$)JR$)J@@@@R$)JR$)JR  :C4,$B"L*R$)JR$)JR$)JR$)JR$)JR$)JR$)JT4\$C0<OC0=KC4-KR5 ''R$)JR$)JR$)JR @@@D)JR$)JR$(6B <OH6AAR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(''MD,OC0<;C3-KR2P2ST)JR$)JR$)JR$(@@@AJR$)JR$(TJ@($K04VR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$DUR0<ON3,;R4,$D ]JR$)JR$)JR$)J@@@@R$)JR!0''K!$BSDUJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JWC@JC0=KC4-KM5%JR$)JR$)JR$)JR @@@D)JR$(CVU]VMP!JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)AMS0:N )KR0)^R$)JR$)JR$)JR$(@@@AJR$)JNS%JWB]JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR!1AFSE#AS,#WD)JR$)JR$)JR$)J@@@@R$)JR$)JR!1JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JPU4JM$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)AV !JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@')
]

{ #category : #resources }
BitmapImageLibrary class >> blankImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #blankImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 63 @ 63
				depth: 1
				bitsPerPixel: 1
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'))
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> bull1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bull1Image"
	
	<resource: #image>
	^Image
		extent: 84 @ 54
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2344 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1638 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4689 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2409 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1606 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4721 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT#YBEB _S51PU!Y]UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTTP@@A)@F$@D@@EUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUO@@-CZP@@@@@5UUUUUUUUUUUUUUUYK&DZR!TZUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT&ZP@@F0@[D@A)QP$ZLQ5EL0 ADA@[@@@@@@@[JBIUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT-WU0ACD@ACF1@@P4L@@@@@@@@@F4L@@DMCP0@[@E\PD50ZCUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUDP@<@A@@F1AWP0AWZP@@F1,@@A,+@@@@P4MC@@@@F0@@U1,@P6$&J&H%M3@YCEUUUUUUUUUMW0$0WU1$U%)UUUUUUUUUUUUUUUUUUUUUUUUUUUUZOC0@ZP@<@A,@@C0@@DMCP4L@@@@@P4MCP0@@P1,@J0@P@@@+F5]C@@@@@DMC@DMWP0@@P4L[@@ACF0@@F0@FX %UUUUUUUUUUUUUUUUUUUUUUUT$@F$@@E\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A-C@@@RE!)UUUUUUUUUUUUUUUUUUUTVF0ACJ0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ACZU\@@C0PE%IUUUUUUUUUUUUUUP$@DE\+P30@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E]C@DMWU4L@@A@FSUUUUUUUUUUUUTHP@@@@D@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P1-WU1-COB,@G5UUUUUUUUUUE#0@ZTL@@DL@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E]WF0@@@@AWU0AW@@]UUUUUUUTZ@A@@@B-CU1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DL[U2-)U4L@F1@@U1]UUUUUUUT_U0@P@@ACP0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A,@@@@@@DMC@B,3@A=UUUUUUS=WO@@@D@A)J1,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ACU5\[P4MCJ3 )P4IUUUUUUS= F5] G6QK[CUFRA@@@@@@P0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EY!@D1UUUUUUUUUW5UUUUUUUUUUUP$,J1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@J50I@FAUUUUUUUUUUUUUUUUUUUUUUUU+A @PU0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@U60)@AAUUUUUUUUUUUUUUUUUUUUUUUUUCP@@J0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P0IQP1AUUUUUUUUUUUUUUUUUUUUUUUUUUSLP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@F3P)@DIUUUUUUUUUUUUUUUUUUUUUUUUUUQ9LP0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B8X@FYUUUUUUUUUUUUUUUUUUUUUUUUUUUURJ0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A9R@B)UUUUUUUUUUUUUUUUUUUUUUUUUUUUUS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@J5UPU09UUUUUUUUUUUUUUUUUUUUUUUUUUUUUFPAWZP@@F0AC@@@@@@@@@@@@P0A)@A,@U0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ETJP49UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUP!)P0@<F0@[@@@@@@@@@@@+ZTL@@A,[@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ZUU"@FIUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU1C@@@+F4L@@@@@@@@@@@@@P1,@P1-C@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@U5T3F5YUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTP@ZP@@U1,@@@@@@@@@@@@[@@A)P0@@O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@F-''J4EUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU J5\@ODL@@@@@@@@@@@@@@@@<@B,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C(8@@)UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTH@@ACZP@[@@@@@@@@@@@[ZP@@@A@<P0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CT&@AEUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUKHPACP4L[@@@@@@@@@@@@@C1CU0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FI F0QUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUO%]C@A@@@@@@@@@@@@@@XA=NS%9)@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P2YW@@EUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUQ2 <@A,[F1@@@@AWU5\@S5UUUUUGMTD A -CP1-C@B,@@A@[@C1W@DMW@DL@@E\@D@@[ZTMCJ0@[J4MMUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUVI @[@@@@U30<@@@+QUUUUUUUUUUUUUU_TUAES%LPF4L<@@AW@@@@U4L+@@@P@@@P@A@@F1,@@@@BUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUP1QWD0@ZP@@F5]WB%UUUUUUUUUUUUUUUUUUUUU_S @@D@@+@@@+@A,<@F$@DA=)@DL[ZTMW@B-AUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUV@@F0AWU0@+TEUUUUUUUUUUUUUUUUUUUUUUUR83@A@@U0XII @@F0@<@A)RDDL[@@@PP0@/UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUS0P@A@P@@@@[EUUUUUUUUUUUUUUUUUUUUUUUUT?@DMWDD-UB!@[D@@@DBIUB @@@A,PF0@WUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUP@P@A,@@F$@T%UUUUUUUUUUUUUUUUUUUUUUUUUUKF% U5UUUR-)@A@@P0)UO3H@ZQ,@J2-#UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUQ@@O@@@ZP@<JUUUUUUUUUUUUUUUUUUUUUUUUUUUK $)A5UUUT@P@@@PU3MUUT8[F0@P@A,5UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUP!CP0AWO@@@FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUR$@OB,@F3UUUU0@@B,8@@@MUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU [P0@@D@@@G%UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU^@@A)G5UUUQ)C@@@EZPAUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU<@@B,VT30@O5UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT4@F1-CJUUUUU(+F2EZ@@MUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT,D@@5YE])UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUR$+P4L3UUUUUS$@@FAUL&)UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT#DF%%F@AWKUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUVHP@A@MUUUUUUUCF2YUY3-UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"@B-UA2,@F%UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTH@DA=UUUUUUP0<P0EUWEYUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU@P0AUUR,@B%UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUMQ,@F5IUUUUUUU=C@BYUV#QUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT3@AA_UV%WGEUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUS&$@P%UUUUUUUR8@F41UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU[@@@IURD@P%UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUX@ACPUUUUUUUUR%)@B-UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT8@@A,URYW@E=UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTJZP@@I5UUUUUUUV0@J0@)UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUBZPAEF$L+@CUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTT+@@@HUUUUUUUUBV@@@E],UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT,P@B-IA @@@EIUUUUUUUUUUUUUUUUUUUUUUUUUUUUUY0@@P1AKUUUUUUT?SDL<I#=UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUK -CU4L@F0A)XC%UUUUUUUUUUUUUUUUUUUUUUUUUUUTNO@AWGAYUUUUUUUTVB0@@C5UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUA$L[@DL@@B,@PEUUUUUUUUUUUUUUUUUUUUUUUUUUUU1W@@@@H%UUUUUUUP5TG1X#F%UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTVP0@<O@,[@F@_O5UUUUUUUUUUUUUUUUUUUUUUUUUUUP4=[F .UUUUUUUUUUUUUUUUUUUUUUUUUUUU')
]

{ #category : #resources }
BitmapImageLibrary class >> car1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #car1Image"
	
	<resource: #image>
	^Image
		extent: 76 @ 70
		depth: 8
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1381 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2826 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4946 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1606 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6938 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1830 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1734 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2055 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3501 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1284 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2730 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7387 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2280 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1509 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 2955 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2505 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3950 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4625 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7837 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4850 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1188 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2858 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4978 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1316 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5300 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1638 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3437 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1541 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2537 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3983 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1766 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5749 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2087 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3533 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3886 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2762 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4207 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 5974 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2312 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4111 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4432 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2216 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1124 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3212 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1349 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3437 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1220 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2666 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3661 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1445 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2890 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3115 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5557 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 1895 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6231 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2569 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4015 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5781 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2120 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3565 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6456 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1349 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4240 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4143 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3372 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6906 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3244 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4689 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7130 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4914 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1252 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 1927 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3693 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2152 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 3918 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5364 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4593 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2376 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4143 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5589 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4818 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2601 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6263 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4368 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5814 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6167 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6488 6520)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRLDW8L1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS8FZET%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IY(Y^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(MZC %IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRY&^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(3IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IQ0H^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^#<%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRUL^''):^''):TB0,KB0,KB0,KB0,KB0,KB0,KB0,KB0,KB0,KB0,KB0,KB1:^''):^''*CXBT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRUCFW):^''(@G"T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%E1-:^''):^$X%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%V''):^''):^2T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRTWR7):^''([IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IT=:^''):K10%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IWI:^''):^%T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IP%:^''):^$H%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRTE^''):^'')1IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRU8^''):^''($IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IT):^''):KDL%IRT%IRT%IRT%IRT%IRT%IRT%IRVYJW):^'')TIRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT5^''):^''(0IRT%IRT%IRT%IRT%IRT%IRT%IRT%U''):^''):L"T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%H69:^''):FBT%IRT%IRT%IRT%IRT%IRT%IRT%N@-:^''):BDL%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRU(^''):^'')-IRT%IRT%IRT%IRT%IRT%IRT%IYE:^''):^$$%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT% ''):^''):TRT%IRT%IRT%IRT%IRT%IRT%IRU4^''):^#-]IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT-^''):^&XWIRT%IRT%IRT%IRT%IRT%IRUU^''):^'')6IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%NW):^''):#BT%IRT%IRT%IRT%IRT%IRT%ZG):^''):YRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IS!\^''):^ <*IRT%IRT%IRT%IRT%IRT%H0A:^''):DH<%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%^W):^''):ZRT%IRT%IRT%IRT%IRT%IUI:^''):^'',%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IQ^T^''):^!P%IRT%IRT%IRT%IRT%IRU$^''):^!L\IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%DW):^''):B"T%IRT%IRT%IRT%IRTV^''):^'')*\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\7M3\6-:^''):^(D%IRT%IRT%IRT%IP8LY''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):GR@8IRT%IRT%IX):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):#V0%IRT%#1=:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'')@WRT%IR9:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^$] IQ0Y^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):$BT''^''):^''):^''(M!7!H\B=:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'').QH9APG):^''):^''):^&H8GW):^''):^'')@M2T%IRT\!G):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(=P2T%IRT^ 7):^''):^''): "=:^''):^''(TP2T%IRT%IRUR^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(2IRT%IRT%ITM''^''):^''):^#=:^''):^''(/WRT%IRT%IRT%IT5:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(QIRT%IRT%IRT%UXA:^''):^'')=^''):^''):\RT%IRT%IRT%IRUU^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):WRT%IRT%IRT%IRTR^''):^''):]7):^''):^(,%IRT%IRT%IRT%XF9:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):M"T%IRT%IRT%IRT%"W):^''):^'']:^''):^'')5IRT%IRT%IRT%IRUO^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^%P%IRT%IRT%IRT%IY-:^''):^'')7^''):^''):&BT%IRT%IRT%IRVOVW):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(1IRT%IRT%IRT%IRVF^''):^''):]7):^''):^"D%IRT%IRT%IRT%WW):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^!\%IRT%IRT%IRT%ZG):^''):^'']:^''):^''(YE2T%IRT%IRT%IU]:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(_IRT%IRT%IRT%WR1:^''):^'')7^''):^''):^ M IRT%IRT%IY!:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^% %IRT%IRT%NA-:^''):^''):]7):^''):^''):%W8%IRT%P9\;^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'')&S"(%IRT%  E:^''):^''):^'']:^''):^''):^'')S@()V\#9:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''(KTYMEQB%:^''):^''):^'')7^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):]7):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'']:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'')7^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):]7):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'']:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'')7^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):]7):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'']:^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^'')7^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):^''):]9FQ$YFQLG):^''):^''):^''):DIFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$X!:^''):^''):^''):^ 2Q$YFQ$UT%IRT%IW9:^''):^''):^''):^#0%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRUR^''):^''):^''):^'')VIRT%IRT%IRT%IRU>^''):^''):^''):^''(<IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%MW):^''):^''):^''):J2T%IRT%IRT%IRT%_''):^''):^''):^''):OBT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IXU:^''):^''):^''):^''$%IRT%IRT%IRT%IW9:^''):^''):^''):^#0%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRVE^''):^''):^''):^'')NIRT%IRT%IRT%IRU>^''):^''):^''):^''(<IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%^7):^''):^''):^''):H"T%IRT%IRT%IRT%GG):^''):^''):^''):V2T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IX%:^''):^''):^''):^''<%IRT%IRT%IRT%IRU\^''):^''):^''):^&<%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT$^''):^''):^''):^''*VIRT%IRT%IRT%IRT%L7):^''):^''):^'')#IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%P69:^''):^''):^''()GBT%IRT%IRT%IRT%IU4/^''):^''):^''(-#2T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT0^''):^''):^''):JBT%IRT%IRT%IRT%IRT%XYQ:^''):^'')"WRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IQE:^''):^''):_C %IRT%IRT%IRT%IRT%IRT$O@5:^(@RP2T%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%F =:^''(1ERT%IRT%IRT%IRT%IRT%IRT%IRUC[WT8IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%MAY]IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IRT%IP@a')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> car2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #car2Image"
	
	<resource: #image>
	^Image
		extent: 82 @ 36
		depth: 8
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 321 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4625 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 1027 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2087 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3565 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1316 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 256 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5332 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7098 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 256 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 192 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2794 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3790 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8094 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3019 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5846 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2537 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5075 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4015 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6552 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4304 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 706 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 224 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4240 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2762 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3469 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6295 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3758 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2698 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 160 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7773 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 449 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5524 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4464 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4753 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2216 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3693 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 770 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6520 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3983 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5460 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(321 385 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5749 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1445 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2152 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2923 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3918 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6745 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3147 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4207 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 610 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3437 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7452 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 128 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4432 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3661 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 64 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5428 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(321 353 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4657 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2120 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4978 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3886 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6424 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2826 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5364 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 289 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7130 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 289 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4882 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1573 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5589 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3051 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3340 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 803 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6584 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 32 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4047 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6874 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 738 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3565 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5043 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2505 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2794 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 256 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7869 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 578 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4561 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1252 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3790 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 192 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 192 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 128 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8094 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1959 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7323 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4786 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1477 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4015 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5492 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2955 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4721 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7548 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2473 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4240 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3180 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6006 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 931 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2409 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 160 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5235 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 96 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7998 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1863 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2923 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4689 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2152 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 385 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1830 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3918 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2858 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 321 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5396 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5685 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 610 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7452 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6392 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4143 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6681 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5910 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 835 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2601 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 64 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7677 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4368 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1830 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3597 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1060 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2537 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 289 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4304 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4593 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1284 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5300 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 224 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 224 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 160 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 513 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6295 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3758 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1509 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5524 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6584 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5814 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3276 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 738 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2505 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1445 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6809 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5749 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 289 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6038 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5267 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 192 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4207 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2730 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1959 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4497 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1188 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3726 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 128 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 128 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 417 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2955 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5203 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1124 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1413 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5428 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5717 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 642 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7484 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6424 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1638 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3115 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4882 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5171 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 96 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6649 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2633 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4721 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7323)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-!#IBN4(;I9\''Q])R\@J%''\@Z)PIGE''8''%9VQ[V5-[V5-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5- '')#6;0AV11A/G6#PVQAV;1=/M-=GI*<YI)A(;1[1Z: [65-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V62A''4GA4;CF;Y.H8SA_[0DK7JTGZR=E0<:MH0\&+0\/DF#/B%-[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-BLH\PVQ!B --[V5-[V7YZ&*M[V5-[V5-[V5-[XN;5M.<_TE=/DDB[V5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V675K1=/55-[V5-[V5-[V4WID9M[V5-[V5-[V5-[W3M@B+[_Q1=PTEA%F5-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V6V[]*O_TE<[V5-[V5-[V5-[V7HT=KM[V5-[V5-[V5-[W3M[WXCPQ3[Z11[YA)-[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-1 E=NC9-[V5-[V5-[V5-[V4_60_M[V5-[V5-[V5-[W3M[V4''A9)$PTF<64G@[V5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[YKK4-KR7&5-[V5-[V5-[V5-[V7TZ _M[V5-[V5-[V5-[W3M[V5-_DG[GK1=PTY$JV5-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-^DY$$=KV565-[V5-[V5-[V5-[V5^Z$80[V5-[V5-[V5-[X-/[V5-%0^(&)*#PR:<PZ]-[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[T?V_V/DGM.SRV5-[V5-[V5-[V5-[V6#08AM[V5-[V5-[V5-[]!O[V5-IZ!*GA3[GJM[YLWO[V5-[P@@[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V4IR"YA_VR)_]-=HV5-[V5-[V5-[V5-[S$\GJM\[V5-[V5-[V5-[T2,B9V:U;2<&+3[_[1=_W6<1,9-[P@@[V5-[V5-[V5-[V5-[V5-[V5-O5*819&#P[1$_U.<&,T*#%V/)6AR!TI8\,J3!JFZPVS[&G/IY)2\611=PVP\&&Q=_TE=_W5$V;0\675AYC9-[P@@[V5-[V5-[V5-[V6Q."& EV &_W6<PZ%=_W6<611,CM.</BQ*S&)=/K2</A0\/J)=/DG[YABS_W5AYI(\/DGDTF/[(75[GG7[@Y*<P]A;YI5-[P@@[V5-[V5-[R5''/*E$/K1=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5A/DE=_QGM3ZA-[P@@[V5-[]=Y&@EA/M/[/G5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_VQ=_W5=_U3M3])O[P@@[V5-R7>SGM-AYA1=_TE=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_]-APY)$/JKM3YTB[P@@[V5-!2&GGA1=P]/[PQ1=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_[2#GM-=P\/M3QI9[P@@[V56AF7V64G[PVP\_TE=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_]/[675=GH1"3\6-[P@@[V6,JI/E/A1=PW5=PW5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_Q0\/G6<V2P "#8DS0@@[V55B*UAPW6<_].ZP[1=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_]-=_TD\&#F(/DF<Q @@[S\1O[2<GDEA_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_W5=_[1=66QAGDQ** 7[Y@@@&74\P[2*GI)=*+2<&$G[GDG[/K1,CTE=/G7[YDE=/K1=_W5=_W5=_W5=_W5=_[1=_W5=_W5A_W5=_W5=_W6Z(77[/DD84,)AP].#PTE=PZMAPP@@B4F<GM-=V4Y=&+1=_TF&G)%X676ZCW4\PTF<_TF<PTE=_W5=_W6</K2<_W5=_TEAPTE=_W5=/G5=_W5=PTE$&''5$PSNTT)SK(12Z/M,\/E-$Y@@@[UQ=V6R<GDFZYDE=@]*^[V5QAPG[_],\PW4\676</K2</G5=_W5APTEA_W5=_Q0\/K2<_W5=PTE=_W5=_W5AGM-A(A%-[V6PU!3[GK3[YM-=A @@[]N<YI)=PW5=P[2#I65-[V5-[X,\GI)A/G5=675APTEAPW5=_[1=_W5=/K2</M/[64EA_W5=_W5=_[2</K1=_[3VD&5-[V5-[Z:#676#/A3[[ @@[]1=6748/K1A/E._[V5-[V5-[[^9,JMA/K1A_[1=/K2<_W5=_W5=_W5=_TEAP[2<_W5=_W5=_W5=_W5AP]/[/DE3[V5-[V5-[WAAI)PU"LBWTP@@[Q $/MJ0/M.<_[0+[V5-[V5-[V4,P]-=&''5A_TF<_W5=PTEAPTE=_W6</K2</K1=_W5APTEAPW5=/K2</K1$V6)K[V5-[V5-[[*<PYA-[V5-[P@@[V6=!=[V"]Z_-A0>[V5-[V5-[V6+_\3]-]6Y7]7]C 9L"3U4D1MVU%[UN''%9^W%9U5]WO#8>O#: (JB (JA)_VP2[V5-[V5-[Z^<1V5-[V5-[P@@[V5-[V5-[V5-P;3L[V5-[V5-[T-=GB]-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-3DE9[V5-[V5-[RM=M&5-[V5-[P@@[V5-[V5-[V5-PA1=''V5-[V5-@MX\-IA-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-0M-FEF5-[V5-QVP8T&5-[V5-[P@@[V5-[V5-[V5-[W]F/JBQ[XJ7RFS[6&5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-YWE="BJ74[E_/G6I[V5-[V5-[P@@[V5-[V5-[V5-[WX3611$2<-$PTFT[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[V5-[T>& VSJPW4\YJ:Q[V5-[V5-[P@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> chicken1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #chicken1Image"
	
	<resource: #image>
	^Image
		extent: 45 @ 47
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 1092 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1060 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5139 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1027 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O1AXD#<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3=CL% _@BH?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O1$NU @S@E@?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<KN20_@ALS@@EC@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O4-BPP@ND1L@C#P<@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?R3PSLP8@@CEVQC<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?P%X@@@@S@@@1O#<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<HK@@,PSD@PP8@C#<?@@@@O3<?O3<?K3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3XSLP8@PP@1@@@,SS<?@@@@O3<?UPQX@CDXJS<?O3<?O3<?O3<?O3<?O3<?O3<?O4T@@AL@@@@SC$D@J3<?@@@@O0,^@CD1C @1D0 /O3<?O3<?O3<?O3<?O3<?O3<?O3@1LSDS@EX1@@@,PC<?@@@@O10@@A<@@@8@@CDNIUT?O3<?O3<?O3<?O3<?O3<?AB0@@@@@@@@@@@@@S#<?@@@@O3<FD3D@C @@LR0@D0@JQ3<?O3<?O3<?O3<?O3=G@EX@@@@@@@@@@@AAK#<?@@@@O3<3SP8@D0@@PPAVK@9VLR!GL ,?O3<?O3<?A2P@C%XS@@@@@@@@@@@1E3<?@@@@O3<?I%X@@@(@D08@@DD1PSD@@@9ON40]GP0@KEX1D0@N@@@@@@@@@@@NJ#<?@@@@O3<DLSD@PP@1@B0_PSD@LPAA@@@_U @@@AL@U 8@@@8@@@@@@@@@@@@FO3<?@@@@O3<@@CD,LP@1@@@,@@@ZLP@1D0@@@@@1KDDS@@AVG3D@@@@@@@@@@@@8O3<?@@@@O3<QD0@@KA<SG1<@C!<@D0@@D3D@G5X1@@@N@@@1@@AA@@@@@@@@@@@DO3<?@@@@O3<?@ X@@@@_@@AV@@@_D0@1D0@@LP@@PTD@C!L@K@@@@@@@@@@@@@@HO3<?@@@@O3<?O10@@@AA@DDN@EX@C @@@@@@@@@@@@@@@@@@@@@@PQ<@D3DSPQ=IO3<?@@@@O3<?O0=AU!L@G1L@@A<@@@@@@@@@@@@@@@@@@@@@@@@@PUX@PP@@LP@BO3<?@@@@O3<?O4-MLQ<;SQL@C$D@D4D@@@@@@@@@@@@@@@@@@@@@@DD1U$D1C$DPO3<?@@@@O3<?O3<?LU(7LCD,@DDN@@@@@@@@@@@@@@@@@@@@@@@@D4D1@AL@LPAWO3<?@@@@O3<?O3<?O3<?DCQA@@@@D08@@@@@@@@@@@@@@@@@@@@@@CD@@EX_@@8?O3<?@@@@O3<?O3<?O3<?O3$@LPAA@DD@@@@@@@@@@@@@@@@@@@@@@@@1@B0_@E ?O3<?@@@@O3<?O3<?O3<?O5%MC @NU @@@@@@@@@@@@@@@@@@@@@@LSDS@@@@C#T?O3<?@@@@O3<?O3<?O3<?O3<3UB0@@A<@@@@@@@@@@@@@@@@@@@@@@@@SPP@_MC<?O3<?@@@@O3<?O3<?O3<?O3<?S$5A@EX@D0@@D3D1@AL@@DD@@@81@@8@@DD0OS<?O3<?@@@@O3<?O3<?O3<?O3<?O2\[B AAU 9APSD@KAL@G0@:@@(@U @_U 4PO3<?O3<?@@@@O3<?O3<?O3<?O3<?O3=FF @@C @@C @,@@@_D0@@@DD@@AL:BC<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<\BUX,@ALN@@@_D3D@LQMVG0@,B%ASO3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?K0X_LTDND0@@D0@,@@@@G45HR3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<HPQ<@D0AVD08@C @#EP,?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<\R!<,U%XS@@AA@BD?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<2O3@@@CDSPP@1KR$?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?JT4M@CD@D3D@JS<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?D T%FU@@LP@;O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?TS=RS#< @E@?O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<FB3<WC! ?O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<\O3<?P!(KO3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?GSD&O3<?O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?G @FE <3O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?R1<SPPL/O3<?O3<?O3<?O3<?O3<?@@@@O3<?O3<?O3<?O3<?O3<?O3<?O3<?O3<?O11ITQQGB3<?O3<?O3<?O3<?O3<?@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> city1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #city1Image"
	
	<resource: #image>
	^Image
		extent: 80 @ 78
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'VE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XC!!4B5@NVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XSV\?VQP_\#1WG%5]YSQ4VE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVF-2[B!,BGINMC@0\6%IZST<M7MEVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVA]CAF$OC0<TEF$$E@=#P E@RT5XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XG$H0MGLTT6%)EA=R\6%IOB) LU!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE 4EAPTEAQBP!PTAD$TMA=2EU@?VE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVFP4P!PTEAPTC3PTECQ)C5I2Y0)XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XO5H4YDHTEAPTEAPTRSPDEC0XYE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE )VE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!4G!QIT1P$ZSQ)G7IRG%5BSAESVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE ''\!A[OGI2EFPJB6\6C"5XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVF52MC0<V604ZV$MG3U)OBQ[DSAXVE!XVE!XVE!XVE!XVE!XVE!XVE!XVD5DI&$TRQP4MD9.FQ8HSC12T&YXVE!XVE!XVE!XVE!XVE!XVE!XVE\4T%T[E@53EGH5]DA2ZS 7ME!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XC$QFZS@TMAPOEAPTEEM)ZV$^SU!XVE!XVE!XVE!XVE!XVE!XVE!XG#P^PB@T\&$T\!Q/UU4TV7P$R5!XVE!XVE!XVE!XVE!XVE!XVE!XVE XQEX4IAQ$EAPTEAPTT6%)ZU,.VE!XVE!XVE!XVE!XVE!XVE!XVE!2ZQ%4H@)2EF%RT''Q4T$8YB")-VE!XVE!XVE!XVE!XVE!XVE!XVE!XVGP8A%MIMFLTEELOEAPTECPTOE!XVE!XVE!XVE!XVE!XVE!XVE!XVFMSOE@?\C0TICQ2UWQIWUH$O4AXVE!XVE!XVE!XVE!XVE!XVE!XVE!XB#I(C0=)ZTHTEAPT\3P4ZV$<VE!XVE!XVE!XVE!XVE!XVE!XVE!XAAP<[7P V3TOLA8RT@(<MD94B5!XVE!XVE!XVE!XVE!XVE!XVE!XVE *QC1)OF8YT&MBEBQ)ZV$TEA9XVE!XVE!XVE!XVE!XVE!XVE!XVE ?P Y4HGP<EAPTS@I4J5-)\"ICVE!XV@I-UA!UH&4XS5T7M7P S35XVAPSWS1RED%NODH5A!8(V55.WU!XVE!XVE!XVE!XVE!XVE!XVE!XVFERG"@3]B=)\3Q,ZV$TOEM(UQUXVE 7X&$?DQEUD"HX[Q X[P$XN%$7G&H^X6@ ]DH>ZQT^XC<?CP52VE!XVE!XVE!XVE!XVE!XVE!XVE!XE''HYEAPTV5HTEC8^T%INMS1GP%!XVCD@D@! [R9-M2IO]B@[]F< O3@A@0X^B%(:MEHTEE\?L7P4T%IXVE!XVE!XVE!XVE!XVE!XVE!XVE!XNUH^CUIRYAQ$ZUHTEF%)[ET4VE!X[VU[QGEAV5\HSB 9G$0<OA8MK052JA9 O7P4X4HTV7A0O3Q.ME!XVE!XVE!XVE!XVE!XVE!XVE!XVE ^ZSQ)E@=)M@<TT5M)EAQWN%MXVE XWBYDQC85EF$TIELOZV%)EGL4RV$<G#=0XUIRM@P^HC=4G7HTVE!XVE!XVE!XVE!XVE!XVE!XVE!XVC9)C2P4LEHTED8$MAP4T54JET5XVD4PI$Q%\&PTZQQ)ECA3EF%)ZQPTM@X9HB, O$9RZS1PXGQ.\$%XVE!XVE!XVE!XVE!XVE!XVE!XVE!XMFLTE@=IZV$TMBP4EAQ)FTH+[U!XJQ@&QGD9C4IIMCPTZV$TMCP4EFL4OGI@HBI2EDI)OFE ]B<>B%!XVE!XVE!XVE!XVE!XVE!XVE!XVE!IT&$4\0<4\3Q)ZQP0T1QB\#<"VA ?DDE(QGISMD$TZRPTEAP$ZT%I\2Q,PSA.I@X4\6$<M2AUFUI0VE!XVE!XVE!XVE!XVE!XVE!XVE!XVGQ2ECA)ZTISEA<0S&Q)MAP<HBAXI"YDI&I%SCP*[B<<\%ILOEIRV30ARTY)MD92T#PTMGILG#9,SBAXVE!XVE!XVE!XVE!XVE!XVE!XVE!XUS0*ECP4ECP0EC,4T''I3EC14GE![G 0FQFU2EEM[Z")WB@(%NQ8*XR<TA&$4EF$4EAPTMCP4P%IRUU!XVE!XVE!XVE!XVE!XVE!XVE!XVE!MOF)NT%I.RV$4OC1RS%\OJGQIVF1RDEYDYQ$OEC1/B!92X@)]\ (7NQ<WMSPTC6%SEAPOT1PTC48XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE![\1\TLB!#EF$<B#\XMAQ[N%MXV19%X"YQU5LDJB@+G''IPXC$^XB@<IC%IEF%NEAQ3EAPTEGLT\%QXVE!XVE!XVE!XVE!XVE!XVE!XVE!XVEI)WWQ@RWHTIF9SHBA#CU5 ME HE4QD@VU[IF$AHE(<G#) JC1J]C$TV1P4ZVL4LGLTEAPOT0=LE%!XVE!XVE!XVE!XVE!XVE!XVE!XVE!X[#PHF7Q ODL4\31'']@(^X0(4VCQ[YQL&CD1)EE-GO3$^TC<^FVA4OCPAZSQ)T1P$ZRPTEAPOZS1XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!)ED0KB0-WP7L$OB@*G2=2ZV%XZS1%QDPPSF%)V6< [C0[HA8^O2T9ZU]IEELTEAPTEAQ3P!P5OE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XV@(TNR@ XQ],OE4<MD$JMA]2B"9SOFT&I%EWID$FC38<NWH/G#%,G#1IL!9LG#12\&9RMAPOT4L9VE!XVE!XVE!XVE!XVE!XVE!XVE!XVE .B"!(G&MRZ''A/M3DBFA!EM4%VM0)[YRYDYS0DZS84X1PTMD8TECPOZTI%ZAU^USM P3PT\#%[[BYXVE!XVE!XVE!XVE!XVE!XVE!-XRU)EFP*R''P)M! 7H#\XUC\ B''I2\ YIVPY"I"Y%J@<TMDIBZUL4LF%)\3PTZRYQYS8%XCL7M65MZ5UUY2)/KU!XVE NVE!XE#\JZP<TZU% ]BHXFD\7M3\XQ1!4VUH<OD1]RU%ZO6$3U5X&I&T(P!Q)EF$4MAQ)LGLTP#PTA$X&A#=YB$M)EGM.\%I.M@X(JU!XSPU*T!P*O6DXFA XQ3D7M6\1FD]!VT8^I#04RR(JXC<JIV@?O''P&DEX&CC0TED$TT1Q)\2PTIAPTECA%V31DO1,3O2A4UWPRHETBD"(+VE!-@B-''FA!4S7QUM1 XM1I4P3P^V312ZQ0 O6AJGD(JZ!0JR (4D YDU"XLJELOEEI)EFPTMSQSZQPTVTE[O@YU]ETR]GP:O7P+L0T?B''QXVE!V@AP.XT46UD<?RSQ2G !3ZV(:XUA B"(%N0(JB (JB&A B$H+I$P&PVTWZQP^T%-.MF!,G$9FT X4QC &V2@^T!PTO2A4TGQ@S6]NW%!XVBL8D@X AA8<BGH4ZR) O6A AV(*IP(JXFA X@(JGE)*B T+ED)[QBYDQ@Y)T5\5]DX<GGPFOG@ U5LFJC >RR(JXD8?HC=2T%4FF1Q-VE!XEED#DB OJ&A XFA AP(JJ!10XFA XA0*ICQ3P4(JJ#<JJ"@4B#0LI$QVI&%)JC< SGH*XQ9.N6=[ZUX&I"P4GF<"CV@ L7IUH )SAE!XVE \DDDPEB,JN6@JB!0*B#= EGMROC<TG''HTZ&LTXB) R!0*AR)CSDPCQBXFZQQ[GFE2\&Q4FS10T@!)L!9DRUH?UWQ2TB@?CUU4N3TTVE!XVEU%U&U2V (*B#<;XB) NQ8OJ"@>J&%)UQ-!B%H?AV@;B )JJ"Q[DDXSDDQ$RT1 XP ^ZUT^OA1UOF%DE6TJG1-UUSP?O3=#]EAIRP=XVE!XC$P&QF! B"ARG30Y[@(Y]AHEN&PTP1=4O2A4G#<JJ&AJR&)*T2<8QFTSV1P4NR)UFV9SUWI]B!,FP X(QC,<T484G"A@O3%PO3U*ZU!XVE!XA$P&TP(JZ!8?M3\*RWH*]AH HD1 CQ!/H@,<Z U B"U B$(4V51"V01%B$%[O4]WG&%UE31ZF1$TI YAPFA B - ]@,+P%HTS$$TVE!XVE!2YPXPRT(\S&@?O3=RT6$3L3=@\&A,ZT8^[#@?XC-JZ&@JJ0<^QDD&PU-BG5,>CU44U''H^CS0<[EL&V6T?HC(:]B@?\GQ4L3]4HE%XVE!XVB(LZFT_XC(TRRA4US0%S#M J&L(J$%RN2A O2(*V%) \F@JS&!HPT LV69)MUHTT#UBRS@TC5LOEFU[A''Q4UWP ]GQ4HA,:]BA J%!XVE!XM6TSQE]ZR!QBM5UPG"T<X40TZP) B#= RVP O6@JMS@/K7ISB"@QM542ED%R\3QRZQPTEAQBIAP4QC1,O384RT$?F3L\TB- O6@?VE!XVE NYPL&D7@JJ!9BSEH4J ) XFA0B"TEN6@\P3@^[%IIXGPVSR9-W %&QR@(OE$OYCPOICPTLBPTMF$&I X[T",JT$$ ]CP/X2=)B$AXVE!XVD,&V1@SEV@*RUM XB-JZ&@JXF@JJ3-PODE$UV]MI4T.SSXX[QY-BT4XSV5)V3PTEGMST3P_ZSPTEBY[WPTOD$ACN5T MBA4]D8JH%!XVE!XVFU%I$QYZ&A XF(JZ )JXC-IECPDAVA]YRM K$4XE&4XSU86[V4.M58.ST-MT''HTT3P4EAQBT5I)QAM2IT%@F1Q*N#=#US=0T"()VE!XVE!XE@M(KF8EART+GGP?J&@YNSQ$EC9 XEL&A!@&D"8)M#Y-[R%-K$4.OQ BZ#Q2I#0^OA8^B@!RI!P&H6$UED(JG6@?O5I4HB,TRP9XVE!XVE!IHTPSG%(?XF%2\%5[XEH?UUT[G#(JT"L<T%,PT&4.K"$VGT4XXB)N[A9NES<+OD0KPC1,O6]2ZRXCZRTTLF$TO2@+T (%RP<4VE!XVE!XVET2QDE%N$%S\&@[HCQYCVEZJ2H(X@)CD7HFL!9VH4%-UQU#OA80ID$[S5T?HF@MT")PT''ICD!8>D3I*M2AUUT=/D&ABZV$$J#AXVE!XVE!XQSH&U!@*N6ARN#)4J")2J#=4M18?N0(8I !RA#0&YP!#ZT)ZPBA4]A,EP&8T]E-[B$<<J@T[G#Q[QE%4HB@?H@( HFE@HC=/T5!XVE!XVE!XA%Y(L$% N7H [7P%FRQIM2A)OB)JB&T^U0X^OA8FJ''P XVA0F6@ T$8 Y!$3SA8%UU4^IUT<\2LCV"@"M7QU]GQ4HFDRHET4VE!XVE!XVE!RDBXP\&AJT T ]ET<\E,YWSPJR#- D60<ODY,V5XUGDHTCS%JXWP>K%TXEBALFR)US@!Y@%-)NDE \%INT$$ O0,UP2(J]BQXVE!XVE!XVF@PPPM]B"U)ZS<TG$8%B (JXF@\B (FOA]LV5,<V7L4V! GXB( T@5MUV44TA8<IP(<T!9RV0<SQ$$$N#<*[''Q4ZSPDP5-4RU!XVE!XVE!XUQ@8Q@MZXFP<O%L;O6@*XFAJJ (EAPY,V31[U2L#C2(?C 9UT"@7P#Q2MCP CWI[OC8$G2QRYBY[J&Q@B2))D''PTB%T G"@;VE!XVE!XVE "YRYDTQ0*X@)ZO0(*B UZR (*B&A E5-[OE,<T X>B (.XA<*V#= V"@3L1,^IDHTRSPOMCPTPS0;P"A4RR)4USPJN#]NXEAXVE!XVE!XVE!WYRXLP2(\B )JJ&A O7I2CVM[XB-WV30(E30&I 4JV3PTB3=0N"A O3=*]D04AFPT\$$5MVLPOB,DH%TOZ%)4MCMUO5ICH%!XVE!XVE!XVEHCI$!2J5) IV(JEFM SC=4US9*O40FOE,WOGHWV5T?F6D3O2A4Z$9#C68JMEH4MAPTED9)EBX4R#12T!8?D$@/ZQQIM@=-VE!XVE!XVE!XMEY%A%\+B (M[#1)SD)2PFE4O&$?\ X<V5,<V1\#M0T*YCQZN''@UB$4GY3Q)T#U)ZT%RMAP>\V$7HD=4XEU4HF$JB (JT29XVE!XVE!XVE!RQFUD@0T*B!9@S4=BAV8EV$A M@,_H31WV5\<BDQZG!1 O4H?\@T;A5=-EELHECQNZQQ)ZQPPYCL?O3L?O2A4]B@KXWPTW5!XVE!XVE!XVGI%A%Y%N6@:A%T?]FMIMFAU]E%2B3P&OB (V5,^PRA#UVYECV< V''H?YGHTMUI)EAQSEC@0C1AIXWP HGP HC=@N&=4]EIXVE!XVE!XVE!X\"Y%D6TDXF@^O5@7B%H*[A<YO"(;J"YWV31[U4X&]A9_OP9.J6AUMAQPO2AI\#QIP%M3EDH$KFA!HGP[F2@ HB@ HC)UG5!XVE!XVE!XVE $HTEDDEIJ\C@?F0=NCPTTR UZB )CI%]WOE-,OBL*G!QNT%I4O0)U]GQ0HF@<EAP4MQPTEF$PO1,?O2@ HB@[F1,[HGP4VE!XVE!XVE!XVA0PU%Y%NS<ET!8<ZV%YN") XD) ATL&JF0<V5-[QD%U\BAPD%A O2)R\&$^ES% EGHOP!QBEAA4]B@ HB@ HB@ TEA4HBQXVE!XVE!XVE!XN1]DZDQDGGAZN3<JB&A J#,EIVA J& <JC1[G%-AEAI XB-IN"A@SD]-W!T*NF$TZR))T0<OL''P HGP HB@ HB@[F3(JP5!XVE!XVE!XVE!ZZQ(8U!@5IQ1IX@(JXF(;B&@JB&@JQ#1[JE,(V5,TT"P4RQQJB%URA64NHDLF\!8^OE,<G''IDR"(\\@-PHB@3]GQ/Y3<+VE!XVE!XVE!XVE *YREDYVP:B2) R!0\B (JB&(;XFA[OE-WV4XFA''L4FD5URP([F7H"S10MMBQ''M5UUDUU''Y6AOV U*ZV%SEAQ3MCP>G3=XVE!XVE!XVE!XVAPFI#!%G (JJ&@*B"TEGF@JV ) B$X<V2![G#0&G PXC"8 E@,"EGI)ZS<?VU!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE(PQCH<O6@JR ) IQ0;B")ZGF@;A#1[OE,WG D(J#UZZQ8JHE([L2@ XGQSVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVGI%QDP\J%(EB&(JXC= J&$MG0(0I%,<O@Y,O@XKT4% HBAPO3<?B2@?B1QXVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVA82QB)JJ!T+O6@5T&9)R 9XVE  L#$<K5,9H3= ]B@?O3(KB3=0XGP T%!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVAP@ZS<ETEMNT$%''VE!XVE!XVE!XT%D<D5-DURA TE@?XE(?HA,[O3=RVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVDL^\19BO65XVE!XVE!XVE!XVE!X]BXWT!@JHC<:O0,[L2@\RQQ2RR)XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE( VE!XVE!XVE!XVE!XVE!XVE!XVE,CI&A4XS= J!QRX2(RSU!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVGQD\ =2RT%PSU!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVB8 E%!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!XVE!X')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> cow1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #cow1Image"
	
	<resource: #image>
	^Image
		extent: 84 @ 54
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5139 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR1!WX1,<E4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KBE<6ED-KTEP@CT4%@B@!R0)RUEQVR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,(D#-^@FMRCP@G@@@%CT4MFP@;@@5XR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,6@BT@A3,@D @@CT4@@@4@IP4@SPA[R6@NH50AD30 G$<0P4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KFA!KR4-KR4-KR4-KR4-KD0@M@CT;IS,;MT5MCT4@CS,;N0AGJ0@MW @%D @@D$4;@@A#XS<6RPPXR4-KR4-KR4-KR4-KR4-KR4-KS P]M#="K$ M@E8ATD-KR4-KR4-KR4-KR5X#U3DM@CT@@BT@N0@G@AH@IP4;@@4R@C,@@C,;N3-MW!H%W!H@@@@5@E8GX2@BD5)!XTXPKE]FLUPGSP@@SQH@@@@@N0@@W#][R4-KR4-KR4-KR4-KR5T@CP@;SP@;@D5^@@4@D @;D 4@CQH%N0@@N3,@@D4@@AI^IP@@@@@@@@@@@C,RN0@@@AIMN1H@@D4%SS,@W @RD$4@@CT[KT-KR4-KR4-KR4-KR4,@N0@@@@@5W @@D @RD!H@@@AM@D4@@AHRN0@;D#,@N1H@@@AM@@@;N0@@N3,;D!H@@AHR@C,@@AHR@@@;D#,;@D45@C,@A4EKR4-KR4-KR4-KR4,;D$4@D @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CU]KR4-KR4-KR4-KR4,?@@@;N0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@EQKR4-KR4-KR4-KR4,XN2T@SP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D @IR4-KR4-KR4-KR4-KL0@R@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@R@@4DR4-KR4-KR4-KR4-KRP@R@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@AIVR4-KR4-KR4-KR4-K@44@SP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;@@ACR4-KR4-KR4-KR4-KR04%IP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MD#,TR4-KR4-KR4-KR4-KR0H;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@4!R4-KR4-KR4-KR4-KR2H@@@@@D%8@@C,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MP@@SS,M@BUVJE9KR4-KR4-KR4-KR4-KR1$;D$4@D @@CT4;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N2TR@D5M@@YKL0AKR4-KR4-KR4-KR4-KR18@CT4M@@45@@@R@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D5^@BT@QD-KT!IKR4-KR4-KR4-KR4-KR1]TSTPO@D4@CU8;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D @%@@@@Q$-KXUQKR4-KR4-KR4-KR4-KR4-KR4-KOBT@SP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MP@@@@@@U$-KEP]KR4-KR4-KR4-KR4-KR4-KR4-KFFLM@E8;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E8@@BT%BT-KT AKR4-KR4-KR4-KR4-KR4-KR4-KR1P@W @%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BTRN3U#R4-KQ$5KR4-KR4-KR4-KR4-KR4-KR4-KR4,QU@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D @;@@@BR4-KQ @IR4-KR4-KR4-KR4-KR4-KR4-KR4-KU#,;@@4@@CT@ST4@IP@;@D4@D#-M@@4@MS,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D$4@@AHOR4-KB2TJR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4\@@@@@@BT;N0A^@D45N0@@D A^N0@MSP@R@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D A^MP@[R4-KQ A[R4-KR4-KR4-KR4-KR4-KR4-KR4-KR0Q^W#-MSP@@@C,@CU8%@@4%@AHRD @%@D4@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CP@@@BT%R4-KQ AVR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-B@@@@IT4;@C,5W @@Q@@@MS,@D 4;@AI^@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5M@BT@U$-KQ$4\R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,6D 4@@@@;IP@RD @M@@@@@@A^N0@@N0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D45IPAMA$-KL2T9R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-NIP@%@@@@CP@@@@4@D 4SI!$;@@4RD",@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@IS,@SS,%S4-KQ!H7R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KW@@;W%8@D @;SP@@D%QKR4,CSEP@@@@R@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BT;MQH@UD-KB44@B$-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR1MM@@@@@E8@CPA^MUIKR4-KR4,]XPAM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SP@@IPA^@D%KXRT%J$-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,BMP@;SPAM@@@%@@YKR4-KR4-KR0(#X0@@CP@@MP@@SP@;D AM@@@M@D4;SPAMN44@IS,@D$=KQ AMBD-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KV2MSQ @R@@AM@CYKR4-KR4-KR4-KR0(DAB5[U"=JIP@MN0@RCQH@CPAMIS,;@C,@D @M@E9KF @RM$-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR0H@N0@R@D%KR4-KR4-KR4-KR4-KR4-KR4-KH0@@D#,%@E8R@EP@@D4@MP<BN0@@MPAPXU85GD-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR3X@D!H;@AQKR4-KR4-KR4-KR4-KR4-KR4-KR2L@SQH@W @@@@A^N0@@LQ!VCST@@AIRM!IMWT-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR1X@D!H@@AQKR4-KR4-KR4-KR4-KR4-KR4-KR4,A@@@M@AHMN2T@@BTPR4-KFPAM@AI"R04@V4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR1X@N3,;@D%KR4-KR4-KR4-KR4-KR4-KR4-KR4,TIP5DW @@IS,@W%AKR4-KOS,@MS-WR1(@R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR5X@@@@R@CYKR4-KR4-KR4-KR4-KR4-KR4-KR4-KHB@#@E8M@@@@G4-KR4-KR5H;@D5@R1Q#R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR0(@@@@R@@YKR4-KR4-KR4-KR4-KR4-KR4-KR4-KDEAK@!H@W!H1R4-KR4-KR5,%@BUWR4-GR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-#@@@MD%MKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KV45M@D5NR4-KR4-KR4,@SP@PR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,SCP@R@AAKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KXST@@BMKR4-KR4-KR4, @AH)R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,1MP@;@DYKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,VD @MCSIKR4-KR4-KR4-!@@A!R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,.@@AMW%)KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,L@@@@A$-KR4-KR4-KR4,Y@E9FR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,Y@C,@N5EKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR2\MN1H7R4-KR4-KR4-KR4-!N0AZR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,"@AH;@@@!R4-KR4-KR4-KR4-KR4-KR4-KR4-KR0X@D AER4-KR4-KR4-KR4-!SP@SR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-H@D4RSP@$R4-KR4-KR4-KR4-KR4-KR4-KR4-KFFL@IU9KR4-KR4-KR4-KR4-Q@CU#R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-QIQH@N1H0R4-KR4-KR4-KR4-KR4-KR4-KR4-KF @@D!%KR4-KR4-KR4-KR0X@@A,>R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,@IQHR@CD*R4-KR4-KR4-KR4-KR4-KR4-KR4,FN2T@H!YKR4-KR4-KR4-KR4P@@CUKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR3 M@@A^IT%KR4-KR4-KR4-KR4-KR4-KR4-KR2LM@D4GR4-KR4-KR4-KR4-KO1HRCSUKR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KU3,@CS,@SU-KR4-KR4-KR4-KR4-KR4-KR4-KQU8@@@@<R4-KR4-KR4-KR4,>X0UWTA!KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-!@AH;IP@ H4-KR4-KR4-KR4-KR4-KR4-KR4-KB%,4VQ!KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR3(RMUQ!I )KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-K')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> elephant1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #elephant1Image"
	
	<resource: #image>
	^Image
		extent: 61 @ 47
		depth: 9
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5267 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5492 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5267 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1316 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5878 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1541 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6649 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2023 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6135 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7387 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 2987 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3404 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4304 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5460 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5781 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6199 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6199 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6456 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6327 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6295 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6649 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1316 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1798 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2023 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2762 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 2987 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 2955 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3404 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3437 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3693 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3918 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4786 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6038 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1573 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1798 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2762 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 2987 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3469 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3469 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3693 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3661 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4850 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4786 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5428 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5524 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1349 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1830 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6520 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2055 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6938 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7516 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3212 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3469 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3950 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4143 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6006 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1349 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1830 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6841 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2087 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2312 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2537 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3244 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3726 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4432 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4914 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4818 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5139 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5010 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5878 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1606 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1830 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6552 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2312 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7195 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2762 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3019 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3501 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3437 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3693 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3693 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3726 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4593 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6038 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6199 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6488 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2087 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2312 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7066 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2794 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7709 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3244 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3276 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3501 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3918 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3726 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4818 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5589 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6070 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1863 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6681 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6584 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3051 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7709 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3276 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3501 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3918 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5685 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1638 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2344 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7130 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2794 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3019 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3276 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3533 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4207 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4207 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4432 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4882 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5846 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1638 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2376 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7002 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2601 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2826 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2826 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3693 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3790 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3758 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4175 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4432 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5621 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5589 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1670 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 1895 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6906 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2569 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2601 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2826 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3083 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3758 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4272 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4432 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4978 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5107 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1445 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6263 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1670 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6745 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2858 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3083 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5524 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1220 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1445 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6456 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6456 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2152 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6874 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7773 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3340 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3565 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3501 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5203 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5332 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1702 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 1927 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2184 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6906 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7195 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7323 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7387 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2633 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3115 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3308 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3340 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3597 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4304 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4240 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4721 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4914 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5203 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5460 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5332 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5653 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5717 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5621 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6327 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6424 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6552 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6681 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2409 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2666 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3372 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4079 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4015 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4207 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4240 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5396 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5878 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5878 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6135 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1477 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6360 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2184 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2666 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 2890 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3147 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3565 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3597 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4079 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4047 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4304 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5428 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5653 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1734 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 1959 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2184 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2441 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2441 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2858 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3147 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3372 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4111 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4561 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4786 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 4978 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4946 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5396 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5589 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5878 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5846 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1509 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6456 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1734 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2441 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2698 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3147 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3404 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7548 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4240 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4593 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1284 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1509 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6103 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 1991 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7002 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7130 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2216 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2698 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 2923 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3629 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3822 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4561 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4721 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4914 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1284 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1541 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6777 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6777 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6970 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7291 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2473 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 3886 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4079 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5460 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5749 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6392 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2023 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7580 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3180 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3661 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3597 3437)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@?@HX@<@B0@B@@/0B?@E(AE@DT@QP@3@BR@@<@,0C)@AT@# AV@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@L@R8@XP@S@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JL@(0B#@JL@(0B*@F4@)PAY@O8@> C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@PPDM@O0@? D#@QTAO@CP@P,AG0DR@JL@JPB4@C8@G AE@R,@> C2@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@JL@(0@A@FL@0 @&@R$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@P(AJPBY@@T@X @8@KX@\@DJ@O$@>PC9@O$AJPA''@JL@(0B#@JL@(0B#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0B#@ITAF0C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@> A:@JL@(0B#@JL@(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JLAI@D5@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@G@B#@JL@(0B#@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0A[@BX@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O(@A@B#@JL@(0B#@JL@(0B#@JL@@@B#@JL@(0B#@M$@- C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@A<@(0B#@JL@(0B#@JL@(0B#@@@@(0B#@JL@(0DQ@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PAA@H\@(0B#@JL@(0B#@JL@(0@@@JL@(0B#@GH@&PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PBL@R0@(0B#@JL@(0B#@JL@@@B#@JL@(0CA@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@> @]@JL@(0B#@JL@(0B#@@@@(0B#@JL@OPC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@G@@*@B#@JL@(0B#@JL@(0@@@JL@(0B#@B0@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PDJ@B<@(0B#@JL@(0B#@JL@@@B#@JL@(0C>@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC=@JL@(0B#@JL@(0B#@@@@(0B#@JL@X C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@PPDH@JL@(0B#@JL@(0@@@JL@(0B#@N8@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@ 0CH@JL@(0B#@JL@@@B#@JL@(0C?@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@B\@& B#@JL@(0B#@@@@(0B#@JL@$@C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$AB A>@LH@>PC9@O$@>PC9@O$@>PC9@O$@>PA0@D,@(0B#@JL@(0@@@JL@(0B#@B4@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@BX@4 B&@A(@&P@&@O$@>PC9@R$@>PC9@O$@>PDC@JL@(0B#@JL@@@B#@JL@(0BV@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PD5@MX@/@A3@P0AJ@@<@N0AB CE@J,@>PC9@O$@HPB#@JL@(0B#@@@@(0B#@JL@6@C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@I DI@JL@(0B#@JL@(0BW@O0@2 AX@O$@>PC9@KD@(0B#@JL@(0@@@JL@(0B#@J0AB C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@P(AL B#@JL@(0B#@JL@(0@@@H<AF@DJ@O$@>PB!@JL@(0B#@JL@@@B#@JL@(0D/@@T@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@ETAH@B#@JL@(0B#@JLAN D\@M(@FPC9@O$@,PB#@JL@(0B#@@@@(0B#@JL@] A%@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>P@5@F@@(0B#@JL@(0B#@JL@(0C+@R,@>PC9@B8@(0B#@JL@(0@@@JL@(0B#@JL@$0DJ@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PBI@JL@(0B#@JL@(0B#@JL@7PB-@O$@>PC$@JL@(0B#@JL@@@B#@JL@(0B#@PP@T@C9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@W@B#@JL@(0B#@JL@(0B#@C\@F C9@G@@)0B#@JL@(0B#@@@@(0B#@JL@(0AM@LH@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@>PC9@O$@\@@(@HH@''PC:@O$@>PC9@O$AB AR@LH@>PC9@O$@>PC9@QL@(0B#@JL@(0B#@JL@(0AT@DL@>PB6@D@@(0B#@JL@(0@@@JL@(0B#@JL@60@Y@O$@>PC9@O$@>PC9@O$@>PC9@O$@0 BK@A$@"0DZ@G@@T@AA@O(@T0@M@ML@Q@A&@L\@90C9@O$@>PC9@LH@5@AN@CX@>PC9@O$@>PB@@B(@(0B#@JL@(0B#@JLAC DO@O$@1@C_@JL@(0B#@JL@@@B#@JL@(0B#@ED@F @&@O$@>PC9@O$AB C9@O$@>PC9@C@@+ @X@J8@7 D7@M0@+0C^@JL@(0B#@JL@(0B#@D<@>PC9@O$@>PBK@Q$@(0A,@P(@>PC9@O$@F0D9@JL@(0B#@JL@(0B#@AX@_ C9@N<@2PB#@JL@(0B#@@@@(0B#@JL@(0@F@JH@00C9@O$@>PA0@OD@;@C9@O$@>P@2@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B)@O$@>PC9@O$@>0AD@JL@(0B-@O$@>PC9@I4@BPB#@JL@(0B#@JL@(0@%@N0@>PB$@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@L4@>PC9@O$@.PB#@ND@>PC9@O$@=0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@^0C9@O$@>PC9@I<@(0B#@JL@^@DJ@O$@>PA>@A\@(0B#@JL@(0B#@JL@DP@C@O$@S@B#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0C6@R$@>PC9@L,@(0C0@O$@>PDJ@O @(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@R\@>PC9@O$@>PA*@JL@(0B#@CLAF C9@O$AF CW@JL@(0B#@JL@(0B#@SPAF DJ@I @(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JL@H C9@O$@>PA]@JLA@PC9@O$@>P@4@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@#@O$@>PC9@P(AA B#@JL@(0D-@G8@>PC9@AH@R B#@JL@(0B#@JL@(0A/@P4@> @T@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@L8@>PC9@O$@9 B#@G\@>PC9@O$@I@B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@]PC9@O$@>PAB@H(@(0B#@JL@(0AG@O$@>PC9@HT@(0B#@JL@(0B#@JL@. B9@CT@;PB#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0B>@O$@>PC9@Q\@(0A(@O$@>PC9@RT@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@DX@>PC9@O$AG C @JL@(0B#@JL@3@C9@O$@>PD;@JL@(0B#@JL@(0B#@JLA@ A0@N(@(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JL@R@C9@O$@>PA9@JL@Z@C9@O$@>PCJ@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B-@O$@>PC9@F$@(0B#@JL@(0B#@S4@>PC9@P(@RPB#@JL@(0B#@JL@(0B#@A@@>PB2@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@RH@>PC9@O$@80B#@G\@>PC9@O$@F @G@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@;@C9@O$@_ B7@JL@(0B#@JL@(0@;@O$@>PAB@G0@(0B#@JL@(0B#@JL@(0BA@S @R@B;@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0@J@O$@>PC9@NH@(0C4@ST@>PC9@G@@4PB#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0A.@O(@>PB5@PP@30B#@JL@(0B#@JLAHPC9@O$@_PC%@JL@(0B#@JL@(0B#@JLAE DT@O@@N B#@JL@(0B#@@@@(0B#@JL@(0B#@JLAF0C9@O$@>PBL@Q4@:@CB@O$@>PC9@LHAA0B#@JL@(0B#@JL@(0B#@JL@(0B#@JLA@@C9@O$AJPD0@G<@(0B#@JL@(0D6@I,@>PC9@O$@>PA^@JL@(0B#@JL@(0B#@JL@/PB9@LX@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@EH@>PC9@O$AB @+@OT@\@C9@O$@>PC9@L(@(0B#@JL@(0B#@JL@(0B#@JL@(0B8@I0@>PC9@O$@>PDP@I8@(0B#@JLAL0DO@BXAB D5@LHAD0B#@JL@(0B#@JL@(0B#@@H@5P@H@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0D*@O$@>PC9@O$AB D^@ID@F A1@H@@%@@K@JL@(0B#@JL@(0B#@JL@(0B#@JL@Y@C3@E\@C BD@F,@"@@9@JL@(0B#@JL@W0@1@RXAAPC@@GP@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@@@@(0B#@JL@(0B#@JL@CPC!@FH@#PB @FTALPB#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0@@@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@@@B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@JL@(0B#@@@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> factory1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #factory1Image"
	
	<resource: #image>
	^Image
		extent: 71 @ 46
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 289 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 353 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3950 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 256 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1027 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(321 321 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 867 867)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@@@@@@@@@@@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@@@@LAL@@@@<L3LIL"43L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@@@@@@@@@@@@H@D@@@@ L3L3G@=ABSL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@@@@@@@@@@@@@@@@@@@@IB@=@@@@@B(3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[MCPOG!8VD#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@@(]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AB$3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L1\^@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L6@@@@@@ABC @@@@@@@@@@@@@@@@@@@@@@@@$3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L)@#T@@@@9I3$LHRX@@@@@PB0@@@@@@@@@@CD3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L2<E@@@@J2H3L38U@@@@IPL-FA @@@@@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3LM@@@@BCL3L3LF@@@@D#L3L1@@@@@@OSL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L;@@@@@@$3L3L(@@@@NCL3L2T9@@@@M3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3LCO#8>O#8>O#8>O#8>O#8>O#8>O#8>O#8PL3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L9@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L9@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L3L3L3L9@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?L3L@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L1$YFQ$0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AFQ$@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L_@@@@@BP3L3L:@@@@@@$3L28@@@@@P3L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L3L3L3L3L3L>@@@@@DP3L3LQ@@@@@AP3L2L@@@@@F#L3L3L3L3L3L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> factory2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #factory2Image"
	
	<resource: #image>
	^Image
		extent: 67 @ 53
		depth: 11
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4657 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4625 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5717 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4497 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3726 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7387 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7741 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6584 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5557 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5557 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4753 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4593 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4529 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3661 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4625 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4625 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4625 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3501 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3533 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3661 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4497 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4464 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4593 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7901 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 7163 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6617 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5685 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5332 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4689 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4625 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4561 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4689 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4464 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4497 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4657 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4593 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4561 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4593 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3597 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3533 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4657 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3758 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7387 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7966 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7612 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6713 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7677 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5460 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6584 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4753 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4657 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5492 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3693 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3790 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3533 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5332 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5460 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5717 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7420 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2666 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3597 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4625 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4529 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2633 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3661 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6456 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5492 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4593 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5492 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7644 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8030 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6617 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6456 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5878 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4464 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4561 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4561 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4625 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4657 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4529 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3758 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4657 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5460 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 6617 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4818 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3629 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3726 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3597 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3629 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3629 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3758 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6584 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5781 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5557 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4464 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4625 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3693 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3661 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3597 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4657 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2698 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4593 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3565 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3790 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4721 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4721 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5492 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3629 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3565 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 5524 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3693 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4689 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7548 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6456 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6617 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6617 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5492 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5621 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4689 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4625 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3693 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3661 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5557 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5653 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5364 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4657 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2633 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6456 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6552 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 4272 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3726 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2666 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2762 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3661 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2826 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2666 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4593 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3597 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4786 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5492 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4657 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6874 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5524 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5492 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5460 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4464 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4689 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4593 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4561 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4689 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4689 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5460 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2666 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 3437 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 3437 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2666 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5267 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4625 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3790 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5621 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5621 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7901 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6745 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7002 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6360 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5428 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4753 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5557 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5717 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 6745 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6681 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4753 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2666 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3790 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4529 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5492 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4625 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6745 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 7163 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6841 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5717 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5524 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4240 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6713 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4786 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4850 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2666 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 3501 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4721 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5589 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2698 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4593 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7484 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6745 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6584 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5492 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5621 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4689 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4529 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4721 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3629 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3854 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3790 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 4400 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3597 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 4368 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3629 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3693 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4497 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 3533 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3565 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2762 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5557 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7612 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7805 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6777 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6488 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5396 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5814 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 5846 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4561 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4786 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5589 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3822 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5814 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4721 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4786 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2666 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 3597 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4657 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4625 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7837 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7066 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6552 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 6906 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6713 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4721 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4464 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4818 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3726 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3726 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2858 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3533 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4753 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4625 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3790 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4753 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3661 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3790 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3693 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4753 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3790 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7548 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6745 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5589 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4786 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4786 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4625 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3597 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4786 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4657 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 2055 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4753 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4818 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5717 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4561 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3822 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3854 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4753 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4946 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4786 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3726 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3790 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3822 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4657 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4689 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3726 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3918 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3790 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7130 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7098 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7163 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5717 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5814 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6970 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4753 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4786 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4593 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 3790 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3726 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7934 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4786 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4721 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4689 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3758 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 2762 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 2633 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3758 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4753 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7612 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6745 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5717 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5589 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4721 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6713 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4786 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3886 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4753 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2730 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6617 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1959 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4593 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3726 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2858 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3726 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3758 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3790 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4721 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4786 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3822 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5781 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6906 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7034 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7002 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5589 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4753 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4689 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3661 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3501 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3790 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 3019 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3661 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3918 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3950 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4657 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4561 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6424 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6906 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6874 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6874 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6777 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4593 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5717 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4786 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3790 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2890 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4786 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6681 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4786 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7805 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 2569 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6938 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5524 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5653 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 6874 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4721 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4432 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5589 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3790 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3758 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3790 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5621 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6681 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 6777 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7355 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6970 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6103 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5685 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4689 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4721 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3950 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4818 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5075 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3244 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3758 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5717 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3886 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6681 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4786 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4721 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4689 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3854 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4786 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5717 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3790 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3854 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5749 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5396 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5685 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5107 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5075 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3854 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3886 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3726 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2858 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2794 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1991 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2955 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4850 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3822 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 2730 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2762 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 3597 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3854 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3758 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7066 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7355 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5653 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5717 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5749 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4529 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 4818 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3950 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3886 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4818 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 5621 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7291 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6777 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6874 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2794 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4882 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5653 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 4561 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4914 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3822 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5717 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3854 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3918 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8062 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6970 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6745 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6874 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5974 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5878 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4914 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5717 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3629 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6745 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2794 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2826 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5685 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3886 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4786 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3854 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2858 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8030 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6809 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7002 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6938 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5717 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5878 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4850 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4978 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4978 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6841 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6906 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2826 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3822 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3918 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4978 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4657 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3822 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5428 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3886 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2923 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7548 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7130 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 6938 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5846 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 6809 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4753 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6809 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 3886 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3726 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3693 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6681 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4786 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4914 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2890 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5717 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4721 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3822 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2858 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3854 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3886 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3790 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3886 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7002 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6681 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6809 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6167 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5749 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4689 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6841 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6938 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3950 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4786 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 2987 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2826 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3019 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2890 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4850 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3983 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4721 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3886 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7901 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7966 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7966 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5717 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6006 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5685 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 4978 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 4753 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 4818 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6070 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7098 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2794 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6970 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6552 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5781 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3950 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5814 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4657 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3822 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5846 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8030 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6681 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6970 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7098 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5942 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5814 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7195 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4818 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3693 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 3501 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3950 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3726 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4914 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5043 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6649 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4946 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 3629 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 3726 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2858 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5717 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7966 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6713 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6649 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6970 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 6745 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5717 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4882 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4786 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3950 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3854 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4978 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4882 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5814 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 3083 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4914 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4914 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2987 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4914 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3854 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 4593 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 2890 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4721 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4786 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5814 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3886 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4850 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3950 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7098 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7002 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6745 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6809 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6745 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 6874 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4786 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4175 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3983 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6906 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3019 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2987 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1959 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4914 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3918 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3758 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3983 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7709 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8094 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6841 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6841 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5910 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4978 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5139 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4818 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3758 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3983 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4818 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4689 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 4015 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2023 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4978 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4015 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 4464 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4753 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 3501 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 3661 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7805 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7516 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 6970 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5749 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5814 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5749 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5974 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6874 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 6906 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3918 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3019 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4240 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 4015 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3822 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4561 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 5010 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4850 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 5910 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4914 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2987 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3918 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4882 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4818 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3886 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3886 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6745 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3983 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3147 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7934 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6777 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7227 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 6006 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5781 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6263 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 5974 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4946 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 3758 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4079 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 3083 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 2923 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 4946 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3854 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5878 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4946 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6745 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4753 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3950 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2955 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 3854 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3886 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3854 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3950 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4015 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3051 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4047 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4015 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7163 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6970 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 6841 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5685 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5942 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5171 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4657 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4882 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3918 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4015 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5749 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3983 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 2023 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 5010 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6777 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2923 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4753 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 4689 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5878 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3950 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5010 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7066 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6713 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 5749 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5814 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6970 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4946 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4978 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6809 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4207 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5781 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3918 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3180 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 6938 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7195 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5781 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5814 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4946 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4497 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4978 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5910 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 6038 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7195 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6809 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7002 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7002 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3212 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3147 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2955 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4015 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5942 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3918 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4818 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4047 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5749 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3083 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 3019 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2184 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7934 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7934 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7355 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7420 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6135 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5974 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4721 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4914 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 5010 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4047 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4079 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3918 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7130 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7227 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6938 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2955 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4850 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4786 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4978 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4914 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 3115 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4015 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7323 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7259 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7163 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7098 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5878 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4914 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4850 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 4946 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4047 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 3950 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3051 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4978 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7195 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6970 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 4047 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 4143 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 5139 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 4689 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5910 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 3983 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3886 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3083 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4914 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4079 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4978 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4047 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7934 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7130 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7130 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7291 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 5653 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4978 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4882 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4946 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3950 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4079 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4593 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5139 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7098 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 2184 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 5010 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6777 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 4721 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5107 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5043 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7323 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7066 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6070 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6809 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5910 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 5139 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5878 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4111 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3983 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 3822 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 3083 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 3083 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4015 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 2152 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 3886 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4240 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4047 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7420 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7452 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5846 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7034 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4850 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 5075 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3950 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3758 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3886 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4079 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4079 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7066 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 3822 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4047 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 4015 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4047 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3115 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3115 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7130 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6938 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5974 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5974 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4914 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4850 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7452 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4047 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3115 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4111 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3918 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 6970 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7163 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7195 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6874 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4978 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4015 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3212 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7998 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6327 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6038 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4946 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 4850 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5043 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4175 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3950 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6103 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3276 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6906 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4111 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4336 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 2923 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 3918 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 3115 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4143 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4111 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4047 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7387 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7002 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5942 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6199 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 4978 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6263 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3950 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4111 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7452 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7002 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7130 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7002 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6809 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6199 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 5075 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4079 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4111 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3147 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 3051 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4015 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5075 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5974 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 5043 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3180 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7130 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6906 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6970 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6295 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6103 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4946 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4978 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5139 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5846 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 5043 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3051 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3212 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 3212 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3180 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5942 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3115 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4143 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7548 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7259 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7227 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7323 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7355 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4914 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5139 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4400 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7163 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7002 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3437 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3372 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4207 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 2152 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4111 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 3950 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 4111 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4143 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4079 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4207 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4914 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 2858 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 5043 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4015 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3244 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3276 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7130 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7066 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6906 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7227 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6231 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5460 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4978 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5171 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4047 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3051 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7291 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6906 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6906 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5010 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 3083 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3115 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 3854 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4111 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4015 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4336 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4175 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7998 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7195 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7259 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5942 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6263 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 6874 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4978 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 6006 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 3950 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4368 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 3083 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4175 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4143 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 5107 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 4143 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4015 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5846 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 2987 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3212 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 3180 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 4111 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4143 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 3212 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5974 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4175 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7066 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7034 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6103 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7420 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5107 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6970 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 5043 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6038 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5139 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3180 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4111 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5974 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2280 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4336 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 2955 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 4047 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 2890 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4079 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4400 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3308 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7548 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7612 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6006 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5942 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 7034 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4978 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5171 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4175 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4272 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4111 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 2987 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4079 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4240 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4079 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 4111 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7130 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7387 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7066 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6360 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7195 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5010 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5043 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 5139 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4272 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 5139 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3180 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7259 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7387 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7163 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7259 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3372 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3115 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4207 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4143 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 6103 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 4079 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 3918 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5974 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 5043 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6970 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3180 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4047 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 6070 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4175 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5910 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4336 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4240 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7612 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7516 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 5974 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7291 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5010 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 4946 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 5267 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4432 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7066 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3276 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4207 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 2312 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4175 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3019 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4047 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4079 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4079 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4175 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4175 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7548 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7420 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 6938 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7580 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7387 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5267 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7130 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4111 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4240 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4111 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3308 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3469 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3115 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 2248 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4175 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4047 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6938 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7002 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4240 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4207 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 4882 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6938 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 6006 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 4079 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3276 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3276 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3212 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 8126 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7227 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6906 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6199 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5974 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6070 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5043 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7195 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4207 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4464 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 3147 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3276 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4015 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4047 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4207 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4304 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4240 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 6167 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4111 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 3147 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4175 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5910 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 3308 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4432 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6135 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7291 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7484 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7452 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6488 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7420 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 4914 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5267 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4079 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4240 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7548 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3276 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5171 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4143 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5332 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3244 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3180 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4272 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 3886 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 2890 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 3950 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 6006 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4175 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3276 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4272 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3372 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4304 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4304 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6070 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 6167 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5267 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5107 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5267 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4207 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5010 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5203 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5075 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6103 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 2376 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6231 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5428 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4304 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 5235 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4207 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 4818 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4111 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 2955 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4175 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4143 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4400 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4240 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4272 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4143 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3340 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7901 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7034 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7580 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6006 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6199 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5171 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5075 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5107 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5203 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3372 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 4850 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5332 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 6970 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7644 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7227 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5492 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4272 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4240 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 6103 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4240 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4047 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 5010 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4207 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 6135 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4207 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7612 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7130 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6263 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 6167 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5460 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 5043 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5267 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4207 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5267 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5235 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4272 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4304 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4240 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4304 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2280 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3212 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4240 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3244 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4207 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4336 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7452 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6038 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6103 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 5267 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5171 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4207 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4175 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3404 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3629 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4240 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5107 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6456 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6167 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3244 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5557 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5235 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4304 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5557 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3340 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5589 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4143 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4207 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4207 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3308 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3244 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4175 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3276 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3308 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4272 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7355 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7355 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4240 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6360 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6167 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5203 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 6167 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6295 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5235 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3372 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5235 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 5267 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4175 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4240 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4207 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5589 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3212 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4079 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4272 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4015 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4240 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2441 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7259 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7580 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 6199 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7323 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5267 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7259 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 3950 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4240 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7163 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3244 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5332 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5492 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5300 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 7098 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4272 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4272 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4336 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4111 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4304 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5621 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4207 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4368 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5300 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3437 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7066 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7484 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6070 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6199 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 5171 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5235 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5364 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4336 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4272 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5332 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3340 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3212 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 2441 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3437 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4240 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4207 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4304 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4079 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4336 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 2280 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3372 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4304 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4497 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3372 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 6006 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7548 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7516 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 6199 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 6038 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6360 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5364 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4432 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4304 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4368 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3244 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3404 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3437 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4304 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4143 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4400 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5267 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 2409 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5428 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5557 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5267 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5557 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4336 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4336 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5557 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5428 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3276 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4336 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4240 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4368 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6392 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6874 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7484 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7355 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6199 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7516 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7420 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4272 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4497 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7163 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5524 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5589 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4336 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 4946 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4400 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5010 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 4047 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2441 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4143 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 6103 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 2473 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 6135 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3276 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4432 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 4240 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2409 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7323 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4400 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7034 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7323 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 6199 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5203 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5203 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4175 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4336 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4529 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3308 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4304 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5364 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5524 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4368 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 2473 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4336 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5267 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4368 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5428 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5428 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5139 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 6199 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 3469 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 3886 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 3308 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3276 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7387 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7387 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7387 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6520 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 7066 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 6199 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5653 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5332 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5589 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4304 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4240 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4497 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3533 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2344 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 2280 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3469 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4432 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5589 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4207 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4368 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3212 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2152 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3372 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2409 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6167 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4400 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2505 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6874 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7677 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 6295 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6231 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6199 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5139 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5524 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4464 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4368 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5332 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3372 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3372 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7387 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7323 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5589 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5364 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4304 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5332 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5524 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5043 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4304 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3372 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5203 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3533 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3404 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3469 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7420 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 6070 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7548 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5203 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5267 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5364 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4336 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5396 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5428 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3404 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5010 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 2505 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 2473 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4432 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5203 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3533 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7548 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7355 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 6295 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6392 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5203 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7227 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7452 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4336 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4336 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7612 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3469 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5524 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5460 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5332 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5492 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5332 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4400 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5428 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4240 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4336 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5492 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5139 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 4978 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 6199 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4561 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3372 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 2473 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3372 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4400 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 6135 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5171 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4464 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5396 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4272 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3083 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3437 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3372 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 2505 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4497 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5203 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4272 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4464 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 7291 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7644 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7677 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7677 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5396 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5235 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5332 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4304 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4304 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3404 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3437 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3469 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2537 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3308 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4400 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5396 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5492 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4400 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4432 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4272 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5075 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 4111 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 4946 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3437 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4432 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4432 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4336 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7548 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7420 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7805 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 6231 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5460 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5235 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5589 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4336 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4625 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4240 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4497 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5396 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2376 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2537 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5460 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5460 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5235 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4400 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 5235 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5235 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 4914 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 2473 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4207 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5332 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3469 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4368 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7516 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 6231 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5428 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4400 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4432 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4400 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3501 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4400 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4368 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4304 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5332 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5300 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4529 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3340 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 3212 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3404 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3501 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7516 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7548 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6199 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6424 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6167 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5460 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4368 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4529 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4625 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3469 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3501 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4368 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5332 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4529 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5300 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5428 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4336 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 5235 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4304 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 4593 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5332 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5364 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3404 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4497 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7452 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7741 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 7066 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6552 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6327 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6360 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7548 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4368 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5267 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5235 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3533 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5396 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6552 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5235 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5460 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4336 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4464 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5492 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5492 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5203 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4175 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4368 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4368 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3469 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3565 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7644 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6552 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6584 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5332 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5524 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4272 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4464 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4497 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4336 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5428 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5139 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3469 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5396 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4464 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3372 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4464 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4529 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3597 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5300 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7644 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7387 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6360 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6777 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5460 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5364 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6520 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6392 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4368 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4432 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3854 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2569 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3533 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4304 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4497 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5524 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5396 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5332 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4464 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3404 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3437 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 4336 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4400 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2473 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4464 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7612 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7773 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7259 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6263 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7420 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5364 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5300 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5300 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4689 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4497 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4336 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4304 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 3661 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3597 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3565 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4497 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5171 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4207 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3372 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4529 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4368 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5460 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1702 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4464 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3597 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7130 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6970 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5621 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5396 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5203 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6295 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4529 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3597 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5364 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4529 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 6424 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5203 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3437 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 3565 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4432 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7259 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7420 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7066 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7195 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5492 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5492 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4689 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4593 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3404 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5524 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5428 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2633 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4464 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4497 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5428 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5267 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5300 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5396 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3565 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2601 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6360 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4497 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4529 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4529 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4497 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4432 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7291 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7355 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6649 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5524 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5332 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5557 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4657 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4497 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 4850 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3372 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5557 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2569 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4497 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4400 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3437 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4625 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 6681 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5267 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5364 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5396 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4207 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4497 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4400 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5300 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4593 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5171 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4497 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 3340 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4368 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4432 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3790 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4497 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7323 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7420 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7516 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6295 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6874 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5396 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5332 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4464 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4529 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4529 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4529 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4529 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6424 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7452 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7420 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4561 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6392 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3565 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3533 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6424 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5492 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4497 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7259 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7484 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7580 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7355 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 6327 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5460 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5364 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5621 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4368 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4561 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3758 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3565 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3629 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 2955 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2537 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2473 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3661 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4432 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4593 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5332 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2601 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4561 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3501 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4400 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 5396 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4529 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7612 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6584 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7869 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6360 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5524 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5621 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5300 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4464 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4593 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3661 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 3565 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3565 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2441 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2633 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6327 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2537 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5171 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4368 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4625 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4497 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4529 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3629 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7773 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7869 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 8030 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5267 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5332 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4657 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4368 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5524 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3661 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4529 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5428 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4561 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4625 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4593 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4529 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 5396 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4400 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 4464 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4497 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3629 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7644 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7934 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6520 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6360 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5524 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5557 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5621 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4561 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4464 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3565 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3629 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 2633 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2569 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3629 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3726 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3693 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3437 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4400 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5364 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6777 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6520 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6456 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6520 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4497 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5460 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4304 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4593 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3533 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5107 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3501 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7484 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7677 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6584 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6488 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6874 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5396 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5332 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4689 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4368 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3693 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3693 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5300 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5364 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7805 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5428 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4561 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5332 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4625 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5396 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5300 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5267 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4625 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3437 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4657 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3565 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4529 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4464 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2698 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2569 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4593 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3629 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3822 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3693 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6552 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6584 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5492 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5524 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5300 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4689 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5524 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3629 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3565 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3661 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2730 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2730 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4593 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5364 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 4143 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3533 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3629 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6488 6841)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80\1A3DC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#AZ@BAPS=@W(C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80TUA1 EY@@E@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LD10EQ@@,GDPO#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@20G$0Q9A,<C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@?8C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80LP@^$GZPVX@>LC80O#@>LC80O#@>LC80O#@>LC80O#AM0AH \9@#<B4 Y.@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC^@BU@/,E30O#@>LC80O#@>LC80O#@>LC80O#@>LC80SBA+$EE ERAB C9 O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@J(@XPO+AW0C80O#@>LC80O#@>LC80O#@>LC80O#@>L@J K^@''8D2@]NA&<C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80R)A3 CY0T''@>LC80O#@>LC80O#@>LC80O#@>LC80O#A/XBDPI>A$T@$0\4@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LF:@_SAVLEJ@O#@>LC80O#@>LC80O#@>LC80O#@>LC80UA@PTBO@Q7A-LF[0O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@/TB&PHN@R(@E0^M@B,E_PF>A)<F(@TS@>0E(PI,AW8C80O#@>LC80O#@>LC80O#@>LC80O#@>LE&@J^AOLC:PYEATLC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80I&@GLFPPRK@8 CJ@IS@ZXAH@B8@A F9 [8A,8E @W9@N8@7PS!A-TDR W:@>LC80O#@>LC80O#@>LC80O#@>LC80O#@<8@]0MNA_4@K0Y/@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80NIA3HG+@IU@\<G# @Y@K\A[PHX@)0CJPL:@[4F-@QWA@DD00QB@Z\F90B(A$@@A SN@%PB"P^3@>4A9@IR@58C80O#@>LC80O#@>LC80O#@>LC80H8A"(AS0]N@S GM@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>L@LPB:AXDG+@\3A6HF'' X%AR$DU NP@/\CB0OQA1$B! I[AG(C.PZ>@XTC/@C!A-DDH ^.@!PAA0Q^@''<B&0QX@^LD0PO#@>LC80O#@>LC80O#@>LD30D8ALPGEPB;A-@C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#A\@D_PD#@<4AZ U[@/ D4@N2@[DD7PRLABTF6PLS@*XG[ ETA2TCT0P]A$0B\0OT@4,AOPG+A%8F5 TTA_8CX@Q4@-,C8 O#@>LC80O#@>LC80O#A4 E;@K]@:XAN@Y/@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80FB@CTDF0Y2@M8F,0D_@RDDD0QYADLEWPW)AOTE( J#AR<BJ0B=@.@B" ^4@IXG[@WY@%XE4 @HA<<A^0]I@B0C3@H$@5<E-PAF@>LC80O#@>LC80VX@24F#PL-@G\G#0O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC^ F-A;TB?0GC@L @K B&AE(CC@RMABLC,0I''ALTDS@V=@6LGH0NL@R DJ VD@-TDXPN!@>PED@W?A:4C-@OOA&4EDPL''@,4B.@C\@>LC80O#@>LE&@IZAB\DW0DFAOPC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@><C#0FXA9X@X0W/A+XF=0T+AXHD< N5A^,AI@LAA[PA0PO''@T0C)@H"@+\BF@GN@-$B7@]8@)(C@ K4@04CC ]JA(TEK Q\@@\@W M3@>LC80O#A/(CY@U!@1PFQ0R&@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O0@OXAUPD)@L<AB Z$A2PDI@HM@"TF-0]$A]@@Q0M&A$HAMPI;@YHF!0QEAY$CS@H6@N<F! I<@.P@.PZH@SX@]PH''@]HDQ@F(A=DC?0O#@>LC80VX@24E?PQ_A(0C" O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LB!@J?A+0E''0G,@"(@M LTA9DDI YZAH<FI NGA3TG^PRT@44G^ E<AAPFI0EM@7PB''0E>A[(A% FWA.$GY0A8A",DQ0ZN@A,DR@S6@J,C80O#@>LB3 EZ@:XD>@AN@0<C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@4HFK@H@A78CU@T2AT,D>P]R@+0DKPHO@>TE60K6@D$G3 NQ@K0DV0^R@#4F@@JK@OL@%0U%@*HAB@DP@S\F: Y9@(@D]PJ:@IPEK@Y\@>LC80O#@#$ABPL-A"4C)0PU@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80\&AE4C^0Q>@D4F\0FYA.8C_PN=A/4@W0Z"AJ(F)PBX@D<E/ E[@#8F50C#A]PCDP^T@XDBJPK<@G4E;PIC@Z$@X@B-AL$C4 E/AL(C40O#@>LC80K%@&4D+@EW@I$E''P\=AM<BD WU@8,CI O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LAB0UI@=TD_0HF@P0@X A$AITFXPQ @RTA5@\:@E@EQ @]A3,DJPA9@XL@9@B,@(0BPPY4A74DFPW.A"$E6@S A:<E_0C0@_0EQ@O>A''TD? G>ALXF. E1@N@A\ J=@!LE!PH7A,4G(@M5@XPB>PZE@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@]TE50VCA- DX _V@G0D=0WZA''XA]@@^@G(CK M9@/4BK D&@A<@G@[>@@(E/0\W@]XDRPH&@_4FI@F?A+,EJ T-@FXD@ Y_@ \D@@YH@2,@R@^9@!\CD F+@3DD3@KO@6,G#@XB@;XDK GP@84FQ C"@\@BD@O#@>LC80O#@>LC80O#@@@C80L2AILE(0]PAT0G%PLU@FHGT0X/@WPFX@IBAT$FL0PZ@P8D+PY]AJ\E4PIWA_,B> J;@G8CTPAQA5DG&PR@@+8EL@Y8A3XD9@PJAJ<BK0LW@" G,@S:@Z(@*PFT@2(F>PLX@60AS E=@64DQ V6AGHGX0L<AKDC?PN @>LC80O#@>LC80@@@>LD3PK>AFPFRPN+A DBW U)@CPF]0X/@-<G$@WSA($BV@U^@YLFR0JGAG0G5PI_A+<B!PC7AA0B\@KPAA8@Z@R.@$@CT \7@EHFK [,A_@F[@G%AH8GUPJ''A70D$@_RAGXAA@G;@ODA4PNR@#(C. V[AMDA50Y0@:TB(@QK@>LC80O#@>L@@@O#A4<BK@S;A$$C; MU@:0CL@^@A(<FL@M"@.D@CPJ%@5XAPPF]@6$@>@PG@2<FL D?@=X@M0[?@88G'' D''ANHFE0^1@L(C*PFZA5XF\PF,@3,C50UB@D0F>0HUA;HA,@S?@K8BF G&@^ BVPI=@J<@KPMOA38GO0JBAY(C] ZJASDC80O#@@@C80J]@,@F/P^]AVXF0@UNA*XGZ0WCA5PEE0TZA= FLPLVA$4E=@F/@3PC/0JH@^4B[ I1A;\AW@E\A^(CYP@ @;\C@@[A@5@A10WA@!,BE B0A[\@$PZK@;,C6@Q3AFXC$0MW@3LB9 J9@#,B 0P/A]0D^@HA@OHB60U\@^\C.@N(A1PC@0@@@>LEF@I/A+4GT@Q;@%0AU DOA;XD20]X@.HEY0R0AT4B#PM(A64EW0@L@7\F:0C4@O$A1PH-A5\E0 Q%@ULD$ ^8A2\@HPF@AFLBX@E]AY8F-PE^A2DAW0F2AF\C[ M>@.\B@ GX@-DC6PO(A:DEX@M<@(DB(PGSA9<E)@S#AHDAV@EY@J8@@@O#A_0A+ V#AV(BB@BZ@P4FR ^ZAV G&0M!AB,GO@Y"@W<@^0P,A&LG%0A''@6(GF HYA90DYPGYA9 FY@KC@FTDE S<@NTCOPG?@#@A[ ]Y@^(A\@P0@V@D7 PC@^8BZ@F3A1LC4@GB@U@@R0Z8AVHD*@RQAT\E.0S%@; B)@D<AV,E5 K#@@@C80E!@&<D*0E"AP@BW@P1A\P@4@^[AL,G( CQA0HDS D9A_TGG@PDA9\A&0FF@0PA-@A)A*\CAPKA@9P@R YC@X\AX0ZP@@8ER@KB@* G. @0@J\F$PNU@(8DAP]?A1XE)PSRAKHER ZRA2 E[@ZSA$8EL0X4A/0DA ]*AKLE) P_@F(G(0@@@>LBWPK@AJ,ADPP2@QHB:@WD@''H@T0K)@*$F@0_YAZ\ES0U-A6<DA@GZA:P@70Y[A6TBH0]%A*DG PV#AHHDL0]@A,H@L KS@A<@C0ZT@=(FA@U.A TFA S&AIXGY [CA]4E@PT4A_DGZ@^;A&TE7 T5APHFA0TY@VPD40PZAPLDZ@DS@GX@@@O#@>LC_0R+@QDB: LY@$PCPPC&A-(C+PU^@QPG50V(A4DC: V\ASXBG@GD@(<G/@T7AS\F%PAT@*(EF0NV@S,B]@N>@1(@=PY:@F,F^0]MA1,FB@X5A0@G)P^BA0DF(0V<APPE[0YOA;4@_0@3A $E\@[DA-HC[0\CA@ C%0T8AMPA60D:@@@C80O#AD4D*0CM@Y0C&@F^@!4A"@[[APTEE0@IAMTBG _TA0PB:0XJA#X@3@B[@R,AO B@A=(G/ [-AS$C/ X7@O(A-PH1@&,@,P]Z@?DEG@@Z@N\FB0V)A;<@''@[/A$PE\PTFAWDF% _[@C @NPY&A,T@UPYP@O,ET@T]AI\E70T^@^<A"P@@@>LC80S''AJ,AX B]@VTAY O2AUD@?@NY@:(@C0O@AWHFTPDT@&DA''0IE@L8@H C=@N F<@[F@H@AC AT@$XCMPU3@A@GA@HCAZ(CZPR4@]0D&@@:A^@E*0_@A* F5@Y<AWDEA WEA)\GV0_AA) FF@\(A2HCA T:@<DFC@WFA''4EG0E5@R0@@@O#@>LEN0S;@]4@ PG^@$\C0 P4A4HC+ @#A#LA" FJA8LAY0FCA2$G!@XYAN G!PIH@0\BP D-A-0D5 Q)A 4DS0HDA=@C+0J+@-PF<PL[@QTE+@\E@WLBO@\*A0XF*PVFAS0E!0XNA0\F< Z*A-4F7PQ*A:XCV@MCAUHD50X8AS4A70E@@@@C80O#AX D>0J,@LDBRPJP@)DA(@W2A*,A<@JRA8XGZ ]*@BH@[@B?@_DB1@_BA]\C00MYAN$AK \HA@$@]@]0A[ B5 YRA''8C& MG@EX@U0N@@L@BBPXO@^@FD@];A*0E8PT AWPE]PYSA#$E<0VI@10FN H2@I8@''0CB@#LC<0TG@*4B1P@@@>LC80USAKTB$0B A/LA< N[@<P@V@D/@BPGJ0@#A:\@00VJ@<TEO Y''@QX@20L>@HHDZ0L6A!DA- A-A: B+ EBAUPG\POF@KHGW@RCA!HDB0C)A4LBG0B!A:$G\ \(A!(E+PU6AS<E+ VK@3\BR VLA20DC@QP@8DA(P_C@*<D!@M0@:H@@@O#@>LC''@I5A54E#PEC@\ B50KWAB@D&PB"@X,@IP\]@14B;@E(AA\A1 P5@_LG!0K-@+@DM KFAW\B; T!AHTB10C*@ZHD6@@Q@O8@ 0_DA*4CB@VNA)$D- I6A%PFN0CR@[\CG BD@, E8 C+A*8FZ@RZ@S@BR0[GA<TCG0SYAHXA8P]K@@@C80O#AN(B;0WG@E$@[ S+A58D-0JTA, E#0GI@*,B2PV/AI,@(0HJA[@CBPMZA,$G* PM@''\@V @RAA @[0L AH\G\0^H@?P@40O[A[$F0 W#@_PEH P7AI0D''PI8A[DG7@BE@MPD'' Y)A\ @5PCV@Q\FD0ED@2D@D0DXA9LEY@GJ@HX@N0@@@>LC80O#@Z4@,0E)AP @O@@=@APAQPMDAF0EBPXTAY@@O RHA!4F+0[4AP(@V0^I@"@@O0K0@ ,@-@U_AF4B,PIL@#P@!0QQ@D@FUPSZA7PE^@C,A5<@50[^@<\FG@PNAK E2PE+@ZL@6@\-A4PBC@M[A#0@"@M\@Q A)@C?A0$D[ UU@,(@@@O#@>LC80]E@KLAFPR9A!8@I R:@ZTEB0VQ@H$CWP\JA<XFG0G"@< A20UE@G@DN@[JABDBSP_]AN0A#@O\A[HF_0VRA[LGG \_A\(D 0F8AS8EH0PO@ATFU O5ARPB^PO]A68ALPNBA-<EC@TM@\0C7 TNAUXG7 O6@/DA#PFN@$8GB0O#@@@C80O#@>LC80^#@H(B20\.ARTA] EFA!TFV0^J@$<BX ]LA/TF& ] @P@CQPO7@? E9@D2@Q(@W@N0@4XC 0F9AC$CH W%AI<BMPF:@3<F @VSA_XFE D[A<\@I0I#@M$CR@[K@H,B%PR;@V0CW@AA@5,AQ0F$A%\DN CG@>LC80O#@>LC80@@@>LC80O#@>LC80]FAF<D;PBL@+HA=PQ0@IHG]PS.@/H@;PCZ@_XE%@BMA&(A=0O9@?(FV@]G@T @1@JV@38C>0FU@%@E^PS/AJ@C?@R<AH$GH@BNA+@EU0G8AC,FF0OI@Q0E%P_H@%DCH0DAA:,@P O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80J3@+PA.0JW@0(G70ACA),A3PG2AC0G2PCE@_$C70L/A(DA#0B$AC4C''PN^@AXDO G:AP<D/P\L@DPG2 D3A"@EV@PP@>@CRPD]A+DEVPR!@[,G] L$A(HG8@D4AGDC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LB6 DBA8,AG A1A<,F, FPA\,F 0B5A"D@#0P?AU(@60JO@GHD( ZDAK4C!@A&A#4@$@EIAK8GCP]!@?@C!PW&A<0D<@PQA2<DP@L8AH(C(0O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LA@0T&@YDA]0W''@DTE3@M@@W E=0F@A"HDT QSAK<@J@@@@@DF8@X>AW(E3PX#ADDB-P_MAJLC2 W(@[0D)@@BAW,E% M2@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>L@2PK3@2TF''@B6AEPDUPTRA#<F8P[!@@L@1 D.AF D<PVWAJTB]P@DAT@DD OK@B$GC ["A4TGD O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@C80O#@>LC80O#@>LC80O#@>L@)P[#@;DF3@\OA.PGL@\PA%$D60NW@8XCR B3A_ B6@JXA.TG40H!@W$BY@O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80@@@>LC80O#@>LC80O#@>LC80O#@>LB- WNA\\D: K/@&TAR ]7A&,FZ0^V@E4CNPEK@X$B^ O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>L@@@O#@>LC80O#@>LC80O#@>LC80O#@>LBAPN_AL@C\PZ]@>DB3@I*@&$C80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@>LC80O#@@@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> family1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #family1Image"
	
	<resource: #image>
	^Image
		extent: 56 @ 64
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2184 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSFP]BT%LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSBYSUR-_SD1LSD1LSD1LSD0IJST5N"MLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0LU0@@@E$GSD1LSD1LSD1LSC(@@@@@AU=LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSC8@@@@@SR1LSD1LSD1LSD0&B @@@@AWYD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LR0@@@@@@F@1LSD1LSD1LSDH5@@@@@C)DSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE8^@@@@@@AQKT1LSD1LSD1LG0(@@@@@R59LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LRU\@@@@@@A8TSD1LSD1LSD1LF@@@@D4MSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0#MP@@@@@@U0=LSD1LSD1LSD0M@@@@G$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE4@@@@@@@@@S$1LSD1LSD1LD0T@@@@>SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LF@@@@@@@@@@>SD1LSD1BAE5QSP@@@E)LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1\N @@@@@@SSILSD1$H@(5@@@@@@@@N#8NSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1@W1P#SP@@@@@:WD$<H0(@@@@@@@@@@@@@@D5"I$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE4^JP@@@@@@@@@@@E\J@@@@@@@@@@@@@@@@@@A]SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CU!SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@@@@@@@@@@@@@@@@@@@B (@@@@@@@@@@@@@@@@@VU=LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LB @@@@@@@@@@@@@@@CU[F@@@@@@@@@@@@@@@@@@JT41LSD1LSD1LSD1LSD1LSD1LSD1LSD1_D40 @@@@@@@@@@@@@@@@LBXR@@@@@@@@@@@@@D5WSP@XW$1LSD1LSD1LSD1LSD1LSD1LSD0LTB$:CVH@@@@@@@@@@@@@@@@+SDH5@@@@@@@@@@@@G $)@CTYSD1LSD1LSD1LSD1LSD1LSD1LSE4:SP@@MP@@@@@@@@@@@@@@@E5LSC(@@@@@@@@@@@@ I 4@@D)LSD1LSD1LSD1LSD1LSD1LSD1$B#UWSP@@@@@@@@@@@@@@@@@@N41LF@@@@@@@@@@@@B@&QP@@PP0TE@1LSD1LSD1LSD1LSD1LIS,@@@)W@@@@AST@@@@@@@@@@@AQP$0C@@@@@@@@@@@@ATH+@@@QDR8^LBMLSD1LSD1LSD1LSD0&TP@@@E]WSP@9JP@@@@@@@@@@@E]TSA$@@@@@@@@@@@@JK0T@N&HJ@@@@MU=LSD1LSD1LSD1LSD03@@@@MU-W@C=W@@@@@@@@@A8@@@TTE@@@@@@@@@@@@@@;MP@?X @@@@@5W$1LSD1LSD1LSD1LSET@@@A"I#(5AST@@@@@@@@@AST@@EDY@@@@@@@@@@@@@@@@N $0@@@@@FILSD1LSD1LSD1LSD1LM#T@@CMSMR$J@@@@@@@@@@@@SP@@@B8@@@@@@@@@@@@@@@A]CAEM@@@@E$1LSD1LSD1LSD1LSE(XSP@@@@(@B%\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MT%LV%\@@@T4SD1LSD1LSD1LSD00@@@@@@@@@@@@U5\@@@@@@@@@@CT^TQ 5@@@@@@@@@@@@@@ACSD0YB @^RT1LSD1LSD1LSD1LK0@@@@@@@@@@@@@@JU\@@@@@@@@@N"-YHVH@@@@@@@@@@@@@@ADL@S@@@FH/EEILSD1LSD1LSD0/MP@@@@@@@@@@@@@@JST@@@@@@@@:H0UXH0@@@@@@@@@@@@@@G! ZSP@@SQ8^PQ-LSD1LSD1LSD1SMP@@@@@@@@@@@@@5JST@@@@@@C(#TP9[@@@@@@@@@@@@@@@@@@@@@@@@@@@@P41LSD1LSD1LSE<^@@@@@@@@@@@@@@@5JT4@@@@@SR$@RE4@@@@@@@@@@@@@@@@@@@@@@@@@@@@EW41LSD1LSD1LW18@@@@@@@@@@@@@@@AWU0@@@@@5TU%BL@@@@@@@@@@@@@@@@@@@@@@@@@@@@E]ISD1LSD1LSD1_G @@@@@@@@@@@@@@@@AWU0@@@E]"I41Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@SR)LSD1LSD1LSDH.@@@@@@@@@@@@@@@@@@AWB @@SUD[SE\@@@@@@@@@@@@@@@@@@@@@@@@@SU\JXD1LSD1LSD1LCC,@@@@@@@@@@@@@@@@@@D4)MPAWLT1LMP@@@@@@@@@@@@@@V5D@@@@@@@@^T0@>SD1LSD1LSD1LBST@@@@@@@@@@@@@@@@@@CUWSU]$S@05@@@@@@@@@@@@@@@>WP@@@@@@@C)BU6ILSD1LSD1LSD1BTP@@@@@@@@@@@@@@@@@@@CT:U6QLP#T@@@@@@D4@@@@@@E-[@@@@@@@@B$HJFD1LSD1LSD1LSD03@@@@@@@@@@@@@@@@@@@@@@(EJ$1HMP@@@@@JU0@@@@@@CRL@@@@@@@AMW2$USD1LSD1LSD1LSCL@@@@@@@@@@@@@@@@@@@@@@A9ISD%M@@@@@A@^@@@@@@@,H0@@@@@@@D47AU5LSD1LSD1LSD0&R0@@@@@@@@@@@@@@@@AM@@@@DFQLT44@@@AML28@@@@@@E-[@@@@@@@@@A5QDT1LSD1LSD1LSDIQ@@@@@@@@@@@@@@AKO%D@@CTYCD0>@@@@@CT+AP@@@@@@F#@@@@@@@@@@WS(RSD1LSD1LSD1LSC@@@@AM@@@@@@@@U5QLJ0@@TT1LSE1M@@@@U0%Q@@@@@@@@MP@@@@@@@@@J@C9LSD1LSD1LSD1LR @@@A J@@@@@@@EW40>@@AJSD1LBQ8@@@@8JCL@@@@@@@@@@@@@@@@@@D4@DT1LSD1LSD1LSD1GSP@@V5\@@CT@@C@&SFD@@DMLSD0QU5\@@FHFX @@@@AWSP@@@@@@@@@@N (6SD1LSD1LSD1LSBL5@CT>JP@@N$4@R$1LX@@@WT1LCED@U0(@B40Q@@@@@AE]@@@@MSL@@@AWNQ=LSD1LSD1LSD1LS#T@B!IW@@AKB @;CD0Y@@@XSD1 JPAMJU\LSA0@@@@@H2<@@@AQI@@@@DE@SD1LSD1LSD1LSD0YMPAWL"$@@FIW@C ASE,@@EELSBMM@@AMHD0%J0@@@@@+O@@@@B]I@@@@H$1LSD1LSD1LSD1LSB(5@B%SJP@@EU\@@A]LR0@@AT1LDP@@@@@ESA=A@@@@@A Y@@@@E09M@@A]SD1LSD1LSD1LSD1LUCT@JVD:@@A"U0@@U$0^@@@0SD1]@@@@@D-LP%D@@@@@L2P@@@@/P#(@@E-LSD1LSD1LSD1LSD0KMPAWQS(@@@!W@@A[SA @@E-LMA @@@@@X$0&L@@@@@AQW@@@@DHSG @@KD1LSD1LSD1LSD1LSA\5@E]$D@@@DQ8@@D9LBP@@YD0GTP@@@@A#SCQCMP@@@EE[@@@:CBYQ@@@QSD1LSD1LSD1LSD1LC3(@G!QA@E] NP@)K40<@E\SSB<)@@@@@A5LSE4:MP@@L54@@EALS@ @@E5LSD1LSD1LSD1LSD1LB@A]SD$@F%=T@@U_SDIML01LQE\@@@@@E$1LWT4:SP@;L0@@NT1LO @@L41LSD1LSD1LSD1LSD02@C%LP@)YW01MR35LD0(?SD0/U0@@@CTTSD0"@CT)SR,P@@@>SD1S@@@ESD1LSD1LSD1LSD1LSFP@H41LX!)_SE%QP$1BMS9LSB<)@@@@G$ILSE4@@@)WL3T@@AELSA\@@C([SD1LSD1LSD1LSD1LVCU!SD1SF%=LUQ8TSAP@GT1LK5\@@@@UCD1LV0@@@E\^SP@@J41LBP@@MU1LSD1LSD1LSD1LSD0LMVELSB(8ED0>MVQLXP@#SD1$MP@@@C9LSD0R@@@@@A8J@@@QSD06@@@5BT1LSD1LSD1LSD1LSBX5T41LYCUISBL@BT1S@C9LSC]W@@AME41LSEP)@@@@SS(5MP%LSCYM@@@+SD1LSD1LSD1LSD1LT0AVSD0,@A5LJ0@ISC<@R$1LEA8@U5L%SD1LEA8@@@@@MQ85T41LSE@@FE-LSD1LSD1LSD1LSD0^@AELSA8JWP1W@D,SMST C@9K@@@)@T1LSD1LM#L^U0@@MS(^MD0_L@@YSD1LSD1LSD1LSD1LMA1[V$1LM#X-IUDJG$I[H4$%F @@@D)LSD1LSD1LSBX6H TJU28=S@1GTP%LSD1LSD1LSD1LSD1LSD1LSD1LSD1LKVQISD1LSD1W@@AKI$1LSD1LSD1LSD1LW2($RT1LSD1BSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE! K3QLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0b')
]

{ #category : #resources }
BitmapImageLibrary class >> fire1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fire1Image"
	
	<resource: #image>
	^Image
		extent: 46 @ 45
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2344 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2376 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDRNEEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTR$MA5EQTUEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTPLV@3)XRUDRR5EQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTS5GJQ 9NEEIKEEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQRS)QV2<Y@5MXTUDXC5EQWEEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQX6YQUDY#Q@XMTS(.RQH1M%EQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEIF@IQJ14,X4(RTQ WTUEUPEEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUD:CE1QVE8(UAMQRT(ATUD,WUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEIQAIQQ%IXNDQQCT<''RUEVH!IQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTQH)TUEQTUD8D@@9R1IQC1(KKEECMDQQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTT%DJUEQTT-CB0@.CUD)FE9RNR$:R&]IRUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTV\XN%EQTU=%MP@<BEDMEP@@T3L&IUEDL5EQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTP\"N%E\TQ%@MP@@Y$%]MP@@OD5HJB%MQEDRN$%QTUEQTUEQTP@@TUEQTUEQTUEQTRMGTUDXTQ!O@@@@VAE^K%8@MU ,X!X"E@LMFB%QTUEQTUEQTP@@TUEQTUEQTUEQTR$:TUD[JP(5@@@@DEIEF5H@T (:RRXWKDQ&V%EQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTR$.CP8@@@@@@CT9C @@MU!QJRT2NTPTIEEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTR,ZKE\@@@@@@@,"E0@@W! GX0,FT3L)JUEQTUEQTUEQTP@@TUEQTUEQTUEQTUD8NBH<B X@@@@@@@,9O@@@F"YHF0@KK%1QTUEQTUEQTUEQTP@@TUEQTUEQTUD8V3 MICI^WU8@@@@@@EH]@@@@OA1@KP@]PTP)@2$RTUEQTUEQTP@@TUEQTUEQTUD$UD$6B#0KL%H@@@@@@@@@@@@@W"9NB0ASMDQ#I@\8TUEQTUEQTP@@TUEQTUEQTUEHIE1@N585GP@@@@AR@@@@@@@@W!4]I0@]XP<"KA$)TUEQTUEQTP@@TUEQTUEQTUDJPA82AC]RGU8@@E8P@@@@@@@@W!5^O@@<T0X"N1,:TUEQTUEQTP@@TUEQTUEQTUEXODPZF15RL X@@@-^@@@@@@@@O@Y^W @5T @2PT<VTUEQTUEQTP@@TUEQTUEQTUDJMVLFEU85NQ\@@@AR@@@@@@@@MST''T @@@@@<K!=\TUEQTUEQTP@@TUEQTUEQTUDJMQ05MPA^B$(@@@@@@@@@@@@@@@@FMP@@F#T<L%ADTUEQTUEQTP@@TUEQTUEQTUEXOCT@@@@@W ,@@@@@@@@@@@@@@E8WMST<H@,7OA4''J"%QTUEQTP@@TUEQTUEQTUD4F%8@@@@@@@@@@@@@MP@@@@@@@A@PMUL5MP@@W ,@OBYQTUEQTP@@TUEQTUEQTUDHF#0K@@@@@@@@@@@@A%H@@@@@@EH@@@@@@@A^W @@MSAQTUEQTP@@TUEQE!MJR#$9OEH''MP@@@@@@@@@@W @@@@@@@@@@@@@@@CT''@@@@T$AQTUEQTP@@TUEQJ@,@@@AR@@@5W%H@@@@@@@@@@@@@@@@@@@@@@@@@MS0@@@@@MTA\JQIQTP@@TUD)AP@@@@@@@@@@B58@@@@@@@@@@@@@@@@@@@@@@@AROEH@@@@@@@A^W5EQTP@@TUD)B @@@@@@@@@@@E9R@@@@@@@@@@@@@@@@@@@@@@ART @@@@@@@@@@JEEQTP@@TUD)AP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@REEQTP@@TUEQJE85@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FAIQTP@@TUEQV34,MP@@@@@@@@@@@@@@@@@@@@AR@@@@@@@@@@@@@EH@@@@@@@@5X1IQTP@@TUEQTUD:I3T@T%H@@@@@@@@@@@@@@CUOW @@@@@@@@@@@EM$J$09Q%@"N%EQTP@@TUEQTUDCR#H5GUL@@@@@@C05@@@@@CT"MA]R@@@@@@@@@DX4JU,1N%1ITUEQTP@@TUEQTUD)IQ45S1ERMQ5@I&T]@@@@@@-MJV\XGUH@@@@@@@$\TUEQTUEQTUEQTP@@TUEQTUEQBD<WH#QMIB%QTT!^GT)]R E''TUEQRRX"NT(FT$D,TUEQTUEQTUEQTP@@TUEQTUEQJSM#WEEQTUEQTR 7R"8<XBIQTUEQTUD:FBU]A%%ITUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTP5PPU8@A 5QTUEQTUEQJTQ#O#)QTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTR%UP X?HS!QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> goat1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #goat1Image"
	
	<resource: #image>
	^Image
		extent: 53 @ 47
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4946 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2666 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2569 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4914 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2633 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4978 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2601 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'ST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST4@@@AMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSU(HST5MST5MST5MSP@@@D5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MXB%MST5MSQ\TST5M@@@@ST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSS\;P45MST4JYC=MST4@@@AMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MGRL;O3AHP0<;R$5MSP@@@D5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST4YS0@OW @@@A1MST5M@@@@ST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST4;E A^@D<#L45MST4@@@AMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5M@ @@@D<@@BM$DD5MSP@@@D5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSULAM@@#W <#E APIT5M@@@@ST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MP1X@S0@@@@@@Q#1 ST4@@@AMST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSQ!^@CP#@CP@C0@@OAYHSP@@@D5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSSUPC0@O@AX@E%8@W#P@@E1M@@@@ST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST4MPA4GC3P#@@<@@D<@@D<EXB0KG44@@@AMST5MST5MST5MSQ]NH#A_MSXWQ@5SST5MST(JC%QQHUXVE"L@@D<@@C1OKD JQ45MST,7SP@@@D5MST5MST5MST4"N0@4E @@E#1^B5IIAUAPF <V@@@@@@@@C0@<E#04@EY!ST5MST5MST5M@@@@ST5MST5MST5DTQX@C0<@OAX@E#0<OC0<E!Y^E @@OD=OE @@C0@<S0@VJ$5MST5MST5MST4@@@AMST5MST5MB!D#@D=O@@@4OC0@@@@@@@@@@C0@@@@<OC0@H0@O@@@@Q USST5MST5MST5MSP@@@D5MST5M@%4VO@@OW @@S30@W!XVE!XVE$=OOC0VO@@@@@@@@E8OO@@4J$5MST5MST5MST5M@@@@ST4L@5\@S4<#@@@@OAX<OD<@E#0<@@@@@@@@@C0@@@@VS4<@@D<VH5AMST5MST5MST5MST4@@@AMD@TVC4<@@C0#MD<@E @<C0@@@@@@@C0VS0@@O@@@OAYO@C0#O@@@ET5MST5MST5MST5MSP@@@C\EH0@@S0@V@@@@E!XOE @VH30<@@@@@@@@E!X<OC0@@@@<S4<@ODMMST5MST5MST5MST5M@@@@X0TGGQ5HKD<@@@@O@@@#S4<@@@@@@@@<OC0@@@@<E#0@@AXV@@=F@$5MST5MST5MST5MST4@@@AMST5MST45O@@@@@@@@@@@@@@@OC0@@@@VE$<@W @@E#0<E AO@E!MST5MST5MST5MST5MSP@@@D5MST5MSUL;S4<@@@@@@@@@@C0@@D<#E @@@@<<C2L@C4<@W AVD$5MST5MST5MST5MST5M@@@@ST5MST5MSP\@E @@@@@@@@@@H0@@@C0@S0<V@@@OE#PO@CP@H3MMST5MST5MST5MST5MST4@@@AMST5MST5MJSP@@@@@@@@@@@@@@BL#@@@@@@<@C30@MAYOE @[QD5MST5MST5MST5MST5MSP@@@D5MST5MST4?C1X@@@@@@@@@@@@<E#0<W%8V@@@@E#P@@BL@G0IMST5MST5MST5MST5MST5M@@@@ST5MST5MSQ\<@@@@@@@@@@@@S1X@@@AOE @O@@<@OAX@E%X(ST5MST5MST5MST5MST5MST4@@@AMST5MST5MP#,O@@@@@@@@@@@<OAX#E @@M@@;TD<@S1X@LT5MST5MST5MST5MST5MST5MSP@@@D5MST5MST4]C0@@@@@@@@@@@D<@@C0<Q%@)X04J@@<@E#0)ST5MST5MST5MST5MST5MST5M@@@@ST5MST5ME5H@O@@OC0@@S0A^WB$IUTD7ST5MSQ9^@@@@OC=MST5MST5MST5MST5MST5MST4@@@AMST5MST5PE"LVC5XTTAX<C0@5ST5MST5MST5MH @VOC1OJ45MST5MST5MST5MST5MST5MSP@@@D5MST5MTP=O@D<O@$5KC0@@G45MST5MST5MST4"H4<@E!)MST5MST5MST5MST5MST5MST5M@@@@ST5MSR$@@D<VS15MST4]C0<)ST5MST5MST5MSQ4@@@AON01MST5MST5MST5MST5MST5MST4@@@AMST4-C30O@D<&ST5MST4TVD5MST5MST5MST5MJS1FQ @#QD5MST5MST5MST5MST5MST5MSP@@@D5MSST@S2L@C2IMST5MST5MST5MST5MST5MST5 E#EIO@<SST5MST5MST5MST5MST5MST5M@@@@ST5MQEX<@C0OMT5MST5MST5MST5MST5MST5MSPUOB"DOU45MST5MST5MST5MST5MST5MST4@@@AMST5MAPA C0-[ST5MST5MST5MST5MST5MST4FQ#-SJP@QST5MST5MST5MST5MST5MST5MSP@@@D5MST5 OET3TD5MST5MST5MST5MST5MST5MSPQ^P44?H1)SST5MST5MST5MST5MST5MST5M@@@@ST5MSRYOLB] ST5MST5MST5MST5MST5MST5MO0@TSS<@C1MMST5MST5MST5MST5MST5MST4@@@AMST5MX@A_QPUMST5MST5MST5MST5MST5MST4.C29M@0<@OT5MST5MST5MST5MST5MST5MSP@@@D5MST4/C4,/C2AMST5MST5MST5MST5MST5MSU0@XD4]@@<BST5MST5MST5MST5MST5MST5M@@@@ST5MSQ<OD$0OX$5MST5MST5MST5MST5MST4LG0AWSQ4V@CAMST5MST5MST5MST5MST5MST4@@@AMST47B30)N1X>ST5MST5MST5MST5MST5MST49@E85US <G5%MST5MST5MST5MST5MST5MSP@@@D5MSPH<@E1 @BL^ST5MST5MST5MST5MST5MSQ4@@@UMMP<@TD5MST5MST5MST5MST5MST5M@@@@ST5MSQP<C2QCC6AMST5MST5MST5MST5MST5MT3%"G$42VF@?ST5MST5MST5MST5MST5MST4@@@AMST5MD18:KT4MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MST5MSP@@@@@a')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> horse1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #horse1Image"
	
	<resource: #image>
	^Image
		extent: 84 @ 68
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NB@9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NECLMS$9NS$9_@@ANS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NP@<NS$9NS$9&C0@MS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9ND @OV@!$GUD/@FLGS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NHU$@E4<WS2H<C0A%S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NHP@7@@@@@C\@@@1NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8)T6YTI"Y#@C\<@@<<M2%NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9ND0<@S2X@I @@C0@@O@<@@D5NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NYU O@FM#@C0@I#0@X0@WE0@WI @AS$9NS$9NS$9NS$9NS$9NS$9NS$9NS 5KLU=NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NOU<(S$9NS 4!C1]OO@A#OC0WS0@&@C\@@D<@@@@/S$9NS$9NS$9NS$9NS$9NS$9NS$9^Y4=OO@@<Z@Y''PQD)S$9NS$9NS$9NS$9NS$9NS$9NG6Y#@@@@C2HUDC0@@@@@@@@@@@@@@@@@@@@@@FL@C0@@S$9NS$9NS$9NS$9NS$9NS$8)B@TWO@@@E1\@@@AOI#0@BQU@R$9NS$9NS$9NS$9NS D>@@<<@A\<@@@&I#0@@@@@@@@@@@@@@@@@@@@@E30OX0@&S$9NS$9NS$9NS$9NS$9NE&E#E3\@X3]OE1\WO@@@@@@@@@@@S0=CBAYDU$8KW3DLNC0@@@<@M4<WO@@@@D<@@@@@@@@@@@@@@@@@@@@@I @@OBX!S$9NS$9NS$9NS$9NE!UWX0@O@C07@@@@@@@@@A\&E1\<@C0<E1]#E1]OO@@<M0@7O@@OE0@WS0@@E6MO@@@@@@@@@@@@@@@@@@@@@@@@@A\@I @BS$9NS$9NS$9NS$8MVS0@@@<<OC\@@C1OX2XWOC0<@@@<E1\<@@@WS30@@C0W@@A#X0@@M0<@@C0<@@@@@C0@@@@@@@@@@@@@@@@@@@@@O@@WE30)S$9NS$9NS$9NS$9WM0@7@A]O@A]#@@@@@@@@E1\<E30@@@@<I#\<@@@WI"XW@FL@@@<@@A\@OBY#O@@<O@@@@@@@@@@@@@@@@@@@@@@@OA\@@BYNS$9NS$9NS$9NS%Y#@@=OO@AOS0@@@@@WI&L7M30@@C1OI$<<@@@WO@@@@@@@@A\7I#\@O@@&@@@@@A]O@@@@@@@@@@@@@@@@@@@@@@@@@@<W@C]NS$9NS$9NS$9NS%@WO@@@M0@<S0@&E0@<O@@@@@@<O@@@@@@@OA\@OA\<@C0WOD<@@A\@I @<E30@@@@@OBX@@@@@@@@@@@@@@@@@@@@@O@@&@BANS$9NS$9NS$9NS#L@I @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@WC0A#@@@W@@@@S0@7@C\@@BX@OA-NS$9NS$9NS$9NS%$@@BX@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<O@@@C4=#S3\WS0@@M0A#O@@@@DUNS$9NS$9NS$9NQA\@@D<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@W@@<@@@@W@BYOX1]#M0@@O@@<OE]NS$9NS$9NS$9N@Q\<M0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O@@O@@=OS0@@C4<@C0@&@D<@S6ENS$9NS$9NS$9NT0@&@A\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<C0@WOD<@I AOQU\@@D<<@D<@E1-NS$9NS$9NS$9NK @O@D<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E2X<@@<O@@<%S$9SOBX<E0@@@A-NS$9NS$9NS$9NY&M#I @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@C\<@BX@C15NS$9NY @@E0@@@D5NS$9NS$9NS$9NF1\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O@@<X30OE$9NS$9NFVL<@FL@X2INS$9NS$9NS$9NF0@<@D<@@@@@@@@@@A\@OC0@OD<<@@AOI!\WE0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<@D=O@FM[S$9NS$9NCP@@OC0@S3MNS$9NS$9NS$9NF0<@OC0@@@@@@@@@@@A#M0AOS0@@S1]OE0@@@@<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<@@@<E15NS$9NS$9NS"<OOBXO@E]NS$9NS$9NS$9NF0<@@@@@@@@@@@@@@A\@@C0OX307@C0@@FLOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C0@7Y$9NS$9NS$9NS"T@@@@@ZFUNS$9NS$9NS$9NEP@<@A\@@@@@@@@@@C\@@C0@@A\@@FLW@C0WOD<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D<@JT9NS$9NS$9NS%<7@C1#BD9NS$9NS$9NS$9NK@@@S1\@@@@@@@@@@@A#C2X@O@<@@@@@S2X@@FL@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C1]&S$9NS$9NS$9NS$9 C0@,CT9NS$9NS$9NS$9NE6L@C0@@@@@@@@@@@@@O@@AO@C0&C2X&S0@@S0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AOI AKS$9NS$9NS$9NS$9NQ@4KS$9NS$9NS$9NS$8T@@<@X0@@@@@@@@@@@A\<@@<@@D\@S0@@X0@<X0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A#@@A%S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8-S30@E30@@@@@@@@@@D<@I#0WPD9NE#UO@@@@S30@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@I#MNS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8>O@@&@D<@I!\@@6X@I!\@E2XUS$9NS$8MBC8O@@AO@@@<E0@@I#0&@@A#@C07@D<<M0@@C0@<E0ENS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$,@C30<E0@@X0ATU$8OI$<@C0@AS$9NS$9NS$8(GP0OX0@<E0@@O@@@O@<@@@<@C0@@@D<O@FLWJ$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$4@X1\@I#0W@@A[S$8E@A\@E2YNS$9NS$9NS$9NS$9NE$@UVP<<@A\WX0AO@@<&@@@7S0@&@@@[S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NGP@OO@@@@BX@I!1NS$9(C0@W@BANS$9NS$9NS$9NS$9NS$9NS -DR0 RERIYG @@E0@@S31#I#MNS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8)C4<<X0AO@C0@X5YNS$8"E0AOE4UNS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS @O@C0OO@@@G%9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS%XPS2X@X0A#@C0WBD9NS$8"@C0@S2UNS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NU#0@X0@@@C]#J$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS YSAP@7@A\&@D=(S$9NS$8@X4<@@FINS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NUP@W@A\@C0@@T49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NY0!%OC1O@BYO@A\]S$9NS%X&@@AO@BMNS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NHP@<O@A#O@@<@T9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8LL$8%@@<@I"X@@E1NS$9NS#$<@@@&@D9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NHD<<@@<&@A\W@T9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NYPY$S$IOI$<@S1\WX5-NS$9NS# OX30<K49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NC0@W@A\@E30@R49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NJRMNS&@"@AHWX0AO@49NS$9NS @@@C1OJ49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9_@@@&OC\@I @<V49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$8KDB8"AU,@S0@@YD9NS$9NS& O@C0@IT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$82S30WE6L@I @<G49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS 4"J0 <R5@<@A]OYT9NS$9NS!$@I!\@BD9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9&@C\@@@<@I$<@B$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NCQ@2YUPLS 9#I!\[S$9NS$9NS$8WE1\@YD9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9L@C0<VQ,W@@AOBD9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NV@=VS%\@X0A"S$9NS$9NS$8+S0@&PT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$IOO@AOK$,O@@@OHT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9KS4YNS&DWE0AVS$9NS$9NS$9[O@@@C$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$X@@C\@M$8@X30@CD9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS \OL$9NS!,&S4=NS$9NS$9NS$9I@A\@ET9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$@@I A&S$8"I @@Y49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NQE%WS$9NS#L@O@UNS$9NS$9NS$9NK1]OBT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS!!O@A][S$8[OC0@N49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NG !NS$9NS&@@@FYNS$9NS$9NS$9NJ0A#@@5NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS%%O@AUNS$9WE0@@YD9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NH49NS$9NS#@@OE]NS$9NS$9NS$9NGP@@S6QNS$9NS$9NS$9NS$9NS$9NS$9NS$9NCP@&OEANS$8:X0AO@T9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS&XWE2ENS$9NS$9NS$9NJP@@X3MNS$9NS$9NS$9NS$9NS$9NS$9NS$9NUP@<C05NS$9@S0A#ID9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS 8<E4ENS$9NS$9NS$9NS <W@C]VS$9NS$9NS$9NS$9NS$9NS$9NS$9NHS0@K49NS$9S@C1OCT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$ @E6QNS$9NS$9NS$9NS$4<@@@''S$9NS$9NS$9NS$9NS$9NS$9NS$9NL4<@J49NS$9$@C0<U$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS%(@E5MNS$9NS$9NS$9NS 8@I!\ES$9NS$9NS$9NS$9NS$9NS$9NS$9%X0@@IT9NS$9SX0@WF$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$(@@DENS$9NS$9NS$9NS$-OO@@@WT9NS$9NS$9NS$9NS$9NS$9NS$8A@@@@T49NS$9SI#0@H49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS%,<OF]NS$9NS$9NS$9NS$8UI <@C5INS$9NS$9NS$9NS$9NS$9NS$85I#]#YD9NS$8ABP@WO49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS Q#@A9NS$9NS$9NS$9NS$8KL4<@@@$$S$9NS$9NS$9NS$9NS$9NS$8OM0@@T49NS$9D@D<@OT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS $@C0A_S$9NS$9NS$9NS$9NR31#C0AWS$9NS$9NS$9NS$9NS$9NS$9#@@<@IT9NS$9NC1\WT49NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NCP@<X4<[S$9NS$9NS$9NS$9NJTT"EU5VS$9NS$9NS$9NS$9NS$9NS$9!S1]#@T9NS$9ND @@AU=NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS 8EAR-SS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9%Y @8YT9NS$9NTP@WOC0]S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS#QNS$9NS$9NS!-OE2YYS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS P@@A\<GT9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS&U @A\@@B]NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9JIVY&IT9NS$9NS$9NS$9NS$9NS$9NS$9N')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> house1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #house1Image"
	
	<resource: #image>
	^Image
		extent: 81 @ 63
		depth: 8
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1381 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1349 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4272 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 610 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 963 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2730 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5267 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3340 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 835 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 803 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1188 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6263 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 417 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1027 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1413 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5364 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5717 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 642 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7484 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1252 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1284 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3790 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4175 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1638 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 513 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 481 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 867 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1477 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 706 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1863 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 738 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3629 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1092 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6167 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5396 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2858 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1734 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 321 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 963 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 931 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1316 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5267 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 546 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4850 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1188 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1156 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3726 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1541 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 417 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 385 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5846 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 770 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7259 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1381 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6841 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 610 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1027 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 4946 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 224 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1638 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 835 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 867 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1220 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7709 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 449 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6135 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1060 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1445 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3983 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 289 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3597 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 674 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3629 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1284 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1316 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3051 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 546 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 5974 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 899 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2312 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3437 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1541 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 513 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4079 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4432 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1895 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 738 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 770 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6199 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1124 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5428 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1766 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 353 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3501 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6424 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1349 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 578 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4882 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1188 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1220 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4111 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 449 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 803 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5139 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1445 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1413 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1798 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 642 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 674 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3565 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2794 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(321 256 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7098 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 899 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 867 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1252 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3790 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4561 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3404 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 481 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5557 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7323 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2248 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3661 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1092 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 353 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1477 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 706 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7548 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5428 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1349 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1316 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1702 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 321 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 546 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6167 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 931 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 578 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4432 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4464 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 770 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 803 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3340 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 385 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2152 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6456 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1381 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3918 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 256 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3565 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 610 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3533 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1220 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1252 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 481 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5557 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 449 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 835 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2601 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5139 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1477 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1445 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4368 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6906 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 706 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 674 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3597 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7901 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 289 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5364 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2055 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 899 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 931 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1284 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3469 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 513 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 1927 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7355 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4464 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1124 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1509 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 738 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7580 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;W9\;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N7^3X0$553,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@6O""NHI8*Y7N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N9L8[8"H"NJH"@&H"C,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3.V[X"*0 XPQB=+K9D$JNH;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N4Y<79F$M)"Q$YFQ$YFQ$^J*W>L;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,_[BB5]U0V2JWH2L#H2L#H$YEU* *!N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N?XG0N^%!AZ?/<#H2L#H2L#H$]-"^V.*7S,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3.MV.S")E3''J7T7WA[H2L#H2L#H$SXX3;"L ''S^N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N0O$*8#)]+=5J<  O%KH2L#H2L#H$V%U2; (&!A"W?P;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3/J1=C"*8"*W]I&!E3H97WH2L#H2L#H$_KXX.J8''&K)DB1CN3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N<0FEK"ZW&,/T5MST<C@M#6Q$YFQ$YFQ$V,P.ONZ*\HGZ1@F8S,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,1KE$PD@Z86IDFOY NE?CH:CZQ$YFQ$YFQ$V.*:^''OA8FBQB=9GB0[N3,;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3,;U*M)WYFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$PXFA XFA XF8$P/2133&:8;N3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;N3/U4:"10IFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$YFQ$PXFA XFA XFW+#X0)D:"DB,G3,;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,;Q\DDY8UAY9FQ$YFQ$YFQ2L#H2L#H2L#H2L#H2L#H$PXFA XFA XF6F.QDC"ZA/O$+ZD;N3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;N3,YQ2V1AL 35IFQ$YFQ$YFQ2L#H2L#H2L#H2L#H2L#H$YDFA XFA XFQB=U.FKXDA"+*>JSN3,;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3,;(]''@J3^DWB-5E,#H2L#H2L#H2L#H2L#H2L#H2L#H2L#H$YDFA XFA XFD@Y+A0_X<:(8"H#$B)T;N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;N3-Q*;"$2C\VHBB%E,#H2L#H2L#H2L#H2L#H2L#H2L#H2L#H$YDFA XFA XFK= (U\,P8!A#8*/"*8"&N3,;N3,;N3,;N3,;@@@@N3,;N3,;N3,;%]''$"DP@8B-\C>CHO,#H2L#H2L#H2L#H2L#H2L#H2L#H2L#H$YDFA XFA XF$^H/$TP\6LJH*3#"X=BH6PD;N3,;N3,;N3,;@@@@N3,;N3,;N3,C )9U$W''_7E0+@"@+9<#H2L#H2L#H2IGH$\"Q2IGH$\"Q2IGH$YDF$PZQA)DFT0[H.L"Z!PXP"A7"NNJH*6LCN3,;N3,;N3,;@@@@N3,;N3,;]>XNIRFQ&JSH2L#H2L#H2L#H2L#H2L#H$PZQA)DF$PZQA)DF$PZQ$YFQ2IGH$\"Q2IGH$\"Q2IDFA XFA XFA.KF2W\;N3,;N3,;@@@@N3,;N>:F4<7SM%072C_H2L#H2L#H2L#H2L#H2L"Q$PXFA XFA XFA XFA XFA,#H2L#H2L#H2L#H2L#H2IFQA XFA XFA&-^N- #N3,;N3,;@@@@N3,;::JT&B50E>^YJ6CH2L#H2L#H2L#H2L#H2L"Q$PXFA XFA XFA XFA XFA,#H2L#H2L#H2L#H2L#H2IFQA XFA XFA))DK0[$,9<;N3,;@@@@N3-LGVHFQ7X-C/D @$#H2L#H2L#H2L#H2L#H2L"Q$PXFA XFA XFA XFA XFA,#H2L#H2L#H2L#H2L#H2IFQA XFA XFA)FAJJ($^TP2N3,;@@@@..HI8(E9T:Q]49''VP.CH2L#H2L#H2L#H2L#H2L"Q$PXFA XFA XFA XFA XFA,#H2L#H2L#H2L#H2L#H2IFQA XFA XFA*)=*Y+,UXF88$X;@@@@.:.+9A043\ %T<  !OGH2L#H2L#H2L#H2L#H2L"QA XFA XFA XFA XFA XFA)GH2L#H2L#H2L#H2L#H2IDFA XFA XFA.XGX#Q" !8G*2%Z@@@@Q*Z&,C0<SS=67<"DC8:Q$YFQ$YFQ$YFQ$YFQ$YFQA XFA XFA XFA XFA XFA)FQ$YFQ$YFQ$YFQ$YFQ$YDFA XFA XFA(INK$Z\L^VC)*Z&@@@@N3,;N3,;N3$NM#95R"*Q$YFQ$YFQ$YFQ$YFQ$YFQA XFA XFA XFA XFA XFA)FQ$YFQ$YFQ$YFQ$YFQ$YDFA XFA XFA"<(B3,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YFQ8%T($YE9^TR8.K"8.K"8.L"XWUNXO\"Q$YFQ$YFQ$YDFA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YFQEOMDZ8"H0.&Q$YFQ$YFQ$S46)A^XM%L-$YFQ$YFQ$YDFA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q0!@X:W''3*$R8.K"8.K"8.CYJJ>]R2@J22L#H2L#H2IDFA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q)A28*%TPDI)9^W%9^W%9^]J%2MI\C3]J2L#H2L#H2IFQA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"QC.2Z_\?F1(IYVU%YVU%YV]ZY-NC12C:Y2L#H2L#H2IFQA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"QOYH0Z,(R2$&@ HB@ HB@ KY[Z@JKM1[H2L#H2L#H2IFQA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q.V4;N3,;N3,;N3,;N3,;N3,;CTJ?\P<>2L#H2L#H2IFQA XFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"QJI@;N3,;N3,;N3,;N3,;N3,;_;''\)I$W2IGH$\"Q2IFQA)DFA XFA)F*6#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q<0 ;N3,;N3,;N3,;N3,;N3,;3,=]$YFQ$PZQA)DF$YFQ$\"Q$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YFQ*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YDF*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YDF<0 ;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L"Q$YFQ$YFQ$YFQ$YFQ$YFQ*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N:>GWQX72L#H2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;$L</$PZQA XFA XFA [H2L#H$YFQ$PY"Q#,;N3,;N3,;@@@@N3,;N3,;N7*GWQ\6$YGH2L#H2L#H2L#H2L#H2L"Q*+0;N3,;N3,;N3,;N3,;N3,;3,=]$YFQ$PZQA)DF$YFQ$YFQ$PZQA Y"Q#,;N3,;N3,;@@@@N3,;N3,;N4XT.F.8"C"Q2L#H2L#H2L#H2L#H2L#HX"8;N3,;N3,;N3,;N3,;N3,;''X<V$QXW2L#H2L#H2L"Q$YFQ$X"Q"H"+Q#,;N3,;N3,;@@@@N3,;N3,;N9O$8.K"GZ(6M3\7M3\7M<#H2L#H2L"QN*4;N3,;N3,;N3,;N3,;N3,;4X:%&WTO9>_''9>_''9>"8"H"H"H"H"H"+Q#,;N3,;N3,;@@@@N3,;N3,;N?XI*8#""I+H2L#H2L#H2AXVE!XVE!XW.B8;N3,;N3,;N3,;N3,;N3,;X]Y\E,#R2L#H2L#H2L"Q"H"H"H"H"H"+S3,;N3,;N3,;@@@@N3,;N3,;N:BH8*.H*9*Q2L#H2L#H2L#H2L#H2L#HVZ4;N3,;N3,;N3,;N3,;N3,;H"Z%2GVY&Y&Y&Y&Y&Y!+"H"H"H"H"FLI)#,;N3,;N3,;@@@@N3,;N3,;N02+8("H*2#H2L#H2L#H2A\WE1\WE1\W.B8;N3,;N3,;N3,;N3,;N3,;:"T=!YFQ2L#H2L#H2L"Q"H"H"H"H"C"+Q#,;N3,;N3,;@@@@N3,;N3,;N4?$*8 88.HWE1\WE1\WE55]WU5]WU4/QD0;N3,;N3,;N3,;N3,;N3,;YX<NT36E$YFQ$YFQ$PXF"H"HG("H"MC$,C,;N3,;N3,;@@@@N3,;N3,;N;+$*16+9A4%IRT%IRT%IV%)ZV%)ZV$:3:4;N3,;N3,;N3,;N3,;N3,;\.50OUBJ6=/[6=/[6:&)NA8^G!88NC"3$3,;N3,;N3,;@@@@N3,;N3,;N84.%<TC@1U3/[6=/[6=/^?/;>?/;>>>W>,;N3,;N3,;N3,;N3,;N3,;$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$3,;N3,;N3,;@@@@')
]

{ #category : #resources }
BitmapImageLibrary class >> imLib1 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 1)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib10 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 10)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib11 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 11)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib12 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 12)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib2 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 2)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib3 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 3)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib4 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 4)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib5 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 5)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib6 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 6)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib7 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 7)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib8 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 8)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #resources }
BitmapImageLibrary class >> imLib9 [
	
	| num |
	(num := (self imLibPage - 1) * 12 + 9)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
]

{ #category : #accessing }
BitmapImageLibrary class >> imLibPage [
	
	^imLibPage ifNil: [imLibPage := 1]
]

{ #category : #accessing }
BitmapImageLibrary class >> imLibPage: aNumber [
	
	imLibPage := (aNumber max: 1)
		min:
			(self class organization listAtCategoryNamed: #'images - bitmap') size //
					12 + 1.
	^self
]

{ #category : #utils }
BitmapImageLibrary class >> imageResize: anImage by: aRatio [
	
	^self imageResize: anImage horizontal: aRatio vertical: aRatio
]

{ #category : #utils }
BitmapImageLibrary class >> imageResize: anImage horizontal: rX vertical: rY [
	
	^anImage shrunkenBy: (Point x: rX y: rY)
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> kangaroo1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #kangaroo1Image"
	
	<resource: #image>
	^Image
		extent: 84 @ 53
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ&L%-EDT)NK6PIGQQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTD1<)Y@\FW@8(SBL7S$U*J%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQHS2@<KP(NC!UAU 8NXD@#QUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTZA40A$EA@@AAETD@PTD@@DDUU0$1UEQTUEQTUEPBFV,2N@H]Q5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQHQUL@@@@UPP@@@@@@PTD@@@@@PUX"UEQTUEQTUEQ)C$EN@!-WEEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@6Y6<@@@AA@@@@@@@@PTD@@DDUETEWQT!TUEQTUEQE@P8#F30#AB1TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDX[C$D@@@@@@@@@@@@@PTD@@DDUEP@@XC)TUEQTUEPBK6@U@EY\MB%TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUA1 [AT@@@AAPPAAPP@@@@@@@@AAPP@UC"T''F%QTUEPZN$AA@DE F3)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTFE]AEQUA@@AAPPAAPP@@@@AAPTD@@@@UJ@9IG5QTUEQTC00#PPA [Q5TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP:M6AA@DDUPPAAPTD@@@@@@DDUU!UA@@@UU!T#YB1TUEQTQ6)NU$E\ZQ5TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP''P@9A@DEAPPAAPTD@PP@@@DEAETEAPTDUETE U2]&UEQTVTUSETDNA&PHUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ$PP@@PTD@PTDUPPAAETD@@@@@@@@UEQUA@DDU@A,BREQTTU]L@DEA@F][REQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD--@DEAPTD@@@AA@@AAPQUA@DEVPP@UETD@@@AA@D@GZR</F6A,@@@@@E1SWUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTADF@DDUPTD@@@@@@@AAPQTUPQUVEP@UETD@@@@@@DDUPPAAPTEAPTD@@@AAQUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQT@$@JEQUA@@@@PQT@PQUA@@AAEQUAPQT@@@@@@DEA@@AA@@@UETDUU!TUPTDU[S)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTMQUAPTEAETD@PQT@PQUA@@AAEQT@PQUAPP@@@DEA@@AA@@AAPTEAEQUAPTDUH4(2UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTN @@@@AAJAT@EQUAPQUA@@@@PTEA@DDUEP@@@@@@@DDUPTD@@@@@@@@@@@@@ETA[J%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTN$EAETEAETEAPTD@@DEAPTEA@@AA@@AAPQUAPP@@PTEA@@AAPQU L0E"C$D@PV@/OUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTV4DUU!UA@@AAPTD@@@AAPQTU@@AA@@@@PUXUPP@@PTD@@@AAC&@7O"D+U6<UPP([V5QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQHQTEAPTEAETD@@@@@@@@@@DEA@DDUPP@@@AUA@DEA@@@@PTDUH2<:RAMHP$TNPV@/OUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPBR$D@PPAAETD@@@@@@DEA@DEA@DEVC 8U@DEAPTEA@@@@PTD(M14*UEQTUAQJZR=MREQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP"M0AAETD@@@AA@@@@PUXUPQTUPTDUXD@N@@@UJDD@PTEA@ATNS%QTUEQTUEQGF%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD!JT$EAPTD@@DDNU49OS Y JF@#A$@(M05EQT=NM6<UPTEAO@]$Z%QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUF!W[AUA@DEA@C-/QTIGL!0 C Y-DS\NHQQTUEP2I5],PR NV!%TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUBXAU$D@@@@UU 0BBEQTR@$7XB<:EE<([S)TUEQTTF4U@A,X@2)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUFL3PP@@@@A U45TUEQTU@I-[1I(UB$UT1ITUEQTUA0UN3ATUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTZFU@@@@@@@@[KEQTUEQTF&LLXFP2UB$UU4T8UEQTUA0NPB]TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUB(2I1Y @DD@C"MEUEQTUEQTF$,LXFP2UB$UH38*UEQTUA0;WB]TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTRE--H09APQUAWB,=UEQTUEQTU@I-XE=BUB%AB!,HUEQTUD)AU&QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUB)(G5DBN T6YVT"I5T0DQ,#B$D@@DEAH3(8UEQTUEQTD0$7WDTTUE!A[F]!UEQTUB,NU!ETUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPT@$4''K3$[H6@(ER U@@AAETD@PTD@@@A RV!TUEQTUEQTZADFWDTTUE-APU](UEQTUFQ@N48HUEQTUEQTUEQTUEQTUEQTUEQTUEP=S$9NS$9NS$8[M6\AH1A@G 9APTEAPPAAETD@@DDUPP@Q@5QTUEQTUEQTEE9"XB=+L&P@@E](UEQTUF,[XE\''BEQTUEQTUEQTUEQTUEQTUEQTUEP]F3]''Y5\FA XFA DA@Q]WU5]WE4LWE3L#PF=\XD@FY1-KUEQTUEQTUEQTL$%@C#].O1,@PR@:ZF *J%--XD@7TUQTUEQTUEQTUEQTUEQTUEQTUEQTJ!P_L"8IM TYV2%+JS(:B14]SS(5N&TM[QX[M64''TVYTUEQTUEQTUEQT@"4;JB4#U31AEP8#U3\!V48 C#,^GUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ(Z@!HRALSD5$*J"Q&J"(*QF 2GQ4]N"9(UEQTUEQTUEQTUEQTK 8@PS,NX@8UEQTUN08FF0Y J@AAAD!TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQT@ )A@@@@@AT(ETE,J@@@@EX(ETD@MFU!UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTND4:V6Q)U4@UPP@UEQUA@DDN[6AAPBUNQP-HUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUF ]QV$FA"M N5YA@@@NH6H#HCL#M4<2UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEPZJ#DTE@I-PB @@DDN[48]TSHBTT!TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEP5YD9NS&5)K3)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUB(SUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQT')
]

{ #category : #resources }
BitmapImageLibrary class >> man1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man1Image"
	
	<resource: #image>
	^Image
		extent: 23 @ 72
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2826 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2666 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2569 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4561 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2858 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7966 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'H"H"H"H"H"H"H"H"E#,[E"H"H"H"H"H@H"H"H"H"H"H"H"HNIUACS1,"H"H"H"H@H"H"H"H"H"H"H!HKM @@PD,VH"H"H"H@H"H"H"H"H"H"H L@@@@@@@AWH"H"H"H@H"H"H"H"H"H"H"T@@@@@@@@%E"H"H"H@H"H"H"H"H"H"H"T@@@@@@D@IF2H"H"H@H"H"H"H"H"H"H%X@@@@@@@@CH"H"H"H@H"H"H"H"H"H"H!8@@@@@@@@RH"H"H"H@H"H"H"H"H"H"H$(6@@@@@ALVH"H"H"H@H"H"H"H"H"H"H!X,@@@@@A,"H"H"H"H@H"H"H"H"H"H"H"H2M#X@@BT8H"H"H"H@H"H"H"H"H"IGHEEM@@@@@@@,D"4VH"H@H"H"H"H"H"4+CRL@@@@@@@ATE10IARH@H"H"H"H"HA0@@@@@@@@@@@@6M @@B3 @H"H"H"HEFP@@@@@@@CX6M @@@@@@@AT@H"H"H"H?@@@@@@@@@@@@@@@@@@@@@AD@H"H"H"4D@@@@@@@@@@@@@@@@M @@@C8@H"H"H"(_@@@@@@@@@@@@@@@@@@@@@BT@H"H"L#X6@@@@@@@@@@@@@@@@@@@@B3 @H"H8E0@@@@@@@@@@@@@@@@@@@@@6MBH@H!YEM @@@@@@@@@@@@@@@@@@@@@WF2H@H$(K@@@@@@@@@@@@@@@@@@@@@CX%E"H@H%L=@@@@G1@@M @@@@@@@@@@@CYLH"H@H!YFLS]WL3T@@@@@@@@@@@@@@@@CH"H@H"H"H"H"F1\@@@@@@@@@@@@@@D@)H"H@H"H"H"H"BA<@@@@@@@@@@@@@@A\$H"H@H"H"H"H"K @@@@@@@@@@@@@@@CT8H"H@H"H"H"H"I0@@@@@@@@@@@@@@@CT H"H@H"H"H"H"Q @@@@@@@@@@@@@@@CT H"H@H"H"H"H"S @@@@@@@@@@@@@@@A]QH"H@H"H"H"H"K0@@@@@@@@@@@@@@@C$''H"H@H"H"H"H"K@@@@@@@@@@@@@@@@CAWH"H@H"H"H"H"A@@@@@@@@@@@@@@@@A@)H"H@H"H"H"H"CP@@@@@@@@@@@@@@@CX2H"H@H"H"H"H"B0@@@@@@@@@@@@@@@@@2H"H@H"H"H"H"M @@@@@@@@@@@@@@@@@2H"H@H"H"H"H3@@@@@@@@@@@@@@@@@@@2H"H@H"H"H"H-@@@@@@@@@@@@@@@@@CX2H"H@H"H"H"IQ@@@@@@@@@@@@@@@@@D@)H"H@H"H"H"HLD@@@@@@@@@@@@@@@@CD''H"H@H"H"H"HVG0@@@@@@@@@@@@@@@@LVH"H@H"H"H"HH@@@@@@@@@@@@@@@@@D "H"H@H"H"H"H-@@@@@@@@@@@@@@@@@ED"H"H@H"H"H"H8@@@@@@@@@@@@@@@@@B4"H"H@H"H"H"HR@@@@@@@@@@@@@@@@M!X"H"H@H"H"H"H''@@@@@@@@@@@@@@@@B2H"H"H@H"H"H"HZ@@@@@@@@@@@@@@@@CRH"H"H@H"H"H"H''@@@@@@@@@@@@@@@@@RH"H"H@H"H"H"IQ@@@@@@@PMP@@@@@@KBH"H"H@H"H"H"HT@@@@@@ARU!@@@@@@BRH"H"H@H"H"H"HVH0@@M @_@1\@@@@6S"H"H"H@H"H"H"H"I @@@@@@HQ0@@@@@S"H"H"H@H"H"H"H"KQ\@@@@@OST@@@@@HRH"H"H@H"H"H"H"E"T@@@@@D@,@@@@@PRH"H"H@H"H"H"H"H#HP@@@@@@@P@@@@PRH"H"H@H"H"H"H"H"\G@@@@@@@@@@@@DRH"H"H@H"H"H"H"H$PB@@@@@@@@@@@@PRH"H"H@H"H"H"H"H$HMM#X@@@@@@@@@PRH"H"H@H"H"H"H"H!XDD@@@@@@@@@@@DRH"H"H@H"H"H"H"H"HX@@@@@@@@@@@@KBH"H"H@H"H"H"H"H"HN@@@@@@@@@@@@BRH"H"H@H"H"H"H"H"HVE0@@@@@@@@@@S"H"H"H@H"H"H"H"H"H"B @@@@@@@@@@G"H"H"H@H"H"H"H"H"H"L @P@@@@@@@@Q"H"H"H@H"H"H"H"H"H"N!<@@@@@@@@@Q"H"H"H@H"H"H"H"H!X<U$$@@@@@@@@@Q"H"H"H@H"H"H"H"B@LW@@@@@@@@@@@@N"H"H"H@H"H"H!IUD@@@@@@@@@@@@@@(R"H"H"H@H"H"H X6@@@@MUTOIR(P@@@FL2H"H"H@H"H"H#,]D$P[H"H"H!P@D@AAR"H"H"H@H"H"H"H"H"H"H"H"H%D@@@AIHBH"H"H@H"H"H"H"H"H"H"H"H!(@@@@KNBH"H"H@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> man2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man2Image"
	
	<resource: #image>
	^Image
		extent: 29 @ 67
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4689 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4721 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'NS$9NS$9NS$9NS$9NS$9A"XDC1@9NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9NQ@;@@@@I1@9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9R@@@@@@@I#$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NS$<@@@@@@@GNS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9NRD@@@@@@@P9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9E0@@@@@@@#$9NS$9NS$9@@@@NS$9NS$9NS$9NS$9NS$CN0@@@DH"NS$9NS$9NS$@@@@9NS$9NS$9NS$9NS$9NS\''@@@@QS$9NS$9NS$9NP@@@C$9NS$9NS$9NS$9NS$9FP@@@@\9NS$9NS$9NS$9@@@@NS$9NS$9NS$9NS$MPBX''@@@@C3$9NS$9NS$9NS$@@@@9NS$9NS$9NQ(BO@\@@@@@@@AB@",9NS$9NS$9NP@@@C$9NS$9NS$"G@@@@@@@@@@@@@@@N2<,NS$9NS$9@@@@NS$9NS$9DTH@@@@@@@@@@@@@@@@@@DIJNS$9NS$@@@@9NS$9NS$8@@@@@@@@@@@@@@@@@@@@@B(.NS$9NP@@@C$9NS$9A#,@@@@@@@@@@@@@@@@@@@@@@A$9NS$9@@@@NS$9NS<G@@@@@@@@@@@@@@@@@@@@@@@@I#$9NS$@@@@9NS$9C0@@@ATD@@@@@@@@@@@@@@@@@@ABE#$9NP@@@C$9NPH@@@@;B T@@@@@@@@@@@@@@@@@@@@FNS$9@@@@NS$7A0@@N1<9Q @@@@@@@@@@@@@@EQT@@AH9NS$@@@@9NR4@@@AHNS$ZJ @@@@@@@@@@@@@EDB\@N0$9NP@@@C$9B0@@@A@9NS$&@@@@@@@@@@@@@DT9R@@@I#$9@@@@NS$9J @@EQ(9NT @@@@@@@@@@@@@BC$_@@@<NS$@@@@9NS%JI0@@B3$9E@@@@@@@@@@@@@AHNPD@@@X9NP@@@C$9NS%E@@@''CS$7@@@@@@@@@@@@@C [A0@*J3$9@@@@NS$9NS$D@@@DNS@@@@@@@@@@@@@@A4 @@@T9NS$@@@@9NS$9NS$U@@@OH @@@@@@@@@@@@@@N0@''NS$9NP@@@C$9NS$9NQ,D@B\D@@@@@@@@@@@@@@@@@D 9NS$9@@@@NS$9NS$9NS$*@@@@@@@@@@@@@@@@@@@;CS$9NS$@@@@9NS$9NS$9NS$&@@@@@@@@@@@@@@@@@DT9NS$9NP@@@C$9NS$9NS$9NS<<@@@@@@@@@@@@@@@@IC$9NS$9@@@@NS$9NS$9NS$9NRT@@@@@@@@@@@@@@C,JNS$9NS$@@@@9NS$9NS$9NS$9FP@@@@@@@@@@@@@@P#$9NS$9NP@@@C$9NS$9NS$9NS$H@@@@@@@@@@@@@@@GCS$9NS$9@@@@NS$9NS$9NS$9NPT@@@@@@@@@@@@@@B\"NS$9NS$@@@@9NS$9NS$9NS$9O @@@@@@@@@@@@@@N3\9NS$9NP@@@C$9NS$9NS$9NS$&@@@@@@@@@@@@@@@;JC$9NS$9@@@@NS$9NS$9NS$9NPP@@@@@@@@@@@@@@B\7NS$9NS$@@@@9NS$9NS$9NS$9EP@@@@@@@@@@@@@@I2H9NS$9NP@@@C$9NS$9NS$9NS=B@@@@@@@@@@@@@@@;M3$9NS$9@@@@NS$9NS$9NS$9LB\@@@@@@C,@@@@@@@@]NS$9NS$@@@@9NS$9NS$9NS$9@@@@@@ABP @@@@@@@A@9NS$9NP@@@C$9NS$9NS$9NSH@@@@@@ATU@@@@@@@@R#$9NS$9@@@@NS$9NS$9NS$9BP@@@@@@NC0@@@@@@DHMNS$9NS$@@@@9NS$9NS$9NS$)@@@@@@AIRP@@@@@@D"89NS$9NP@@@C$9NS$9NS$9NPH@@@@@@DTE@@@@@@AINS$9NS$9@@@@NS$9NS$9NS$9FP@@@@@@C$T@@@@@@AP9NS$9NS$@@@@9NS$9NS$9NS$Y@@@@@@@9A @@@@@@M3$9NS$9NP@@@C$9NS$9NS$9NQ\@@@@@I#$7@@@@@@@0NS$9NS$9@@@@NS$9NS$9NS$9P @@@@AGNS$@@@@@@C@9NS$9NS$@@@@9NS$9NS$9NTX@@@@@I2H9CP@@@@@@H#$9NS$9NP@@@C$9NS$9NS$9B0@@@@@GHC$I@@@@@@A@NS$9NS$9@@@@NS$9NS$9NS$#@@@@@@\LNTT@@@@@@C(9NS$9NS$@@@@9NS$9NS$9NQT@@@@@P#$9AP@@@@@@PS$9NS$9NP@@@C$9NS$9NS$9I0@@@@ABNS$K@@@@@@AENS$9NS$9@@@@NS$9NS$9NS$@@@@@@AT9NPX@@@@@@DT9NS$9NS$@@@@9NS$9NS$9NP@@@@@@H3$9I@@@@@@@@#$9NS$9NP@@@C$9NS$9NS$7@@@@@@@HNS$P@@@@@@@FNS$9NS$9@@@@NS$9NS$9NRH@@@@@@AL9NQL@@@@@@D(9NS$9NS$@@@@9NS$9NS$9CP@@@@@;QC$9L0@@@@@@B#$9NS$9NP@@@C$9NS$9NS$M@@@@@DH9NS$6@@@@@@@5NS$9NS$9@@@@NS$9NS$9NQ@@@@@@I#$9NS$@@@@@@@X9NS$9NS$@@@@9NS$9NS$9@0@@@@AINS$9NRD@@@@@FC$9NS$9NP@@@C$9NS$9NS$9I0@@B049NS$9QP@@@@@''RC$9NS$9@@@@NS$9NS$9NT @@C,7NS$9NS%JEP@@@@@@I2YCNS$@@@@9NS$9NS$O@@@@P#@9NS$9NS$9L!LRI0@@@BL9NP@@@C$9NS$9R#,@@B\=NS$9NS$9NS$9NS$7FRX*I#$9@@@@NS$9NS$9AQH&DC$9NS$9NS$9NS$9NS$9NS$9NS$@@@@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> man3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man3Image"
	
	<resource: #image>
	^Image
		extent: 25 @ 66
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2666 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2184 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2376 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2601 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'N#(:N#(:N#(:N#T6Q!H>JC(:N#(:N#(:N @@@C(:N#(:N#(:N!D1@@@@J0H:N#(:N#(:N#(@@@@:N#(:N#(:N#)PO@@@@@@ TS(:N#(:N#(:@@@@N#(:N#(:N#(:D@@@@@@@@A<:N#(:N#(:N @@@C(:N#(:N#(:N#X$@@@@@@ANN#(:N#(:N#(@@@@:N#(:N#(:N#(6I@@@@@@KTS(:N#(:N#(:@@@@N#(:N#(:N#(:S$\@@@@@E18:N#(:N#(:N @@@C(:N#(:N#(:N#8&@@@@J1D:N#(:N#(:N#(@@@@:N#(:N#(:N#(^S@@@@@,^N#(:N#(:N#(:@@@@N#(:N#(:N#(:G%@@@@@$SA(5N#(:N#(:N @@@C(:N#(:N#(^L#-G@@@@@AP+O4<^N#(:N#(@@@@:N#(:N#(REBP@@@@@@AUG@@@<H$@:N#(:@@@@N#(:N#(ZB@@@@@@@@B,+@@@@@@@/G#(:N @@@C(:N#)QC0@@@@@@@D\U@@@@@@@@EQD:N#(@@@@:N#(:F#0@@@@@@BPEO@@@@@@@@B,ZN#(:@@@@N#(:N$8@@@@@@BPEI@@@@@@@@@ABMS(:N @@@C(:N#)N@@@@@@@ B@@@@@@@@@@@L3(:N#(@@@@:N#(:F#0@@@@TQ0@@@@@@@@@@@A\:N#(:@@@@N#(:N %G@@@+B0@@@@@@@@@@@@AAN#(:N @@@C(:N#(IG@AGRP@@@@@@@@@@@@@@MC(:N#(@@@@:N#(:H0 HAS0@@@@@@@@@@@@@@A4:N#(:@@@@N#(:N!($ARP@@@@@@@@@@@@@@@@SN#(:N @@@C(:N#(ZAP @@@@@@@@@@@@@@@@<RC(:N#(@@@@:N#(:BR,@@@@@@@@@@@@@@@@@AQD:N#(:@@@@N#(:N!EI@@@@@@@@@@@@@@@@IAH(N#(:N @@@C(:N#(CF0@@@@@@@@@@@@@@@DH^N#(:N#(@@@@:N#(:N H@@@@@@@@@@@@@@@@HMS(:N#(:@@@@N#(:N#(^Q0@@@@@@@@@@@@@@@@(:N#(:N @@@C(:N#(:N 0@@@@@@@@@@@@@@@APN#(:N#(@@@@:N#(:N#(JQ0@@@@@@@@@@@@@@I3(:N#(:@@@@N#(:N#(:MPT@@@@@@@@@@@@@@EH:N#(:N @@@C(:N#(:N#TE@@@@@@@@@@@@@@APN#(:N#(@@@@:N#(:N#(QEP@@@@@@@@@@@@@@DC(:N#(:@@@@N#(:N#(:F",@@@@@@@@@@@@@@B8:N#(:N @@@C(:N#(:N!(+@@@@@@@@@@@@@@@LN#(:N#(@@@@:N#(:N#(NJ0@@@@@@@@@@@@@@R!8:N#(:@@@@N#(:N#(:L",@@@@@@A0@@@@@@CD5N#(:N @@@C(:N#(:N"0+@@@@@BP)@@@@@@@8TS(:N#(@@@@:N#(:N#(ZJ0@@@@@\A@@@@@@@AQD:N#(:@@@@N#(:N#(:F",@@@@@B14@@@@@@AP0N#(:N @@@C(:N#(:N 8+@@@@@AT6B@@@@@@KBS(:N#(@@@@:N#(:N#(FG@@@@@@UFR,@@@@@BA(:N#(:@@@@N#(:N#(:L",@@@@@P#HE@@@@@@@VN#(:N @@@C(:N#(:N!(+@@@@@DUQLP@@@@@@IS(:N#(@@@@:N#(:N#)QE@@@@@@PJB8@@@@@@D8:N#(:@@@@N#(:N#(:TQP@@@@$E#)N@@@@@@ARN#(:N @@@C(:N#(:N"UG@@@@GCT:MTH@@@@@M18:N#(@@@@:N#(:N#(R@@@@@DH:N!8M@@@@@ATIN#(:@@@@N#(:N#(:E0@@@@ABN#(:T"P@@@@$D3(:N @@@C(:N#(:N"$@@@@@I#(:N H$@@@@@DX:N#(@@@@:N#(:N#(G@@@@@B,:N#(2I@@@@@AEN#(:@@@@N#(:N#(:L0@@@@AIN#(:L@ @@@@@LS(:N @@@C(:N#(:N"4@@@@@H#(:N#TH@@@@@AT:N#(@@@@:N#(:N#("@@@@@DT:N#((J0@@@@@$MS(:@@@@N#(:N#(:LP@@@@@WN#(:N# @@@@@@CH:N @@@C(:N#(:N#<@@@@@DC(:N#)E@@@@@@@JN#(@@@@:N#(:N#(1@@@@@A@:N#(:E0@@@@@@M#(:@@@@N#(:N#(:P @@@BQKN#(:N$L@@@@@@A :N @@@C(:N#(:N!T@@@AGS#(:N#)NQ0@@@@APN#(@@@@:N#(:N%DU@@@@NP$:N#(:DPT@@@@@Q#(:@@@@N#(:TQH"@@@@@E@:N#(:N%D1O@@@OB8:N @@@C(:N$4@@@@@BBHFN#(:N#(:F ,@@@T,N#(@@@@:N$P$@@@UJ!D^N#(:N#(:N (<@@@8N#(:@@@@N#((HQH!BQ8:N#(:N#(:N!9E@@@@H#(:N @@@C(:N#(:N#(:N#(:N#(:N#(^LP@@@CD:N#(@@@@:N#(:N#(:N#(:N#(:N#(:N!4EATT2N#(:@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> man4Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man4Image"
	
	<resource: #image>
	^Image
		extent: 33 @ 60
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3340 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3I3$EAT <L3L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3HP\@@CQJRSL3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3A @@@@@@GCL3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3Q2L@@@@@FSL3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3P@\@@@@@N#L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3F2 @@@@>F3L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3H@@@@8Q#L3L3L3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L08>@@@@A3(?ESL3L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3X&@@@@@@\(EC\%N3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3B$(#@@@@@@@@@@@#I$D3L3L3L3L3L3L3@@@@L3L3L3L3L3L-J@@@@@@@@@@@@@@@@AP*F3L3L3L3L3L3@@@@L3L3L3L3L3LE@@@@@@@@@@@@@@@@@@@@ED 3L3L3L3L3@@@@L3L0L1,[L1(8@@@@@@@@@@@@@@@4@@@@@CQEL3L3L3L3@@@@L1@ECP<DD0(T@@@@@@@@@@@@@BMHAS8@@@@GLCL3L3L3@@@@L4@8O @@@B @@@@@@@@@@@@@@@@[L08#@@@,@#L3L3L3@@@@L3LJR#8@@@@@@@@@@@@@@@@@@@@J@!X@@C9@L3L3L3L3@@@@L3L3H 8G@@@@@@@@@@@@@@@@@@@LB"L@@D(3L3L3L3L3@@@@L3L3L3ME@@@@IAP@@@@@@@@@@@@RCP@@MA\3L3L3L3L3@@@@L3L3L3L[N@@@J D@@@@@@@@@@@@>M@@@B2\3L3L3L3L3@@@@L3L3L3L3Q# MPQ0@@@@@@@@@@@@@@@@GQ#L3L3L3L3L3@@@@L3L3L3L3L3X''L4@@@@@@@@@@@@@@@@\:L3L3L3L3L3L3@@@@L3L3L3L3L3L3L1\@@@@@@@@@@@@@G080L3L3L3L3L3L3@@@@L3L3L3L3L3L3L0X@@@@@@@@@@@@TF3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L4T@@@@@@@@@@@@DLCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L4T@@@@@@@@@@@@DLCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L0T@@@@@@@@@@@@DI3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L2(@@@@@@@@@@@@_RSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L4 @@@@@@@@@@@@TPSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L4@@@@@@@@@@@@@(BSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L2$>@@@@@@@@@@@EOCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L1(Q@@@@@@@@@@AHL3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L2\M@@@@@@@@@@@/L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3AE@@@@@@@@@@@NL3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3MC@@@@@@@@@@@\L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3LH@@@@@@@@@@@LL3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L)M@@@@@@@@@@:L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3I@@@@@@@@@@YL3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3R0@@@@@@@@@=L3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3C @@@@@@@@ACL3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3Q!4@@@@@@@@ML3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3ETH@@@@@@@@DI3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3OC @@@@@@@@TF3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3OC @@@@@@@@]Q#L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3OC @@@@@@@@>PCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3RSH@@@@@@@@#Q3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3LB@@@@@@@@@4C#L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L4T@@@@@@@@@RCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L@4@@@@@@@@@RCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3MI@1P@@@@4@@@@J3L3L3L3L3L3L3L3@@@@L3L3L3L3L3L;A 4>M@@@@@@D@@@@J#L3L3L3L3L3L3L3@@@@L3L3L3L3L3L''IBL#H2L#H39J@@@@I#L3L3L3L3L3L3L3@@@@L3L3L3L3L3L3LA,-F30<F1(=M@@@ASL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3LPH@@>GCL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3LXGP@(KSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3L*@@@(BSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3MJ@@@TJSL3L3L3L3L3L3L3@@@@L3L3L3L3L3L3L3L3L3L3L3L\I$QHLCL3L3L3L3L3L3L3@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> man5Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man5Image"
	
	<resource: #image>
	^Image
		extent: 44 @ 60
		depth: 6
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 289 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1638 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1830 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 256 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5685 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@TEDQDDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAPTQDPPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAB4-@@@@@@@@DA@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDKR4@@@@@@@@PD@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDDA@@@@@@@@@@@B@ A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PPD@@@@@@@@@@@HB@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA4]@@@@@@@@@@@WE0PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDGQ4@@@@@@@@@@A\WA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@\G@@@@@@@@GA0DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA0\@@@@@@@@\G@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@JB PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@(JA@PDA@PDA@PDA@@@A@PDA@PDA@PDA@PDA@PO@@@@A@PDA@PDA@P/K0@@FA ]GPLCC0<.K @@K"8@@@@@A@PDA@PDA@PDA@<@@@@DA@PDA@PDAB</@@@XFA4]@0LOC28.@@@.K @@@@@DA@PDA@@@@@@@@@@@@A$Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@PD@@@@@@@@@@@@FQ$@@@@@@@@@@@@@@@@@@@@@@@@#H0@@@@@@@@@@@@@@A@PDA@PDAA0\EP@@@@PDA@P@@@@@@@@@@@@@@@@DA@@@@@@DA@PDA@PDA@PDA@PDA@PDGA0UEP@@A@PDA@@@@@@@@@@@@@@@@@PD@@@@J@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@JB PD@@@@@@@@@@@@@@@@A@PVE PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@(JA@P@@@@@@@@@@@@@@@@DAAXVA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@(@@@@@@@@@@@@@@@@@@@@@@@@@KB0DA@PDA@PDA@PDA@PDA@PDA@PDA@PDB (@@@@@@@@@@@@@@@@@@@@@@@@,K@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@@@@@LC@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@@@@@0LA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P^G H@@@@@@@@@@@@@@@@@@P@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA8^@ H@@@@@@@@@@@@@@@@A@PPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@B</A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@K2<DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@UEPPDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@ATUA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAAHR@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDD!H@@@@@@@@@@@@@@B$DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@J0PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@+A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAA@P@@@@@@@@@@@@@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDDA@@@@@@@@@@@@@@@@@@@@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P.K @@@@@@@@@@@@@@@@@@A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAB8.@@@@@@@@@@@@@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@@@XFA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@@@@@@@@@@@@@@@@@@@A XDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@@@@@@@@@@@@@@@$I@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@@@@@@@@@@@@@@@@BP$A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@(J@@@HB@,KIRT@@@@IA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDB (@@@ HB0,%IP@@BP$DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P!HP@@I"XDA@4M@@@@E@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDABD!@@@&I PDCP4@@APTA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDG1<@@A(ZA@PC@0@@JB DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P_G0@@F!(DA@LC@@@(J@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@NC PDI2\@@A,[A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@P@@@8NA@P''I0@@F1,DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PSD0@@H"HDAA X@@@*J PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDAALS@@@"H PDFA @@B(*A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@@@@@APTA@PD@@@@@@@DA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDABX&EAPDA@PDA@PQDPPDA@PDA@PDA@PDA@PD')
]

{ #category : #resources }
BitmapImageLibrary class >> monkey1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #monkey1Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 54
		depth: 9
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5267 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1316 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1541 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6167 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2023 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7098 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2248 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 2987 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7644 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3180 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3437 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3404 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3212 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5043 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5749 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1573 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6231 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1798 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2505 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2730 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7420 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7612 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3212 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4175 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4818 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5075 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1092 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1573 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6424 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2055 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6970 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2280 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7548 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7612 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7677 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 2987 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5492 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5814 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1349 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1573 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2055 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2312 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2280 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2762 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7644 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7644 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 2987 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7034 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4625 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5139 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5492 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1830 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6392 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2537 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2762 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7420 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7644 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7677 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7677 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7644 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3244 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 3886 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7484 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4400 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4657 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5781 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1124 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5942 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1606 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6392 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7002 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7452 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7484 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7709 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3276 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7644 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3726 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 3950 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 3983 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1381 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1606 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6681 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1863 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7066 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2087 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7291 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2794 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7516 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7516 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3276 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7644 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3758 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7484 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7677 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5171 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5781 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6456 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1863 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2344 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7452 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3051 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7677 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7677 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7677 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4657 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4657 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5749 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6231 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6424 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1863 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2344 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7323 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3051 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3758 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 3950 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4240 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4721 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4689 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4914 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5524 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2120 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2601 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2826 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7484 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7709 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3533 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3758 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4240 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4721 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4689 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5107 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5749 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1670 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 1895 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2376 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7066 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7291 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7291 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7516 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7484 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7709 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3308 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3308 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4207 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6006 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1670 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7098 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7066 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2152 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2633 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3083 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7709 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3533 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5878 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5942 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6199 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6327 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 1927 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2152 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2152 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3083 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3533 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3276 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3790 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4047 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4272 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4464 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4753 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5653 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6038 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5974 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1702 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 1927 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6649 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6938 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2409 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7323 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7291 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7516 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7741 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3565 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3115 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7516 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2409 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1702 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4240 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4529 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4753 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1702 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6488 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7034 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2666 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7580 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3854 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3790 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4304 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4497 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1477 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1702 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6488 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2184 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6938 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7195 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2666 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7098 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7741 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3372 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7773 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3597 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4079 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4529 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6649 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 1959 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6906 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6938 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6906 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6874 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7773 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3372 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7741 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4753 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1027 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1252 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6167 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6456 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1734 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 1991 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2666 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7773 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3854 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4047 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4304 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4561 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4721 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6263 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1509 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 1991 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 1991 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6906 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7130 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7227 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2441 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7644 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4047 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 4978 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1284 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1541 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6038 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5910 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7002 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2473 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7163 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2698 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 2955 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3180 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7612 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3629 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3597 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4368 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4593 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1060 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5814 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6263 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6777 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2473 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6970 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7612 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3437 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3661 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4368 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4625 4111)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@* AE@B$@Z0C @J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+P@7@KH@GPB:@FXAAPBJ@B<@?0B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PC*@K\AT@DJ@P(AB B@@E<@L0AS@PP@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@8@C5@ADAB DJ@P(AB DJ@P(@T@@@@K$@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AR AY@P(AB DJ@P(AB DJ@P(AL@BP@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@DX@/PD0@P(AB DJ@P(AB DJ@P(@H@B.@RH@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AD A3@L(@D0DJ@P(AB DJ@P(AB DJ@P(AB A1@TX@XPB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PCE@G<@*0CU@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@C8@90EW@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AI@EV@K<@3 BQ@B@AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@GD@= @*@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@PP@^0D5@B4@3@B#@KLAT@DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@KL@;@B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PA''@@P@<0A"@Q$AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB AR@G4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@T4@0@C"@N,AT@DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@P@@K@PDAR0B0@J\@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AI C<@R(AP@DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@B@DP@B @*PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@BX@@@D2@E@AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@:0ES@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PDQ@F$AF DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@>PB>@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@D\@@@CB@Q$AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@@0EA@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PBV@MD@E0DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@]PD]@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PAO@CDAB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(@FPA%@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@-PD#@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@Q$@30A:@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@D @:@B_@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@SD@$ B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@@\@Y@DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB CS@D8@N@B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PBW@H0AFPDJ@HLAC DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB A7@TL@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PA#@DHAB D0@J<@''PCS@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AT@@^@OD@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AA@@=@J@AB BX@M8AQP@I@Q$AB DJ@P(AB DJ@P(AB DJ@P(AB DJ@P(AFPCA@H@AB DJ@P(AB DJ@P(@5 ET@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@J0EI@P(@X A4@J4@< C;@GTAB DJ@P(AB DJ@P(AB DJ@P(AB DJ@T@AS@D/@@XAB DJ@P(AB DJ@P(@+@AD@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@X@@0@S8@V0BU@J4@+PB-@H4@,0DJ@P(AB DJ@P(AB DJ@P(AB A1@P$@F C\@T AB DJ@P(AB DJ@P(AA0B(@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@A,AO@DJ@C@AT B-@J4@+PB-@J4@#0A5@P(AB DJ@P(AB DJ@P(AB @>@@@@+PD8@H\AFPDJ@P(AB DJ@P(@C@A8@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@KP@!@DJ@UT@7PB-@J4@+PB-@J4AA@CR@M(AB DJ@P(AB DJ@P(AB EP@A<@+P@7@T8@H@DJ@P(AB DJ@Q$@[@C_@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@@@AO0@ @C,@+PB-@J4@+PB-@J4@+PB-@AT@(PDJ@P(AB DJ@P(AB A1@@@@+PC!@S4@''0DJ@P(AB DJ@U@@GPD8@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@I$AB D^@BD@+PB-@J4@+PB-@J4@+PB-@D @SPCS@P(AB DJ@P(AB @0@G@@+PB-@I8@@PDJ@P(AB DJ@GD@_ AG@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PA(@CPAB EH@ET@+PB-@J4@+PB-@J4@+PB-@J4@UPCH@P(AB DJ@P(AB CV@P4@+PB-@@T@,0DJ@P(AB DJ@P,@=0B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+P@V@C@AFPBK@E @+PB-@J4@+PB-@J4@+PB-@J4@+PDO@A$AB DJ@P(AB @\@M,@+PB-@G0@CPDJ@P(AB DJ@E8@,PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PD.@GD@\PBA@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PAV@U$AFPDJ@P(@H@@@@L\@+PB-@J4@\ D0@P(AB DJ@EH@50B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AQ0A\@S8@( @6@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PC?@Q<AB DJ@P(@> D@@J4@+PB-@J4@U@EU@P(AB DJ@A @Z B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@)P@,@P(@C B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PD[@E8AB DJ@P(@P0B-@J4@+PB-@J4@) EH@P(AB DJ@OP@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@- ED@C8@&0B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@M0AK@P(AB DJ@P(@$PA/@I(AJPCP@Q0@1@C#@P(AB @ @@@@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AL0C=@P0@D B-@J4@+PB-@J4@+PB-@J4@+PB-@RX@PPB"@P(AB DJ@P(AFPB_@Q$AB A1@ID@@@B\@K0@H DY@Q @+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@] A5@FP@6@B-@J4@+PB-@J4@+PB-@J4@+PB-@NP@+@EP@P(AB DJ@P(AO0@$@IL@^PDV@IP@G0@J@M @L DJ@C$@6PCI@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@E@@"@CT@RPB-@J4@+PB-@J4@+PB-@J4@+PB-@R@AL@DJ@P(@9PBI@T<@K DS@SPAIPA-@ETAE@B-@LX@:PAR@@L@G@AU@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@D@CS@R$AM0B-@J4@+PB-@J4@+PB-@J4@+PB-@HT@;0DJ@P(AI0E[@L4@WPC>@U @+PB-@J4@+PB-@J4AM0BB@@H@>@D9@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@C0DJ@R4AEPB-@J4@+PB-@J4@+PB-@J4@+PB-@K,@@@A5@ML@# @"@E<AG AJ@BT@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AJ0DJ@@@@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4A@0C-@C0@@@EQ@MP@/0@:@F8@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@20DY@TH@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PDW@L$AA B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@D0AM B_@BL@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@S(AG @1@N8@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@ED@# @''@E\@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PAF@U0@''0A,@E(@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB$@K @9 @?@PP@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4AN0D,@C8@"@C0@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@R @SPAR@HXA@ B-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@U(@00DH@RD@<PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-@J4@+PB-')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> pig1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #pig1Image"
	
	<resource: #image>
	^Image
		extent: 63 @ 39
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 770 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 835 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1830 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 867 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUCA3H''QTUEIE@TSD@]D XVE"M@IR([M4)WT@DSG5P;I@,EETUEQTUEQTUEQTUEQTUEQTTOQTUEKC]EQTUEQP@#@BD^CQMRO"D@@BEG@@@3Q1D@@@@@DT\3Q2EG@@@@@@@@@@@@VA0VR3(0P"IEQTUEQPTDDTUEU@@MIDUEQTT@D!DMPP4Q@@4@Q1D@@BEXDP@@L4\!DP@@L1DQDQDQQ2D3@CLMK3L@@@@3K4\MAE,TOE@HV@5NQSPQQ4!EQTUE@EQODP@QQ0@@@@@@@@@3L0@3@@@@@@@@L0@@@CMGDP@@L1D@@@AGDP@Q@@@@@AD@@D\@@AD@P5L@@C5EQTUEQPAEQS%G@CL!L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Q@@AG@@\X@@@VQTUEQTT@QTTCCU @L1D@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C4@DP@@@E @FDUEQTUE@DUED @/HRD@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BEG@@AXK4\QL3-EQTUEQPAEI@@!@CL@Q0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@4@@@@@DP@;QTUEQTT@QS@/Q0@!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HP@@@@5G@@5GTDUEQTUE@DU[@@@@Q04@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@4@CQD@@E @CSIEQTUEQPAEV0@M@@@/V@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Q@@@@HR=G@CLDKDX@SR4@QT,!@@@H@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L0AGHP@@DQD@K1D@V@AC@DT0VCL3K0@!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@VBD@CP@@Q4\3Q3LQDPAGQ0@!@@@!S AEICL@L0@M@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DP@@L1DQ@D\@DT\@@BDQQ2D@Q4\DVTT@QTUK@@@M@AD@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AGV@@MHQD3Q1D@@E 3@AD@Q0@!@$UE@DUEB!0M@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Q4\@@@@QQ0@MDPAGQ2D@Q3L@@EAEQPAEQTTS@@43L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HP@@SP@!L0@@Q3L@L0@QHP@@GE1EQTT@QTUEQS(MQ3L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AG@@@!HP@@DT]G@@@!@@@&@4UEQTUE@DUEQTT$@CL3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@VD\@@@@@VBD@JDPVE$,?QTUEQTUEQPAEQTUERD\!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DP@(K$5MDSL!HDUEQTUEQTUEQTUEQTT@QTUEQS@3CP@QL2D@CT\@L0@@K0@@@BEGL0AG@AEG@CMGU %@F @/@@@/NTT1E4@0CDUEQTUEQTUEQTUEQTUE@DUEQTT[@BD3OU@RHT\@VADMK0@@V@4@L0@M@B<@CS$YLDUEQRP@HP@!D$UEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEW@@@CPEEQTTAR0@@@@AG@CL3HP@QSP1UACAEQTUEQTTKCP@MDP=EQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQR5XDRYEQTUEQTT$QTUSP4@1TALTCDUEQTUEQTUEQTUEI@@M@D\SQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUECT\DQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQRP!@@@=QTUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQT4@TTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTNL0@/D$UEQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUZQ4QEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEO1D@@BMEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUED$\@D4UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQR0@L2=QQTUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQST@L4%EQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT5H4\@DDUEQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUER4\@M$UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQS DF#LCQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUPA2-EQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQS-MHRAEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEN2%CQTUEQTUEQTUEQTUEQTUEQTUEQTT@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> pig2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #pig2Image"
	
	<resource: #image>
	^Image
		extent: 45 @ 30
		depth: 6
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5428 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 770 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2087 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 835 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@0LC@0LC@0LC@0LC@0LC@0LKER4Q@0LC@0LC@0LC@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LC@0LC@0LAC2(/H@@@@@@@H@8,M 4AI0LC@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LC@0L]E"@@@@@@@@@@@@@@@@@@@@@@H@H9@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCGRH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D#X_@0LC@0LC@0LC@0LC@@@@@0LC@0,%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@LG"4C@0LC@0LC@0LC@@@@@0LCG2P@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B@8@0PC@0LC@0LC@@@@@0L.D@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@H@@&L LC@0LC@@@@@0@\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BH]@0LC@@@@@@LJ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@4K1L9@0LC@@@@@0L/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\L@LC@0LC@@@@@0L4@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@PLC@0LC@@@@@0LL@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E@0LC@0LC@@@@@0L @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E LC@0LC@@@@@0LG@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BD-@0LC@@@@@0LT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+@PPC@@@@@0L]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0Z@@@@@0LCK0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AXC@@@@@0LCB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HB4C@@@@@0LC@18@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CBH@@@@&FBLAB0LC@@@@@0LC@0L3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ N@LC@24C@0LC@0LC@@@@@0LC@0LQIP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CL_@0LC@0LC@0LC@0LC@@@@@0LC@0LCA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N@LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCA @@@@@EE3LP@@@@@@@@@CT"M $@@@@4@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCF0@@@@@6@0LC@24DJAT-@0LC@0L@@@@B@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCC@@@@@@]@0LC@0LC@0LC@0LC@0L@@@@1@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCL0@@@A@C@0LC@0LC@0LC@0LC@0L@@@@C@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LCFQ0@@CXC@0LC@0LC@0LC@0LC@0L@@@@C@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LC@3(@@A C@0LC@0LC@0LC@0LC@0L@@B$C@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LC@0L5@A@C@0LC@0LC@0LC@0LC@0L@@C\C@0LC@0LC@0LC@0LC@0LC@@@@@0LC@0LC@0L@@@@@@0LC@0LC@0LC@0LC@0L@@@@@@0LC@0LC@0LC@0LC@0LC@@@@')
]

{ #category : #resources }
BitmapImageLibrary class >> plain1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #plain1Image"
	
	<resource: #image>
	^Image
		extent: 64 @ 70
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JND\@N3%JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR#@@@@@BR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR!DA@@@@C%=JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(#@@@@@@@''R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JI0@@@@@@E$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR&@@@@@@@E4 R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR&D;@@@@@@@@ID)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)N@@@@@@@@@CQJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JL@@@@@@@@@@BR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR&H@@@@@@@@@XD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)R@@@@@@@@@AYJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JL @@@@@@@@A@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR%H@@@@@@@@@FD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)R@@@@@@@@@@%JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JT @@@@@@@@@ER$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR%H@@@@@@@@@AT)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)R@@@@@@@@@@UJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JT @@@@@@@@@ER$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR%H@@@@@@@@@AT)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(\@@@@@@@@@@UJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JT0@@@@@@@@@ER$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR!0@@@@@@@@@AT)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(6@@@@@@@@@@UJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JM @@@@@@@@@ER$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR&H@@@@@@@@@H$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JGD,4DD)JR$(6@@@@@@@@@C-JR$)JHEHG@"QJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JH@8@@D0 R$)JO0@@@@@@@@ALUD)JR&H@@@@VR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$D@@@@@UD)JPQ,@@@@@@@@@@D<9R$)K@@@@N4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)P@@@@@EPQG@ @@@@@@@@@@@@@C2QJO0@@@C-JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JB0@@@@@KL0@@@@@@@@@@@@@@@@@SR5L@@@@OR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$X<@@ALH @@@@@@@@@@@@@@@@@@@@@;@@@@ST)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A5JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"P@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AMFR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$D"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SP-JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JDTP&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HP4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JNR$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/HD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JU0<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E!AR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JT"X@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C&IJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$( F @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N!%JR$)JR$)JR$)JR$)JR$)JR$)JR$(*H @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AXJ$)JR$)JR$)JR$)JR$)JR$)JR$(4C @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D08,DT)JR$)JR$)JR$)JR$)JR$YG@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ET9R$)JR$)JR$)JR$)JR"P"@@@@@@@@@@@@@@@@@C0EX@H4LCX@@@@@@@@@@DDPW%) H#0@@@@@@@@@@@@@@@@@N2QJR$)JR$)JR$)JDP\S@@@@@@@@@@@@@@@TGEP8R$)JR$($@@@@@@@@@@@ R$)JR$(CPUDEO@@@@@@@@@@@@@@&R3!JR$)JR$)JNSL@@@@@@@@@@@@@WT\$DT)JR$)JR$)JPP@@@@@@@@@@HD)JR$)JR$)JR"QBMP@@@@@@@@@@@@A NT)JR$)JLB4@@@@@@@@@@@@"T#%JR$)JR$)JR$)JR X@@@@@@@@@@BAJR$)JR$)JR$)JR#$DC0@@@@@@@@@@@C,+R$(CL#0@@@@@@@@@@D$0@4)JR$)JR$)JR$)JR$(K@@@@@@@@@@@ R$)JR$)JR$)JR$)JR LPIP@@@@@@@@@@O@]JM@@@@@@@@@@NN!UJR$)JR$)JR$)JR$)JR$)JH@@@@@@@@@@@HD)JR$)JR$)JR$)JR$)JR$(*V 8@@@@@@@@@R"<@@@@@@C\WQ$)JR$)JR$)JR$)JR$)JR$)JR L@@@@@@@@@D2AJR$)JR$)JR$)JR$)JR$)JR$( TRH@@@@@@D(X@@@@FCA!R$)JR$)JR$)JR$)JR$)JR$)JR$(CMP@@@@@@@@8CR$)JR$)JR$)JR$)JR$)JR$)JR$(CLA @@@AJF@8MJ!EJR$)JR$)JR$)JR$)JR$)JR$)JR$)JDRH@@@@@@@@;R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(QJ%([R%\9R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(X@@@@@@@@AT)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JHD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JW@@@@@@@@A!JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR%X@@@@@@@@RR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(\@@@@@@@@A4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR0@@@@@@@B=JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JO1L@@@@@@@@<A3!JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(CCP@@@@@@@@@@@@AUHD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(9F@@@@@@@@@@@@@@@@D5TR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(KG @@@@@@@@@@@@@@@@@@RDEJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$($KP@@@@@@@@@@@@@@@@@@@@@HP4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(PQP@@@@@@@@@@@@@@@@@@@@@@@AL4R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)RS@@@@@@@@@@@@@@@@@@@@@@@@@@@@@I!R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR LR@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E#%JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(R@@@@@@@@@@@@@CT@@@@@C @@@@@@@@@@@@@A@4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(CMP@@@@@@@@ALVP(9H @@@E@PCCT@@@@@@@@@@B)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JH@@@@@@@@C5RA$)JB1L@@@AAR$((MA=L@@@@@@APR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$("@@@EHU,QR$)JR MR@@@RNT)JR$)JW581@@@@JD)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JL5YAR$)JR$)JR$)JH@8@O$)JR$)JR$)JR%QRIR9JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(/@VEJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @a')
]

{ #category : #utils }
BitmapImageLibrary class >> saveImage: image name: imageName inClass: aClass proctocol: prAsString [
	
	| class s |
	class := aClass class.
	s := WriteStream on: (String new: image bits size // 8).
	s
		nextPutAll: imageName;
		cr.
	s
		tab;
		crtab;
		nextPutAll: '<resource: #image>';
		crtab;
		nextPut: $^.
	s nextPutAll: image minimalStorageString.
	class
		compile: s contents
		classified: prAsString
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> sheep1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sheep1Image"
	
	<resource: #image>
	^Image
		extent: 56 @ 44
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4978 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3950 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 4882 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N1QCKC-CH3QCP3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;K @NC @@D0@@I0\;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,"@@@]@AMN@B$SGPL;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,.@AL/D1LS@@8@@B@;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;TPANK0@]O@@@@D8@@D<;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N5D/@B<SD0@@OB<@S @]@EH;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,K@@@)@B<]@@@]D30@C @@C  ;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;F@@/GP@N@@8]C @@@B<@C 8@C!4[B4EIKC,;N3,;N3,;N4 OSS88L4@ IPMALS,;N3,;N3,;N3P)GP@@OC1NK0AN@C0@C @@D30@@A4)@@@/AT,HT$<QL!,]JR</K1L/@@@@@@@<P <;N3,;N3,;I0@SC!4]@@@]@A4@S @@JP@@C#0]@@ANS @@@D8S@B<@@@@/K30/@@@SS$8@C 8S@B ;N3,;N3,@OC0@@@@N@@8S@A4@D2<SOB<<@D8S@@@@@AL<@@8<@D8<@@8S@ALNC @@@C0@K2<@OAX;N3,;N0D@GQ4@P"$]@@@J@@@]C @N@B$)@@@@K30]D0@]@@AN@@AN@AL@@@@@@@@<S!4@K08S@AH;N3,;N3=IG$L;Q0@NO@@]JR<@@@8@@@ANJT8@@@@@GQL/@AL<@@@)@B%N@@@SO@@@@D8<@@@@D4X;N3,;N3,;N3-CGR<@GP@@D1L@@B$@GR<@@B<]D0@@@B</@@@SK0@S@B<<D0@@D2<)@@@SGP@@B%@;N3,;N3,;N3,KK2<N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/I#,;N3,;N3,;N4%NC @/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B<=N3,;N3,;N3,;N34@@B$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S @;N3,;N3,;N3,;J @N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@]@C,;N3,;N3,;N3,;F30@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@NN3,;N3,;N3,;N3,C@A4@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A@;N3,;N3,;N3,;N3=N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@]TS,;N3,;N3,;N3,;N1,<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@LN3,;N3,;N3,;N3,;JALSD0@/K0@@K14@@@8@@AL/@AL<@@@@@@@/@C1N@B$/@@@@@@@@@@@@@D4;N3,;N3,;N3,;N3,4K14@O@(@S 8@@@@NGP@@D0@<D0@@@AL/@D8@K30@@B<S@@@@@@@@@@@@MC,;N3,;N3,;N3,;N3-E@@8@@B$@GP@N@B<@K08]S @@@@@SOAL@@@8@@B$/@D8@@@@@@@@@@D8;N3,;N3,;N3,;N3,;N0 @D3X@OA4/JQLS@D8@K0@/@AL<K0@@@@@/C#0@GQMN@@@@@@@@@@@@J3,;N3,;N3,;N3,;N3,;M08@OA4@D0@@@D8@OA4]S @/K1L/K2<]C @@K08@@D8@@@@@@@@@@@@KN3,;N3,;N3,;N3,;N3,;J@@@JT8@S!MN@@@@JP@@O@@@@AL<K0@@C 8@@C0)@@8@@@@@@@@@@@ ;N3,;N3,;N3,;N3,;N3,;J08@@A5N@A4SGP@@C @SD0@@K0@@O@8@C"<NESIN@@@@@@@@@@@@PS,;N3,;N3,;N3,;N3,;N3,YGP@]K0@<@C0@S"89N @@K31NC!@''B4DYIC,;N1H/@@@@@@@@@@@-N3,;N3,;N3,;N3,;N3,;N3,*C @SO@@]@C00GC,;N3\FKC,;N3,;N3,;N3,;N0L@@A4N@@@)@A<;N3,;N3,;N3,;N3,;N3,;N3,IK @/D1L@R#,;N3,;N3,;N3,;N3,;N3,;N3,;N4<N@@@@@@8@F3,;N3,;N3,;N3,;N3,;N3,;N3,,DP8@K0AON3,;N3,;N3,;N3,;N3,;N3,;N3,;N4D]C @N@@@2N3,;N3,;N3,;N3,;N3,;N3,;N3,;OP@<C$<;N3,;N3,;N3,;N3,;N3,;N3,;N3,;@#0@O@@@C#T;N3,;N3,;N3,;N3,;N3,;N3,;N3,2C ANEC,;N3,;N3,;N3,;N3,;N3,;N3,;N3,1D0@/C @SG#,;N3,;N3,;N3,;N3,;N3,;N3,;N04@S @WN3,;N3,;N3,;N3,;N3,;N3,;N3,;N4<NJQ,@C 0;N3,;N3,;N3,;N3,;N3,;N3,;N3,;S1L@C X;N3,;N3,;N3,;N3,;N3,;N3,;N3,;B0@EPP@/E3,;N3,;N3,;N3,;N3,;N3,;N3,;N3-D@@@@N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,)D3HROC0;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N40@@C0;N3,;N3,;N3,;N3,;N3,;N3,;N3,;PQL@TS4@I3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;B0@@@BP;N3,;N3,;N3,;N3,;N3,;N3,;N21B@A4.D2$QN3,;N3,;N3,;N3,;N3,;N3,;N3,;N3QN@C0NE3,;N3,;N3,;N3,;N3,;N3,;N3,;Q!MNK0@@F#,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;MPAN@D8!N3,;N3,;N3,;N3,;N3,;N3,;N3,^B2@QBD4;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,DK @%EC,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N3,;N0@a')
]

{ #category : #resources }
BitmapImageLibrary class >> sheep2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sheep2Image"
	
	<resource: #image>
	^Image
		extent: 67 @ 52
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6456 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTCA2<_O4UEQTUEQTT@QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQT9TQCH@@@@QA2P?QTUEQPAEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTCK0@@@@@@@@@@@D0PQTUE@DUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTEMED@@@@@@@@@@@@@@CA_QTT@QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@@@@@@@@@@@@@@@@AIFD@AEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQU!Z@4UEQTUEQTUEQTUEQTUEQTUEJAQYQ0@@@@@@@@@@@@@@@@@@@@@(@DUEQTUEQTUEQTUEQTTYLE)EJEAFNB1[D0$GN @SNA$(XDUEQTUEQTUEQP([Q"!Q@@@@@@@@@@@@@@@@@@@@@@@@@@8@QTUEQTUEQTUEL4-MS1L@@A)Q@@@STP@@@D\@@@A[TP@!JB AL4UZUB83K0@@N @@@@@@@@@@@@@@@@@@@@@@@@AGN@AEQTUEQTUEQPDR@C(2@@@@@@@@@@@@@@@@@@@@@@@@@@@!@@@:UC(@@ED@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TQ5E@DUEQTUEQTUEK0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@VQTT@QTUEQTTCR"\H@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A-EQPAEQTUEQS$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L&AE@DUEQTUEK0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ETT@QTUEO4I!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A!B AEQPMS@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A[@DUEJ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@QTUR@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AEQTTQ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A]@DUE@4@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@QTUJ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#A4YVS AEQSP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAEQTUE@DUEW @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@M$UEQTT@QTTPQ#(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B@PQTUEQPAEQTTG@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C$UEQTUE@DUEQR,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[QTUEQTT@QTUEP0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HS=EQTUEQPAEQTT0MP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D0D8QTUEQTUE@DUEQTT"G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ATQTUEQTUEQTT@QTUEQQ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N$IEQTUEQTUEQPAEQTUEDP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5UQTUEQTUEQTUE@DUEQTUH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D9EQTUEQTUEQTT@QTUEQTT6C0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@RNDUEQTUEQTUEQPAEQTUEQPM!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EYEQTUEQTUEQTUE@DUEQTUEJ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ALXDDUEQTUEQTUEQTT@QTUEQTT?TP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@I4UEQTUEQTUEQTUEQPAEQTUEQTUAM0 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FD(QTUEQTUEQTUEQTUE@DUEQTUEQTUEEP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-S4UEQTUEQTUEQTUEQTT@QTUEQTUEQTU^@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N$9EQTUEQTUEQTUEQTUEQPAEQTUEQTUEQS !@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E4GQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQS!^U#(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!WP@@@@@!DRT3W4UEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUEE @@@@@@D0@@@@@@@@@@@@@@@@@@@@@@I#$KDR$=K0@@@E9EQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTT0@@@@@E(P@UQVF5D@N00RD%QVG YIF5\<QTUEQTTT@@@@@$UEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQRH@@@@\@4UEQTUEO48PQT8WQTUEQTUEQTUEQTUEQQP@@@4?QTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUES @@@B]EQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEI0@@L$UEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTT?@@@@LTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT_@@APQTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQPL@@@@>QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQPP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUEX@4@@BUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUE@P@@LDUEQTUEQTUEQTUEQTUEQTUEQTUEQPAEQTUEQTUEQTUEQTU CP@@WDUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT[@@@[QTUEQTUEQTUEQTUEQTUEQTUEQTUE@DUEQTUEQTUEQTUEQS4@@@@KDDUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQUX@@DMNQTUEQTUEQTUEQTUEQTUEQTUEQTT@QTUEQTUEQTUEQTUEP @@@@@_QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEL @@@ED3QTUEQTUEQTUEQTUEQTUEQTUEQP@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> snake1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #snake1Image"
	
	<resource: #image>
	^Image
		extent: 76 @ 29
		depth: 5
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2569 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(353 353 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@AXMAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@ZAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTT@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTT@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SAPTEAPD@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FP@@@@@@@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@APTEAPTE@@@@@@@@APTEAPT@@@@@@@@@@@@@APTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A@TO@@@@@@@@@@TD@@@@@@@@@@@@@@@@@@@@@@TEAQ @@@@@@@@@@@@@CPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0T@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAP@@@@@@@@@V@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAQ(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@QAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ATEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@TEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TEAPTEAPTEAP@@@@@@@@@@@@@@@@@@E TEAPTEAPTEAQH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@T@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\E@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ATFAPTEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@EAPT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HAPTEAPTEAPTEAPTEAPTEAPTEAPTI@@@@@@@@@@@@@@@@@@@@@@@@@@HEAPTEAP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@E@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEEP@@@@@@@A EAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@D@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@E0TEAPTEAPTEAPTEAPTEAPTEE@@@@@@@@@@@@@@@APTE@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@@@C@TEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTE@@@@@@@@@@@@@@@@@@@@APTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAP@@@@@@@@@@@@@@@@(EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEB0@@@@@@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPT@@@@@@@@EAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTEAPTb')
]

{ #category : #resources }
BitmapImageLibrary class >> tiger1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tiger1Image"
	
	<resource: #image>
	^Image
		extent: 59 @ 30
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1316 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2087 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1349 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0_J#@0A#\_AD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD1LSD1LV!1JV6M@@@@@@@@@W#,RXD(9J!ALSD1LSD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LSD0<@#4?@@@@@@@@@@@@@@@@@@@@@@@@@D,)LUL_SD1LSD1LSD1LSD1LSD1LSD0@SD1LSD1LSD1LSD1LAA\!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@PA,?D$$WWE0ZO!MVG40DT40@SD1LSD1LSD1LSD1OH0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[I @@F3 MCQ<@SD1LSD1LSD1LSA(X@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@F24@SD1LSD1LSD1LS@\@JS<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OT0@SD1LSD1LSD1LM$][AP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@F0P@SD1LSD1LSD1LSP@]QP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A4@SD1LSD1LSD1LKE8_T0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B,@SD1LSD1LSD1RCSILD@D@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A0@SD1LSD1LSD1\@E%LSD(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@W T@SFD*G41LSD0W@CELSB @@@@@@@@@@@@@@D8O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MGD0@A"D@U41LSD1 PE<DMAD@@@@@@@@@@@@@F1<DH%\@@@@@@@@@@@@@@@@@@@@@@@@@@@@@HP@@@E$''OD0@F3,9QT1LSA<MHTD!@@@@@@@@@@@@@@@@L41LSFD+U0@@@@@@@@@@@@@@@@@@@@@@@@@HWAD@CUMLSD0@@AMLSD1LSBT@F4@@@@@@@@@@DP@@@@@WOD1LSD1LAA0!@@@@@@@@@@@@@@@@@@@@@@@MDE(*M$1LSD0@@DULSD1LMU8@@@@@@@A@G#41RP@@@B9LSD1LSD1LSD0DW@]N@@@@@@@@@@@@@@@@@@@@I41LSD1LSD0@PAQST!T=P@A^@@@:VDEHSD1LX@@@@EALSD1LSD1LSD1LSD0S@@@@@@AFJ51ED @@@@@@GD1LSD1LSD0@OP@@DP@@CTPH@B=BSD1LSD1LHP@@C41LSD1LSD1LSD1LSD0*@@@@@E-!SD1LFRD@@@@@S!=LSD1LSD0@DB,JV6@GT0\@PAMLSD1LSD1RDP@@XD1LSD1LSD1LSD1LSD1E@@@@@@YLSD1LSEL!@@@@@@MLSD1LSD0@SD1LSD1LG6L@XD1LSD1LSD0DD @@RT1LSD1LSD1LSD1LSD1E@@@@@QALSD1LSD0N@@@@@@AESD1LSD0@SD1LSD1LP @@LT1LSD1LSD1LBRD@S$1LSD1LSD1LSD1LSD1E@@@@IT1LSD1LSD1LK @@@@@=SD1LSD0@SD1LSD1LT @@TD1LSD1LSD1LSA0@TUMLSD1LSD1LSD1LSD1E@@@@D41LSD1LSD1LKUP@@@A^T41LSD0@SD1LSD1LT @@NT1LSD1LSD1LSEH[@BULSD1LSD1LSD1LSD1E@@@QBT1LSD1LSD1LSD1]HP@@Q#1LSD0@SD1LSD1LAD\@Q$1LSD1LSD1LSD0T@BX+DD1LSD1LSD1LSD0K@@@:SD1LSD1LSD1LSD1LG2L@@AXDSD0@SD1LSD1LSB@@P41LSD1LSD1LSD0KS @@OQ5LSD1LSD1LSD0PK@A@QT1LSD1LSD1LSD1LS@,M@@A T$0@SD1LSD1LSA@$G41LSD1LSD1LSD1LJ!,@@DL-SD1LSD1LSD1LLP@@CVH\AD1LSD1LSD1LSD0SS @@N00@SD1LSD1LSD1LSD1LSD1LSD1LSD1LS@P_B41LSD1LSD1LSD1LO!,@@@@&J$1LSD1LSD1LSD1LO"9[U5T@SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSA=SL@9SSD1LSD1LSD1LSD1LSD1LSD0@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> tree1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree1Image"
	
	<resource: #image>
	^Image
		extent: 61 @ 63
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD:P3)QCVM)TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTQL"Y0@OPTT@RUQZTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUY@Y0@&C0<9E@A@T41QTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTT8:P1TOT1P9@AQST0@@PEM]@UEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD$T0AS@@@T@@@@@@@@@D@TC0A][DEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQM4MRF A]PEL@@@A@@@@@PD@@@@@O@APOO2)QTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQCV(@T0@@P@@TP@@OED@@@DA@@@@@@@=S@@<@LUEQTUE#CUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUDWP@<@C0@&N2HO@EL@@@@@@@@@P@@@NP@OE@@@GB)QL@1L@@%QTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQX1 IX@<]CT-CPF\@I!P@@@@@@@@@@@@O@D@@C0@+L"X@@@=IS%EQTUEQTUD@@@AQTUEQTUEQA5IJTUEQTR%LX5EQTUEATVL5@AP@I @TPAPTP@@@@D@@T0A@@BX@I @&Y1QSC6MQTUEQTUEQ@@@@TVLID#A]T$YT@C=COU45NSUQTUEQGQ9SED@@@@A@P@@@@@@@@@@@@F\@P@@&Y0@&@APTEBX>TUEQTUEQTP@@@EDE@@<@@@@OPF\@Y1P@I&\THTP?OA(&EAQ@@@@@PD@@@@@@@@@@@AP@I&\&@@@TEF\@I @*XP5QTUEQTUD@@@AQTQ<?V6\TNP@&C0A@@C$@T0A''T0AS@APTP@@@@@A@@@@@@@@@@@A@C0@@NQQ@@@@@@C$&O%EQTUEQTUEQ@@@@TUEQZUD)PQ(O@@@&C0@@C0@@@@<@@@=@PD@@@@@@P@@@@@@@@@@@@@@9@@@9P@@TY0A''@@@RTUEQTUEQTP@@@EEQTUEQTUEQUC%S@BX@E@A''E@@&I!P@PD@@@@@@@@@@@@@@@@@@@D@TY0AS@@<OC1P@PEL9NPTRG!=QTUD@@@AQTUEQTUEQTU8@P@<@I @&@@@O@EM''@@@@@@@@@@@@@@@@@@@@@@@@C0A''@@<@@@ASI&]''@@@O@@=]QP)Q@@@@TUEQTUEQTUE"E@@@EF\@@DA@@@@@C0@@@@@@@@@@@@@@@@@@@@@@@EL@@@@@@AM]C0@&P@@@@F]''P@ASGP@@@EEQTUE)S%EQZ A''I @&@@@T@AQ''E@A''@@@@@D@@@@@@@@@@@@@@@BX@I <@F3]L@D@OKQ]EI$@T@ELOPBP@@@AQTSUYZ <?J$@@NP@@@AQS@D@@@ELTS1PTP@@@T1PTC0A@C0@@B0@T@@@@PA@!H!I_E%EQPPA@@BXOY3=H@@@@GS(SX0<TNP@9@BYS@BX@I%M@T0<@WP8?YC=]E@@9@@AS@@@@@@@O@@=*W5$@IEEQLS<ZMP<@@@=#CV@ATP@@@FLAYCT+NPA''@@<@@D@@E@@&@@@&C0@T@DEQV"IS@BYS@D@@I <O@FYQTUETO01RB@@@@C$@B0@ITUEQTUD@@@AQTUE E@@&@BX@P@<@Y0AS@C$@Y0@&Y5-NTUEQD A''@C$@PA0@A X>C%D>@A5CZ -SPAP@@@<@TFAFTUEQ@@@@TUEQDBY''@@=S@ELTI @O@C$@EEUTT0@0@%EQTVA*@F\@P@@TT%D1I$L,C15QU@@ONQQSC0<@T5LKO5EQTP@@@EEQTP%C@PYST0<@E@@@T0,@Y0M_TT9[I"YFTUEQTT0@@@<9O3YQTRI[PFAZYBITWP@@@F\@I&\@@F]FTUD@@@AQTUEQTUEQQ%QSNUL@C0@@E@ASY0<%TV(OPE)VTUDIY0@&BUEQTUD+NUM[U@EQTUE*@E]\H#$@C0@-TUEQ@@@@TUEQTUEQTUEK[@@O@@@&@@<@@C$@WUEQT @O@AIQBPA]IEEQTUD:@F\@NR]YS%EAS%EQTUDMKP@TG%EQTP@@@EEQTUEQTU$FKP=@P@@O@@ASQS(KC0@3TUE @BXNTQ(@O2%QTUDJC4@&@AQS@@=]@F\-ZUEQTUERI @#TUD@@@AQTUEQTUDRY5LZQ5P"EAPO@D1QTP5QTUEQTU\@D5E''P@@WTUDXNP@@PC$@I @O@@@O@@=]SEEQTR$1TUEQ@@@@TUEQTUEQRB,DTUEQTU$?C0A\D$ YXDD5TED1@C<.C5M*TUEMC4ASI%L@WP1CN%P@I @TC0@UC6AQTUEQTP@@@EEQTUEQTUEQTUEQTQLIZ @O@BXTRT@K@@<KT$09T5L@JUDRT0A@EEM@BUD)NVQ,PC%S@@@OP@A*TUEQTUD@@@AQTUEQTUEQTUEQTUDA@6\O@@=@EELTI A]O"%#@D@T@D)ZI %#H!P@IT8[P A@PD@@PBX@@@<&@CU"TUEQ@@@@TUEQTUEQTUEQTUEFTUU@I @OI&]''@AQ''@@YNXF\9E@<@W%EQIT@FJUD"T1Q''C0@TT4@@I!QS@FT$QUEQTP@@@EEQTUEQTUEQTUD(B$%@@C A@V(@T0@OY0@9Y0@OY0@T[EEQPP@OLQ UC2X@@BX@E@@@NRX@EA)QTR!QTUD@@@AQTUEQTUEQTUEQTUD:SD1VTUEQCUH"@@A@@@APTUQSPBIQCS<@C6\T@BXTPD@@I @TI!P@@EL@K5EQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTQ4+@@=''N%E @@A]T%49@AQST0<@@EMSP@@&P@AS@@A''@D9QTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTS1DVUH!G <@@@%QD$@OE@@@Y0<&@@@@NP@@NP@O@@@@I&\&Y0@>TUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQH@<@Y5L9@@@9I$ALTU@T@@<TO05&PC$\EDA''Y0@O@EM''P@AS@BX@PBP(TUEQ@@@@TUEQTUEQTUEQTUEQTUEQTU$0P!HZ@D$9@C$@@EDX@A0@I#)QW0@T@@@@C0@9E@@@@BXO@BX@Y0@9N2MQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQPP@@@@<&NU5*P6\9@@UQTUPOP@0]JRP@E@<@@@<@[CQ]WP=(VTT)TUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTQT;U@A]YCT@NV]@@C%DTU0&WT!QTUED[DL]O&Q@@BI#TT-QTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUE^TUE#JUEQR@A@PAP&R@$O@@EQTUEQTUEQTUEQ@R%QTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUETT5LT@AT9GD!QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQN%M@E@@@E@EQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTQX&@@@O@D9QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTRLYTUEQWQPO@B-QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD!Z#=,R%Q@T0@-TUEQTUEQGT)QVB<1@UEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD7J$A@EAP&Q%EQS %*O1P@MQD@I"H1TUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD]E@=SH%EQU@@@Y4ATG @@B0AATUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQX A''@E4MHQPKE@@OS%EYJ0@3TUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDO@DA''DP=+X1)S@DAATR(+TUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD7C0@@C0A#TUEQQ"]^TUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQQ @TC0@ TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTV@@C5LO@UEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD?C5L@C49QTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQA%L@Y0ANTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTTH@Y0<@XUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUDO@@<T@AUQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD1PAP@P@<@GUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@TUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQQ#(]FFDIN$YQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTP@@@EEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUD@@@AQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQTUEQ@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> tree2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree2Image"
	
	<resource: #image>
	^Image
		extent: 56 @ 55
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2087 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2152 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2858 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0)GQALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LRBUMC0ELSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSA,@X#U"SUALSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1BO4 G@@AM@@AMD4ILSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSE$ZIP<@X @@Q @@C0@@U41LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0:@44O@@@@@D4@C1L@MT46S41LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LPT$KG0@SC0@OD2T5@@@@@AL@C0@$SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0[C!<OX @@C3$@C44@@@@@C0@%D0@%IP=SSD1LSD0=XD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LS@@O@D4S@@<@ST49@AL5@@@@D0@@IPAMMP@6J%9PWS$0SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LTQ03@@=M@@@9@C$O@@@9NT4@@@<@@D4@C0@%@C$5X$4^SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSFX@NS$@D449@@@@@@@@@@@@@@@@@@@@@D4OIS$@IP@VSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0]@D49SRT@SP@@@@@@@@@@@@@@@@@@@@@@@FH9NQL5C1LZY$1LSD1LSD1LSD1LSD1LSD1LSD0YNT5MC0AMNP@@C0@@@@@@@@@@@@@@@@@@@@@9D0@@SP@5NRT@WT1LSD1LSD1LSD1LSD1LSD1LT @@MVH@NT4SC0@@@@@@@@@@@@@@@@@@@@@@@@@@NP@$SAP<NP<9K$1LSD1LSD1LSD1LSD1LSD1 YB(_K!<9NQL@IS$@@@@@@@@@@@@@@@@@@@@@@CT@C2ESSD1LYDX@XD1LSD1LSD1LSD1LSD1LSD1LSD0"B1)MNP@S@@@@@@@@@@@@@@@@@@@@@@@SSQL@MQL@YVALSD1LSD1LSD1LSD1LSD1LSD1LBAP[RD5"@@<@D1L@@@@@@@@@@@@@@@@@@@@@@D4@X#T@C0@%@C-!SD1LSD1LSD1LSD1_S!=FVET@ST4@@AMM@BT@IP@@@@@@@@@@@@@@@@@@@@@@@@<@@@<SD1L5@@@ORFX SD1LSD1LH6HSNP@O@CT9IRT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C$9NS$%@@AHSD1LSD1\Q3H]OQ<S@FH@IP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<@@CTO@FMLSD1LSD1LSD1LSA(ONP<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S@@<@@@<@R$1LSD1LSD1LSD1LG0@@@AL@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C$@SP<@B41LSD1LSD1LSD1LSD0_SP<9D0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SP<@IP@]SD1LSD1LSD1LSD1LSA$@MP<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AMMMS$Q@",_O$1LSD1LSD1LBB5$@FH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BT@@@<@MP@%C0@O@@QLSD1LSD1LSA\+D0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@NP@5@D4S@@@SC4(_B41LSD1LSD1LSETS@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<@IP@@C0@SNQ<4T1,PK1ULSD1LSD1LSD1LSAHSX&H@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AL5ST4@MRUXXD1LSD1LSD1LSD1LSD1LSB<6MP@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<@NP@@@C$@@C$5F!-LSD1LSD1LSD1LSD1ND1L@C0@O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BTSC0@5@@=MNP0@V$1LSD1LSD1LSD1LY@AM@B9X@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AMIP@@D0@@@@IND0I SD1LSD1LSD1LSD0/V4ALS@!UX @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@9IP<@MQ=&SD1LSD1LSD1LSD1LSD1LSD1LSD1&R3%M@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A"@CTGSD1LB1ALSD1LSD1LSD1LSD1LSD1SV@@S@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AM@@@O@E _M&H@C41LSD1LSD1LSD1LSF@!@@<S@@@@NQL@SP@O@@@9NP@%@C%MD0@9NT49SPAM@@@@@C$5NPA"WT1 SD1LSD1LSD1LSD1LI%5HI2P[GP@@SVH@@@@%MS$@C@@9@C%M@AL%D44@X @OMPA"@@@OC0@ISD1LSD1LSD1LSD1LSD1LSD1LSA\OSP@@C44%D3T@NP@5@ALO@C$9@C$@@E @X @@NS$@SP<@@BT2SD1LSD1LSD1LSD1LSD1LSD0&@C$OSP<9C0@@SP@%IP@@NQL@D0@%D44@D0<@C0@SD0@O@DX@@C$O@T!VSD1LSD1LSD1LSD0]@AL5C0@9@@@@X @@C2T@@AL@@CT@MP@@SP@S@CT@X 1MGD @@ALO@@<@C0HKSD1LSD1LSD1LSDHXGQ4$T1 8GP1"SRU"@@="@@@OC0<@D1L@C2U%R <@@!UAS@(/K1@(K4MLSD1LSD1LSD1LSD1LSD1LSD1LSD07@#$SMS$9@@@OC5YLWT4S@@<9S$1TC@<@D$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1L@3%XYCL]X6X1V%!BSD06D6H@D45DSD1LA @KSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1BSD1LSD1LSD1 P41LSDX9D0@SNQ%LSD1LK@YLSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LDT4@C44@RD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1^@AL%NST>SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSBQ"C0@@C4!LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LCP@5D44@V$1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0/X @5NPAMSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSF@@@C$@MP@$SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSEL%@D4@D49LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1BAP@%@D5MWT1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSDH>UVH@C0@9C0@>SD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LTPIWGCUXR!EX@ HBQ%AESD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD1LSD0b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> tree3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree3Image"
	
	<resource: #image>
	^Image
		extent: 65 @ 47
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3693 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$(/TD)JV %XQTUER2(NFEQ KTTCV$L"T (@J4\EA1EJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JAS,@YDIL@@@;EC,#@CP#@CP@EC,T@@@@S@@@H40@NT)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR#Y^EAP4@@@JSC,JW"L;E@@J@CP4B!P4H0@TN0ALB A T0D!R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$(AKQ!MF"L@N0@@B$0@N0@@@@(;@@A^N0@@@AP;W @@B @@@AP@@A(ZYC(:J10&R$! F!)RN QEK!,SQD)JR @@@D(0Y@ALW AL@AP;S@@@@AP#@BL;@AP;@@@@B$0@E@@@W#,#M@(JS@(#@BML@BL FT=LEBL4@AP4@@@@N3P:R$)J@@@@R#0XA@@#B @TH3,4N0@;@@@;@C-L@@(@B @@@CPT@CP#@D0@@@@@H40:X!MK@CP@H0(@B@@TN0@JB$1XKEAJR$(@@@AJR$)JR@ALM@ALE@@@ECP@@@(@@C,J@BML@@ @N0@Z@B-ENP\8D4)JR$)JR!H@B @TS@@@H0(@N0A^EDT&R$)JR @@@D)JR$)!N2L@B @@B#,@B%8;B"L@SC,@E@@;EA(DV@QHR$)JR$)JR$)KI4T3@D0@M@@@B AL@@@4B @@@AP@O3AJ@@@@R$)JR%0DF @#N0(@@CP@@D0@EE8@@D0@B&QJR$!XQP8NL2@ZN#)GB@@4@AP@S@@ A@(;B @4@@@;F MXF@9CDT(@@@AJR$)JR$)JHU)ZKFD[KB43SS,;@D0@SAPJLD)JXAIXVB5O@D0T@@@;S@(@N2L;N3(DSSEMF!QLW @*R$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$(8@AP@EAPJHDT$@3TLGPYZR$)HAAP@W @@B @4@D0@H0AL@@@;@AQ^@FMJR$)JR$)J@@@@R$)JR$)JR$)JR$)JJP]UA@@@S@@#N3,T@BL@B$0#@B4OR$)JF3DTB @@@@@@H4ILW (@EC,TB$YJO$)JR$)JR$(@@@AJR$)JR$)JR$)JR$(B@C,4@BLTS@@@MCP#H0(@@@(@F4(5M1(:@@@;@CP F4T#@D0@@BL@SD1MR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JV!,3@D1^@@(@@@@@@@(#@@(;L2YHEPPVF@@JH44-S$(5HBLJ@C,J@@]JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$(JH0@@H3P@H0)L@@@DKTD0R$(A@@9M@AQXR"43R$)JKP@JH0@-R$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JVC,@W!P@@@(;@E8TB#UJR$)JR$(3@D4?D!AJR#(@EF@2AD)HI$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JW5)@PEXQN#PT@E8@N$AJR$)JR!(@PD)JR$)JP5!ES@@OR$)JR$P%R$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(ST15]RD,Z@EEJR$)YB!PFR$)JR$)JR$)UMCUJR@(T@E8@F4)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"UEN1(GR%4@EE()PV@DAB@ U1H@OT43FC<:C!-JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(,E@@ W @#PD)ZV@@;B$0@@AIHI$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)ZH@@J@@A@R$41L0QIN$0TW$-JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JV0@;N0=JR$)JR$(''B$ [LD)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JF (@N$)JR$)JE0)FR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(_@@@\R$)JR!L@CD)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"TZB%IJR$)JL05JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"4@H1YJR&ALR4)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JNAP@L4(S@B!JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)FN0@JR&ELB4)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"X4W"MHQSQJR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR%H@@@)^ST)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JT (#E@AMR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(:@@@JSD!JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"@#M@@5R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JES,J@CAJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(^N0(@V$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$,@@@9JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JOBLHV4)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)#@C,XR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR!!LH5MJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JSC,DR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@D)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR"0;B AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)J@@@@R$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JV@(;N2%JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$(@@@AJR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR$)JPE)]W31JR$)JR$)JR$)JR$)JR$)JR$)JR$)JR @@@@@a')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> tree4Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree4Image"
	
	<resource: #image>
	^Image
		extent: 30 @ 67
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 1959 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3693 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'QDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDQ@T^QDQDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQFB4QDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQE4@E4QDQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDQA!X@$QDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQDQ ADQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQBYEC%%DQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDR0@N@CL7QDQDQDQDQDQDQDP@@DQDQDQDQDQDQDP BDX_V@@KS1QDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQB @@E @B0@)QDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDT0AOQP@@B0@HQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQQE@@1G08@B3XCQDQDQDQDQDQDQ@@@QDQDQDQDQDQD@5L*G0@@@DTK@D1DQDQDQDQDQDQD@@ADQDQDQDQDQDP%B U[I 8NQP@EVTQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDP&@CX@C @=QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQBT3U@@6G3TQE3]DQDQDQDQDQDQD@@ADQDQDQDQUG$Q]VCD6QU @M%$:N$QDQDQDQDQDQDP@@DQDQDQDQDPHN@@@V4<6@CX@@@@WQDQDQDQDQDQDQ@@@QDQDQDQDQDQQIUEBMSXNG0,@E%$BHDQDQDQDQDQD@@ADQDQDQDQDP"AUE0DK@E _@CUO@B8DHDQDQDQDQDP@@DQDQDQDQ@ @T1P2S08@@CYSP LCM4QDQDQDQDQDQ@@@QDQDQDQDQ@X:P%UYMTUE@BYUP  ^UTQDQDQDQDQD@@ADQDQDQDQDQDQDQB@1M @@@A]B@2TFQDQDQDQDQDP@@DQDQDQDQDQDL1T,E AEB4T6VCP>P%)DQDQDQDQDQ@@@QDQDQDPCR!P@B0@_G0@@@@,6@B8IEBADQDQDQDQD@@ADQDQDV4<ZQT<1G08_M$UE@@@KCA(^HDQDQDQDQDP@@DQDQDP:VSL@@CX@LP@@C!P&B0@@LP@5QDQDQDQDQ@@@QDQDQDPY@@,6QQ<@QP,@FDIPI  WTUUDQDQDQDQD@@ADQDQDQA]]B0@@VE @M!<NS2UBT5-IV0ADQDQDQDP@@DQDQDQDRD@5M!<@@@,@@DT@@AX@@@8@R$QDQDQDQ@@@QDQDQDQDV0$\@E _@A<N@E NM#YRR#1QQDQDQDQD@@ADQDQDQDQDQ@D_B0@KC AX@@,6HPD7QDQDQDQDQDP@@DQDQDQDQDPYG5 @M @@QQ<@@@ABQDQDQDQDQDQDQ@@@QDP7MTYVD09EB3DK@CX_@DUEQSX''IBQDQDQDQDQD@@ADQA\EPB8@@B(HG3XN@@@6M 9E@@@KH$QDQDQDQDP@@DQDQDQDD T9R$P;B0@KM @_@CX1@@,K@@MDQDQDQ@@@QDQDQDQDQDQDQCMXB0AE@@86M!<@AP!AQDQDQDQD@@ADQDP]P2X3BS!XC @@QSX6@CD_@D<UVU\HIDQDQDP@@DQDQDP MP8_@A<VC#X6@@AEC @@@DTNG4=DQDQDQ@@@QDQDQDQDQE,X@@8@LPAXG0@@G0@1@CMDQDQDQDQD@@ADQDQDQDQDQA-[BED.QPAEM#X1@@@KD$P%APHTBDP@@DQDQDQDQDQDQDQDP$H6QPAX@@@_B0@KG0@VG0@WQ@@@QDQDQDPWED0^Q@41B0@NM @@V@,@QU 1V@AEO2]D@@ADQDQDQDQNL4-KQP,_M#X@VE @@CD6M @K@@TTQDP@@DQDQDQYNTH]Q#XK@@AX@DT@C @@LP@_@BXWQDQDQ@@@QDQDQ@$6S0@NLP@NQPAE@@AXG0@@LP@@R19DQDQD@@ADHCT=Q@IJR!X@M#X@LP@@@DUEQSD@L"<WUTQDQDP@@DQDL0,ZET)\D@)OM% @@E!CF! @B3D.BCMDQDQDQ@@@QDPOK#0+H$YAEP@_@E _@B)PP$I[F!(5RDQDQDQD@@ADQDQDQET''M0 6LSX@@CD5HS\ UTIBQDQDQDQDQDP@@DQDS1]BP0@N@@AX@D<I@CUBJ$IFAT\IJ !DQDQDQ@@@QDQQAR8TQSX@ASXKQ L@@C\4N"@AE4(&QDQDQDQD@@ADQDP(AA(@L4QDUQ)SI@,6Q"@ QDQDQDQDQDQDQDP@@DQDQDQDN"ADQB@Q@D$ @E 6M4QDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQED@D@<@@CUIQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQ@MUQ@@KI%QDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQDMP@HE5%DQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDPZM"MDQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDQA(6STQDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQDG@8UQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDPG@CADQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDQE-X@TQDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQDI @EQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDP3@@UDQDQDQDQDQDQDQDQD@@ADQDQDQDQDQDQDQDQDQELK@DQDQDQDQDQDQDQDQDP@@DQDQDQDQDQDQDQDQDQDQC)DQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQD@@@b')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> tree5Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree5Image"
	
	<resource: #image>
	^Image
		extent: 37 @ 63
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2248 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3950 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'S$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$8QS$8&S$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS"YCDRY@K49NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NH4<:@P@''S$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS%H;C"L5XT9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NT (FS$9NS$9[H0@@C%!NS$9NS$9NHD9NS$9NS$9N@@@@S$9NS$9NS%YWC")NS$9C@ AOXC\8S$9NS"1ZC$]NS$9NS$9NS @@@D9NS$9NS$9SS%D@FT9NHU@5@@@@XT9NS&H@@C-"S$9NS$9NS$8@@@ANS$9NS$9NS$8 D5]CS$8Y@C-OGBYNS#]O@FP;W$9NS$9NS$9N@@@@S$9NS$9NS$9NS 8;IT9AFVP@H4<BS#<#C 8;J INS$9NS$9NS @@@D9NS$9NS$9NS$9RN1L[S$ION4<SED9K@C- HT9NS$9NS$9NS$8@@@ANS$9NS"X*G5@BS"\@YD8O@@(@YD8VH1L(X49NS$9NS$9NS$9N@@@@S$9NS!$@MPAON0YNP09US!0@C$1NYD,-G$MNS$9NS$9NS$9NS @@@D9NS$89@EAY@E\@@AD)@B4?D2!NO3,&S$9NS$9NS$9NS$9NS$8@@@ANS$9NE#!NHQ$@C#T@X@8_@$<NS!<6S$9NS$9LD%YIJ"(YS$9N@@@@S$9NS$9NS$9NS!P''T%@#@C<FC!!RS$9NDD\NMV@;@@AO@B 0S @@@D8TYE@.U6P(K!!ZFR]N@1 _J",QS ]"MP@N@@@@B$TS@AL5@C0@@@ANKQ<?YE\;@@8S@@A YAD[SAH*IR4$T!DXCT-$ST .DQ ?J 1N@@@@S$9NR#4&WVA]V X@C 9$LE=OH5@SO49NS$9NS$9NP2YNS$9NS @@@D9NS$9NS"PYS$8FN3,@KT9GL0INV%5NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NWU\IS$8I@D1NS%LQS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$8WS$9XQ6MZ@$ TLT9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9QCQ$@O0$6HT9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS#XFH0$DS1<?YFQZE49NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS!$@MPADJ"L@X X5@@(6S$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS% NMRMOFD\@D0$2@@9ON1!NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9$@BL;N6I"@E]NT@9OA"4_YD)NS$9NS$9N@@@@S$9NS$9NS$9NS$9CD3T@D0@XWP@_U$=O@E%NBP@5BT9NS$9NS @@@D9NS$9NS$9NS$9NS 8@N1MOH YOD5\SH0@NS"E[S0A]S$9NS$8@@@ANS$9NS$9NS$9NS!E D0@#S1E$@E\@@BL@C!!NQ AE@B!NS$9N@@@@S$9NS$9NS$9NS M @C,Z@EQRX@)$S3U$@@@#FB@FN6A U49NS @@@D9NS$9NS$9NS$8AH0@S@D=$S@@AB @_W%\@H0A^HQL#C 8QS$8@@@ANS$9NS$9NS$9LXC,SC"L.V 8@A 8_D&D2U0@#C$06@E]OA$9N@@@@S$9NS$9NS$9NBP8@@@A$KQ @X@@#FD8&B1E N0APPQ%P@@9NS @@@D9NS$9NS$9NS$\@C 8#B"YGC#,#@C=NS$9LR0AW@B5NC @NHT8@@@ANS$9NS$9NS$8"C @@@CM\M @(D2LVS$9NS $@Q6P3S&I @D1N@@@@S$9NS$9NS$9NVPAOY@$OS#QPA AOI$9NS$9NED8_BT9NJ!L6S @@@D9NS$9NS$9NS%]WC"!NS$9NAR(@A$9NS$9NS$8&GD9NS$85O48@@@ANS$9NS$9NS$8!S$9XS$9NS$86@A5NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NS@8YS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS H@BD9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$8?D49NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NEQ=NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS%5PS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$8FX$9NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NG5)NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS&PIS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$9W@$9NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NYBENS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS#9NS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$9]S$9NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NWT9NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS"INS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$9PS$9NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9N@T9NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS YNS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$8_S$9NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$9NU49NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS 9NS$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$M P49NS$9NS$9NS$9NS$9NS$9N@@@@S$9NS$9NS$9NS$9NS$9NS$8=D35NS$9NS$9NS$9NS$9NS$9NS @@@D9NS$9NS$9NS$9NS$9NS$9NS%,&S$9NS$9NS$9NS$9NS$9NS$8@@@ANS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9NS$9N@@@@')
]

{ #category : #'interface specs' }
BitmapImageLibrary class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Picture Library' 
			#min: #(Point 354 298) 
			#max: #(Point 354 298) 
			#bounds: #(Rectangle 720 558 1074 856) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 0 89 81) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib1 
				#tabable: false 
				#label: #imLib1 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 0 177 81) 
				#name: #ActionButton2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib2 
				#tabable: false 
				#label: #imLib2 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 0 353 81) 
				#name: #ActionButton4 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib4 
				#tabable: false 
				#label: #imLib4 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 0 265 81) 
				#name: #ActionButton3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib3 
				#tabable: false 
				#label: #imLib3 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 80 353 161) 
				#name: #ActionButton8 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib8 
				#tabable: false 
				#label: #imLib8 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 80 265 161) 
				#name: #ActionButton7 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib7 
				#tabable: false 
				#label: #imLib7 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 80 177 161) 
				#name: #ActionButton6 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib6 
				#tabable: false 
				#label: #imLib6 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 80 89 161) 
				#name: #ActionButton5 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib5 
				#tabable: false 
				#label: #imLib5 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 205 258 242 290) 
				#name: #ActionButton33 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #imLibNextPage 
				#label: #arrowNext 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 116 257 153 289) 
				#name: #ActionButton34 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #imLibPreviousPage 
				#label: #arrowPrevious 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 160 89 241) 
				#name: #ActionButton9 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib9 
				#tabable: false 
				#label: #imLib9 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 160 177 241) 
				#name: #ActionButton10 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib10 
				#tabable: false 
				#label: #imLib10 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 160 265 241) 
				#name: #ActionButton11 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib11 
				#tabable: false 
				#label: #imLib11 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 160 353 241) 
				#name: #ActionButton12 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib12 
				#tabable: false 
				#label: #imLib12 
				#hasCharacterOrientedLabel: false 
				#defaultable: true))))
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> woman1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #woman1Image"
	
	<resource: #image>
	^Image
		extent: 20 @ 75
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2216 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4689 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 1092 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 128 128)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2087 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2473 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2858 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3597 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1156 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2152 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6456 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 1734 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(160 160 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 706 706)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'R4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4-KR4,VC#8ZUD-KR4-KR4-KR4-KR4-KR%,LD%=]XD-KR4-KR4-KR4-KR0Y#@@@@@BH)R4-KR4-KR4-KR4-KA@@@@@@@@A9KR4-KR4-KR4-KR4,S@@@@@@@@@B1KR4-KR4-KR4-KR18@@@@@@@@@V$-KR4-KR4-KR4-KS @@@@@@@@@1R4-KR4-KR4-KR4,S@@@@@@@@@BA R4-KR4-KR4-KR1L@@@@@@@@@X3)KR4-KR4-KR4-KLP@@@@@@@@@YI$-KR4-KR4-KR4-V@@@@@@@@@@00XD-KR4-KR4-KK 0@@@@@@@@@NEX^DD-KR4-KR143@@@@@@@@@@@@@@@ TD-KR4,IU @@@@@@@@@@@@@@@@@GR4-KR2X@@@@@@@@@@@@@@@@@@DIKR4-KK @@@@@@@@@@@@@@@@@@RD-KR4-H@@@@@@@@@@@@@@@@@@@\R4-KR4T@@@@@@@@@@@@@@@@@@E-KR4,$H@@@@@@@@@@@@@@@@@@@CD-KR3%V@@@@@@@@@@@@@@@@@@@@R4-KF%<@@@@@@@@@@@@@@@@@@@@%R4,D@@@@@@@@@@@@@@@@@@@@SPYKR04RD @@@@@@@@@@@@@@@D4\R4-KWB\@@@@@@@@@@@@@@@@LGD=KR4-KF@@@@@@@@@@@@@@@PU1KR4-KR4,%C@@@@@@@@@@@@@ALR4-KR4-KR4,_N@@@@@@@@@@@D"!KR4-KR4-KR5LL@@@@@@@@@@@@SP%KR4-KR4-KP# @@@@@@@@@@@@@HT-KR4-KR4,J@@@@@@@@@@@@@@@LXD-KR4-KR1L@@@@@@@@@@@@@@@AJR4-KR4-KT @@@@@@@@@@@@@@@B-KR4-KR4L@@@@@@@@@@@@@@@@@D4-KR4-KBP@@@@@@@@@@@@@@N@@1XD-KR4-W@@@@@@@@@@@@@@@@@D9TR4-KR1,@@@@@@@@@@@@@@@@@LUQKR4-KPFL@@@@@@@@@@@@@@@@0R4-KR4-KG @@@@@@@@@@@@@@@CAKR4-KR4,^@@@@@@@@@@@@@@@@V$-KR4-KR3,@@@@@@@@@@@@@@@ALR4-KR4-KK0@@@@@@@@@@@@@@@D1KR4-KR4,2@@@@@@@@@@@@@@@@SD-KR4-KR30@@@@@@@@@@@@@@@@7R4-KR4-KB0@@@@@@@@@@@@@@@C5KR4-KR4,\@AH@@@@@@@@@D @@UT-KR4-KR10@@@@@@@@@@@@@@@@\R4-KR4-KEFH2Q@@@D 08@C  D3QKR4-KR4-KR4,(@@AVOP@@BE9KR4-KR4-KR4-KR1L@@FM^@@A#BT-KR4-KR4-KR4-KOP@@I1\@@BA R4-KR4-KR4-KR4,.FP@@OSL@X2UKR4-KR4-KR4-KR4X^NC @@@@LW$-KR4-KR4-KR4-KR48@D @@@AIHR4-KR4-KR4-KR4-KLP@@@@@@@AAKR4-KR4-KR4-KR4,S@@@@@@@RRD-KR4-KR4-KR4-KR4\@@@@@@@0AR4-KR4-KR4-KR4-KM @@@@@@U!QKR4-KR4-KR4-KR4,.@AH@@@A#IT-KR4-KR4-KR4-KR5P@@@@@@A9KR4-KR4-KR4-KR4-KR5X@@@@@D4-KR4-KR4-KR4-KR4-KTP@@L0@0R4-KR4-KR4-KR4-KR4,Q@@@;N@=KR4-KR4-KR4-KR4-KR588@ALLR4-KR4-KR4-KR4-KR4-KW@AM@!9KR4-KR4-KR4-KR4-KR4,*@@@ CC)KR4-KR4-KR4-KR4-KR2L@@@@@R$-KR4-KR4-KR4-KR4-K@P@@@@@?R4-KR4-KR4-KR4-KR4,S@@@@U$U@R4-KR4-KR4-KR4-KT@@@@@01SS5KR4-KR4-KR4-KR4$C@@@"@1$''DD-KR4-KR4-KR4,MX1H@V3]JF%1KR4-KR4-KR4-KK"A#I3TUEEQKR4-KR4-KR4-KR4-KIUM\R"9JK%$TXD-KR4-K')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> woman2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #woman2Image"
	
	<resource: #image>
	^Image
		extent: 21 @ 68
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2666 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 2633 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2184 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3693 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'O#8>O#8>O#8>O#8>O#8>O#8>O#8>@@@@O#8>O#8>O#8>O"@ HC8>O#8>O#8>@@@@O#8>O#8>O#8:URPTQB8>O#8>O#8>@@@@O#8>O#8>O#LV@@@@P@<>O#8>O#8>@@@@O#8>O#8>O 9@@@@@@@ .O#8>O#8>@@@@O#8>O#8>RA\@@@@@@@@,O#8>O#8>@@@@O#8>O#8>K 0@@@@@@@ANO#8>O#8>@@@@O#8>O#8>G@@@@@@@@@AMO#8>O#8>@@@@O#8>O#8>U @@@@@@@@@#RC8>O#8>@@@@O#8>O#8 CP@@@@@@@@AET38>O#8>@@@@O#8>O#8.I0@@@@@@@@AJJC8>O#8>@@@@O#8>O#8 MP@@@@@@@@AJAS8>O#8>@@@@O#8>O#8>K#H)@@@@@@@FB# >O#8>@@@@O#8>HB(QOBH@@@@@@@@/QTT%HC8>@@@@O#8>AT@@@@@@@@@@@@@@@@@/RS8>@@@@O#8>S@@@@@@@@@@@@@@@@@@)AC8>@@@@O#8>AP@@@@@@@@@@@@@@@@@@GC8>@@@@O#8>AP@@@@@@@@@@@@@@@@@@TC8>@@@@O#8>RT@@@@@@@@@@@@@@@@@@AS8>@@@@O#8>NB<@@@@@@@@@@@@@@@@@TC8>@@@@O#8>N@L@@@@@@@@@@@@@@@@@Q38>@@@@O#8>NDT@@@@@@@@@@@@@@@@@L#8>@@@@O#8>NAP@@@@@@@@@@@@@@D@@QC8>@@@@O#8>ND(@E$(@@@@@@@@@J0L@LB@>@@@@O#8>K @@MCP@@@@@@@@@LD<@@4$>@@@@O#8>B @@MB\@@@@@@@@@I@4@R%@>@@@@O#8>G@@@I4(@@@@@@@@@R!\@@C,>@@@@O#8>G@@@JP@@@@@@@@@@@@ @@@$>@@@@O#8>J@@@@@@@@@@@@@@@@@@@@A(>@@@@O#8>B @@@@@@@@@@@@@@@@AJP@4>@@@@O#8>G@@@@@@@@@@@@@@@@@@$K2\>@@@@O#8>AP@CJP@@@@@@@@@@@@@0KR< @@@@O#8>T@@M@@@@@@@@@@@@@@@''D4(.@@@@O#8>R4@9@@@@@@@@@@@@@@@CDT)I@@@@O#8>RP@@@@@@@@@@@@@@@@@@PD([@@@@O#8>NAX@@@@@@@@@@@@@@@AJUQXB@@@@O#8>H@4@@@@@@@@@@@@@@@@VLC<>@@@@O#8>O$$V@@@@@@@@@@@@@@A@CQ,>@@@@O#8>O#8=@@@@@@@@@@@@@@@/L38>@@@@O#8>O#9E@@@@@@@@@@@@@@@VF38>@@@@O#8>O#8T@@@@@@@@@@@@@@@VP#8>@@@@O#8>O"@L@@@@@@@@@@@@@@@VRS8>@@@@O#8>O"X/@@@@@@@@@@@@@@@/RS8>@@@@O#8>O$$_@@@@@@@@@@@@@@AJRS8>@@@@O#8>O"!J@@@@@D@=OP@@@DTUI#8>@@@@O#8>O# 6MP@@@@4[N0@@@C\>O#8>@@@@O#8>O#8>N0@@JUX>HP@@BA8>O#8>@@@@O#8>O#8>M @@R!@>GB$@R#(>O#8>@@@@O#8>O#8>N0@@K0(>RQX@R#(>O#8>@@@@O#8>O#8>D@@@J5L>RPL@BCD>O#8>@@@@O#8>O#8>G@@@R! >FP @PC,>O#8>@@@@O#8>O#8>TP@@@A(>S@@@@EX>O#8>@@@@O#8>O#8>G@@@@BP A0@@@EX>O#8>@@@@O#8>O#8>RT@@@AX O0@@JT0>O#8>@@@@O#8>O#8>K!X@@DT N0@@CA0>O#8>@@@@O#8>O#8>RD<@@DX B$(@QS >O#8>@@@@O#8>O#8>O \@PB(>K#4@KS8>O#8>@@@@O#8>O#8>O$0)JT0>NC@@J#8>O#8>@@@@O#8>O#8>O$%JR#(>ND<@B38>O#8>@@@@O#8>O#8>O#9ER! >NC@HJC8>O#8>@@@@O#8>O#8>O#8MJS,>K"\/B#8>O#8>@@@@O#8>O#8>O#82@@\>B"<_B#8>O#8>@@@@O#8>O#8>O#87@C@ B$(/B#8>O#8>@@@@O#8>O#8>O#8G@CP AR$@B38>O#8>@@@@O#8>O#8>O#8$@AX.D @@GS8>O#8>@@@@O#8>O#8>O"YJ@@@7LD@CT#8>O#8>@@@@O#8>O#8>O"@O@1XPNB@>O#8>O#8>@@@@O#8>O#8>O"@;J 8\P5@\I#8>O#8>@@@@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> woman3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #woman3Image"
	
	<resource: #image>
	^Image
		extent: 19 @ 63
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7901 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3437 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2184 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2409 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2280 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'N3,;N3,;N3,;N3,;N3,;N3,;N0@;N3,;N3,;M2<3FP<;N3,;N3,;@C,;N3,;N0(>BP@@I#D;N3,;N3,@N3,;N3,;B@@@@@@@BC,;N3,;N0@;N3,;N3,.@@@@@@@>M3,;N3,;@C,;N3,;C0D@@@@@@A8GN3,;N3,@N3,;N3,[B0@@@@@@OT0;N3,;N0@;N3,;N1 I@@@@@@@@LC,;N3,;@C,;N3,;S@@@@@@@@@@>N3,;N3,@N3,;N3,<@@@@@@@@@@$,N3,;N0@;N3,;N1P@@@@@@@@@J@<;N3,;@C,;N0("BB @@@@@JC(PN3,;N3,@N3,JE0$(@@@@@@@@QBX RS,;N0@;N2H@@@@@@@@@@@@@@@@FC3,;@C,;C @@@@@@@@@@@@@@@B44N3,@N3,Y@@@@@@@@@@@@@@@@G#P;N0@;N3@@@@@@@@@@@@@@@@ADRS,;@C,;P0@@@@@@@@@@@@@@@ATVN3,@N3-K@@@@@@@@@@@@@@@@HSD;N0@;N0X@@@@@@@@@@@@@@@@UF3,;@C,,KP@@@@@@@@@@@@@@@@,[N3,@N4%D@C4@@@@@@@@@JDP@Q (;N0@;DS4(I @@@@@@@@@RG0@>R#,;@C,Y@@$\OP@@@@@@@BX2@@D?N3,@N3@@JD@@@@@@@@@@OP@@I#\;N0@;FP@=KP@@@@@@@@@@@B!LN3,;@C,)@@@@@@@@@@@@@@@@@3,;N3,@N2<I@@@@@@@@@@@@@@@HN3,;N0@;C24@@@@@@@@@@@@@@D,;N3,;@C,;I @@@@@@@@@@@@@@B0<;N3,@N3,T@@@@@@@@@@@@@@@@MC,;N0@;N1D@@@@@@@@@@@@@@@ALN3,;@C,;FP@@@@@@@@@@@@@@@DD;N3,@N3,/Q@@@@@@@@@@@@@@-HC,;N0@;N3,5BP@@@@@@@@@@QAH2N3,;@C,;N3,F@@@@@@@@@B FOS8,N3,@N3,;N2X@@@@@@@@(A" @EQX;N0@;N3,DM @@@@@@@BDI@@ADRS,;@C,;N3,+@@@@@@@UG @@@B "N3,@N3,;N04@@@@@KR(@@@@@@AD;N0@;N3,;AP@@@DPR@@@@@@@@FS,;@C,;N3,)OP@(A" -A @@@DXQN3,@N3,;N002G X(QB=BOP@@NC,;N0@;N3,;N3,YJ@@-RD%D@@AIN3,;@C,;N3,;N00@@B4''C1T@@@0;N3,@N3,;N3,;F0@@J (;H0@@CC,;N0@;N3,;N3,ZB0@-F3,>@@@LN3,;@C,;N3,;N20>@B LQQ8@@B$;N3,@N3,;N3,;M38@@B,LJ@@@JS,;N0@;N3,;N3,,N @@HT0(@@AGN3,;@C,;N3,;N3-K@@ADMB4@OQ,;N3,@N3,;N3,;N3@@@AT;N @RC3,;N0@;N3,;N3,;SC4@M#,+@CX;N3,;@C,;N3,;N3,JJ@@HN1$@BC,;N3,@N3,;N3,;N3,U@AD;FP@SN3,;N0@;N3,;N3,;N2,=C#,+OSP;N3,;@C,;N3,;N3,;DS4%N3$=FC,;N3,@N3,;N3,;N3,"JA$;N#5IN3,;N0@;N3,;N3,;N0H(M#,>@DD;N3,;@C,;N3,;N3,;GR #N4,@R3,;N3,@N3,;N3,;N3,$@DP;O ADLS,;N0@;N3,;N3,;F0$@R3,2@DXON3,;@C,;N3,;N3-II$,LN3,JN3,;N3,@')
]

{ #category : #'images - bitmap' }
BitmapImageLibrary class >> woman4Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #woman4Image"
	
	<resource: #image>
	^Image
		extent: 34 @ 58
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2698 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3372 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 2023 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1156 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 995 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2441 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2409 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1220 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 1927 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 738 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2184 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 1991 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 2698 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3822 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1509 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2216 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5428 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 2987 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'QDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDQDQDP!UEXLQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDQDQAT/@@@-BDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQDP#A@@@@@@@I@YDQDQDQDQDQDQDQ@@@QDQDQDPFQDQDQDQDQ@X''@@@@@@@@S15DQDQDQDQDQDQDQ@@@QDQDQD48GTQDQDQDQC\@@@@@@@@@F"EDQDQDQDQDQDQDQ@@@QDQDQAD-R IDQDQDQA0@@DT@@@@@T$QDQDQDQDQDQDQDQ@@@QDQDC4<@@A=DQDQDQC@@@BX$@@@@ITQDQDQDQDQDQDQDQ@@@QDQDQ@\@@@-DQDQDQC\@@A8-@B<7QDQDQDQDQDQDQDQDQ@@@QDQDQBDD@A(VQDQDD0P@@@@@@D((QDQDQDQDQDQDQDQDQ@@@QDQDQDPE@@@&QDP B @@@@@@@@@,O4QDQDQDQDQDQDQDQ@@@QDQDQDP7@@@ZRS$J@@@@@@@@@@@@K@YDQDQDQDQDQDQDQ@@@QDQDQDP]@@@@P$T@@@@@@@@@@@@@@D!DQDQDQDQDQDQDQ@@@QDQDQDQDA@@@@@@@ID(@@@@@@@@@@CMDQDQDQDQDQDQDQ@@@QDQDQDQDQ4T@@@@DOP @@@@@@@@@@@QMQDQDQDQDQDQDQ@@@QDQDQDQDMA(@L0MDQAT-@@@@@@@@L2\%QDQDQDQDQDQDQ@@@QDQDQDQDQ@<5HTQDQ@$J@@@@@@@JADT_QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQALJ@@@@@B5JQP@TQDQDQDQDQDP_F0@@QDQDQDQDQDQDQDQDQED-@@@@KPP-@@AEICL3F$)JR!D-@@@@QDQDQDQDQDQDQDQDQB9E@@@@I4<@@@@@@@@@@@@@@@@@@@@@QDQDQDQDQDQDQDQDQCD@@@@ML0@@F20-B$=OK1]JS#D0LP@@QDQDQDQDQDQDQDQDPPP@@CLZ@@@@IT4FA YIHQ!MQDQDQ@@@QDQDQDQDQDQDQDQDHTT@B QE@@@@UTQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDK @-ADT@@@@@K3QDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDI @DB @@@@@@@AUDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDK@QO@@@@@@@@@BYDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP!JSL@@@@@@@@@@B%DQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDPFR @@@@@@@@@@@DIDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQLQP@@@@@@@@@@@B1DQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDPIS0@@@@@@@@@@@D!DQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP]L0@@@@@@@@@@S1UDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDPPS0@@@@@@@@@@R#)DQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP*QP@@@@@@@@@@ODQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP%@@@@@@@@@@@@U$QDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQT@@@@@@@@@@@@A$QDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP_@@@@@@@@@@AOQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP1@@@@@@@@@@@6QDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQ@@@@@@@@@@@@YQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP!H"4@@@ABIQHXQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDPT(@@@@.QDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDQC,@@E@!QDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDJD<@@C]DQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDL @@@BUDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDP@@@@AADQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDN0@@@D5DQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDK@@@F$QDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDE@@@I$QDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDN@AEO$QDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDC @$GTQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDK AJQDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDIP@<QDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDIP@HQDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDG0@.QDQDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDQDLP@6R4QDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP+DP@@GEMDQDQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP%KP@-@@(;STQDQDQDQDQDQDQDQDQDQ@@@QDQDQDQDQDQDQDP*OAECG1<UJ4QDQDQDQDQDQDQDQDQDQ@@@')
]

{ #category : #actions }
BitmapImageLibrary >> imLibNextPage [
	
	self class imLibPage: self class imLibPage + 1.
	self closeAndUnschedule.
	self open	"Interface: #bitmapLibrary"
]

{ #category : #actions }
BitmapImageLibrary >> imLibPreviousPage [
	
	self class imLibPage: self class imLibPage - 1.
	self closeAndUnschedule.
	self open	"Interface: #bitmapLibrary"
]

{ #category : #'initialize-release' }
BitmapImageLibrary >> initialize [
	
	super initialize.
	^self
]

{ #category : #accessing }
BitmapImageLibrary >> observer [
	
	^observer
]

{ #category : #accessing }
BitmapImageLibrary >> observer: anObject [
	
	observer := anObject.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib1 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib10 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib11 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib12 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib2 [
	
	| text |
	text := thisContext selector.
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib3 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib4 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib5 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib6 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib7 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib8 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]

{ #category : #actions }
BitmapImageLibrary >> selectImLib9 [
	
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self
]
