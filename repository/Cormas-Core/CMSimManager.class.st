Class {
	#name : #CMSimManager,
	#superclass : #Object,
	#instVars : [
		'cormasModel',
		'simNumero',
		'simName',
		'simFolder',
		'buttonsForwardAreOn',
		'isRandomSeedFixed',
		'fixedRandomSeedValue',
		'traceSize',
		'processRun',
		'processReplayBackward',
		'processReplayForward',
		'undoList',
		'redoList',
		'finalTime'
	],
	#classInstVars : [
		'newFolder'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #accessing }
CMSimManager class >> bosExtension [
	
	^'.bos'
]

{ #category : #resources }
CMSimManager class >> deviation2image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #deviation2image"
	
	<resource: #image>
	^Image
		extent: 198 @ 64
		depth: 11
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6809 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6295 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4175 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4400 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 4978 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2537 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1830 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 1156 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4978 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 2858 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 4561 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2473 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5492 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 5910 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6103 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4368 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4432 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4432 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4336 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 1156 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 3983 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 4625 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5589 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2505 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 3950 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7130 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6199 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7034 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5524 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 4047 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2890 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2923 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2344 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1798 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3693 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1863 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 1927 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5846 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7066 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4400 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 5621 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 4689 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 3276 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2312 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1863 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 1477 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 2826 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 1156 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5749 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 3983 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4015 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6584 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 4818 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4721 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3147 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 1734 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 1156 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4272 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 3372 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 3501 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2537 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7195 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5942 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2633 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5171 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5075 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1830 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 1156 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5910 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4079 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7098 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2569 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4015 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6167 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5589 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 5107 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 3308 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3180 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 3147 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1895 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1927 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 1124 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 3404 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2409 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7291 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7130 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5653 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 4818 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3147 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3115 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3469 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1863 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1927 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3822 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4721 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7195 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5621 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4111 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2601 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1863 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 2087 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 1316 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 1188 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 1959 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7163 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 4753 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 4657 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2794 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3180 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3212 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 1188 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2537 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2473 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5107 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 4689 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5685 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5974 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2666 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5910 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5685 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4529 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5653 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4689 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4143 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 1188 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6295 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6263 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5428 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4529 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 5685 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 3372 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1927 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 3822 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 1991 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 2505 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 4593 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5910 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2666 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7195 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5717 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2666 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5942 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 4978 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4561 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 4753 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3212 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2987 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1188 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1991 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2698 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4175 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7227 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 5717 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 5235 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5364 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5171 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2923 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 3212 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 4657 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4753 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5749 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7259 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4593 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 5043 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3244 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 3372 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 1188 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3276 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 2955 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2923 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 4464 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6199 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6617 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 4207 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6295 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3244 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3308 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 1766 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1284 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2698 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2794 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 3212 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2730 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7291 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5749 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4625 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 5749 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4464 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2762 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5781 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6231 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4368 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4689 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6360 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3276 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 1220 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 1798 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7387 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7452 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7355 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5814 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6392 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4657 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4400 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 3565 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4882 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2730 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 2152 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1220 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4914 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 1124 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4272 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7323 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7387 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6199 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 4721 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4946 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3372 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3308 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 3051 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2023 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1220 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1381 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 1124 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 3950 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 3212 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4497 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2794 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4304 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7420 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6070 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6103 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4721 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 5075 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4978 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 4882 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2890 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4529 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 1220 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3822 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7420 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6103 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4689 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4721 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 4946 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3340 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 3758 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2055 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1477 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 3180 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7387 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7452 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4818 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5139 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2858 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2858 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1220 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4497 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 6263 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4721 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 4850 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 3693 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3404 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6520 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 5878 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2120 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1220 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2890 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7420 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6135 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5010 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4786 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4753 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2087 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 2376 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 2184 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7420 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6327 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 6263 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4753 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 5524 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4400 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3404 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3469 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 1541 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1252 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 1798 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 3115 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 3372 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7516 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5235 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 5203 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4946 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4946 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3469 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2120 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 2248 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1606 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1188 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5010 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4464 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2955 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7452 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4432 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7484 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6488 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4786 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 5460 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 4914 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3437 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3115 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4818 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2923 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1188 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7548 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7484 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6199 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6584 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4818 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 5396 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6552 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3469 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3501 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 1252 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2152 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 3533 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1188 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1220 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3115 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3244 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4497 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7516 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6777 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 5492 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5171 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4978 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 3822 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4464 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 2023 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1252 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 4047 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2987 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7516 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7516 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6006 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4882 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 2890 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 3918 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 4079 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2216 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1252 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 2280 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 1477 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 3147 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 2955 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4497 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 2987 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1509 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7548 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6263 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6295 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5171 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4882 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 5460 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 3886 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 5107 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 4047 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1284 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 995 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 1060 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3886 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1509 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7869 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7580 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4625 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3533 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 3886 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 3983 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 1252 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1252 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2216 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2248 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 2087 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4657 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4593 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 6552 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6038 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7580 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4882 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5075 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 3822 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 3501 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 2344 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 2312 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3854 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3372 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 6520 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6070 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4561 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 3918 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 3886 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 3469 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 3083 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3051 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7612 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6327 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4914 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4946 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3597 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 1284 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2248 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 1959 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 2344 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4240 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 5621 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1316 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4561 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3083 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7612 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 5685 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6103 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 3950 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 4111 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1477 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7644 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6777 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5428 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3597 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 5043 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2280 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 1284 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 995 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1316 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3629 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3180 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6392 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5010 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 5589 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3115 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 6006 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1541 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 1766 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3822 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 3244 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3950 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1638 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7677 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1349 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 6584 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6135 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4978 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5492 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 4464 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 5075 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2312 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 2376 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 1573 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2505 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 2537 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 2312 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4850 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4657 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1638 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7677 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6167 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4914 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5043 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 3822 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 5075 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3147 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1606 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 3469 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 963 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1316 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3918 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 3693 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4753 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7709 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6424 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5010 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 3726 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2344 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 4207 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1670 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1349 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2376 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3180 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1381 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 7002 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5075 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5300 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3212 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3212 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2409 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 1316 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 1381 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1349 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1702 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1702 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7773 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 5781 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 5460 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5396 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 4111 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 3533 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 2152 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 2312 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 1895 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 3244 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4207 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 4143 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5396 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 4721 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7837 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6745 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6103 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 5942 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3693 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 3886 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4207 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2376 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 2441 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 2537 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2344 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6649 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7805 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7773 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4753 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5075 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5460 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3501 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3726 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4850 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3244 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 6263 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 995 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1349 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3726 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 4175 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 3758 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2409 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 3790 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1381 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 4240 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 2537 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 2473 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1927 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1766 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3276 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7837 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6520 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5107 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 5300 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 5139 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 4207 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 2633 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 1413 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 1316 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 995 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4400 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5043 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7805 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4786 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3276 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7805 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7837 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 4914 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 5235 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3758 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 3983 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2633 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2441 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4464 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1381 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 3918 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 5589 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5300 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7901 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6520 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 5267 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5781 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3790 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 5171 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3533 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 3886 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 3758 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7869 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6584 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6938 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5749 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5203 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 3950 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3469 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2473 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1413 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2505 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 1670 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2409 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4593 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3308 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6809 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 1830 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3340 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7901 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7901 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 5203 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5814 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6199 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3372 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 4850 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 2858 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 2312 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 2087 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 1445 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7934 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6617 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5203 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5846 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 4175 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3918 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 4079 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2698 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 1027 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 3790 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3533 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2441 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6584 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3886 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 5139 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4786 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 1606 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7934 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1445 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1895 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3372 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7934 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6745 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5235 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 5653 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3276 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5717 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2537 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 2858 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5621 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4882 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1927 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 2473 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7966 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6617 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7966 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6070 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 5557 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3886 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 4047 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2601 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 2473 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 1606 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1413 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3437 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4946 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2505 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 2473 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4914 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6681 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3533 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2601 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 4336 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6456 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7998 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7998 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6970 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5267 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5075 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5139 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3950 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 4368 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2633 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 2569 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3822 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1477 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 1541 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4946 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3469 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3469 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 1959 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7998 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6199 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6167 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 4304 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 3983 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 1959 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4143 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8030 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6970 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6038 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3950 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3918 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4721 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 6263 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 2923 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 4175 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 1060 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3437 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 3180 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4978 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6552 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8126 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8062 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 5428 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5910 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3533 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2826 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 1895 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1509 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 1027 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8062 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6552 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5653 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5332 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3983 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3533 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2633 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 2858 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 1573 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1509 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3533 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8062 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7066 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6777 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5460 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4561 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 2923 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 5043 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1509 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1606 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8094 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6745 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6777 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6392 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 4143 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3565 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 2890 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 1895 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1477 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6617 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5814 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5589 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 4529 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3758 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2248 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2698 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 1734 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 5332 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8126 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6295 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 7227 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 4464 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3854 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 2923 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2087 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3790 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3501 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4818 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6070 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3597 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4047 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2344 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2698 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2730 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1573 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2184 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 2666 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2120 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6649 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5428 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5460 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 4111 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 4175 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3693 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2248 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2312 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5428 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1188 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5717 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6874 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6327 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5492 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6103 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2730 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 2826 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 1316 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2601 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 2376 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 2890 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2376 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2152 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6681 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5460 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 5621 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 5781 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 4561 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 2473 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 6295 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3661 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4207 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5171 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2280 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2152 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7387 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5524 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 4721 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 4336 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6327 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 3083 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2762 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6360 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1606 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 1092 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4207 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 5171 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7291 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5524 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6713 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 4207 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5717 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3918 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1606 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 770 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6745 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7291 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 4432 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 4753 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2794 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2826 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 3019 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1638 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 1092 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4497 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5428 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3726 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2216 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2216 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5524 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5557 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 5781 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5653 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3983 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 4657 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5621 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6520 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 1092 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2826 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 1991 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 3308 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5621 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 5621 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3758 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2376 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1670 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 1670 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4272 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6777 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5235 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 4047 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5781 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2858 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3758 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6809 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 4464 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4240 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 5428 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 2730 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 3019 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 2858 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 3115 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1638 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 1092 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2280 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2312 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5589 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 4432 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 4625 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 4336 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2890 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 2794 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1702 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 1092 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 4304 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2441 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2055 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6809 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5653 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5492 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 4497 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2890 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 5075 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 2312 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1670 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3661 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 2666 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6841 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 5621 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5814 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3822 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 4850 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4914 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 2344 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5364 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1734 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 1124 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 2730 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6456 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5364 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 3822 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5910 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2923 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 1798 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1734 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6874 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6295 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5396 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4272 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 4625 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 4818 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 4593 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2987 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1702 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 1927 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1766 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 2762 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4304 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2344 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7002 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7420 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6006 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 4432 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 4432 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 4882 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2987 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4593 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3693 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 1124 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5910 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6906 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 5749 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 4625 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 4175 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 3886 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2409 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5428 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1766 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 1124 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 2794 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7034 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6938 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 5814 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6263 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6970 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 4882 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5428 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2987 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2601 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3051 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2794 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7066 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6970 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 4914 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 3950 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 3308 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2762 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1734 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 1413 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 4625 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 1895 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7002 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5781 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4336 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5814 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3019 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 1156 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2344 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5139 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6777 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5878 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5139 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4015 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 3918 6488)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCJ@LT@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:HCO@OQ@=DC4POQ@=DC4POQ@=DC4POQ@$HC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=D@LPD/@)HC4PO0@W4C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DB%0G8@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@#PAVPOQ@=DC4POQ@=DC4PN;AETC4PC*@:$C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCK J$@ADC4PNK@F(C4POQ@&TD[@M=@=DA  M=@=DBP K3@=DCJ@HI@=DC4POQ@2 DB I3@=DB+PJR@=DAX0NYAF0C_PN:AF0CE@OQ@74A*POQ@=DAM@OQ@#PAVPOQ@74DJ@C9@=DCQ Q<@NX@: C*@^(C4POQ@74D[@G*@=DC4PF)@:4@RPIB@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCK P2@EH@>PNK@F(C4PBO@<@B(PJ$@)HB5@P2@=DAC @Q@=DA>@E:@=DC4PJ-@,(D/PNA@=DBM@EY@=D@4@@4@KDCHPB1@W4AT MF@5 @P OQ@=DD POQ@#PAVPN:A@<C/ K#@4 C<@HW@*PA4PC2@!\C4PAI@#$B5@H9@10C4PA*@F,A" A8AJHC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCK B:@+HBEPNK@F(C4PFM@VLCQ KG@>PAF E\@;(BV0J$@=DDC0R.@=DC4PA?@]\BP OQ@=DBM@EY@=DDPPD4@=D@0PLJ@=DD\PMX@5 @P OQ@=DD POQ@#PAVPOQ@=DC4PNK@CPC4PD*@)\C4PFB@_4C4PJ!AD\C4PH^AE4C4PA*AK(C4PC>@^DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0CK B:@74AT OG@F(C+@L3@]DA4PGQ@$PCQ A-@7TCYPNC@A4A50OQ@=DC4POQ@<\A?PBQ@=DBM@EY@=DD-@OQ@=DB" DY@=DAKPI&@5 @P OQ@=DD POQ@#PAVPNY@6T@< R?AE(C4PD*@)\C4PFB@_4C4PO9@;,C4POQAHDCE@A*@30C4PK?@J<C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0CK B:@:0@ PB @F(C+@E-@K\C4POQ@=DC4PCM@DH@#0D*@F,D_@OQ@=DC4PN-@=DC&PB @&TBM@EY@=DD-@OQ@=DB" DY@=DAKPI&AJ8B)@OQ@B4C(POQ@#PAVPNK@=$C4PKQAE(C4PFG@S<C4PFB@_4C4PJG@8@C4PCY@Q@C4PA*@30C4PK?@L,C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@NH@8 C"@NH@8 CYPB-@:0C+@QK@R4C+@EN@_4AKPP#AH\C+@PY@$4B\0P(@X<CJPOQ@=DC4PLJ@<@@,PC\@=DBU0FG@=D@I0OQ@=DB2 D4@=DAW@JC@=DDM NC@M0AD@OQ@%\A!0I3@]\@3PD-AGDC4PL)AKPCK F)@#$C4PAI@%,D* H9@^,C4PBE@7TC4PL\@NXC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@NH@8 C"@NH@8 C"PNH@:0C+@N,@;(C+@N,@;(A7@N-@:0C+@OQ@74C4POQ@74C4POQ@=DC4POQ@2 BP OQ@=DC. N:@=DC&POQ@=DC&POQ@=DC&POQ@=DC4PJ-@=DC+POQ@;(C. OQ@;(B\0OQ@:4C4POQ@1PCJ@OQ@9$C4POQ@=DBYPOQ@=DC4PNY@=DC4PN:@:4C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@8 C"@NH@8 C"@NH@8 C"@NH@8 C"@NH@8 C"@NH@8 C"@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@8 C"@NH@8 C"@NH@5<CW0M_@5<CW0NH@8 C"@NH@8 C"@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 C"@NH@5<CW0M_@5<CW0JP@)@B$@JP@)@B$@JP@5<CW0M_@5<CW0NH@8 C"@NH@:0C+@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 C"@M_@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@M_@8 C"@NH@:0C+@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@8 C"@M_@5<CW0JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@5<C"@NH@8 C"@N,@:0C+@N,@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@8 C"@M_@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@CW0NH@8 C"@N,@:0C+@N,@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@NH@5<CW0M_@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@M_@8 C"@NH@8 C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@M_@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@5<C"@NH@8 C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PCSAEPC\ K*AEPB;POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 CW0JP@)@B$@JP@)@B$@M/@#@BA0HG@ \BA0E%@%LBGPH]@!4BT0IS@%LB$@JP@)@B$@JP@)@B$@JP@)@CW0NH@8 C"@NH@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN:@9(BDPM_@8 C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DDB@JP@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 CW0JP@)@B$@JP@)@B$@D''@=P@J@AY@.4D@0H]@!4BGPG4@!4BGPH]@%LB$@JP@)@B$@JP@)@B$@JP@)@B$@M_@8 C"@NH@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PNHA@@B[@R]AD0C/ PZ@=HCE M_@8 C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DAI0JP@=DDJPA:@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@0,C8POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@NH@8 CW0JP@)@B$@JP@)@B$@JP@%LBW0F&@!4A=@D''@R\AI0D''@R\AI0D''@_PBGPH]@!4B$@JP@)@B$@JP@)@B$@JP@5<C"@NH@:0C+@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@JP@R\D(0L/@ZHA PFA@XDA:PPG@X,D^ NH@=DC4POQ@=DC4POQ@=DC4POQ@=DD1@@_@=DAI0PK@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@9DB9POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@NH@:0C+@OQ@=DC4PN,@:0C+@N,@8 C"@NH@5<B$@JP@)@B$@JP@)@B$@JP@%LC8PSD@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0G4@!4BT0JP@)@B$@JP@)@B$@JP@)@CW0NH@:0C+@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@JP@R\DB0CH@Y8B3@FA@XDA PFA@F8C<PJP@:0C4POQ@=DC4POQ@=DC4POQAGPBL@JN@1 B/ BZ@(PC[@M-@ZX@S LX@)D@% OQ@%0C% QT@GPC4POQ@=DC4POQ@=DC4POQ@G(@=POQ@=DC4PPKA@,C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@8 A7PN[AK,A>PRJ@5<A/@RO@4HA6@A @C\CD@M_@_XDD@@F@M4CR0F-@[4CW0M_@)@B$@JP@)@B$@JP@)@BT0IS@R\@>@OX@R\AI0D''@R\ASPD''@R\AI0D''@R\AI0D''@_PBGPIS@)@B$@JP@)@B$@JP@)@B$@M_@8 C"@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@8 CU KE@^PBN GV@XDA PFA@XDA PP/@>TDB0JP@8 C4POQ@=DC4POQ@=DC4POQ@R\C8POQ@=DB: G4@%0B:PJP@T\D]PM_AI<DJPI"ALLC+@SC@OTC4POQ@=DC4POQ@=DC4POQ@ZT@]@OQ@=DC$PJIAI<A=0OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PNH@8 AY D)@[0B$@R;@7,A PFA@XDA P@F@!4C] FA@XDA PFA@XD@W D''@,XA PFA@XDA PFA@DDBT0P+AB8B"0FN@T@AV@E''@)@BGPG4AB$@@@H!A@,AZ0H)@2XCB@R @%4@O D''@R\AI0D''@R\A=@H]@!4B$@JP@)@B$@JP@)@B$@M_@8 C"@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@NH@5XB? D]AD0CEPFA@XDA PFA@+$C!PFA@XDAT0F,@I(D%PJP@:0C4POQ@=DC4POQ@=DC4POQ@.4BW0OQ@)@B: OQ@9X@R OQ@T,A=0OQAEP@:0F%ALPBJ B_@8 C4POQ@=DC4POQ@=DC4POQAJDB$@OQ@=DAIPOQ@3<A> OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@LTAJ0BF@C\A PFA@3@A=@@O@XDB[0@*@(0@WPD,AITA&@@?AJ @W@FZ@-8@60PK@\L@+ O(@40A90@5@HH@1 RL@XDA PFA@XDA\@CN@R\AO BC@*T@>@OUAHPDW Q?@# B-@D @[DBO A@@R\AI0D''@R\AI0G4@!4B$@JP@)@B$@JP@)@B$@M_@8 C"@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@L;@/8AT@R@@5@A PFA@XDA PQ(@2HB>PO[@$8A10FA@\XB'' I9@$XA=@M_@=DC4POQ@=DC4POQ@=DC4POQAGP@] OQAB$@40OQ@ZXC+@N,@ZXC4PJP@ZXC4PJ>AITC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@5<C4POQ@R\C7@OQ@TXC[0OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PNH@''HBU F?@TH@4PJP@)PA PFA@XDB[0G&@.DD%PLLA@0B]@BJ@;HB2@C=A@,DGPP=@''(A(@C^@_8DF0PK@;LDSPOZAC8APPQ=@XXDB0G7@4@DY@F0@9L@J0QYAITBR@D;@SH@X H>@*\B5PKU@-TB5PKU@-TBE @KAI@AI0D''@R\AI0G4@!4B$@JP@)@B$@JP@)@B$@M_@8 C"@NH@8 C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@8 AY @/@;8CSPK&@XDA PFA@XDDS N5@+TAV H!@L(BM0M)@<<A PHY@+(DP R+@80BT0N,@=DC4POQ@=DC4POQ@=DC4POQ@&HB/ NQ@OTD]@RU@O\C4PLK@.$C4PBZAI<C4PN4@>DAQ0Q4@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@IXAQ0D''@T\C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@8 @> OA@!(A PFA@XDBX@B8AG\@'' M[@K0@" RX@TLDB0FQ@G0DS0QOAI8@_PP\A@,@8@D#@OP@=@C4@RLD)PRU@H AH0A=@EL@E0AD@>XDB0DO@/(C70D.@?TCX G7@6<AG O8AHHC; J''@-TB5PKU@-TB5PKU@-TB5PIIAE<@/PB,@R\AI0D''@_PBT0JP@)@B$@JP@)@B$@M_@8 C"@NH@8 C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@K/@-,BZ@E,@JDA PFA@XDA PFAAGLC''0J"@Z<B;PK-AB$AZ@@%@U8@,0B3@6,CAPM<AI8C:PO7A@,B$@NH@=DC4POQ@=DC4POQ@=DC4POQ@=DAI0N,@8 C4POQ@8 C4POQ@8 C4POQ@8 C4POQ@!4AI0OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DBX K$AITC4POQ@=DC4POQ@=DC4POQ@=DC"@F(AE\BF0B!@\,A]0NU@Y@@-@PQ@0DCY@P8AA<B(0L1AKTDD0@I@-<DB0IJ@X0BN0OC@HPB5 C-A@,DXPE<@Q<AZPH5@7<B7@PKAIXAMPRM@<$BS@D!@X$DB0M:@L<@N R^AD<D'' O''@0,@,@Q>@ILAXPKU@-TB5PKU@-TB5PKU@-TB5PKU@ <D-0I.@#0B"@J3@)TAI0H]@)@B$@JP@)@B$@JP@5<C"@NH@8 C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@NH@*@B,@H"@_,A, G?@XDA PFA@XDB[0E.@DXC) H6@.4B;PHCA@4AEPMO@3(B=@F3@_0C(@@$@DLD'' @WAC<A&0E%AITB$@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PM_@[<B90F"@XDA PFAAB@DB0I5@\@DG D@@<PA8 M/@4D@=@B3@OPBW C!@?PDB0E9AJXB;PK-@=P@]@M/AITC[0FW@GP@]@BZ@_\DB0CF@6<AYP@_AB$D@0BZ@6<DB0BX@\HC2 D1@<0BI FY@3(AL@QB@C @( KU@-TB5PKU@-TB5PKU@-TB5PKU@R@C7 DF@QLAL D;@S,B?@J(@-\B4 J1@WXB$@JP@5<C"@NH@8 C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C"@M_@XLB,@OH@@PACPEE@ZHA PFA@XDA PFP@@ C^PG/@EDCGPK-@:<DJPM7@NHB^0B3@RLA,0P$AITCXPD"@,8B!@B=@"\@=@A_@Y,@& PK@%LC"@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@8 BLPQ:@THBG0H]AJ0A PF"@[PA80L^@6<BQ0K;AF$DZPSA@ITC)0PK@<8C-0BK@"LB;P@_@6<D%PPK@_\A3 G7@-4DB0C+@!4AI0RUAITD%PRU@LXAI0IS@R\D%PPK@6<C[0PK@IX@% M/@I(DJPK-@.4DJPG7@!LB&POM@OXA1@KU@-TB5PKU@-TB5PKU@-TB5PKU@!XCM @R@ HDIPES@5DAR@EU@XDA PFA@XDDD J)@U4@E@OV@[4COPQF@I\A7PL''@5<CW0H1@B8B? D\A@DA>PRE@M4BXPNF@XDA PFA@XDA PFA@Y@@XPND@\DD# J<@.4B;PL+@L0C@ R-@: C[0JB@\TA?@LS@S\D&PQ"AITDB0G7@I(@& E1@! BTPIX@I(D%PIS@8 C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@=DBU@GL@7LC+@OQ@=DBB@OH@ALB) FA@XDCW@RU@20DRPB>@]HCS JZ@6<B/PFL@!@DTPIL@LH@&PPK@6<@& AJ@I(A%0M/AITA=@G4@R\AI0D''@!4BT0JP@5<B$@JP@)@B$@JP@)@CW0M_@)@B$@JP@)@BGPJP@)@BGPD''A@,C[0G7@\8A=0M/@6<@]@K-@''4D$PKU@-TB5PKU@-TB5PKU@-TB5PKU@CL@4 K-@% A> G:@\<@&0J;@D\BOPQ2@^$A PFA@XDA PFA@XDA PFA@XDA PFA@&@BX@FA@XDA PFA@XDA PFA@XDA PFA@)<@(0KI@FLB]0@E@04B;PK-@5$A"@A4@I(C8@C_@QDAW0GT@! CF0PK@#<B] K-@:<DJPG7@IXAI0CFAITDB0L_@I0DJPG7@IXB$@NH@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC"@@A@ATAI GH@6(DAPNO@)@AB0FA@XDA PET@0L@6 H2@'' AX@P"AIH@Q@N6@6<B; KO@5(B;POT@I(C[0D''@R\D%PPKAIT@:0G4@)@CW0M_@5<CW0M_@8 C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@NH@5<B$@JP@%LAI0C+@LX@1 CFAITC[0BZ@H0DZ B]@N\@90C''@N\@90C''@N\@90C''@ZLBJ@E/AKLBV A)@-LC5@K-@.4B/0K-@+<AV PN@]LD, J6@PL@_ RC@<HB3@FP@XDA PIO@?,@(0G%@0PDP@A,@''8D,@HL@.4B;PK-@:<D@0HT@?XAX N?@QH@=@EWA@,@Y@J7@BXB8 B&@A@DB0RU@0,AYPFW@_\C[0BV@%LB$@JP@)@@YPQX@_\CN CF@)@C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@8 D1 @)@,,BX NQ@9@@JPM.@N,BJ0H@@ 8@B G0@L@A=0H2@U<AH0IK@MPDR @ A@,D%PLK@Y\A=0M/A@,AI0JP@)@B$@JP@)@B$@NH@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@NH@5<B$@JP@)@B$@JP@%LBT0H]@R\@1 RU@6<@[0DT@>(C: O*@>(C: O*@>(C: P<@#8C''PD#@RL@=@DD@ITA$ G7AH,@00JX@=\DJPOT@:<B;PK-@.4B;PK-@.4B;PK-@24CKPK-@.4B;PK-@.4B;PN/A@LB=PD6AD B6@B2AILCB0@G@T$A,0G<@&4DT B''A@,@5 Q9A@LD@0P)@_\D%PD''@N,D%PBV@R\BT0JP@5<C+@OQ@8 BT0BVAITAI0JP@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@?H@JPNR@I<BX NQ@RPB!PIP@EP@V KM@]$C?@RR@ITA7 M/@N A''@K-@.4DJPK]@N,AI0C+@N,AI0H]@)@B$@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@NH@8 CW0JP@)@B$@JP@)@B$@H]@_PAI0D''@LXC<0L7@#8C,PRHAH D"@RHAH @L H>@?(A=0L AC(A<PAO@. @@0PK@O<AW0D9@RLA2PP-@W<A=0OP@H,AAPF>@''<CH0@B@I(C)@DL@@0DA@LF@^ C)PK]@[XADPD#@X0A5@G<@4$D%PC/@$(DM@EO@;0@& M/AITDB0G7@_\CB0PK@LXBT0JP@)@B$@JP@5<C+@OQ@=DC4POQ@:0B$@IS@%LB$@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PJPAG@@QPI"@&HC$PD$@.4DJPR>@](B* A=@H\A-PB?@O@CQ0RU@-4@& FW@_\C[0CF@%LB$@JP@)@CW0N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@NH@8 CW0JP@)@B$@JP@)@B$@IS@!4AI0D''@R\AI0D''@4L@NPA0@LPBIPN+@; B_@N0@6<CB0BZ@.4B!@IX@.4@50M/@1DBI@SB@3HBF@G<@]@D%PR1@[LA,0E_@X0A#@DVA@,C20FL@[LA5@GT@_0BT RU@A C* BI@!0C,0EQ@^0D%PM/@I(DJP@_@I(CB0RU@_PAI0D''@R\BGPJP@)@CW0N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@M_@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@H]AE,B:0NQ@9DAI@K-@.4DJPN\@58CY E>@A$B! N/@I(DB0D''@LXD%PCF@R\BT0JP@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C"@NH@8 CW0JP@)@B$@JP@)@B$@JP@%LAI0D''@R\AI0D''@R\BY0PUAKXDE@DA@6 D"PRUAITDB0M/@_\A=0BZ@Y\C[0PK@3(@R N/@.4C@@I)@ODD%PMJ@.0A-0DB@JT@M MJAITB&0F.@&(CA0PF@MTAB RU@6<@& PC@=PDJPBZ@6<AI0RUA@,C[0PKAITAI0JP@)@CW0M_@5<C"@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCW0D''ALTCY0D$@RPB;PK-AB$AYPP!AC@DJPP)@A<@& G7A@,AI0JP@)@B$@JP@5<C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@M_@)@B$@JP@)@B$@JP@)@A=@D''@R\AI0D''@R\AI0D''@N,@:0C+@N,@:0D''@R\AI0C+@IXD%PRUAIT@:0D''AITC[0G7@I(@& E%@6<D%PM/@I(C5@K-A@L@R K]AITC[0BZA@LC5@P)@I(C[0CFAITC[0G7@0,C[0PK@R\B$@JP@%LBT0JP@)@CW0N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCW0D''@D4@E K-@.4DJPP)@VTCN AP@1HA%0M/A@,D%PD''@)@B$@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@M_@)@B$@JP@)@B$@JP@)@BGPG4@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0D''@R\BT0IS@!4AI0D''@IXD%PRU@R\A=@D''A@,CB0K]@-4C[0RU@R\@:0PK@6<C[0M/A@,AI0IS@%LAI0D''@!4BT0JP@)@C+@N,@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DCW0D''@ ,DT@O=AB$AYPE%@3(@#P@)@^4C[0D''@)@B$@M_@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@M_@)@B$@JP@)@B$@JP@)@BT0IS@_PAI0D''@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0D''@R\A=@IS@%LB$@JP@)@B$@JP@)@B$@JP@)@B$@JP@%LBGPD''@R\A=@JP@)@B$@IS@!4BT0IS@)@B$@NH@:0CW0M_@8 C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC"@H]@6<B;P@)@>0DMPSGAL BK@P&@I(AI0JP@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@NH@5<B$@JP@)@B$@JP@)@B$@JP@%LA=@D''@R\AI0D''@R\AI0D''@R\AI0D''@R\AI0G4@!4BT0JP@)@B$@JP@)@B$@JP@)@CW0NH@8 C"@N,@:0C"@NH@8 C"@N,@:0C+@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PJP@LXA3 FSAFTAN G[@;$@N0P)@6<BT0NH@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@8 C"@NH@8 CW0JP@)@B$@JP@)@B$@JP@%LBGPG4@R\AI0D''@R\AI0D''@R\AI0D''@_PBGPH]@!4BT0JP@)@B$@JP@)@B$@JP@5<C"@NH@8 C"@N,@:0C+@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@%LD%PG7AB$B!@J?@:<@& M/@R\B$@N,@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 CW0JP@)@B$@JP@)@B$@JP@)@B$@JP@%LBGPH]@_PA=@G4@_PA=@H]@%LB$@JP@)@B$@JP@)@B$@JP@)@B$@JP@5<C"@NH@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0BT0C+A@,CN LK@6<D%PG4@)@C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 CW0JP@)@B$@JP@)@B$@JP@)@B$@JP@)@BT0H]@!4BGPH]@!4BGPH]@%LB$@JP@)@B$@JP@)@B$@JP@)@CW0M_@5<C"@NH@:0C+@N,@:0C4POQ@=DC4POQ@=DC4PIC@Z,C4POQ@=DC4POQ@=DC4POQ@=DC4P@N@=DC4POQ@=DC4POQ@=DC4PKC@:4C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DDU PB@=DC4POQ@=DC4POQ@=DC4POQ@=DB$0OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@JP@)@BGPG4@%LB$@M_@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@M_@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@A\ Q&@H8A\0AL@)@B$@JP@)@B$@JP@)@CW0NH@8 C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4PR$@&LC4POQ@=DC4POQ@=DC4POQ@=DC4PLW@=DC4POQ@=DC4POQ@=DC4PO+@>LC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC;PMR@=DC4POQ@=DC4POQAF@@HPOQ@UXA @OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C"@NH@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@NH@5<B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@D2P@Z@)@A%@AU@)@B$@DI@GHB$@JP@)@B4@R''@/4C+@N,@ (@Y NX@:0C&@IC@XPA.0OQ@/H@ @Q8@&LC4POQ@,@@L@NJ@=DC4PNX@EXCU0LW@=DC4POQ@=DCQPR$@,LC4PHR@8(C&@IC@-$@Y OQ@1(@U N-@=DC" HJ@=DC4PF*@=DC;PMR@=DC" R/@WPC4PMW@Y<B0PEV@UXBP0OQ@=DB6P@!@1(C4POQ@ (C+PCG@)LC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C"@NH@8 CW0JP@)@B$@JP@)@B$@JP@)@B$@JP@)@B$@JP@)@@H0A''@)@A]PG.@)@A.@M8@/\DK@JPAK C8 Q#@Q\C. I@@ZPD[0AW@)LD)@@M@S C\@@!ADLDE C#@&LC4PG_@[$@O@B(@,PCJ A7AAXA)@H-@=DC4POQ@-$@-PHE@M C4PL4A@HD)@@[@&,AE0Q#@ XBZ0Q#@=DDBPLY@=DC4PLW@=DC;PMR@;(BA DG@N$D*PRT@D @*@P7@98@R@OQ@ 4@U0@=AHXD@ OQ@3PB=0PV@;X@Y OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C"@NH@8 C"@M_@5<CW0JP@)@B$@JP@)@B$@JP@)@B$@JP@)@@H0QD@<TA< JA@R @U0KP@/4DQ@C;AI(D^0N,@6@A]@QD@;(C+@E[@>4D)@PW@5\C4P@=@K,C4PH3@&LC4PR[@^@CU0AX@GL@?@@\@=DBB I0@=DC4POQ@P @CPJS@=DC4PL4A@HD)@@[@8(A]@J+@,@C&@K0@=DDBPLY@=DC4PLW@=DC;PMR@=DC4POQAC$B<POQ@2PDL0OQ@_T@F0OQAE0A]@OQ@$TCM@OQ@3PAQ@OQ@/ C%@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 C"@M_@)@B$@JP@)@B$@JP@)@B$@JP@)@@UPBP@YTC8 A2@7DCIPP,AC\DX0F''@_LDNPN,@:0C_ K1@=DC4PR\@Y<D)@I+@=DC4PJ\A@$C4PR$@&LC4PF:AC\DM0P7@4PC\@M0@=DC4PLW@=DC4POQ@=D@V0@[@(@C4PL4A@HD)@I+@=DCF PX@=DC4PLW@=DDBPLY@=DC4PLW@=DC;PMR@9 @- N^@,HBX0OQ@2PDL0OQ@_T@F0OQ@''DC4POQ@J$@-POQ@3PD@ OQAF\B% OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4PN,@:0C+@N,@:0C+@NH@8 C"@NH@5<CW0M_@)@B$@JP@)@B$@JP@)@@UPBP@)@CMPDX@W DP0NX@8 C"@NHAI(@\0N,@^@AU O/@6@C4P@<@IHD)@I+@=DC4PAX@BHC4PC%@&LC4PQ&@SLC4POQ@=D@;@P7@=D@9@IA@=DC4POQ@:4C4PNX@>HB0@L4A@HD)@I+@=DCF PX@=DC4PLW@=D@ @B(@=D@.PIA@=DC;PMRAC$A)@OQ@:LBX0OQ@7@CN@OQ@_T@F0OQAA\@.POQ@NTD& OQ@3PD@ OQAF\B0POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@NH@8 C"@NH@8 CW0JP@)@B$@JP@)@@%@B*@5<A3PLW@7PB>@B+@;4BZ0N,@EXD! I#@X@C" JV@A,BA N=@8(D+0J,@=DC4P@0AE0B0 SJ@&,C4PJ]@A,C/PHF@EXCF D8@"PC'' RF@=DC4POQ@<XA.PMS@8HC4PMTACDD+0J,@=DCJ QC@=DC4PM]@=DC4PH$@T(C  QC@=DC? M0@,L@CPNG@;4BZ0OQ@>LCUPA5@ (@U0OQ@$TD! KB@S AS@OQ@5PDLPOQAF8B0POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C"@NH@8 C"@NH@8 C"@NH@5<CW0M_@5<C]@NH@8 C"@M4@8 C"@M @"8C+@N,@:0C+@IU@:0C4POQ@6@CF OQ@=DC4PNX@=DC4POQ@;(CF OQ@:4C4POQ@;(BD N-@=DC4POQ@/HC4PN-@=DC4POQ@=DCQPJS@=DC4PNX@=DC4PNX@=DC4PNX@=DC4PNX@=DC4POQ@-$C4PN-@=DC. N:@=DC. KC@=DC+POQ@=DCJ ME@=DC&@OQ@=DC. KC@=DC4POQ@9 C4POQ@;(C+POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@:0C+@N,@8 C"@NH@8 C"@NH@8 C"@NH@8 C"@N,@:0C+@N,@:0C+@N,@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@:0C+@N,@:0C+@N,@:0C+@N,@8 C"@NH@8 C"@NH@8 C"@NH@8 C"@N,@:0C+@N,@:0C+@N,@:0C+@OQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC+@N,@:0C+@N,@:0C+@N,@:0C4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ@=DC4POQ')
]

{ #category : #resources }
CMSimManager class >> deviationImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #deviationImage"
	
	<resource: #image>
	^Image
		extent: 196 @ 66
		depth: 11
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7066 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6231 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4400 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5749 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 3276 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2184 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1830 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2633 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2473 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4047 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7130 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6070 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5814 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5492 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4368 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4432 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 4657 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2184 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1830 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4850 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 3854 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 4978 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 4657 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5492 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2505 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2569 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 3950 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7130 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6456 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7034 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4240 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5524 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3115 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2312 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4432 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1798 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3693 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2569 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7066 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5621 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6649 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4400 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 4497 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3115 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2344 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 2120 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5171 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 3983 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4015 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7163 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7098 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6135 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4207 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 4111 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 3340 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3083 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2569 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5235 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 2858 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 5107 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2537 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 6552 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5878 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5846 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4304 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 3501 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2344 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1830 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2280 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4240 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7130 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7098 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2569 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4015 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5653 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5589 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6103 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5589 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5685 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4497 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 3822 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4175 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4336 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1927 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 1156 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7130 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 5589 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5910 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6584 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5043 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4593 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 3372 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3147 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3115 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1863 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3822 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3180 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 3340 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 2312 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4721 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 4753 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7291 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7612 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 5974 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6713 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2601 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5621 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2633 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1863 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2890 2890)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4111 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7163 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 4657 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4143 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 2216 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3180 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3501 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 1959 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2698 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 3950 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7355 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7644 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5910 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7163 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4529 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4561 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 3308 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2441 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5075 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5107 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5717 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 3886 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2023 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 1092 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 4497 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5075 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 5653 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7195 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5910 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4561 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 4625 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 2280 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3244 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1927 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 3822 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4272 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2923 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 1092 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3822 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4272 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 5524 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3790 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2666 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7195 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7420 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5974 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5974 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4464 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4561 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5107 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3212 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 3469 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5974 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5878 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4432 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 1092 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7323 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2698 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4175 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7227 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6167 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6745 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 5717 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4272 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 3661 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 1349 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 1124 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7259 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6006 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4593 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5171 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3244 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3308 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4368 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1959 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 3950 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 2923 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 2955 2955)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 4207 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7484 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7323 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 5621 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5974 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4368 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3244 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3308 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3918 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4432 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2730 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3758 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7291 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5749 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 5814 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4625 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 2762 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 1124 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7291 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7355 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4657 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 6167 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 3533 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3276 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 2312 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 2505 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 1124 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 2344 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2762 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7387 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5781 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7387 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7323 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6520 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5814 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4657 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4272 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 5203 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 3597 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 4432 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7355 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7452 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7420 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4336 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4400 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3308 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2794 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2023 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1220 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7291 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7420 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6070 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6167 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5010 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5589 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 2569 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 4882 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4657 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 5717 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3019 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2955 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7484 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6135 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4689 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 4978 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4175 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3340 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2055 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 1798 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7387 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7452 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7452 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 5749 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 4432 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5300 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 5107 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 3758 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4914 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4721 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 2184 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2858 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7516 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 5781 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4721 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 4786 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6103 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5171 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 5878 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 4015 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3051 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 1156 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7420 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2890 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 2120 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7452 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7420 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6135 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4786 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5171 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 2698 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2087 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 2376 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4272 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4240 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7420 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6777 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4753 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5749 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4336 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3404 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 2890 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 2505 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2152 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 4400 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 1252 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 2923 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7516 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 6360 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7452 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4946 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3469 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 2730 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2120 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1188 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 6263 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 6392 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4786 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5621 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 5524 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3437 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 2666 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3019 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 2248 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 2505 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1188 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1220 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 5524 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5043 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 5203 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2923 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 4529 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7548 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7484 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7516 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4818 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3469 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2987 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2184 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2152 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4561 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1188 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1220 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 3051 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7644 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4850 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5717 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 5589 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 4786 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 4882 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5910 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1252 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 3147 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1252 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 2184 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 4978 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 3854 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 2698 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4464 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2987 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7516 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6327 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6263 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6263 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4272 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4561 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 4978 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 2987 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1252 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 2280 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6006 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 2987 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1509 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7548 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6713 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 3019 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1445 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7580 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6295 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4914 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3533 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 2890 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2216 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3147 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1252 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2248 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7612 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7612 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6038 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6841 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7580 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4882 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 4336 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 2633 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 2890 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4914 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 4304 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4625 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 96)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7612 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4593 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3597 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 3597 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 1284 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 3790 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4625 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 5589 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5974 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 3180 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7612 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 6424 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6874 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4914 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 4978 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3597 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 1284 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2248 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 2698 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5171 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1316 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4561 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3083 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 385 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7612 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 5203 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 5300 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 3918 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 4368 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 2344 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 2441 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 1927 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5203 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4721 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 4625 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 6103 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7677 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7644 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6938 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 4753 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3597 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2280 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 1284 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1316 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 1381 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2344 1959)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 6841 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4657 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4432 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 3308 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 3983 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 2569 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 2473 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 2376 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2023 3212 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3212 3212)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 2441 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3983 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1638 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7773 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1349 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 417 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3115 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7709 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6135 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4978 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 5685 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5010 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3950 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 3790 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2312 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 2441 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 1284 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 1316 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 2987 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 2312 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 2794 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5332 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1638 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3180 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3147 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7130 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7677 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5043 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 6167 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 3276 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 4079 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5396 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1284 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1316 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5010 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 6038 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 5267 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 2858 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 4368 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2344 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 1413 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 2120 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 3244 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3180 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1381 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 6777 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 5557 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3308 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3693 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 4721 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 2505 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 1316 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4657 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1349 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3212 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 1702 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1702 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7773 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6552 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 6038 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 3854 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3726 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 5107 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5589 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5364 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5267 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 4721 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 4753 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7869 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 5364 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3693 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 4304 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4207 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2376 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 1316 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2569 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3212 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2344 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 1413 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7805 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7773 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 6263 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6167 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5075 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4753 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 4047 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3244 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2441 2120)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 995 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4561 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7869 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5428 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5492 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3726 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 4079 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 2826 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2409 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 995 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1381 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 1316 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 4240 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3051 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3083 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5010 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1766 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3276 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7837 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 6617 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6713 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5107 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 5492 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3340 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 3372 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2473 2152)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 5171 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 3340 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 4561 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7805 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4786 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3372 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3276 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 4882 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7869 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7805 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6327 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 6649 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 5235 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 5557 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3758 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3372 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6231 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2441 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7837 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1381 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7901 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6520 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 6263 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 5267 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5171 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 4850 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3790 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 5171 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 2601 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 1349 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 4272 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3180 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 1895 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3340 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1895 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7869 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6809 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 6874 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5203 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3180 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 2601 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2473 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 3340 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5107 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 2409 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 5910 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6263 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 1830 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3340 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7901 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7901 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5460 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 4850 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3372 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3501 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5524 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 1349 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 1766 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3469 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 995 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7934 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6745 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5203 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5235 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4464 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 4015 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3501 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 1381 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1349 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 1573 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1413 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 3372 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3404 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 6167 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 4079 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6584 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6617 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 6809 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3886 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 4304 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2569 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 4336 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4850 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1445 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 1413 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3469 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 3950 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 3565 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 5396 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7934 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 6906 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1895 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3372 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 7998 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7934 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7130 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5235 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5267 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 5332 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3083 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5235 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2537 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2730 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1413 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 3340 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4882 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7966 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6617 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6295 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 5878 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5075 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3886 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 4079 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2601 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 5910 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6167 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1413 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1445 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 3404 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3501 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7966 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3437 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6520 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8030 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4914 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 4272 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 4079 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 2858 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 2633 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 4336 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1445 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3533 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 4111 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 6231 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5139 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 5589 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4914 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7002 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 4111 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6456 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 7998 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8030 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7998 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5267 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5300 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 4175 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 4143 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1477 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 1702 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3437 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1477 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 3212 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 3372 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4946 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3469 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 3469 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 1959 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7998 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6327 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6103 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 6199 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 4304 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 4143 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1509 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 2890 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 6199 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 2087 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 6520 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 1959 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8030 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6970 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 4978 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3950 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 5332 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 3822 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 1638 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 1027 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1509 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3437 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2505 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8062 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3340 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 4304 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3308 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 2794 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1509 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8062 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 6777 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5332 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 5814 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3983 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3533 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2633 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1541 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1509 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3533 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8062 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6713 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 5043 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4015 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 3790 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 2890 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1606 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4079 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1541 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1509 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2537 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1638 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3597 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 1606 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3501 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8094 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 6809 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 5235 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 5942 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3372 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5685 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 2858 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1638 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3565 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1477 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1541 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 1670 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6809 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6263 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6617 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3597 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 2858 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2698 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 2890 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2152 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 1606 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8126 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 6809 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 4015 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3533 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 2955 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1670 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1541 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2152 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2087 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 1638 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6777 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7195 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 5300 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6424 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 3661 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 4047 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3597 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2698 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4753 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1573 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 3501 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 2633 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6649 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6295 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5428 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 4497 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 4529 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 1991 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 4593 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 3340 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2152 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7259 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 3501 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5428 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2730 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 1766 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2152 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1606 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2601 2601 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 4240 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1670 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6617 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6681 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5460 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 5492 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 6295 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 3918 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6070 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 2312 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1766 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3661 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1606 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5171 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 3726 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7291 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6649 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 6809 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7163 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7098 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 4625 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6231 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2762 2601)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2280 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 6745 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1606 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 2633 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 2601 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 2248 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 5171 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7291 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 5460 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5043 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 7291 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3693 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5428 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 3019 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 1734 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1606 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 2923 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 2666 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 2633 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1863 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5653 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 770 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5557 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6713 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6745 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6906 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5043 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6199 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3726 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2794 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2216 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2216 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 1670 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 4272 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 2666 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6906 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5524 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 5685 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4175 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 4689 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3854 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5139 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 5781 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1638 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2826 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 1830 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1895 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2312 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6906 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6938 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7130 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 4240 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3726 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4850 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6167 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 1734 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1670 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3597 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3758 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6777 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5557 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 5557 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5235 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 3597 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2890 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2858 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 1830 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1927 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1959 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 1895 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1702 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3758 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6809 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 6970 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5171 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 1830 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 1991 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 2955 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 1766 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2473 2216 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 2666 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1638 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2280 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 2312 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7002 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5589 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 4625 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 4079 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2890 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 3180 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1702 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3629 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 1830 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 5878 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6038 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 1766 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2312 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6424 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 7002 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5781 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5203 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4272 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 3983 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2890 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 3180 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2184 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1670 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4047 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 4561 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6777 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6809 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5492 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3822 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 2312 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6841 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5396 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 4432 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5557 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4079 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3822 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5364 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 2344 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 1734 1156)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3661 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 3661 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 1863 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7387 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6456 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 5621 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 4111 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 3983 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 3854 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2923 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 3501 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5364 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2730 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7387 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7066 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 6938 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6874 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4272 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 4079 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 2344 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 3180 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2987 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1702 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 3212 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 3372 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 2730 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 5524 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2344 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7002 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7420 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 6906 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 5717 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 5974 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 4143 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 4304 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 2344 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6488 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 5075 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 4015 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 3886 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 5942 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4336 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 5300 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4015 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2473 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 3180 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 4336 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2152 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 2409 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 2762 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 5428 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 3886 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 899 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7034 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 7098 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6938 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 5428 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6617 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 4818 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5878 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 4015 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 2987 2826)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 7066 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 6970 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 6006 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 5043 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 4850 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3051 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 2184 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 1734 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 1830 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4368 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 4015 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7323 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6520 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 4753 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 4336 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 6167 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 3019 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 2055 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 2376 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2794 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5685 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 5267 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 5621 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7034 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 3918 6488)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0L''@1PC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C.PL>@>,C:0O+@>,C:0O+@>,C:0O+@>,BNPO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@B<AL@JA@>,DA E9@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@(XA9PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0H)@U<C:0O+@>,C:0O+@>,C5PQ>@>,@<0OA@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,CKPJV@A@C:0NZ@F(C:0O+@%TD''PNN@>,A!PNN@>,BNPK(@>,CI0G5@>,C:0O+@2\DJ I&@>,B(@JA@>,AZPN-AI4C# OTAI4CE@O+@88A)0O+@>,AM@O+@"$AW0O+@88DQ DH@>,CT R/@O@@<0C3@]PC:0O+@88D''PGT@>,C:0F''@<X@Q@H9@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0L-AEP@SPDH@9(@Z O+@H<C7PJS@)XB PKHAEPC:0DV@A@C:0G%@WXC:0O+@*@B/ S0@9HC:0H)@U<C:0CY@CH@.PL!@K$A^PEY@5HCY0@>@>,C:0R4@>,BJPE_@=PDL@O[@-,CUPPF@ 0B% G@@O0BC@O+@DPBK KH@"8CG@O+@F(@Z0FJ@G4D5 O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@24@1PJ%@ ,C& A*@>,A#PE)@5HB.0O;@Q0AX OT@$,B% O+AC@D70O+@>,@ PGC@#$C:0O+@"$AW0O+AF(AM@O+@L,C@ O+AJPCY0M''@C8C:0O+AKPC:0H)@U<C:0O+@>,C& @2@>,AK@JF@>,A!PG*@>,B$0Q/@>,BD0RH@>,@Z S-@>,AC@GL@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,CKPCE@88AVPO$@F(C:0L2@\@A0@G@@#,CT A,@8XC^PNT@A4A00O+@>,C:0O+@>PA: BQ@>,BJPE_@>,D90O+@>,B^0D[@>,AK0IW@6\@O O+@>,D-@O+@"$AW0N-@7$@?@S2AHTC:0D,@(XC:0FE@^(C:0PN@=TC:0O+AKPCE@A*@38C:0K4@K\C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0L-@LTC:0BC@J\@Z O+@WH@00O+@>,C:0O+@MX@O BO@R0@Z0R/@>,C:0O+@<XC:0N-@J\BUPH)@U<C:0S''@>,C:0I;@Q,C:0D/@%\D70JV@>,@J0N6@>,BJPE_@9(C<PO+@,LD!PO+@X$AQ@O+@XTA: O+@'' C$@O+@M<AF@O+@F(CO O+@/P@5@O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@7$@8 O+@>,D\0D/@>,AU@G*@R<DPPR:@>,DM0IB@&XDQ FO@2 C:0O+@>,C@ O]@K$@90O+@$XA"PO+@B\C:0O+@+8AM@O+@VHB]@O+AE$C%@C''@Q C:0IF@X$BY GC@MXAK0R$@>,CJ@S''@24A)0H.@>,@Q@IKAM8BK GV@>,@!0NF@>,CG@C0@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1 O+@>,C:0O+@=PC:0O+@=PA10OF@>,C:0O+@88C:0O+@88C:0O+@>,C:0O+@2\BNPO+@>,C5@OT@>,C+PO+@>,C+PO+@>,C+PO+@>,C:0J @>,C1 O+@=PC5@O+@=PBY O+@<XC:0O+@1PCI0O+@:4C:0O+@>,BUPO+@>,C:0N-@>,C:0OT@<XC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OEACXD 0F<@6PC&@OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TB\0D^@3LDP@I+@R,CI NX@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC&@I3@I8D8 N7@W8A_ PQ@](DN@LA@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC&@I3@$PCU0G9@P<B0@E>@W8A_ E>@=@B=PM3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC&@NX@7LC 0@L@KPAUPG(@*(C% E>@W8A_ E>@W8A_ E>@W8CK BL@''LC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@<TC1POE@<TC1POE@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@9 C\0L=AF8D/PA]@N A#@JX@W8A_ E>@W8A_ E>@04AOPMDACLA_ E>AD<D80B!ANDB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC1POE@<TC1PNX@9 C\0M3@7LC\0M3@7LC\0M3@7LC\0NX@9 C1POE@<TC1POE@<TC1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC&@NX@7LAD B5@IH@)PE%@ 8A_ E>@W8A_ E>@W8C70G=AL8B"@S$@(TC2PK_@''$A_ E>@)T@9PQI@-L@=@I3@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC1POE@<TC1PNX@9 C&@NX@9 C&@M3@7LC\0M3@7LC\0M3@7LC\0M3@9 C&@NX@9 C&@NX@<TC1POE@<TC1POE@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 C&@M3@EDD/PSJAGPD] E>@W8A_ E>@W8A_ QP@%8@ZPMB@K CO0OI@>8DRPQI@A<@]0B!@B@DW N$@$(A[ @_@30@3 I3@9 C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC1POE@9 C&@M3@7LC\0M3@7LC\0M3@7LC\0M3@7LC\0M3@7LC\0M3@7LC\0M3@7LC1POE@<TC1POE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@9 C\0DR@FTD:PQXAB@A_ E>@W8A_ E>@,@A_@@E@6,@5PNG@<$C; QIAD$@G0B!@JDA%@HI@30C] R\AL\CP0O@@&$C; FTAI0AI I3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1PNX@9 C&@NX@7LB\0I3@''LB\0I3@''LB\0I3@''LB\0I3@''LB\0I3@''LC\0M3@7LC\0NX@9 C&@NX@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 C\0AQ@14A\@@T@W8A_ E>@W8A_ L3@"<@. O%@_(C; OIAD$DRP@_@JD@(PFT@ $CO@M6AL\@'' D&@RXAI HQ@''L@8@LS@ $A%@M6@I8BQ@I3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC1POE@7LC\0M3@7LC\0I3@''LB\0I3@''LB\0I3@''LB\0I3@''LB\0I3@''LB\0M3@7LC\0M3@7LC\0NX@9 C1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC&@M3@)@CB@B;@W8A_ E>@W8B0@F1@C4C9PGW@>8C; QIAD$@QPB!@YPBBPL<@7XD10B^@RXAI G!@$PB\0I3@''LC&@NX@<TC&@I3@OPD''@S!@RXB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1PNX@9 C\0M3@''LB\0I3@''LB\0I3@$PBQ@ID@$PBQ@ID@$PBQ@ID@$PB\0I3@''LB\0I3@''LC\0M3@9 C&@NX@9 C1POE@<TC1PO+@>,C:0O+@>,C:0O+@>,C1POE@9 @C@@Q@J A_ E>@W8B?@KZ@"0AN@OW@>8DRPQI@DT@(PFT@ $C] Q-AND@3 D&@^DBQ@I3@''LB\0NX@9 C1POE@>,C:0O+@>,C:0OE@''LBDPG!@''LB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC1POE@7LC\0M3@7LB\0I3@''LB\0I3@''LBDPHQ@!DBDPHQ@!DBDPHQ@!DBQ@I3@''LB\0I3@''LB\0M3@7LC\0M3@9 C&@OE@<TC1POE@<TC1PO+@>,C:0O+@>,C1PNX@;(@:@FP@W8A_ O_@C4@%POJ@>8DRP@_@JDA%@HI@7XD[PS!@OPAI G!@''LB\0I3@7LC&@OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C&@I3@''LC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,@7@Q;@8HB8 Q;@-<C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1PNX@9 C\0M3@''LB\0I3@''LB40H%@_LA<0G3@_L@(PHQ@!DBDPHQ@!DBDPHQ@$PBQ@ID@$PB\0I3@''LB\0M3@7LC&@NX@9 C&@OE@<TC1POE@>,C:0O+@<TC&@P?@F8A$@E>@]LC,0S[@<(DRPQI@JDA/PKS@7XD8PCN@RXA8PI3@''LB\0NX@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,DI I3@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC1POE@7LC\0M3@7LB\0I3@''LB\0CN@-<D= AX@''TB70D&@RXAI D&@RXAI D&@RXBDPG!@!DBQ@I3@''LB\0I3@7LC\0M3@7LC&@NX@<TC1POE@<TC:0OE@9 BYPRC@ 8A_ G,AKHB@PPZAD$@(PHI@7XD8PC4@RXBQ@I3@''LC&@NX@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,AI I3@>,DRPA?@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C@0O8@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 C\0M3@''LB\0I3@''LBQ@HQ@^DA8PIO@ZDAI D&@RXAI D&@RXAI D&@RXAI D&@^DBDPHQ@$PBQ@I3@''LB\0I3@7LC\0NX@9 C1POE@<TC1POE@7L@Q0@T@W8A_ P^@%$DRPAE@[4C] S!@RXBDPI3@''LC&@OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0S7@A<C:0D&AL\C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0N(@-4C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC:0O+@<TC1POE@<TC1POE@9 C&@M3@7LB\0I3@''LB\0G!@!DAI D&@.HD=0D&@RXAI D&@OPAI D&@RXAI D&@RXAI D&@^DBDPID@''LB\0I3@''LC\0M3@9 C&@OE@<TC1PNXALXD9PE>@W8@"PA''AA(@QPHI@7X@3 G!@''LB\0OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0R%@"TB_0LP@+D@(PI5@8@C PF!@D$CD@J@@I8C:0IL@:XD^0A7@>,C:0O+@>,C:0O+@G<@?0O+@>,C:0QEAF4C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@9 C&@M3@ \DJ0QG@9 D_0FU@@LC''0G(@^ B1 M3AFD@>PF>@-X@C NO@!HC&@NX@7LC\0I3@''LB\0HQ@^DA8PD&@RXAA0M<@OP@=@B^@I8@'' B^@I8@3 C4@OPAI D&@RXAI HQ@!DBQ@ID@''LB\0I3@''LC&@NX@9 C&@MQ@TTB0@E>@,@A>0N]AD$A/PM6@OPBDPI3@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C5@DZ@:0C&@NX@9 C1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@RXC>@O+@>,B8 G!@$0B8PI3@T0D*@M3AMHDRPIPAOXC1PS6@O<C:0O+@>,C:0O+@>,A(@A7@>,C:0N(@''(D4 HI@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC&@NX@(4@30NX@% @LPGF@:TA_ E>@F8BDPL^@W8A_ E>@W8A_ @$@RXCG E>@W8A_ E>@W8DY@I3@Z$@50QK@,TB-0D&@!DAI D&@RXC2P@@@V8@'' R*@4(D$0P]@$\DA0S!ANDD8PC4@RXAI D&@RXA8PHQ@$PB\0I3@''LB\0M3@7LC\0N<@((A_ E>@2HBJ QI@JDC] B^@!DB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0NXA@ A3 G+@E8DFPKD@[,C\0M3@9 C1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,B70IO@>,B\0K"@>,C) AE@>,AT@HI@>,D^0C4@Z@D=0H_@JXC&@O+@>,C:0O+@>,C:0SU@''LC:0O+@R\C:0MA@V8C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1PL)@0PBOPGY@VTA''PR3@!DDNPE>@W8A_ G?@@\BZ S!@@4@[0BH@S(BP@NI@''\D10R>@O,D! ON@!0D:@H-@I8@!@E>@W8A\0E3@#DB=0D&@;4A]PA9@P\C] D;AAHA8@QQAG\B+@O!@7(D8PS!@I8@'' D&@RXAI D&@!DBDPID@''LB\0I3@7LB\0B#@&DA_ O4A@0DF AE@ $D8PD&@''LC&@O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@7LBDPS+@AXB; K.@.8B; QZ@JPA3PJD@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0R%@G$C:0QI@M0C:0F!@<TC1PF!@>,B\0F!@>,B,PS!@>,C:0O+@>,C:0O+@>,C:0O+@7LC:0O+@RXC= O+@T,C] O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0NX@9 C@POG@14A4@I3@WPA_ E>@W8A_ FP@4TD8PG6AGD@% F?@2,B:PIVAI0C6@@"@:@B>@I[@4 @1 R\@4,@R S@AIHANPN0@ $D[P@M@0$@R0H[@<PAO0L.AI0CK C2@V\AV @)@M,AH KI@,$B2PKI@Z8DMPH3@>4D8PS!@L8AI D&@RXA8PHQ@$PB\0I3@''LB(0H]@W8A_ N!@+$DRPFT@7XAI I3@7LC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TB\0G!AL\A9@AO@:HB; K.@.8B; S4A@$B\0OE@>,C:0O+@>,C:0O+@>,C:0O+@%@B,PN(@O<D)PS!@PHC:0LC@.DC:0B!AMHC:0OM@? AS@R%@>,C:0O+@>,C:0O+@>,C:0O+@>,@'' EL@RXAS@O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC&@G4@JHCB K@@W8A_ M]@RXDB A!@<HA(0@W@9DBE@QE@QPA0PSP@:HB; K.@D D8PF$@.8B; K.@.8B; B ANDA^ KK@,,B&PJY@''0DUPQE@E<B;@OKAN<A% I)@E@C@0JT@; @3PR[AALB2PKI@,$B2PKI@,$B2PKI@/4CM@R+AND@'' C4@RXAI D&@!DBQ@ID@8T@$0E>@W8D@0P;@>8@(PLCANDBDPI3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PD3AFHC" P_@.8B; K9@.8B; O2AL$D8PI3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0D&@<TC&@O+@>,C&@O+@>,C&@O+@>,C&@O+@>,BDPD&@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@%@B7@S!@>,C:0O+@>,C:0O+@>,C:0O+@9 C&@E@@?0BW@JO@R BXPE>@W8D&@NK@28DE0KT@+ C(@E#AE,B; R AL\B&0K.@.8B; N''@G@@/@S!@] C6 P<AIP@X@CX@*PD8PG]@:$B*@F/@CLC_PE,AL\D9 HM@ 4A:PG)@>\D^PHI@40A]0D<AF$B[@KI@,$B2PKI@,$B2PKI@,$B2PF^@I\D8PS!@L8AI D&@RXAT P,ABDA_0E>@Y4D]PKWAD$A/PQE@RXB\0M3@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 C\0C5@J<AIPI3AL,B; K.@.8DYP@?@.8B; RG@Y\@(PS!@''LC&@O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0NX@)@D2 HP@Y@A_ E>@O(D''@JT@>XA7 D-AJDD @M6@8 B; K.@.8B; N"@20D8PS8@",B$PL0@>8@]0M6ANDC] B!AD$DRP@_@V,DQPS!@7X@(PQI@>8DRPB!@7XD[PL AK<BFPR1@$4A60DJ@-LB;0DY@ @@*PKI@,$B2PKI@,$B2PKI@,$B2PKI@)(@:PS!AHHBT IH@]0A? H1@T4ASPF_@68A^@K_@G\C@0S!@!DB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC1PJB@NL@&@BF@.8B; D!@RXC+ KY@KXBV E.AOTB; SA@R@DRPM6@RXC\0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C&@NX@R(CU SW@$PCB E>@W8A;@H @28A- CQAA0@A L#@.8B; BEAI0BE0D@@0<@&0J&@FXC] S!@7XA/PB!@JD@(PKSANDAI S!@7XCO@L<@7XD[PC4@RXD8PM6@ $BBPG/@-LD10S!@0L@QPOI@V8A[ J:@^<A-0SM@[$@&PMF@,$B2PKI@,$B2PKI@,$B2PKI@,$@D Q<@J0@/0B?@OHA@PD2@SHDY0CJ@Y B70QI@[4D[PD&@''LC\0OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 B< O9AB4A+@I3@@DB; K.@.8C30J[@Z4D8PSG@^<@G0QI@)HB; BJ@V@DRPM6@RXB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC&@OE@<TC:0O+@9 @]@F>@2<A$@E>@C@@'' @XAKTC:@EVAGHA&PM6@%4B; K.@4\@S@K>AA D8PM6@JDDRPQI@G\A;0R\@RX@=@SGAF4D8PB^@RXBQ@I3@''LA8PD&@RXA8PID@''LB\0I3@^DAI D&@RXAI HQ@RXD8PLC@YP@QPQI@JDB40HIAD$AQ M^@)(B2PKI@,$B2PKI@,$B2PKI@,$B2PRJAF @& C]@ <@? R6@/XAV@IQ@-<DRPB!@7XD8PHQ@''LC&@NX@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC&@NX@9 C&@MS@]DBRPNU@.8B; K:@H4@=@O/@C,B[ O#AD$A;0S!@OPD[PM6@7XDS@I>@3D@(PM6@RXB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1PBN@&4@I SO@D@BN KB@''LA90E>@W8A_ GE@,(A>@PK@.@B/@P$@.8B; D!AF4BY0S*@ HCZPO.@DTC@0B^ANDC] KS@7XD[PB^@RXB\0I3@''LB\0I3@''LB\0OE@<TC1PNX@9 C&@NX@<TC1POE@<TC&@NX@7LB\0I3@7LB\0HQ@RXD8PQ-@7XC] SG@7X@(PK_@0,D&PKI@,$B2PKI@,$B2PKI@,$B2PKI@T(C:PE=AJXA?@@Y@V8B70OI@A<AZ0M6ANDAI I3@9 C&@NX@9 C1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1PNX@KHAP0HX@1<D^@C6@$P@M@K.@/(@D0M\@ (DR@S!@ $@(PAE@JDBBPQE@RXB\0HQ@RX@,0DM@JDA/PQ-@^DB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1PA5@N0@* @U@^4DSP@(@W,AI AZ@$LB_PKL@Q<AH0KS@Z(B; K.@.8D@PI>@)4D10SG@ $@]0B!@YPC@0S!@^DBQ@D&@RXA8PID@''LC\0OE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC&@NX@9 C&@I3@''LB\0ID@RXAI D&@RXD8PM6@ $B?0P"@& C?PO=@?4C?PO=@?4C?PO=@6(@PPJ)@(,B%0K1@FHALPLQ@ $B5PLE@RXA8PI3@''LC&@NX@9 C&@OE@<TC1PO+@>,C:0O+@>,C1POE@<TC1POE@<TC1PNX@5L@1@J=AO$ABPI3@#PB; K.@.8B; K.@N<@3 N/@*,C?0O.AD$A/PS!@OPD10M6@7XD8PD&@!DB\0M3@<TC\0FRANDC] S!@!DC\0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1PFF@B D"PB&@%@C*@D$@@P@J@OY@30B[0LRAE0B; MZ@7TD''@J\AHPBMPK_AD$BBPS!@OPD8PQ-AND@3 D&@$PB\0NX@9 C&@NX@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1PNX@9 C&@NX@''LB\0I3@''LA8PG!@RXAI C4ANDD[PM6@GDBL0AF@\(A2 GJ@\(A2 GJ@U8BG A-@X@BF Q&@$8@3@A"@7,C] HC@[@B>0BT@;DAV0J6@''LA2@DQ@"\CFPM3@7LC&@OE@9 B-@DIAH,B9@D6@I@C\0J-@PLC_0K.@.8B; A$@RXDU0QB@\<DO@FZ@C(C] S!@7X@(PB!@V,BBPQ-@RXB\0ID@!DBQ@I3@''LC&@OE@>,C:0NX@''LAI D&@''LC\0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0M3@Z,C(0B&@%@C*@D$@-<DRPK-@00@IPKK@.8B; PA@:,B<0S!@ $@QPAE@JDBBPR\@RXB\0ID@$PB\0I3@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 B\0I3@''LB\0G!@^DA8PD&@RX@3 S!ANDD8PA2@#LA&0P[AK,D.0R^@6<CW0B-@JD@(PK_@V8@40C8@P8D^ M6@J8CV0HM@ 4BL@I_@&@BDPE\@)$B20KK@80DX0RA@''L@6 K.@.8B; K.@.8DOPG!@H,B; K:AE4AU0OL@NPD8PMN@JDDRPQI@A<A;0R\@RX@3 SGAND@'' D&@!DB\0M3@<TC1POE@<TC:0O+@>,C:0O+@>,C\0I3@''LC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@''L@MPJL@%@C*@D$@RPB70QI@2(DM@H?ABPB<@FA@;,@(PR\@L8D''@M6ADTD8PD&@$PB\0OE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@9 C&@I3@''LB\0I3@!DA8PG!@^DAI D&ANDD8PS!ANDA70RZABLB7 O AK\CI@O0@0LC] L<@JDDRPQI@>8DRPF=@7XBBPQI@.LA  A(AK@@] S!@VDDP0N4@08B; K.@44AI D.@64DWPAN@WDB3PS:ANDA80P>AB8C; PZ@JDC] B^AI0B40HI@ $C] S!@RXB\0I3@''LB\0I3@7LC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@9 AI SC@=8C*@D$@RPB70QI@V,D6 O7AD8DRPQIAD$@(PM6@L8BQ@ID@!DBQ@I3@''LC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC&@NX@''LB\0I3@''LB\0ID@^DA8PD&@RX@'' S!ANDD8PS!AI0CF0SBAG4BBPQEADTD8PS!AI0C] M6@7XCO@L<ADTD8PM6@V,@QPQIAD$@(PL<ANDC] B!AA(C; PM@@HCE S!@=X@(PPZ@>8DF B!@7XD8PR\@ $@(PB!@[4CO@S!@^DAI D&@RXAI HQ@''LB\0OE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C\0D&@;HA# D$@-<B70QI@V,CO@S\@]H@(PG/@ $C] S!@RXB\0M3@9 C&@OE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 B\0I3@''LB\0I3@$PA8PG!@RXAI C4@L8D8PS!ANDD8PR\AI0D[PQ-AF4D10S!ANDD8PB^@L8D8PB^@OPAI D&@L8D8PR\@7XC] M6ANDAI S!@-L@(PB!@JDA;0QE@L8D8PKS@YPAZ0G/@0LD8PD&@RX@'' S!@I8AI D&@''LB\0M3@''LB\0NX@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0M3@RX@10H!@$DDRPQI@V,CO@@.@B DIPM6@I8AI HQ@''LB\0OE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@9 C&@M3@7LB\0I3@''LBQ@G!@^DA8PD&@RXAI B^ANDD8PS!ANDD8PS!ANDD8PS!ANDD8PB^@L8AI D&@RXA8PHQ@!DB\0HQ@!DA8PD&@RXB\0I3@$PAI B^ANDD8PB^@RXB\0HQ@RX@3 C4@RXAI ID@''LB\0I3@''LB\0I3@9 C1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@7LA8PLC@K4@J@AB@6 @^@EG@K@@''@AEANDB\0M3@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC&@NX@9 C&@I3@''LB\0I3@!DA8PG!@^DAI D&@OP@3 S!ANDD8PS!ANDD8PS!AND@'' CN@OP@=@D&@RXAI G!@!DBDPI3@''LB\0I3@7LC&@NX@9 C1PI3@''LB\0I3@''LB\0M3@7LB\0I3@''LB\0NX@<TC1PO+@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0I3AND@]0P''@N(C@@MO@K8@''@K_@30AI M3@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 C&@NX@''LB\0I3@''LB\0ID@^DA8PG!@RXAI D&@OP@=@CNANDD8PS!ANDD8PC4@OPAI D&@RXAI HQ@!DBDPID@''LB\0I3@''LC&@NX@9 C&@OE@<TC1POE@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@7LAI M6@A<A[ CS@RPA[ PZ@ $@3 I3@9 C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 C&@NX@9 C\0M3@''LB\0I3@$PA8PG!@^DA8PD&@RXAI D&@RXAI C4@OP@=@C4@RXAI D&@RXAI G!@!DBDPID@''LB\0I3@''LB\0NX@9 C&@NX@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0I3@RXD''@HI@JD@(PFT@7X@3 I3@9 C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@9 C&@M3@7LB\0I3@''LB\0ID@!DA8PG!@^DAI D&@RXAI D&@RXAI D&@RXAI D&@^DA8PHQ@!DBDPID@''LB\0I3@''LB\0M3@9 C&@OE@<TC1POE@>,C:0O+@>,C:0O+@>,BO@F2@>,C:0O+@>,C:0O+@>,C:0O+@>,@C0O+@>,C:0O+@>,C:0O+@>,B-POF@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+AH0DJ@O+@>,C:0O+@>,C:0O+@>,C:0O+@(HC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,B\0I3@RX@3 S!@RXAI I3@9 C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC&@NX@9 C&@I3@''LB\0I3@$PBQ@G!@!DA8PG!@RXAI D&@RXAI D&@RX@9 P@@@ AJPR,@!DBDPID@''LB\0I3@''LB\0NX@9 C&@NX@<TC1POE@<TC:0O+@>,C:0O+@>,C:0SX@%LC:0O+@>,C:0O+@>,C:0O+@>,C:0LW@>,C:0O+@>,C:0O+@>,C:0PB@?(C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,DA@M @>,C:0O+@>,C:0O+AI@@HPO+@U4A 0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC\0I3@''LB\0M3@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 C&@NX@''LB\0I3@''LB\0I3@''LBDPG!@^DA8PG!@^DA8PG!@^DA8PR"AH4A8PDPAL0BQ@I3@L@@B0I3@''LB\0JNAJ4B0PNX@9 A5PAS@84C1PN,@#0A!0F5@>,B90BBAJ8BT0O+@>,B+ @,@9$C:0O+@:0@U@M%@1\C:0O+@>,C:0MTAM B-PO+@  C&PN,@#0B4PA#@>,CF AT@<XC:0NY@_\C:0O+@Z C:0PD@6@C:0NYAN@A[PO+@6TA)PJ/@U4AWPH<@>,C:0KQ@BDCF O+@>,A=0OF@M@B  O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@9 C&@NX@9 C&@NX@''LB\0I3@''LB\0I3@$PBQ@HQ@!DBDPHQ@!DBDPHQALPD.@HQ@QTA!@I3@S\CMPJ0A@TB\0S;@=DDT DD@9 BA@FKAH8@UPJBAM @BPD>@7 @HPQ+AB<@:0IS@>,A2PF3@CX@,PJ?@3X@^ P/@ZXBH O+@>,C:0KQ@LDA<PC^@>,CM0P(AM @F I"@Q\D%PG2@&HD%PO+AB$CF@O+@>,CE0O+A@PCX@OT@_HACPC1AM$D/@AC@KDDW0N5@DLC:0HE@ET@M0R9AB C:0L7@.,DK0OR@FLC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@9 C&@NX@9 B\0I3@''LB\0I3@''LB\0I3@''LB\0ID@$PBQ@ID@$PD7PPO@7@A$PH#@PT@F0I2@''HDQ@C!ALTD$PNX@1$ATPQ,@<TC1PE&A@PD6@P1@6TC:0@7@L C:0H(@%LC:0SQ@\,CYPAV@G,AB0@\@>,A=0I#@>,C:0O+@P$@BPJB@>,C:0L7AB D6@@Z@9$A[PJ^@*8C+@K%@>,DJPLX@>,C:0LW@>,DA@M @>,C:0O+AF@B9 O+@2TDU O+@^H@F O+AH<A[PO+@#8CM0O+@3\ARPO+@.(C'' O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC&@NX@9 C&@NX@9 C&@NX@''LB\0I3@''LB\0I3@''LB\0I3@''LB\0S]@B4AD0OC@C CN@KNA@TDAPQR@X A.@PP@9 C&@M1@,<C1POEAMLA)PSX@&HC:0O+@($DJPO+AM BT0O+@[PDW0Q_AE<CT@M8@7 C:0O+@1\C:0O+@>,C:0A[@A(B\@O+@3\DJ@SX@&HC:0LZACHC:0O+@1\C:0P)@1 C:0O+@1\C:0PD@6@C+@CB@;TB, IS@>,CIPQV@>,A8 @Z@>,BY@O+@>,@''0CA@>,CM0P(@>,D% JG@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@<TC1POE@<TC1POE@9 C&@NX@9 B\0I3@''LB\0I3@''LB\0I3@''LB\0I3@@(@U0I3@+L@2PD5AAPCNPM3@9 C&@R#@E$C1PF5@T8C: MS@<T@M B]AM BX O+@>,@U @#@>,@; IS@>,D%0D3@>,C:0O+@PXDW0O+@N4BM O+@>,C:0OF@>,C+@O3@*8CM0P(AM BX O+@1(DL O+@>,CE0O+@HH@,PO+@LPBM O+A@PCX@Q @ZXC:0N>@%LC:0M8@3(C:0G"@A(C:0P1@LPC:0C.AMPC:0L7AB C:0RV@*<C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1POE@<TC&@NX@9 C&@NX@9 C\0I3@''LB\0I3@''LB\0I3@''L@O@A\@''LA"@KP@6XB10A<@;<BM0NX@C$D%0H8@V C!@I1@A(A< O\@9$D8@J_@>,C:0@,AH<B, S<@&HC:0JC@A(C7@G2@EPCF D>@"XC-PR9@>,C:0O+@>HA,0M!@9LC:0M"AELD8@J_@>,CM Q+@>,C:0M2@>,C:0H&@T<C$0Q+@>,DEPM8@+T@BPNW@=0BX O+@?(CX0B@@_\@UPO+@#8D.PJ2@S8AT0O+@6HDT0O+AJ\B+0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC&@NX@9 C&@NX@7LB\0I3@''LB\0I3@''LB\0L9@''LB\0NX@6XC&@NX@5LBA OE@<TC1POE@"\C1POE@<TC]@LZ@>,C:0O+@:0C:0O+@>,C5@LZ@>,C1 O+@>,C5@HH@<XC:0O+@>,B90O+@<XC:0O+@>,C:0MT@(HC:0O+@:0C:0O+@:0C:0O+@:0C:0O+@:0C:0O+@>,B4PO+@<XC:0OT@=PC:0OT@+TC:0OF@>,C:0L6@5PC:0N,@>,C:0OT@+TC:0O+@>,C+@O+@>,C5@OF@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C1POE@<TC1PNX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1POE@<TC&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@<TC1POE@<TC1POE@<TC1PO+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0OE@<TC1POE@<TC1PNX@9 C&@NX@9 C&@NX@9 C&@NX@9 C&@NX@9 C1POE@<TC1POE@<TC:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+@>,C:0O+')
]

{ #category : #resources }
CMSimManager class >> flecheImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #flecheImage"
	
	<resource: #image>
	^Image
		extent: 21 @ 57
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5524 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5749 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4207 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5974 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 5428 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 5653 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4111 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6327 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3790 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4015 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3469 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7002 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 3693 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5685 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 4914 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4143 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6681 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5139 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7355 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4721 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 3950 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5717 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4946 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5171 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3629 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 5075)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HB@!S7I2AB@ HB@ HB@ @@@@HB@ HB@ HBA8BWX!I4$ HB@ HB@ @@@@HB@ HB@ HDAO^25PJPY2HB@ HB@ @@@@HB@ HB@ HD8%TC@LTP!<HB@ HB@ @@@@HB@ HB@ I4=LSG- IW,''HB@ HB@ @@@@HB@ HB@ W%-LSD00I )LU"@ HB@ @@@@HB@ HB@@LT1LSD1;XBT2I2@ HB@ @@@@HB@ HB@AJ$1LSD1L^BYMSBD HB@ @@@@HB@ HBM9VU%YVU%Y^6@%L"\ HB@ @@@@HB@ HG$*^7-;^7-;^7!XST0 HB@ @@@@HB@ HC]OS4=N^2X-KR47ISH@HB@ @@@@HB@ HBP!I7 +^7%8IPTJ]''-PRR@ @@@@HB@ HBA2_GXGL''$%SWYTI2]$AB@ @@@@HB@ HBA5\"$G]''$%SW-@HB@ HB@ @@@@HB@ HB@ HD1^]''%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&]''%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&K''%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&B''%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&SW%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&SW%[SW-7HB@ HB@ @@@@HB@ HB@ HD0&J%U[SW-7HB@ HB@ @@@@HB@ HB@ HD0&V5U[SW-7HB@ HB@ @@@@HB@ HB@ HD0AIUU[SW-7HB@ HB@ @@@@HB@ HB@ HD1XISE[SW-7HB@ HB@ @@@@HB@ HB@ HD05_SE[SW-7HB@ HB@ @@@@HB@ HB@ HD05U3E[SW-7HB@ HB@ @@@@HB@ HB@ HD19^@5[SW-7HB@ HB@ @@@@HB@ HB@ HD19^@5[SW-7HB@ HB@ @@@@HB@ HB@ HD19T05[SW-7HB@ HB@ @@@@HB@ HB@ HD19LD=[SW-7HB@ HB@ @@@@HB@ HB@ HD1US$=[SW-7HB@ HB@ @@@@HB@ HB@ HD1US$=[SW-7HB@ HB@ @@@@HB@ HB@ HD01S$=[SW-7HB@ HB@ @@@@HB@ HB@ HD0MJ4=[SW-7HB@ HB@ @@@@HB@ HB@ HD1OI$=[SW-7HB@ HB@ @@@@HB@ HB@ HD1OI$=[SW-7HB@ HB@ @@@@HB@ HB@ HD1OI$=[SW-7HB@ HB@ @@@@HB@ HB@ HD1OVD=[SW-7HB@ HB@ @@@@HB@ HB\''I45O^T<L^B(,HB@ HB@ @@@@HB@ HC]OS4=O^T=OS0%ZI2D$\''T @@@@HB@ HBYO^W%9^W%9^T<G^7-P_B@ @@@@HB@ HB] S4<MS4=OS2 %SWYTRR@ @@@@HB@ HBANKT=OS4=OKRX*SW,/HB@ @@@@HB@ HBA@XD=OS4<-JBUM]'')IHB@ @@@@HB@ HB@ T2!OKR4IA2)MVUH HB@ @@@@HB@ HB@ HR! JB (IT56H4$ HB@ @@@@HB@ HB@ HCL(JFANJ$4B]2@ HB@ @@@@HB@ HB@ HBD(JB!MSWX#AB@ HB@ @@@@HB@ HB@ HB@%@5E;B$0!HB@ HB@ @@@@HB@ HB@ HBAI^REP^0@ HB@ HB@ @@@@HB@ HB@ HB@ RWH\H2@ HB@ HB@ @@@@HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@')
]

{ #category : #accessing }
CMSimManager class >> newFolder [
	
	^newFolder ifNil: [newFolder := 'A new folder']
]

{ #category : #accessing }
CMSimManager class >> newFolder: aFilenmaFolder [
	
	^newFolder := aFilenmaFolder
]

{ #category : #accessing }
CMSimManager class >> newFolderName [
	"return a String for newFolder (starting at model's name"
	
	| i listComp str |
	self newFolder isString ifTrue: [^self newFolder].
	listComp := self newFolder components.
	i := listComp
		indexOf: 'Models'
		ifAbsent: [^self newFolder asString].
	str := '..'.
	(listComp
		copyFrom: i + 1
		to: listComp size) do: [:e | str := str , listComp first , e].
	^str
]

{ #category : #accessing }
CMSimManager class >> separator [
	
	^'-------'
]

{ #category : #'replay-private' }
CMSimManager class >> simNameStart [
	"Return the begining part of each simName (=> 'sim_' )  "
	
	^'sim_'
]

{ #category : #actions }
CMSimManager >> accept [
	
	self listInit selection isNil
		ifTrue: [^self inform: 'Please, select a method of #initialization']
		ifFalse: [self cormasModel activeInit: self listInit selection].
	self listControle selection isNil
		ifTrue: [^self inform: 'Please, select a method of #control']
		ifFalse: [self cormasModel activeControl: self listControle selection].
	self closeRequest.
	self setActiveProbes.
	self initScenario.
	^true
]

{ #category : #'replay-private' }
CMSimManager >> allReplayButtonsTo: bool [
	"bool = false => all replay buttons are grey and inactivate.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward  "
	
	self simButtonAt: #stepBack displayActivated: bool.
	self simButtonAt: #runBack displayActivated: bool.
	self simButtonAt: #replayRunForward displayActivated: bool.
	self simButtonAt: #replayStepForward displayActivated: bool
]

{ #category : #actions }
CMSimManager >> applyUserChangeForFinalStep: aNewFinalStep [
	"this method is call from Cormas when user have manually change the inputField current step"
	
	aNewFinalStep < 0 ifTrue: [^false].
	self finalTime = aNewFinalStep ifTrue: [^true].
	self currentTime < aNewFinalStep
		ifTrue:
			[self simButtonAt: #run displayActivated: true.
			^true]
		ifFalse:
			[self simButtonAt: #run displayActivated: false.
			^false]
]

{ #category : #actions }
CMSimManager >> applyUserChangeForStep: aNewStep [
	"this method is call from Cormas when user have manually change the inputField current step"
	
	self enableBackward ifFalse: [^false].
	aNewStep < 0 ifTrue: [^false].
	self currentTime = aNewStep ifTrue: [^true].
	aNewStep = 0
		ifTrue: [self setButtonsForTime0]
		ifFalse: [self setButtonsForTime1].
	self currentTime < aNewStep ifTrue: [^self replayStepForward: aNewStep].
	self currentTime > aNewStep
		ifTrue:
			[buttonsForwardAreOn := false.
			^self restoreOrganizationAt: aNewStep].
	^false
]

{ #category : #accessing }
CMSimManager >> buttonsForwardAreOn [
	
	^ buttonsForwardAreOn 
		ifNil: [ buttonsForwardAreOn := false ]
]

{ #category : #actions }
CMSimManager >> cancel [
	
	self closeRequest.
	^false
]

{ #category : #actions }
CMSimManager >> changedRandomSeed [
	
	| wrapper |
	wrapper := self builder componentAt: #randomSeed.
	fixRandomSeed value
		ifTrue:
			[wrapper beVisible.
			wrapper enable.	"wrapper beInvisible."
			(self builder componentAt: #releaseRandomSeed) enable]
		ifFalse:
			[wrapper disable.
			(self builder componentAt: #releaseRandomSeed) disable.
			releaseRandomSeed value: false]
]

{ #category : #'replay-forward' }
CMSimManager >> confirmDeviation [
	"check if bos file for next step exists. If not, then continue to simulate and to save into the same folder (continue the same simulation process).
	If exists, then proposes to save the sim history (from 0 to currentStep) into a new folder"
	
	| finename resp |
	(finename := self simFolder / (self stepFileNameAtStep: self currentTime + 1)) exists
		ifTrue: [ 
			self class newFolder: ((Cormas dumpPath: self cormasModel class name) / self newSimName).
			(resp := self openNewDeviationWin)
				ifTrue: [
					self simNumero: self simNumero + 1.
					self enableBackward
						ifTrue: [
							self copyPreviousBackStepsInNewFolder.
							self traceSize: self currentTime ]
						ifFalse: [ self traceSize: 0 ] ].
			^ resp]
		ifFalse: [ ^ true ]
]

{ #category : #'replay-forward' }
CMSimManager >> copyPreviousBackStepsInNewFolder [
	
	| stepFiles previousFolder |
	stepFiles := (self simFolder directories select: [ : st | st beginsWith: self stepNameStart ])
		select: [ : str | 
			(str
				copyFrom: 1 + self stepNameStart size
				to: str size) asNumber <= self currentTime ].	"change it simFolder and simName"
				
	previousFolder := self simFolder copy.
	self simFolder: self class newFolder.
	self simName: self class newFolder tail.	"copy the stepfiles to the new folder"
	stepFiles do: [ : str | 
		| files |
		(files := previousFolder filesMatching: str) isEmpty
			ifFalse: [ files first copyTo: (self simFolder / files first tail) ] ]
]

{ #category : #accessing }
CMSimManager >> cormas [
	
	^self cormasModel cormas
]

{ #category : #accessing }
CMSimManager >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
CMSimManager >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #accessing }
CMSimManager >> cormasModelClass [
	
	^self cormasModel class
]

{ #category : #time }
CMSimManager >> currentSimEnded [
	
	^ self finalTime <= self currentTime
]

{ #category : #time }
CMSimManager >> currentTime [
	
	^ self cormasModel timeStep
]

{ #category : #time }
CMSimManager >> currentTime: anInteger [
	self cormasModel timeStep: anInteger
]

{ #category : #time }
CMSimManager >> defaultFinalTime [
	^ 100
]

{ #category : #simulate }
CMSimManager >> displayRunDuration: duration [
	"display on the Transcript, the duration time of the simulation"

	| txt |
	txt := 'Simulation [' , self simName , '] was run in ' , duration printString
		, ' milliseconds'.
	duration > 1000
		ifTrue: [ | dur |
			txt := txt , ', ie. '.
			dur := Time fromSeconds: duration / 1000.
			txt := txt , dur hours printString , ' h: ' , dur minutes printString , ' m: '
				, dur seconds asFloat printString , ' s.' ].
	Transcript
		cr;
		show: txt
]

{ #category : #'replay-backward' }
CMSimManager >> enableBackward [
	self flag: #shouldBeRevised.
	"not yet implemented in cormas-pharo"
		^ false
]

{ #category : #ui }
CMSimManager >> enableBackward: bool [
	
	enableBackward := bool.
	bool
		ifFalse: [self allReplayButtonsTo: false]
		ifTrue:
			[self currentTime = 0
				ifTrue: [self allReplayButtonsTo: false]
				ifFalse: [self allReplayButtonsTo: true]]
]

{ #category : #time }
CMSimManager >> finalTime [
	^ finalTime ifNil: [ finalTime := self defaultFinalTime]
]

{ #category : #time }
CMSimManager >> finalTime: anInteger [
	finalTime := anInteger
	
]

{ #category : #time }
CMSimManager >> finishSimulation [
	self cormasModel timeStep: self finalTime
]

{ #category : #accessing }
CMSimManager >> fixedRandomSeedValue [
	^ fixedRandomSeedValue
]

{ #category : #accessing }
CMSimManager >> fixedRandomSeedValue: anObject [
	fixedRandomSeedValue := anObject
]

{ #category : #accessing }
CMSimManager >> getStepNumberOfBosFilename: aFilename [
	"Return the number from the name of the bosFile.
	Example: 'step_26.bos' => 26
	aFilename = <String>"
	
	| name |
	name := (Cormas splitString: aFilename with: $.) first.
	name := name
		copyFrom: self stepNameStart size + 1
		to: name size.
	^Cormas stringAsObjectType: name
]

{ #category : #simulate }
CMSimManager >> initRandomSeed [
	
	self isRandomSeedFixed
		ifTrue: [Cormas randomSeed: self fixedRandomSeedValue]
		ifFalse: [Cormas initRandomSeed]
]

{ #category : #init }
CMSimManager >> initScenario [
	
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.	"*** initialize the simulation ***"
	self initializeSimulation.
	self keepOrReleaseRandomSeed
]

{ #category : #init }
CMSimManager >> initScenarioWindow [
	
	| initialList aSet i |  
	self randomSeed value = 1 ifTrue: [self randomSeed: Cormas seed asValue].
	self isRandomSeedFixed onChangeSend: #changedRandomSeed to: self.	"self fixRandomSeed value: self fixRandomSeed value."
	(self enableBackward isKindOf: Boolean)
		ifTrue: [ enableBackwardValue := self enableBackward asValue ].
	(self listInit list: (self cormasModel class organization listAtCategoryNamed: #init)) isEmpty
		ifTrue: [ ^ self alertMessage: 'The model does not define any method for initialization !' ].
	(self cormasModel activeInit
		ifNotNil: [:m | self listInit list includes: m]
		ifNil: [false])
			ifTrue: [self listInit selection: self cormasModel activeInit]
			ifFalse: [ self listInit notEmpty
				ifTrue: [ self listInit selection: self listInit list first ] ].
	(self listControle list: (self cormasModel class organization listAtCategoryNamed: #control)) isEmpty
		ifTrue: [ ^ self alertMessage: 'The model does not define any method for control !'].
	(self cormasModel activeControl
		ifNotNil: [ : m | self listControle list includes: m ]
		ifNil: [ false ])
			ifTrue: [ self listControle selection: self cormasModel activeControl]
			ifFalse: [ self listControle notEmpty
				ifTrue: [ self listControle selection: self listControle list first ] ].
	initialList := OrderedCollection new.
	aSet := Set new.
	i := 0.
	self cormasModel class probes
		do: [ : p | 
			i := i + 1.
			initialList
				add: self cormasModel class name asString , '>>' , p asString.
			(self cormasModel class activeProbes includes: p) ifTrue: [aSet add: i]].
	(self cormasModel class allEntityClasses
		asSortedCollection: [ : cl1 : cl2 | cl1 name < cl2 name])
		do: [: c  | 
			(c probes isEmpty or: [ c isAbstract ])
				ifFalse: [
					initialList add: self class separator.
					i := i + 1.
					c probes do: [ : p | 
							i := i + 1.
							initialList add: c name asString , '>>' , p asString.
							(c activeProbes includes: p) ifTrue: [aSet add: i]]]].
	self listProbes list: initialList.
	self listProbes selectionIndexHolder value: aSet.
	self finalStep value: self cormasModel finalTime.
	self builder: nil
]

{ #category : #init }
CMSimManager >> initializeSimulation [
	self setSimName.
	self simFolder: nil.
	self simNumero: self simNumero + 1.
	self traceSize: 0.
	self flag: #shouldBeRevised.
	"the 2 following instructions are the responsability of the CMSpecSimulationWindow  isn't it?
	self allReplayButtonsTo: false.
	self finalTime > 0 ifTrue: [self simButtonAt: #run displayActivated: true]."
	self initRandomSeed.
	"The 2 following instructions replace the old cormas-vw instruction self cormas initiSimulation ( which was delegating the init simulation to cormas). Now it is the simManger which is in charge of initializing the simulation"
	self cormasModel activeInit isNil
		ifTrue: [ ^ self cormas alert_NoInit ].
	Cursor wait showWhile: [ self cormasModel initSimulation ].
	self flag: #shouldBeRevised
	"the  following instruction is not yet operational with cormas-pharo
	self enableBackward ifTrue: [self storeCurrentStep]"
]

{ #category : #time }
CMSimManager >> intoASimulation [
	"return if the current sim is between the time range (0 - final time) "
	
	^(self currentTime = 0 or: [self finalTime <= self currentTime]) not
]

{ #category : #accessing }
CMSimManager >> isRandomSeedFixed [
	^ isRandomSeedFixed ifNil: [ isRandomSeedFixed := false ]
]

{ #category : #accessing }
CMSimManager >> isRandomSeedFixed: aBoolean [
	 isRandomSeedFixed := aBoolean
]

{ #category : #ui }
CMSimManager >> listControle [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listControle isNil
		ifTrue: [listControle := SelectionInList new]
		ifFalse: [listControle]
]

{ #category : #ui }
CMSimManager >> listInit [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listInit isNil
		ifTrue: [listInit := SelectionInList new]
		ifFalse: [listInit]
]

{ #category : #ui }
CMSimManager >> listProbes [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listProbes isNil
		ifTrue: [listProbes := MultiSelectionInList new]
		ifFalse: [listProbes]
]

{ #category : #simulate }
CMSimManager >> loopRunStep_untilFinalTime [
	[[ self currentTime < self finalTime ] whileTrue: [ self runStepByStep ]] fork
]

{ #category : #init }
CMSimManager >> newSimName [
	"Return a new simName defined from the current clock time. 
	Ex:    self basicNew newSimName  =>   sim_2014.04.22-14.09.43"
	
	| d |
	d := DateAndTime now.
	^ self simNameStart , d year printString , '.'
		,
			(d month < 10
				ifTrue: [ '0' , d month printString ]
				ifFalse: [ d month printString]) , '.'
		,
			(d day < 10
				ifTrue: [ '0' , d day printString ]
				ifFalse: [ d day printString ]) , '-'
		,
			(d hour < 10
				ifTrue: [ '0' , d hour printString ]
				ifFalse: [ d hour printString ]) , '.'
		,
			(d minute < 10
				ifTrue: [ '0' , d minute printString ]
				ifFalse: [ d minute printString ]) , '.'
		,
			(d second < 10
				ifTrue: [ '0' , d second printString ]
				ifFalse: [ d second printString ])
]

{ #category : #ui }
CMSimManager >> openNewDeviationWin [
	
	| resp |
	(self openDialogInterface: #windowNewDeviation) ifFalse: [^false].
	resp := self deviationChoice value.
	resp = #noDeviation.
	resp = #deviationRandom ifTrue: [Cormas initRandomSeed].
	resp = #newDeviation
		ifTrue:
			[releaseRandomSeed value: true.
			^self setStepMethod].
	^true
]

{ #category : #init }
CMSimManager >> openReplayWin [
	
	| directoryContent name firstStep |
	self terminateAllProcesses.
	directoryContent := (Cormas dumpPath: self cormasModel class name)
		directoryContents asOrderedCollection.
	directoryContent
		removeAllSuchThat:
			[:txt | 
			(txt
				startingAt: 1
				couldComplete: self simNameStart) not].
	directoryContent isEmpty
		ifTrue:
			[^Dialog warn: 'The ''Dump'' folder does not contain any stored simulation'].
	name := directoryContent
		detect: [:txt | txt = self simName]
		ifNone: [directoryContent first].
	self simName: name.
	name := Dialog
		requestDirectoryName: 'Choose a ''Dump'' Directory:'
		default: ((Cormas dumpPath: self cormasModel class name) construct: name).
	name isEmpty ifTrue: [^nil].
	self simFolder: name asFilename.
	self simNumero: self simNumero + 1.
	self enableBackward: true.
	directoryContent := name asFilename directoryContents asOrderedCollection.
	directoryContent
		removeAllSuchThat:
			[:txt | 
			(txt
				startingAt: 1
				couldComplete: self stepNameStart) not].
	directoryContent isEmpty
		ifTrue:
			[^Dialog
				warn:
					'The '' ' , name , ' '' folder does not contain any stored simulation'].
	self traceSize: directoryContent size - 1.
	self traceSize > 1
		ifTrue:
			[self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true].
	firstStep := self getStepNumberOfBosFilename: directoryContent first.
	firstStep > 0
		ifTrue:
			[Dialog warn: 'The replay will starts at step ' , firstStep printString].
	self currentTime: firstStep.
	self cormas cycle value: self traceSize + firstStep.
	self cormasModel spaceModel ifNil: [self cormasModel initializeSpaceModel].
	self replayStepForward: firstStep
]

{ #category : #ui }
CMSimManager >> openScenarioBuilderWin [
	
	self terminateAllProcesses.
	self initScenarioWindow.
	self openInterface: #scenarioBuilderInterface.
	self changedRandomSeed
]

{ #category : #'undo/redo' }
CMSimManager >> redo [
	"reload the last redo BOS File from the redoList"
	
	| filename currentFile |
	self redoList size < 2 ifTrue: [ ^ self alertMessage: 'No available Redo' ].
	currentFile := self redoList last.
	self redoList removeLast.
	filename := self redoList last.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifTrue: [ self undoList add: currentFile ]
		ifFalse: [ redoList := nil ]
]

{ #category : #accessing }
CMSimManager >> redoList [
	
	^redoList ifNil: [redoList := OrderedCollection new]
]

{ #category : #accessing }
CMSimManager >> redoList: anObject [
	
	redoList := anObject
]

{ #category : #'replay-forward' }
CMSimManager >> replayRunForward [
	"Replay the stored simulation history forward using BOS file.
	Threaded process"
	
	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].	"Suspend or resume current process"
	processReplayForward isNil
		ifFalse:
			[processReplayForward suspendedContext isNil
				ifFalse:
					[processReplayForward suspendingList isNil
						ifFalse: [^processReplayForward suspend]
						ifTrue: [^processReplayForward resume]]].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Forward threaded    *********************"
	processReplayForward := ["***"
	[self currentTime < self traceSize or: [processReplayForward = nil]]
		whileTrue:
			[self replayStepForward
				ifFalse:
					[processReplayForward terminate.
					processReplayForward := nil.
					^nil]]	"***"] forkAt: Processor userBackgroundPriority.	"  *********************       END PROCESS ***        ************************"	"*********************************************************************************"	"Normaly, the instructions below are not called, because #terminate (called on process) will leave this current method"
	self finalTime = self currentTime
		ifTrue:
			[processReplayForward terminate.
			processReplayForward := nil]
]

{ #category : #'replay-forward' }
CMSimManager >> replayStepForward [
	"Replay a step forward using BOS file"
	
	^ self replayStepForward: self currentTime + 1
]

{ #category : #'replay-forward' }
CMSimManager >> replayStepForward: newStep [
	"Replay a newStep forward using BOS file"
	
	| filename resp |
	(filename := self simFolder / (self stepFileNameAtStep: newStep)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false.
			self alertMessage: 'Sorry, there is no bos file at time ' , newStep printString ,
							'
for simulation ' , self simName.
			^ false].
	undoList := nil.
	redoList := nil.
	resp := self cormasModel restoreOrganizationFromFile: filename.
	(filename := self simFolder / (self stepFileNameAtStep: newStep + 1)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false ].
	^ resp
]

{ #category : #'replay-store/restore' }
CMSimManager >> restoreOrganizationAt: aStep [
	" Restore the stored model state at aStep "
	
	| finename |
	(finename := self simFolder / (self stepFileNameAtStep: aStep)) exists
		ifFalse: [ self alertMessage: 'Sorry, there is no bos file at time ' , aStep printString ,
							'
for simulation ' , self simName.
			^ false].
	self buttonsForwardAreOn
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true.
			self simButtonAt: #run displayActivated: true.
			buttonsForwardAreOn := true ].
	^ self cormasModel restoreOrganizationFromFile: finename
]

{ #category : #'replay-backward' }
CMSimManager >> runBack [
	"Replay the story of the stored simulation backwards, using BOS file.
Threaded process"

	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse: [ processRun terminate.
			processRun := nil ].
	processReplayForward isNil
		ifFalse: [ processReplayForward terminate.
			processReplayForward := nil ].	"Suspend or resume current process"
	processReplayBackward isNil
		ifFalse: [ processReplayBackward suspendedContext isNil
				ifFalse: [ processReplayBackward suspendingList isNil
						ifFalse: [ ^ processReplayBackward suspend ]
						ifTrue: [ ^ processReplayBackward resume ] ] ].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Back threaded    *********************"
	processReplayBackward := [ "***"
	[ self currentTime <= 0 or: [ processReplayBackward isNil ] ]
		whileFalse: [ "***"
			self stepBack
				ifFalse: [ processReplayBackward terminate.
					processReplayBackward := nil.
					^ nil ] ] ] forkAt: Processor userBackgroundPriority.	"  ********************       END PROCESS ***        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self currentTime = 0
		ifTrue: [ processReplayBackward terminate.
			processReplayBackward := nil ]
]

{ #category : #simulate }
CMSimManager >> runSimulation [
	"  Loop over the STEPs until simulation end. This take place into a treaded process (called from runSimulationThreaded).
	Display the Duration time on the Transcript"

	| chrono |
	chrono := Time millisecondsToRun: [ self runSimulation_Basic ].
	"self simButtonAt: #run displayActivated: false."
	self displayRunDuration: chrono.
	processRun ifNotNil: [:p| p terminate.
	processRun := nil]
]

{ #category : #simulate }
CMSimManager >> runSimulationThreaded [
	"  Loop over the STEPs until simulation end. Threaded process.
	Method called from Cormas' runButton [>II]"
	
	Processor yield.	"Terminate the others processes"
	processReplayForward isNil
		ifFalse:
			[processReplayForward terminate.
			processReplayForward := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].	"Suspend or resume current process"
	processRun isNil
		ifFalse:
			[processRun suspendedContext isNil
				ifFalse:
					[processRun suspendingList isNil
						ifFalse:
							[self simRunButton_Pause: false.
							^processRun suspend]
						ifTrue:
							[self simRunButton_Pause: true.
							^processRun resume]]].	"Create the process"	"*******************************************************************"	"**********************     RUN  threaded    *********************"
	processRun := [self runSimulation]
		forkAt: Processor userBackgroundPriority.	"  ********************       END LOOP        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self finalTime = self currentTime
		ifTrue:
			[processRun terminate.
			processRun := nil.
			self simButtonAt: #run displayActivated: false]
]

{ #category : #simulate }
CMSimManager >> runSimulation_Basic [
	"Run one simulation step by step.
	Do not display the Duration time on the Transcript.
	Method called from #runSimulation but also from SensitivityAnalysisAbstract #runOneSimulation"

	| continue |
	continue := true.
	[ continue ]
		whileTrue: [ self currentSimEnded
				ifTrue: [ continue := false ]
				ifFalse:
					[ " *********   One Step  ***********" " *********     Done  ***********" self runStepByStep ifNil: [ continue := false ] ] ].
	self flag: #shouldBeRevised
	"what is the need of having  'continue' temporary variable here ?
	why the method is not written as siply as    [self currentSimEnded] whileFalse: [ self runStepByStep ]"
]

{ #category : #simulate }
CMSimManager >> runStepByStep [
	
	self buttonsForwardAreOn ifTrue: [buttonsForwardAreOn := false].
	undoList := nil.
	redoList := nil.
	self enableBackward
		ifTrue:
			[self confirmDeviation
				ifFalse: [^nil]
				ifTrue:
					[self cormasModel activeControl isNil
						ifTrue: [self setStepMethod ifFalse: [^nil]]]]
		ifFalse:
			[self cormasModel activeControl isNil
				ifTrue: [^self cormas alert_NoDynamic]].	"  **********   RUN Step   ********"
	self cormasModel runStep.	"  **********    Done   ********"
	self enableBackward ifTrue: [self storeCurrentStep]
]

{ #category : #actions }
CMSimManager >> setActiveProbes [
	"set the active probes (to be registered) to CormasModel class"
	
	self cormasModel class setActiveProbes: self listProbes selections
]

{ #category : #'replay-private' }
CMSimManager >> setButtonsForTime0 [
	
	self simButtonAt: #stepBack displayActivated: false.
	self simButtonAt: #runBack displayActivated: false.
	enableBackward value
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false]
]

{ #category : #'replay-private' }
CMSimManager >> setButtonsForTime1 [
	
	enableBackward value
		ifTrue:
			[self simButtonAt: #stepBack displayActivated: true.
			self simButtonAt: #runBack displayActivated: true]
]

{ #category : #'replay-private' }
CMSimManager >> setSimName [
	"set the simName attribute to the current time"
	
	self simName: self newSimName.
	^simName
]

{ #category : #'replay-forward' }
CMSimManager >> setStepMethod [
	" Answer a <Boolean> "
	| resp |
	(self enableBackward isKindOf: Boolean)
		ifTrue: [ enableBackwardValue := self enableBackward asValue ].
	self listControle list: (self cormasModel class organization listAtCategoryNamed: #control).
	self listControle isEmpty
		ifTrue: [ 
			self alertMessage: 'The model does not define any method for control !'.
			^ false].
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl]
		ifFalse: [
			self listControle notEmpty
				ifTrue: [ self listControle selection: self listControle list first ] ].
	self finalStep value: self cormasModel finalTime.
	resp := self openDialogInterface: #changeStepInterface.
	resp ifFalse: [ ^ false ].
	self listControle selection isNil
		ifTrue: [ 
			self alertMessage: 'Please, select a method of #control'.
			^ self setStepMethod]
		ifFalse: [ self cormasModel activeControl: self listControle selection ].
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.
	self keepOrReleaseRandomSeed.
	^ true
]

{ #category : #'replay-private' }
CMSimManager >> simButtonAt: buttonName displayActivated: bool [
	"bool = false => display the buttonName in grey color and inactivate it, 
			otherwise, display the button in red or green and activate it.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward 
	bool = <Bollean>

List of buttons : runBackButton stepBackButton <--  Time  --> replayStepForwardButton replayRunForwardButton stepButton runButton 
List of icons : 
		runBack_offIcon     -     runBackIcon
		stepBack_offIcon   -   stepBackIcon
		replayStepForwardIcon  - ->   replayStepForward_offIcon (= step_offIcon)
		replayRunForwardIcon   - ->  replayRunForward_offIcon (= run_offIcon)
		step_offIcon    -    stepIcon
		run_offIcon   -      runIcon
"
	
	| aLabel aButtonName |
	(#(#step #stepBack #run #runBack #replayRunForward #replayStepForward)
		includes: buttonName) ifFalse: [self halt].
	aLabel := buttonName.
	aButtonName := buttonName.
	bool ifFalse: [aLabel := aLabel , '_off'].
	aLabel := (aLabel , #Icon) asSymbol.
	aButtonName := (aButtonName , #Button) asSymbol.	"Dev todo: 'Ancienne m√©thode pour simInterface independante'.  "	"self cormas simulationWin controller notNil 
		ifTrue: 
			[self simulationWin controller closeAndUnschedule.
			self simulationWin: nil]."
	(self cormas mainBuilder componentAt: aButtonName) isNil
		ifFalse:
			[(self cormas mainBuilder componentAt: aButtonName)
				label: (Cormas perform: aLabel)]
]

{ #category : #'replay-private' }
CMSimManager >> simFolder [
	"return the appropriate Dump folder = simName"
	
	simFolder
		ifNil: [ simFolder := (Cormas dumpPath: self cormasModel class name) / self simName ].
	simFolder ensureCreateDirectory. 
	^ simFolder
]

{ #category : #'replay-private' }
CMSimManager >> simFolder: aFilename [
	"Set the simFolder = aFilename"
	
	^simFolder := aFilename
]

{ #category : #accessing }
CMSimManager >> simName [
	^ simName ifNil: [ simName := 'unnamed' ]
]

{ #category : #accessing }
CMSimManager >> simName: aName [
	
	simName := aName.
	
		self flag: #shouldBeRevised.
	"the following instruction is obsolete isn't it?
	self cormas simName value: 'Sim name: ' , simName"
]

{ #category : #'replay-private' }
CMSimManager >> simNameStart [
	" Return the begining part of each simName (=> 'sim_' )  "
	
	^ self class simNameStart 
]

{ #category : #accessing }
CMSimManager >> simNumero [
	
	^simNumero ifNil: [simNumero := 0]
]

{ #category : #accessing }
CMSimManager >> simNumero: nb [
	
	undoList := nil.
	redoList := nil.
	simNumero := nb.
	self flag: #shouldBeRevised.
	"the following instruction is obsolete isn't it?
	self cormas simNum value: 'Sim number: ' , nb printString"
]

{ #category : #ui }
CMSimManager >> simRunButton_Pause: bool [
	"bool = false => display the run button [ I> II ] 
			otherwise, display as [ II ].
	buttonName = <Symbol> =  #run 
	bool = <Bollean>
		run_offIcon   -      runIcon  "
	
	| aLabel |
	
	self flag: #shouldBeRevised.
	"bool
		ifFalse: [aLabel := #runIcon]
		ifTrue: [aLabel := #pauseIcon].
	(self cormas mainBuilder componentAt: #runButton) isNil
		ifFalse:
			[(self cormas mainBuilder componentAt: #runButton)
				label: (Cormas perform: aLabel)]"
]

{ #category : #'replay-store/restore' }
CMSimManager >> snapshotCurrentState [
	"Snapshot the current simulation state as BOS file. Time is temporary set to 0, in order to use the BOS file as initial state of further simulations"
	
	| finename currentTime text |
	finename := self 
		requestFileNameForSave: 'Save current simulation state as'
		default: ((Cormas dumpPath: self cormasModel class name) / (self stepFileNameAtStep: 0)).
	finename isEmpty ifTrue: [^nil].
	currentTime := self currentTime.
	self currentTime: 0.
	self cormasModel dumpOrganizationOnFile: finename asFilename.
	self currentTime: currentTime.
	text := ('	Dump at step ' , currentTime printString) asText.
	text := text , '\	The current simulation state has been saved as ' withCRs , (finename asText emphasizeAllWith: #italic).
	text := text
		,
			'\	To reuse it as starting point for the next simulations, write the following instruction into an #init method: \	'
				withCRs.
	text := text
		,
			(('self restoreOrganizationFromFile: ''' , finename , ''' asFilename')
				asText emphasizeAllWith: #bold).
	self alertMessage: text.
	Cormas println: text
]

{ #category : #'replay-backward' }
CMSimManager >> stepBack [
	"Replay a step backward using BOS file"
	
	self currentTime <= 0 ifTrue: [ ^ false ].
	^ self restoreOrganizationAt: self currentTime - 1
]

{ #category : #'replay-private' }
CMSimManager >> stepFileNameAtStep: aTimeStep [
	"return a string for the file, with its extension. 
	aTimeStep: <Integer>
	Example:   stepFileNameAtStep: 22 =>   'step_22.bos'   "
	
	^self stepNameStart , aTimeStep printString , self class bosExtension
]

{ #category : #'replay-private' }
CMSimManager >> stepNameStart [
	"Return the begining part of each stepFilename (=> 'step_' )  "
	"return a string for the file"
	
	^'step_'
]

{ #category : #'undo/redo' }
CMSimManager >> storeBeforeManipulation [
	"Store the whole state of the current model as BOS file into the appropriate simFolder . This is done before manipulation from the user, in order to enable the Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	| filename |
	filename := self simFolder / self stepNameStart , self currentTime printString , '_'
				, (self undoList size + 1) printString , self class bosExtension.
	self undoList addLast: filename.
	self redoList isEmpty 
		ifFalse: [ redoList := nil ].
	self cormasModel dumpOrganizationOnFile: filename
]

{ #category : #'replay-store/restore' }
CMSimManager >> storeCurrentStep [
	"store the current step into the appropriate Dump folder (store After the step execution)"
	
	| filename |
	(filename := self simFolder / (self stepFileNameAtStep: self currentTime)) exists
		ifTrue: [ 
			self simFolder: self class newFolder.
			^ self storeCurrentStep ].
	self cormasModel dumpOrganizationOnFile: filename.
	self traceSize < self currentTime 
		ifTrue: [ traceSize := self currentTime ]
]

{ #category : #init }
CMSimManager >> terminateAllProcesses [
	processReplayForward isNil
		ifFalse: [ processReplayForward terminate.
			processReplayForward := nil ].
	processReplayBackward isNil
		ifFalse: [ processReplayBackward terminate.
			processReplayBackward := nil ].
	processRun isNil
		ifTrue: [ ^ self ].
	processRun terminate.
	processRun := nil
]

{ #category : #accessing }
CMSimManager >> traceSize [
	
	^traceSize ifNil: [traceSize := 0]
]

{ #category : #accessing }
CMSimManager >> traceSize: anObject [
	
	traceSize := anObject
]

{ #category : #'undo/redo' }
CMSimManager >> undo [
	"reload the last BOS File from the undoList"
	
	| filename |
	self undoList isEmpty ifTrue: [ ^ self alertMessage: 'No available Undo' ].
	filename := self undoList last.
	self redoList isEmpty
		ifTrue:
			[self storeBeforeManipulation.
			self redoList add: self undoList last.
			self undoList removeLast].
	self undoList removeLast.
	self redoList add: filename.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifFalse: [ undoList := nil ]
]

{ #category : #accessing }
CMSimManager >> undoList [
	
	^undoList ifNil: [undoList := OrderedCollection new]
]

{ #category : #accessing }
CMSimManager >> undoList: anObject [
	
	undoList := anObject
]

{ #category : #ui }
CMSimManager >> updateCormasInterface [
	
	self cormas displaySimNumber value: self simNumero printString , '/1'
]
