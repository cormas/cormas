"
close
	super closeAndUnschedule.

	self siCongif ifNotNil:[self siConfig closeAndUnschedule]
"
Class {
	#name : #SpaceInterface,
	#superclass : #Object,
	#instVars : [
		'spaceModel',
		'menuHolder',
		'legend',
		'activeSpatialEntity',
		'basicTitle',
		'delimiterSize',
		'fillDico',
		'povMethodDico',
		'infoMethodDico',
		'trackedFigureTypes',
		'video',
		'zoomInterfaceIsStatic',
		'isTimeTitleDisplayed',
		'isTimeFieldDisplayed',
		'timeField',
		'timeUnitName',
		'manipInstancesController',
		'createInstancesController',
		'entityForManipulation',
		'siConfig',
		'configName',
		'enableUndo'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #resources }
SpaceInterface class >> changeAttributeIcon [
	
	^OpaqueImage
		figure: self changeAttributeIconImage
		shape: self changeAttributeIconMask
]

{ #category : #resources }
SpaceInterface class >> changeAttributeIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #changeAttributeIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 1 @ 2
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
				usingBits: #[0 0 0 0 0 0 0 0])
]

{ #category : #resources }
SpaceInterface class >> changeAttributeIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #changeAttributeIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 1 @ 2
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits: #[0 0 0 0 0 0 0 0])
]

{ #category : #resources }
SpaceInterface class >> createEntityIcon [
	
	^OpaqueImage
		figure: self createEntityIconImage
		shape: self createEntityIconMask
]

{ #category : #resources }
SpaceInterface class >> createEntityIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createEntityIconImage"
	
	<resource: #image>
	^Image
		extent: 20 @ 18
		depth: 1
		bitsPerPixel: 1
		palette: MonoMappedPalette whiteBlack
		usingBits:
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 240 0 0 0 144 0 0 0 144 0 0 0 144 0 0 15 159 0 0 8 1 0 0 8 1 0 0 15 159 0 0 0 144 0 0 0 144 0 0 0 144 0 0 0 240 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> createEntityIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createEntityIconMask"
	
	<resource: #image>
	^Image
		extent: 20 @ 18
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 240 0 0 15 255 0 0 15 255 0 0 15 255 0 0 15 255 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 240 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> createIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createIconImage"
	
	<resource: #image>
	^Image
		extent: 25 @ 22
		depth: 1
		bitsPerPixel: 1
		palette: MonoMappedPalette whiteBlack
		usingBits:
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 63 0 0 0 33 0 0 0 33 0 0 0 33 0 0 0 33 0 0 15 225 252 0 8 0 4 0 8 0 4 0 8 0 4 0 15 225 252 0 0 33 0 0 0 33 0 0 0 33 0 0 0 33 0 0 0 63 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> createIconImageFun [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createIconImageFun"
	
	<resource: #image>
	^Image
		extent: 32 @ 27
		depth: 9
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 1027 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5557 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1284 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6038 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1734 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6135 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6488 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6456 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1702 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7034 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2730 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7773 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8158 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8126 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3886 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 3180 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4529 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4207 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 5043 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 5428 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5203 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5075 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 1156 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5781 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5878 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6392 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6231 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1092 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1316 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7869 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7130 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7355 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2730 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 3918 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8126 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7837 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7677 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 2987 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3180 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5043 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5653 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7901 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 1573 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6327 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7901 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 6713 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2152 2152 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7163 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7387 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2473 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7677 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7837 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8126 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3083 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1638 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4497 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 738 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4561 4400)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 610 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 738 32)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5460 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 642 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1413 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5846 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6199 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7484 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8126 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4786 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 5492 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1220 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 1124 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1252 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 899 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6263 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6584 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 2312 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6938 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7387 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7998 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8062 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8191 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3726 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8062 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7934 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4497 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4625 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5010 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4561 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8094 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6070 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6167 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6360 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6970 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7291 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7869 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 3629 3051)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3854 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 449 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 674 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 5717 5557)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 5942 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 5910 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6038 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6327 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1349 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6552 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6006 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6874 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2505 2569 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 2698 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7677 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3115 3115 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 3372 2923)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7998 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4143 3437)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4272 3854)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8126 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 4272 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 4850 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3822 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 1027 256)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 931 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1220 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 835 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6906 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 2344 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6970 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7580 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8094 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8126 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3950 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3854 3340)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8126 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7901 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5203 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5267 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 642 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5942 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6103 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6392 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 6167 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7066 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7741 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7998 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8126)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8191 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 4207 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 4175 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 160 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5235 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 674 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 1027 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 931 481)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 1349 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6263 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 6360 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6392 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6424 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 6809 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7484 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7869 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8158 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 4079 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4015 4079 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4625 3918)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 4978 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 513 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 192 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5428 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 1060 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 5557 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5589 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5749 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6263 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6295 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 1316 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2152 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2376 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7002 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7098 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7227 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 5974 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 8030 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3629 3661 3147)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4625 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 770 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 995 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5749 5075)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1220 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 5781 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 6906 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7034 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7259 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 2569 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 3758 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 4561 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4561 4593 4015)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5139 5107 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 738 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 1284 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6070 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 1188 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 1734 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 6167 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 1863 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 6745 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6906 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7355 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 2923 2666)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7869 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 3404 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8126 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7966 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 2762 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3469)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 578 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 835 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1220 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 5846 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6295 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6360 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 6520 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6456 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2120 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7034 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7227 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7195 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7580 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8062 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8094 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3918 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 3533 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4721 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4818 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5974 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6263 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 5942 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6006 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6392 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1734)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 2376 1798)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2601 2023)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7355 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3051 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 3180 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3790 3629)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4400 3822)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 4304 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 4753 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 5139 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 610 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 770 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 963 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 1188 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6199 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 1863 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7548 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7837 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 3790 3661)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7869 7934 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 3983 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8030 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3019 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 4753 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 4721 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5139 4432)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4978 5043 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5203 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 803 289)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 1027 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1124 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 1316 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6038 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 5717 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 6295 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 6552 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6713 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4111 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7452 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7387 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7612 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 1381 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8094 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 4529 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 513 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 674 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 1509 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6199 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6488 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6520 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6424 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 6938 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 2409 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7323 7387 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7644 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8126 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 4047 3886)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4175 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 4111 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4850 4882 4304)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5107 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 803 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 899 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 1124 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6006 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 5878 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 1445 1060)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 6327 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1895 1895 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 2569 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2794 2826 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2923 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7420 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7966 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 3501 3083)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8094)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8126 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 7934)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 4175 3726)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8191 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 4368 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8062 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3822 3115)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 5075 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 5396 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 899 224)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6070 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 6199 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1702 1734 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 6424 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 6649 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 6649 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7195 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 6938 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 2858 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 2923 2248)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8158 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8030 7998 8158)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8126 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7901 7869 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4625 4657 4143)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8126 8094 7966)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 4529 3758)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(289 353 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7966 7998 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5332 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 1316 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6006 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 1541 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6295 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6231 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6456 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6777 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 3758 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7195 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7677 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8158 7901)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3340 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8030)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8158 8191 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4786 4753 4593)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@E\@^0@2@QDA;PC^@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@@<@C0@O@E,AT DN@T8A90FS@Q8AY@BW@@<@C0@O@@<@C0@O@@<@C0@O@\P@8PA^@Y4AY0FW@CL@Z0B]@@<A] @O@M<AU ED@NT@7@A#@CD@LPE]@^PA& @O@@<@C0@O@@<@C0@O@@<AL0A*@Y\A(@A^@NH@C0FR@WT@+ CQ@V(@ @FE@Q4AH@E\@@LAG@F*@I<A*@BT@C(@% @O@@<@C0@O@@<@C0C2@A @\ @O@JT@C0D%@P<@3@B&@S,@)@D<@U<AOPB:@N4@[PGR@Y<A"@CB@TL@A B9@UPA8P@O@@<@80F%@ALAZ0DO@@<AX F1@@<@C0@O@@<@3 @/@JX@^@G)@] @I@F&@T0ASPAO@B(@2 F,@SH@(0C[@QH@6 @O@OLAKP@K@B<@S @O@@<AIPF1@RT@:@@O@D4@^ B&@\<A-@DG@](A5 @U@A,A[@A)@[,@;@A3@N8AJ0BS@Z$@C0@Z@S@@KPF2@JX@3 @O@JT@C0C(@K0@C0@O@L8@"PD!@ZDAAP@^@Z,AF DK@H @[@FQ@^T@>@GF@V<@,PAY@@<@T@BX@\,@# D@@H4@C0@O@JT@3P@O@@<@C0CN@H$@A0C*@PDA@0B(@Q\@;0C1@K@@,@E1@O$@ PDA@[<@@P@O@[@AK0F.@FT@# CN@@<@)P@O@@<@C0F1@VHA2PC!@Z\A0@@D@@ @OP@L@M\A( D)@E(AU0DF@Y8@RPC:@@<@C0C+@GP@CPGK@H8@3 @O@JT@)PC)@N$@)PF1@N @K C?@G\@" AL@N@AT0B6@WHAJ B3@^ @QPF:@\\@( E_@@<@*PA5@NXA2 BN@XH@3 @O@\4@:PC)@N$@C0@O@@<@3 AQ@^$@^P@)@LX@_0G(@T<AO AH@SP@H A!@^XAX@@O@Y,@?@D$@G @D@GN@L8@C0C)@N$@:PB=@@<@C0@O@@<@DPA%@VDAH D9@K\@\@A0@\H@? A_@DDA+PGP@@<@C0DS@@$@_@@1@FT@) G*@N @:PC)@H<@/P@O@@<@Y@B<@JX@# @Q@UD@LPD&@RH@C @1@CDA4PD_@G4@C0@O@@<AQP@B@GTA:0A%@JXA%@@O@N$@/PB=@N$@:PC)@@<@C0B''@CP@M@F3@VLA90AQ@YTAD@A"@AP@Y @5@@<@C0@O@B0A[PGA@VTA-PA%@GX@# B&@JX@) CN@EHA% BM@JX@# G''@FT@LPE!@AX@LPE!@Q@@%P@ @@<@C0@O@@<@C0B*@TH@APD5@CXA 0F/@T@@30FP@U8A&@GH@]L@*0F@@J0AP@E@@VX@9@DJ@S(A2@E7@Y0@C0@O@JX@C0@O@@<@) DU@X$AK@BG@D,@20B8@SX@-PDI@S\A80B @P0@R@D8@W,A$PD7@X8@8@AE@A<A- DX@@<@# A=@JXAZ@@O@]P@* A;@KHA70AB@OP@HPD.@OTAB@A1@L$@9@BG@X(@\PG @C\@>0G]@I$A7 C0@F\@*0@O@@<@C0@O@A\@C0FD@H8@Q B!@TLA"0F=@X0A[ C5@TXALPE[@HP@H0EG@L\A\0E8@TX@1PCU@A$AH0CX@FT@C0@O@@<@3 F7@@<@N@BN@FT@I0D''@T,A.@@9@K8A5P@\@C4A60F>@OXA]@DT@LLAQ EH@U,@/0E)@W$AI FU@@<@C0@O@A\@0@@O@JX@X BP@^$@W@G\@I8@20C1@ZL@N0BQ@J4A.PCR@F A1PEA@T,A#0A?@I(@5 EP@FTA;@BN@JX@)0@W@N$@C0E>@H8@YPA @Q$@5@BB@\LAU0A]@ZPA#P@]@UT@O@@@@]\@&0@$@BT@J@D(@U(@Q0AS@VL@) B&@J\@Y C)@@<@) B&@H8@''@CY@BP@7PBF@[0AJ EI@]\@C A%@H8@4@@>@O(@$ EX@]$A&PFF@F8A_@BN@C<@_ CN@FX@:P@O@L8@) BN@@8AVP@$@ETAY AJ@PP@+0G)@FT@# C''@JX@LPD9@@(@1@AX@H,@-@FG@ML@O0CN@BX@:PC)@N$@C0CN@JXA,0@1@ZXAE G"@VXACPA/@DLA_PAD@JX@0PCN@YL@LPEJ@O\A_0EQ@EP@U C=@JX@3 @W@N$@ 0BC')
]

{ #category : #resources }
SpaceInterface class >> createIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createIconMask"
	
	<resource: #image>
	^Image
		extent: 25 @ 22
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 15 255 252 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> createIconMaskFun [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createIconMaskFun"
	
	<resource: #image>
	^Image
		extent: 32 @ 27
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 3 240 0 0 15 248 3 254 191 248 7 255 255 252 15 255 255 254 127 255 255 255 127 255 255 255 127 255 255 255 127 255 255 255 127 255 255 254 127 255 255 255 127 255 255 255 127 255 255 254 127 255 255 252 127 255 255 252 127 255 255 240 127 255 255 228 127 255 255 239 127 255 255 225 127 255 255 227 127 255 255 227 127 255 255 255 127 255 255 255 127 255 255 255 127 255 255 255 127 255 255 255]
]

{ #category : #resources }
SpaceInterface class >> iconColumn [
	"UIMaskEditor new openOnClass: self andSelector: #iconColonne"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 10 @ 30
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0])
]

{ #category : #resources }
SpaceInterface class >> iconHexagon [
	
	^OpaqueImage
		figure: self iconHexagonImage
		shape: self iconHexagonMask
]

{ #category : #resources }
SpaceInterface class >> iconHexagonImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconHexagon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 22 @ 22
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 3276 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 168 0 0 170 160 0 0 170 161 85 84 170 160 0 0 170 161 85 85 42 160 0 0 170 133 85 85 42 160 0 0 170 133 85 85 74 160 0 0 170 21 85 85 74 160 0 0 170 21 85 85 82 160 0 0 168 85 85 85 82 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 82 160 0 0 170 21 85 85 82 160 0 0 170 21 85 85 74 160 0 0 170 133 85 85 74 160 0 0 170 133 85 85 42 160 0 0 170 161 85 85 42 160 0 0 170 161 85 84 170 160 0 0 170 168 0 0 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0])
]

{ #category : #resources }
SpaceInterface class >> iconHexagonMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconHexagonMask"
	
	<resource: #image>
	^Image
		extent: 22 @ 22
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 0 0 0 0 0 0 0 1 255 0 0 3 255 0 0 3 255 128 0 7 255 128 0 7 255 192 0 15 255 192 0 15 255 224 0 31 255 224 0 31 255 240 0 31 255 224 0 15 255 224 0 15 255 192 0 7 255 192 0 7 255 128 0 3 255 128 0 3 255 0 0 1 255 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> iconIrregular [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconIrregular"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 20
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 3276 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 128 0 0 170 170 170 170 170 128 0 0 170 128 42 128 42 128 0 0 170 21 72 21 74 128 0 0 168 85 81 85 74 128 0 0 161 85 85 85 82 128 0 0 161 85 85 85 82 128 0 0 161 85 85 85 82 128 0 0 168 85 85 85 82 128 0 0 170 21 85 85 74 128 0 0 170 21 85 85 42 128 0 0 170 133 85 85 42 128 0 0 170 161 85 84 170 128 0 0 170 161 85 82 170 128 0 0 170 168 85 74 170 128 0 0 170 170 21 42 170 128 0 0 170 170 133 42 170 128 0 0 170 170 132 170 170 128 0 0 170 170 162 170 170 128 0 0 170 170 170 170 170 128 0 0])
]

{ #category : #resources }
SpaceInterface class >> iconLine [
	"UIMaskEditor new openOnClass: self andSelector: #iconneLigne"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 31 @ 10
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[0 0 2 36 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 0 0 2 36])
]

{ #category : #resources }
SpaceInterface class >> iconNormal [
	
	^Cursor normal asOpaqueImage
]

{ #category : #resources }
SpaceInterface class >> iconPhoto [
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
]

{ #category : #resources }
SpaceInterface class >> iconSquare [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #iconSquare"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 22 @ 22
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 3276 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:t1 | 
									(t1 at: 1) value
										perform: (t1 at: 2)
										withArguments: (t1 at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0 168 0 0 0 0 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 85 85 85 84 160 0 0 168 0 0 0 0 160 0 0 170 170 170 170 170 160 0 0 170 170 170 170 170 160 0 0])
]

{ #category : #resources }
SpaceInterface class >> iconWrite [
	
	^Cursor caret asOpaqueImage
]

{ #category : #resources }
SpaceInterface class >> inspectIcon [
	
	^OpaqueImage
		figure: self inspectIconImage
		shape: self inspectIconMask
]

{ #category : #resources }
SpaceInterface class >> inspectIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #selectionIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 239 254 0 0 231 254 0 0 235 254 0 0 237 254 0 0 238 254 0 0 239 126 0 0 239 190 0 0 239 222 0 0 239 14 0 0 237 126 0 0 233 190 0 0 230 190 0 0 238 222 0 0 255 94 0 0 255 62 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
SpaceInterface class >> inspectIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #selectionIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 16 0 0 0 24 0 0 0 28 0 0 0 30 0 0 0 31 0 0 0 31 128 0 0 31 192 0 0 31 224 0 0 31 240 0 0 31 128 0 0 31 192 0 0 25 192 0 0 17 224 0 0 0 224 0 0 0 192 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
SpaceInterface class >> manipulateIcon [
	
	^OpaqueImage
		figure: self manipulateIconImage
		shape: self manipulateIconMask
]

{ #category : #resources }
SpaceInterface class >> manipulateIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #handIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[254 127 0 0 229 143 0 0 217 183 0 0 217 181 0 0 237 178 0 0 237 182 0 0 151 246 0 0 103 254 0 0 119 253 0 0 191 253 0 0 223 253 0 0 239 251 0 0 239 251 0 0 247 247 0 0 251 247 0 0 248 7 0 0])
]

{ #category : #resources }
SpaceInterface class >> manipulateIconImage2 [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #manipulateIconImage"
	
	<resource: #image>
	^Image
		extent: 25 @ 22
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			#[170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 42 170 170 128 0 170 170 168 74 170 170 128 0 170 170 168 74 170 170 128 0 170 170 161 82 170 170 128 0 170 170 161 82 170 170 128 0 170 170 133 84 170 170 128 0 170 170 133 85 42 170 128 0 170 170 21 85 42 170 128 0 170 170 21 85 74 170 128 0 170 168 85 85 74 170 128 0 170 168 85 85 82 170 128 0 170 161 85 85 84 170 128 0 170 161 85 85 84 170 128 0 170 133 85 85 85 42 128 0 170 133 85 85 85 42 128 0 170 0 0 0 0 10 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0]
]

{ #category : #resources }
SpaceInterface class >> manipulateIconImageOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #manipulateIconImage"
	
	<resource: #image>
	^Image
		extent: 16 @ 16
		depth: 1
		bitsPerPixel: 1
		palette: MonoMappedPalette whiteBlack
		usingBits:
			#[6 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 5 128 0 0 53 96 0 0 45 88 0 0 36 84 0 0 20 20 0 0 16 4 0 0 8 4 0 0 8 4 0 0 8 8 0 0 4 8 0 0 4 16 0 0 7 240 0 0]
]

{ #category : #resources }
SpaceInterface class >> manipulateIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #handIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[1 128 0 0 27 240 0 0 63 248 0 0 63 250 0 0 31 255 0 0 31 255 0 0 111 255 0 0 255 255 0 0 255 254 0 0 127 254 0 0 63 254 0 0 31 252 0 0 31 252 0 0 15 248 0 0 7 248 0 0 7 248 0 0])
]

{ #category : #resources }
SpaceInterface class >> manipulateIconMaskOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fingerPointerMask"
	
	<resource: #image>
	^Image
		extent: 16 @ 16
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[6 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 128 0 0 55 224 0 0 63 248 0 0 63 252 0 0 31 252 0 0 31 252 0 0 15 252 0 0 15 252 0 0 15 248 0 0 7 248 0 0 7 240 0 0 7 240 0 0]
]

{ #category : #resources }
SpaceInterface class >> menuBar [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Environment' 
		#nameKey: #environment 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'New' 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileNew) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Grid size' 
				#nameKey: #gridsize 
				#value: #openWindowGridSize 
				#helpText: 'Create a new regular grid')) #(1) nil)) #(MenuItem 
			#rawLabel: 'Load' 
			#nameKey: #load 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Regular Tesselation' 
				#nameKey: #spatialGridType 
				#labelImage: #(ResourceRetriever SpaceInterface #iconSquare) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'asc type' 
					#nameKey: #loadASC 
					#value: #loadASC) #(MenuItem 
					#rawLabel: 'env type' 
					#nameKey: #loadGrid 
					#value: #loadGrid)) #(2) nil)) #(MenuItem 
				#rawLabel: 'Irregular Tesselation' 
				#nameKey: #irregularSpatialGrid 
				#value: #subMenuTesselationIrr 
				#labelImage: #(ResourceRetriever SpaceInterface #iconIrregular) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'MIF/MID Files' 
					#nameKey: #openWindowMifMid 
					#value: #openWindowMifMid)) #(1) nil))) #(2) nil)) #(MenuItem 
			#rawLabel: 'Save' 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Asc type' 
				#nameKey: #saveASC 
				#value: #saveASC) #(MenuItem 
				#rawLabel: 'Env type' 
				#nameKey: #saveGrid 
				#value: #saveGrid) #(MenuItem 
				#rawLabel: 'MIF/MID type' 
				#nameKey: #saveMIFMID 
				#value: #saveMIFMID) #(MenuItem 
				#rawLabel: 'Rst/Rdc type' 
				#nameKey: #saveRSTRDC 
				#value: #saveRSTRDC)) #(4) nil)) #(MenuItem 
			#rawLabel: 'Modify' 
			#nameKey: #modify 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Cell shape' 
				#nameKey: #cellshape 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Square' 
					#nameKey: #square 
					#value: #squared 
					#indication: true 
					#labelImage: #(ResourceRetriever SpaceInterface #iconSquare) 
					#submenu: #(Menu #(#(MenuItem 
						#rawLabel: '4-Connexe' 
						#nameKey: #fourconnexe 
						#value: #fourconnexe 
						#indication: true) #(MenuItem 
						#rawLabel: #(UserMessage 
							#key: #eightconnexe 
							#defaultString: '8-Connexe') 
						#nameKey: #eightconnexe 
						#value: #eightconnexe 
						#indication: false)) #(2) nil)) #(MenuItem 
					#rawLabel: 'Hexagonal' 
					#nameKey: #hexagonal 
					#value: #hexagonal 
					#indication: false 
					#labelImage: #(ResourceRetriever SpaceInterface #iconHexagon)) #(MenuItem 
					#rawLabel: 'Irregular' 
					#nameKey: #irregular 
					#value: #notYiet 
					#indication: false 
					#labelImage: #(ResourceRetriever SpaceInterface #iconIrregular))) #(3) nil)) #(MenuItem 
				#rawLabel: 'Grid boundaries' 
				#nameKey: #gridboundaries 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Torroidal' 
					#nameKey: #torroidal 
					#value: #torroidal) #(MenuItem 
					#rawLabel: 'Closed' 
					#nameKey: #closed 
					#value: #closed)) #(2) nil))) #(2) nil)) #(MenuItem 
			#rawLabel: 'Re-Open' 
			#value: #reopen) #(MenuItem 
			#rawLabel: 'Close' 
			#value: #closeRequest 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #abort))) #(3 2 1) nil)) #(MenuItem 
		#rawLabel: 'PoV' 
		#nameKey: #pov 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'bidon' 
			#nameKey: #bidon)) #(1) nil) 
		#helpText: 'Point of View') #(MenuItem 
		#rawLabel: 'Display' 
		#nameKey: #display 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'info' 
			#nameKey: #info 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'bidon' 
				#nameKey: #bidon)) #(1) nil)) #(MenuItem 
			#rawLabel: 'track' 
			#nameKey: #trackAgents 
			#indication: false) #(MenuItem 
			#rawLabel: 'Spatial delimitor' 
			#nameKey: #celldelimitation 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #size 
					#defaultString: 'Size:') 
				#nameKey: #sizeLimitation 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: '0 pixel' 
					#nameKey: #pixel0 
					#value: #pixel0 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '1 pixel' 
					#nameKey: #pixel1 
					#value: #pixel1 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '2 pixels' 
					#nameKey: #pixel2 
					#value: #pixel2 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '3 pixels' 
					#nameKey: #pixel3 
					#value: #pixel3 
					#indication: true 
					#indicationSelector: #delimiterSize)) #(4) nil) 
				#helpText: 'Set the size of the cells'' delimitors') #(MenuItem 
				#rawLabel: 'Color' 
				#value: #selectColor 
				#helpText: 'Set the color of the cells'' delimitors')) #(2) nil)) #(MenuItem 
			#rawLabel: 'Time' 
			#nameKey: #time 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #displayTimeTitle 
					#defaultString: 'Display time in the title') 
				#nameKey: #timeTitle 
				#value: #displayTimeTitle 
				#indication: true) #(MenuItem 
				#rawLabel: 'Display time on the interface' 
				#nameKey: #timeField 
				#value: #displayTimeField 
				#indication: true)) #(2) nil) 
			#helpText: 'Display the current time step') #(MenuItem 
			#rawLabel: 'BackGround' 
			#value: #setBackGround 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Change background color' 
				#value: #setBackGroundColor)) #(1) nil))) #(2 3) nil)) #(MenuItem 
		#rawLabel: 'Tools' 
		#nameKey: #tools 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Display legends' 
			#nameKey: #activateLegend 
			#value: #activateLegend) #(MenuItem 
			#rawLabel: 'Photo' 
			#nameKey: #photo 
			#value: #photo) #(MenuItem 
			#rawLabel: 'Video' 
			#nameKey: #video 
			#value: #video) #(MenuItem 
			#rawLabel: 'Manipulate instances' 
			#value: #openManipInstances) #(MenuItem 
			#rawLabel: 'Create instances' 
			#value: #openCreateInstances) #(MenuItem 
			#rawLabel: 'Click to...' 
			#nameKey: #clicTo 
			#value: #clicTo 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Change attribute...' 
				#nameKey: #clicToChange 
				#value: #clicToChange) #(MenuItem 
				#rawLabel: 'Inspect' 
				#value: #clicToInspect)) #(2) nil)) #(MenuItem 
			#rawLabel: 'Habitus' 
			#value: #openSIconfig)) #(7) nil)) #(MenuItem 
		#rawLabel: 'Option' 
		#nameKey: #option 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Unmoveable zoom' 
			#nameKey: #unmoveableZoom 
			#value: #unmoveableZoom 
			#indication: true 
			#helpText: 'The zoom you will open will be static') #(MenuItem 
			#rawLabel: 'Moveable zoom' 
			#nameKey: #moveableZoom 
			#value: #moveableZoom 
			#indication: false 
			#helpText: 'The zoom you will open will be moveable') #(MenuItem 
			#rawLabel: 'Set track length' 
			#nameKey: #setTrackLength 
			#value: #setTrackLength) #(MenuItem 
			#rawLabel: 'Enable Undo/Redo' 
			#nameKey: #enableUndoOption 
			#value: #enableUndoOption 
			#indication: true 
			#helpText: 'Display or hide the Undo/Redo buttons') #(MenuItem 
			#rawLabel: 'Touchpad manipulate mode' 
			#nameKey: #isManipulateForTabletEnabled 
			#value: #toggleManipulateForTablet 
			#indication: false 
			#helpText: 'Clicking for manipulation adapated to touchpad')) #(2 2 1) nil)) #(MenuItem 
		#rawLabel: '?' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #aboutThisModel 
				#defaultString: 'About this model') 
			#value: #aboutThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #help)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #inspectModel 
				#defaultString: 'inspect model') 
			#value: #inspectModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #debugIt))) #(2) nil))) #(6) nil)
		decodeAsLiteralArray
]

{ #category : #resources }
SpaceInterface class >> modifyFigureIcon [
	
	^OpaqueImage
		figure: self modifyFigureIconImage
		shape: self modifyFigureIconMask
]

{ #category : #resources }
SpaceInterface class >> modifyFigureIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #modifyFigureIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 19
				depth: 8
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3533 3533 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 224 224)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5942 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3918 5332 5332)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3051 4111 4111)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4047 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4946 5814 5814)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 2023 2023)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2923 3019 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3758 3597 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 5589 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3147 3244 3244)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4657 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 8094 8094)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6167 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5492 6874 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2794 2762 2762)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6809 6713 6713)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 256 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 321 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3918 3693 3693)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 5043 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2890 4047 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2955 4015 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1124 1124 1124)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2666 3501 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 4978 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6199 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1349 1349)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5235 5203 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5171 6231 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4753 4786 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4497 4914 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1252 1573 1573)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7837 7837)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1863 1863)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6295 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 481 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(417 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3790 3629 3629)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4914 5717 5717)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4143 3950 3950)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1670 2376 2376)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 6520 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3790 3469 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6456 8094 8094)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6263 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4015 3854 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4946 4882 4882)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 5075 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6295 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 4143 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4111 4111)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8126 8094 8094)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4432 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4529 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5653 5524 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5589 5557 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6617 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6295 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2505 2473 2473)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3790 3822 3822)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 2120 2120)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(642 931 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4914 5749 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(578 803 803)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7323 7195 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6327 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1060 1060 1060)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1670 2248 2248)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3051 4207 4207)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4272 4593 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 4015 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3693 3565 3565)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4657 5235 5235)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5043 5043 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3019 3244 3244)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2441 2376 2376)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4978 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5075 5203 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3404 3726 3726)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3533 4657 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 6424 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 192 192)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1445 1734 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5910 5910)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(449 578 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4272 4625 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4978 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7355 7355)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4721 5396 5396)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6745 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4015 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 2023 2023)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4368 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4753 4721 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3276 3308 3308)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2762 2762)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1863 1863)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7130 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3758 3404 3404)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4175 4175)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1734 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 7034 7034)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4625 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7355 7355)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5557 5492 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4432 4400 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4689 5267 5267)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3533 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6456 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@B0,R&%''_"P:U#=,Q18<KC<?KP@\ZP@@@@@@@EH7DA(J 7<"_U11BP=BY"\?HP@@D4X.]VPLG6M+M ,/^#H[I X4EU@!W@@@O2)8QQ-;@!<5BF DR1H8@#EDE @@@@@@O5$''T4<B@ H8S4UES2$BDXYTOTEAPTD@HRDNV&T)@ HBG2$)JR$)!!$>O3<?O3<@WT]=!XP8@!DBTU<XN2T@U%X?O3<?O3<@Q7=?NV48@!DBPQ\GU6<@@C<?O3<?O3<@Q61,NV48@!DBUT@*JFH@O0@?O3<?O3<@@T]VL8P8@!DB GI,L@D@O3<@O3<?O3<@V6A3]BL)@!DLZ%!"X%0@O3<?@C<?O3<@O3<TJ4TQ^3DMXHICP2D@O3<?O0@?O3<@O3=9RF96S@TJ S<?O3<@O3<?O3<@O3<@PU4SSQ4#XP*AO3<?O3<@O3<?O3<?@C<@H@@@@@AIX$8?O3<?O3<@O3<?O0@@@@@@_$(,X@A^[C<?O3<?O3<@O3<@O0@?O3<@_$(?K@A"O3<?O3<?O3<@O0@@O3<@O3<@I0@C\@A\O3<?O3<?O3<@@C<?@C<@O3<@B"\''I79AO3<?O3<?O3<@O3<?@C<?@C<@'))
]

{ #category : #resources }
SpaceInterface class >> modifyFigureIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #modifyFigureIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 19
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0])
]

{ #category : #resources }
SpaceInterface class >> moveIcon [
	
	^OpaqueImage
		figure: self moveIconImage
		shape: self moveIconMask
]

{ #category : #resources }
SpaceInterface class >> moveIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #handIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[254 127 0 0 229 143 0 0 217 183 0 0 217 181 0 0 237 178 0 0 237 182 0 0 151 246 0 0 103 254 0 0 119 253 0 0 191 253 0 0 223 253 0 0 239 251 0 0 239 251 0 0 247 247 0 0 251 247 0 0 248 7 0 0])
]

{ #category : #resources }
SpaceInterface class >> moveIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #handIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[1 128 0 0 27 240 0 0 63 248 0 0 63 250 0 0 31 255 0 0 31 255 0 0 111 255 0 0 255 255 0 0 255 254 0 0 127 254 0 0 63 254 0 0 31 252 0 0 31 252 0 0 15 248 0 0 7 248 0 0 7 248 0 0])
]

{ #category : #'parcel load/unload/save' }
SpaceInterface class >> obsolete [
	
	[Tool reinitialize]
		on: Error
		do: [:ex | ex return: nil].
	super obsolete
]

{ #category : #'instance creation' }
SpaceInterface class >> openAndDisplay: aSpaceModel [
	
	| interface |
	interface := self new.
	interface spaceModel: aSpaceModel.
	interface open.
	interface displayGrid.
	^interface
]

{ #category : #'parcel load/unload/save' }
SpaceInterface class >> postLoadActionFor: aParcel [
	
	Tool reinitialize
]

{ #category : #resources }
SpaceInterface class >> redoIcon [
	
	^OpaqueImage
		figure: self redoImage
		shape: self redoMask
]

{ #category : #resources }
SpaceInterface class >> redoImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #redoImage"
	
	<resource: #image>
	^Image
		extent: 14 @ 18
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 5300 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 5075 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 4593 5910)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7163 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 3790 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 5364 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 3693 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 6713 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 4175 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 3822 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1606 5524 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 5203 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 5492 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 5653 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 5460 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 5846 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4111 5428 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 5075 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 5428 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 5203 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 5974 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 5428 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 5300 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 6392 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7998 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 3854 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 4689 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1766 3565 4978)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 4464 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 6295 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 4240 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 3918 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 5878 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 5814 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 5781 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 4657 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 4529 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4818 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 3597 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 5685 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7548 7709)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 3758 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2120 3983 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 5364 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7420 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 4079 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 4786 6231)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 4336 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 6424 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 5139 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 3308 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 4946 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 6488 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 6424 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2569 5460 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6360 6777 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 6392 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 4304 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 6327 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 3565 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 4561 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 3533 5428)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1959 3918 5300)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 6488 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 5364 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 4015 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 4657 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 5235 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7163 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 4368 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 4657 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 6841 7837)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 6231 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 5589 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 5910 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 5010 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7002 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 4818 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 6327 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 6167 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 6038 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 5557 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 5460 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 3983 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 5942 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 6617 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2698 5685 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 5043 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 3983 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 5332 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 4753 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 3790 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 3854 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7098 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4818 5621 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 4882 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 6777 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 3629 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 6874 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4336 5589 6360)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 4400 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 6103 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 5589 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4786 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 4111 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 4464 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 5524 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 3372 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 3822 5267)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUUT@@EUUUUUUUUUUX%UUUUUU@@AUUUUUUUUUUR]YUUUUUP@@UUUUUUUUUUU$WTYUUUT@@ET6Q2<EC4,1E4(PKUUU@@@C\A1HB5)SGS%@A00XUP@@@V1BF!DSD"EMUD07ZUT@@A8YK&!-T@@"HATV@"1U@@@*W0P_LFMACV9*W&YUUP@@B@Y/BV4=H3QVV5IUUUT@@BT&L6ANMTPPB 9UUUUU@@@TYS8:UUUUY4MUUUUUUP@@JC0)@UUUUU!!UUUUUUT@@ET+WF-UUUUUUUUUUUUU@@AUKU\?UUUUUUUUUUUUUP@@UUT8F4=UUUUUUUUUUUT@@EUUUUD;UUUUUUUUUUUU@@AUUUUUUUUUUUUUUUUUUP@@')
]

{ #category : #resources }
SpaceInterface class >> redoMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #redoMask"
	
	<resource: #image>
	^Image
		extent: 14 @ 18
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 0 128 0 0 0 192 0 0 0 224 0 0 127 240 0 0 255 248 0 0 255 248 0 0 255 248 0 0 255 240 0 0 255 224 0 0 255 192 0 0 241 128 0 0 241 128 0 0 112 0 0 0 112 0 0 0 56 0 0 0 24 0 0 0 0 0 0 0]
]

{ #category : #resources }
SpaceInterface class >> removeEntityIcon [
	
	^OpaqueImage
		figure: self removeEntityIconImage
		shape: self removeEntityIconMask
]

{ #category : #resources }
SpaceInterface class >> removeEntityIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 96 0 0 37 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 112 0 0 53 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0])
]

{ #category : #resources }
SpaceInterface class >> removeEntityIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0 255 255 255 0])
]

{ #category : #resources }
SpaceInterface class >> temp [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #temp"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7484 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[85 85 85 84 85 85 85 84 85 69 85 84 85 65 85 84 85 72 85 84 85 74 21 84 85 74 133 84 85 74 161 84 85 74 168 84 85 74 170 20 85 74 160 4 85 74 33 84 85 72 40 84 85 65 72 84 85 69 74 20 85 85 82 20 85 85 80 84 85 85 85 84])
]

{ #category : #resources }
SpaceInterface class >> undoIcon [
	
	^OpaqueImage
		figure: self undoImage
		shape: self undoMask
]

{ #category : #resources }
SpaceInterface class >> undoImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #undoImage"
	
	<resource: #image>
	^Image
		extent: 14 @ 17
		depth: 7
		bitsPerPixel: 8
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3565 5364 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7998 7966 7998)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3790 5139 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 4721 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 5717 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 3790 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 3886 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 3950 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 6327 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 4978 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 4336 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 7066 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2344 5267 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 5781 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 4593 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 4143 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 6809 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4047 5524 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 5524 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 5396 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 5460 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 5781 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3597 6424 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 5107 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 6327 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 5781 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 7098 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 4561 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 5107 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 5043 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 7098 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 6970 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 5557 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 6135 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 5717 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 5910 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 6552 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 4400 6103)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 6584 6970)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 4753 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 5075 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 3308 5139)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 3886 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 5300 6938)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 3854 5653)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 4882 6456)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7163 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 3693 5043)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 3790 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 3661 5524)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 5878 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4818 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2376 4079 5364)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 4432 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 5589 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 3533 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 4079 5396)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5364 6038 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 5107 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 5524 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(578 3437 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2248 4786 6263)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 5460 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1349 4047 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 3918 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5878 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 3950 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1927 4721 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 6456 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 6360 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 3822 5814)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6392 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4175 6809 7869)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 4657 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(546 3886 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 4593 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 3469 5203)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3340 4786 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5428 6103 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 5557 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 5653 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 5942 7387)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 5267 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 4015 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 4529 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 6038 6681)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 4497 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2537 5460 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 5043 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 4882 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 5942 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3693 4850 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 4914 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 7677 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 6745 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 6906 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 5524 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 5557 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 6777 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2762 5043 6199)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 4721 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 4689 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(867 5460 7034)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 4047 5621)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3918 6231 7291)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@PDA@PDZ@PDA@PDA@PD@@@DA@PDPW@DA@PDA@PDA@@@A@PDA@ADA@PDA@PDA@P@@@PDAX$ >@PDA@PDA@PD@@@DANV($E! #VC5WG0DA@@@AXAI_QP !EP0CF3Q^@P@@@VYQD05[S5L:P3=TS D@@@EAV","L&!]USU)PA\A@@@A@Q1#EE@;BRTGLB03@P@@@PE!I3X(RT,NR#0EVPD@@@DA@VP-YR8&@ X)LQ$A@@@A@PDAHF\A@PDJM41 @P@@@PDA@PDD@PDAGTX8@PD@@@DA@PDA@PDA@T5BU DA@@@A@PDA@PDA@PD*C0DA@P@@@PDA@PDA@PDKK18A@PD@@@DA@PDA@PDAQD\A@PDA@@@b')
]

{ #category : #resources }
SpaceInterface class >> undoMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #undoMask"
	
	<resource: #image>
	^Image
		extent: 14 @ 17
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[4 0 0 0 12 0 0 0 12 0 0 0 28 0 0 0 63 240 0 0 127 248 0 0 127 248 0 0 127 248 0 0 63 248 0 0 63 248 0 0 31 248 0 0 12 120 0 0 4 120 0 0 0 112 0 0 0 112 0 0 0 224 0 0 0 192 0 0]
]

{ #category : #'interface specs' }
SpaceInterface class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #space 
				#defaultString: 'space') 
			#min: #(Point 10 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 531 1062 874) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(InputFieldSpec 
				#layout: #(LayoutFrame 0 0.333333 4 0 0 0.666666 26 0) 
				#name: #configName 
				#flags: 0 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#model: #configName 
				#tabable: false 
				#isReadOnly: true 
				#type: #text) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -142 1.0 3 0 24 22) 
				#name: #undoButton 
				#model: #undo 
				#tabable: false 
				#helpText: 'Cancel the last manipulation from user' 
				#label: #undoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -117 1.0 3 0 24 22) 
				#name: #redoButton 
				#model: #redo 
				#tabable: false 
				#helpText: 'Redo the last undo from user' 
				#label: #redoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutSizedOrigin 40 0 1 0 48 21) 
					#name: #timeUnitName 
					#flags: 0 
					#isOpaque: true 
					#model: #timeUnitName 
					#isReadOnly: true) #(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 41 0 22 0) 
					#name: #timeField 
					#model: #timeField 
					#isReadOnly: true 
					#type: #number 
					#formatString: '0')) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutSizedOrigin -90 1.0 3 0 88 22) 
					#name: #Composite1)))))
]

{ #category : #resources }
SpaceInterface class >> zoomIcon [
	
	^OpaqueImage
		figure: self zoomIconImage
		shape: self zoomIconMask
]

{ #category : #resources }
SpaceInterface class >> zoomIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #zoom"
	
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
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 6617 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 2120 2120)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'L3L3L3L3L3L3L0@@L3L3L3L3L3L3L0@@L3L3L3L3L3L3L0@@L3L3L@@CL3L3L0@@L3L0@RI@@3L3L0@@L3LAH"H"PCL3L0@@L3LBH2H"HCL3L0@@L3@RL3H"I@L3L0@@L3@"H2H"H L3L0@@L3@"H"H"H L3L0@@L3ABH"H"HPL3L0@@L3LBH"H"HCL3L0@@L3LDH"H"DCL3L0@@L3L0ABHPAUL3L0@@L3L3L@@CLDT3L0@@L3L3L3L3L0QSL0@@L3L3L3L3L3AEL0@@L3L3L3L3L3LDT0@@L3L3L3L3L3L0@0@@L3L3L3L3L3L3L0@@'))
]

{ #category : #resources }
SpaceInterface class >> zoomIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #zoomIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 1 224 0 0 7 248 0 0 15 252 0 0 15 252 0 0 31 254 0 0 31 254 0 0 31 254 0 0 31 254 0 0 15 252 0 0 15 252 0 0 7 254 0 0 1 231 0 0 0 3 128 0 0 1 192 0 0 0 224 0 0 0 96 0 0 0 0 0])
]

{ #category : #'menu - actions' }
SpaceInterface >> aboutThisModel [
	
	self spaceModel ifNil: [^nil].
	self spaceModel cormas aboutThisModel
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateCreateEntityTool [
	"Activate the CREATE ENTITY tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'CreateEntity Tool'
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateInspectTool [
	"Activate the INSPECT tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'Inspect Tool'
]

{ #category : #'menu - actions' }
SpaceInterface >> activateLegend [
	
	((self menuHolder value atNameKey: #tools) submenu atNameKey:
			#activateLegend) isOn
		ifTrue:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOff.
			self legend legendes
				do:
					[:leg | leg builder window isOpen ifTrue: [leg builder window unmap]]]
		ifFalse:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOn.
			self legend legendes
				do:
					[:leg | 
					(leg isOpened and: [leg builder window isOpen])
						ifFalse:
							[leg builder window openIn: leg builder window displayBox.
							leg isOpened: true]
						ifTrue: [leg builder window map]]]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateManipulateTool [
	"Activate the MANIPULATE  tool button in the toolbar (hand tool)"
	
	self activateToolNamed: 'Manipulate Tool'
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateToolNamed: aString [
	"Activate the tool button in the toolbar which name = aString. (Desactivate the other buttons). Example: aString: 'Inspect Tool' or 'CreateEntity Tool'  "
	
	| anIndex |
	1
		to: buttons list size
		do:
			[:i | 
			| each |
			each := buttons list at: i.
			each value
				ifNotNil:
					[each value initialState name = aString ifTrue: [anIndex := i]]].
	buttons selectionIndex: anIndex
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateToolNumber: anInteger [
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	buttons selectionIndex: anInteger
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateZoomTool [
	"Activate the ZOOM tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'Zoom Tool'
]

{ #category : #accessing }
SpaceInterface >> activeSpatialEntity [
	
	activeSpatialEntity isNil
		ifTrue: [activeSpatialEntity := self spaceModel cellClass].
	^activeSpatialEntity
]

{ #category : #accessing }
SpaceInterface >> activeSpatialEntity: aSpatialEntityClass [
	
	activeSpatialEntity := aSpatialEntityClass
]

{ #category : #menus }
SpaceInterface >> adaptMenuForNewShape [
	"adapt the menu"
	
	| menu |
	menu := self menuCellshape.
	spaceModel gridCellShape = #hexagonal
		ifTrue:
			[(menu atNameKey: #fourconnexe) beOff.
			(menu atNameKey: #eightconnexe) beOff.
			(menu atNameKey: #square) beOff.
			(menu atNameKey: #hexagonal) beOn]
		ifFalse:
			[(menu atNameKey: #square) beOn.
			(menu atNameKey: #hexagonal) beOff.
			spaceModel nbNeighbours = #four
				ifTrue:
					[(menu atNameKey: #fourconnexe) beOn.
					(menu atNameKey: #eightconnexe) beOff]
				ifFalse:
					[(menu atNameKey: #fourconnexe) beOff.
					(menu atNameKey: #eightconnexe) beOn]]
]

{ #category : #'menu-info' }
SpaceInterface >> addSubMenuInfoTo: aMenuBuilder from: aListOfClasses [
	"Add a Submenu with: info, track. 
a selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| infoList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			infoList := self siConfig
				ifNil: [aClass availableInfo]
				ifNotNil: [self siConfig infoMethodsForSIMenu: aClass].
			infoList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changeInfo: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]
]

{ #category : #'menu-pov' }
SpaceInterface >> addSubMenuTo: aMenuBuilder from: aListOfClasses [
	"Add a Sub-Menu to a given menu (aMenuBuilder) for the classes.
A  selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| povList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			povList := self siConfig
				ifNil: [aClass availablePov]
				ifNotNil: [self siConfig povMethodsForSIMenu: aClass].
			povList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changePov: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]
]

{ #category : #'user message' }
SpaceInterface >> asynchronousDo: aBlock [
	"execute asynchronously aBlock (usefull for remote work"
	
	^aBlock promise
]

{ #category : #accessing }
SpaceInterface >> basicTitle [
	
	basicTitle ifNil: [self setBasicTitle].
	^basicTitle
]

{ #category : #accessing }
SpaceInterface >> basicTitle: anObject [
	
	basicTitle := anObject
]

{ #category : #menus }
SpaceInterface >> boundariesChanged [
	"gere le menu Forme des cellules "

	| menuCloture |
	self updateWindowName.
	menuCloture := self menuGridboundaries.
	spaceModel closed
		ifTrue: [ "cellules fermees"
			(menuCloture atNameKey: #torroidal) beOff.
			(menuCloture atNameKey: #closed) beOn ]
		ifFalse: [ "cellules toroidales"
			(menuCloture atNameKey: #torroidal) beOn.
			(menuCloture atNameKey: #closed) beOff ]
]

{ #category : #changed }
SpaceInterface >> changeInfo: aSymbol ofEntity: aClass [
	"Called from the user, when an Info has to be displayed"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"on memorise les #infos"
			self infoMethodDico
				at: cl name
				put: aSymbol.
			self drawing changeInfo: aSymbol ofEntity: cl].	"il faut regler aussi le petit onglet du menu"
	self checkInfoMenu.	"change the window title"
	self updateWindowName
]

{ #category : #changed }
SpaceInterface >> changePov: selectorName ofEntity: aClass [
	"Called from the user, when he changes aPoV"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"self changeInfo: #nil ofEntity: cl. on supprime les info sur les figures"
			"apparement c''est pas n√©cessaire"
			self povMethodDico
				at: cl name
				put: selectorName.	"on memorise les pov"
			self fillDico
				at: cl name
				put: selectorName ~= #nil.
			self legend isOpen
				ifTrue:
					[self legend
						majLegendes:
							(Array
								with: cl
								with: selectorName asString)]].	"on supprime les pov des autres classes spatiales"
	aClass isSpatialClass
		ifTrue:
			[| classes |
			classes := self spatialClasses copy.	"SpatialEntity allSubclasses"
			classes remove: aClass.
			classes
				do:
					[:cl | 
					(cl isElementary and: [selectorName = #delimitors])
						ifFalse:
							[(self povMethodDico at: cl name) = #delimitors
								ifFalse:
									[self povMethodDico
										at: cl name
										put: #nil].
							self fillDico
								at: cl name
								put: false]]].	"il faut regler aussi le petit onglet du menu"
	self checkPovMenu.	"*** finally, change the POV !"
	aClass withAllSubclasses
		do: [:cl | self drawing changePov: selectorName ofEntity: cl].	"change the window title"
	self updateWindowName	"Pas besoin d''un refreshViewDisplay car le updateWindowName force le r√©affichage"
]

{ #category : #'menu-info' }
SpaceInterface >> checkInfoMenu [
	
	self setCheckInfo: self menuInfo
]

{ #category : #'menu-pov' }
SpaceInterface >> checkPovMenu [
	
	self setCheck: self menuPov	"self setCheck: ((self builder bindings at: #menuBar) menuItemAt: 4) submenu."
]

{ #category : #'user message' }
SpaceInterface >> choose: messageString labels: labels values: values default: defaultValue [
	
	^Dialog
		choose: messageString
		labels: labels
		values: values
		default: defaultValue
		for: self mainWindow
]

{ #category : #'user message' }
SpaceInterface >> choose: messageString labels: labels values: values default: defaultValue then: aBlock [
	"request the user to choose from a list of options then evaluate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	| answer |
	answer := Dialog choose: messageString labels: labels values: values
		default: defaultValue.
	aBlock value: answer
]

{ #category : #'manipulate instances' }
SpaceInterface >> chooseEntityForManipulation [
	
	| list eValues choice choicesList |
	list := OrderedCollection new.
	self siConfig
		ifNil:
			[list add: self activeSpatialEntity name.
			((self drawing components collect: [:c | c entityType]) asSet
				select: [:e | e ~= self activeSpatialEntity])
				do: [:e | list add: e name]]
		ifNotNil:
			[((self drawing components collect: [:c | c entityType]) asSet
				select: [:e | self siConfig manipEntitiesList list includes: e])
				do: [:e | list add: e name]].
	list isEmpty ifTrue: [^self entityForManipulation: nil].
	list size = 1
		ifTrue: [^self entityForManipulation: list asOrderedCollection first].
	choicesList := OrderedCollection new.
	choicesList add: 'Any kind'.
	choicesList add: '-------'.
	choicesList addAll: list.
	eValues := choicesList copy asOrderedCollection.
	eValues removeFirst.
	eValues addFirst: #any.
	choice := Dialog choose: 'Select an entity' fromList: choicesList values:
			eValues lines: 8 cancel: nil.
	choice = '-------' ifTrue: [choice := nil].
	self entityForManipulation: choice
]

{ #category : #accessing }
SpaceInterface >> classFromSymbol: aSymbol [
	self deprecated: 'Use class method on Symbol instead of classFromSymbol:'.
	^ aSymbol class
]

{ #category : #'menu - actions' }
SpaceInterface >> clicToChange [
	
	self activeSpatialEntity notNil
		ifTrue:
			[self drawing clicToChange.
			self activateInspectTool.
			Cursor caret beCursor]
]

{ #category : #'menu - actions' }
SpaceInterface >> clicToInspect [
	
	self drawing activeAttribute: nil.
	Cursor normal beCursor
]

{ #category : #'menu - actions' }
SpaceInterface >> closed [
	spaceModel closed
		ifFalse: [ spaceModel closed: true.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged ]
]

{ #category : #aspects }
SpaceInterface >> configName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^configName isNil
		ifTrue: [configName := Text new asValue]
		ifFalse: [configName]
]

{ #category : #'user message' }
SpaceInterface >> confirm: aMessage [
	"display a message for this window"
	
	^Dialog
		confirm: aMessage
		for: self mainWindow
]

{ #category : #'user message' }
SpaceInterface >> confirm: aMessage then: aBlock [
	"display a message for this window"
	
	[(Dialog
		confirm: aMessage
		for: self mainWindow) ifTrue: [aBlock value]] promise
]

{ #category : #initialisation }
SpaceInterface >> copyPovFrom: parentInterface [
	
	self spaceModel: parentInterface spaceModel.
	self activeSpatialEntity: parentInterface activeSpatialEntity.
	delimiterSize := parentInterface delimiterSize copy.
	fillDico := parentInterface fillDico copy.
	povMethodDico := parentInterface povMethodDico copy.
	infoMethodDico := parentInterface infoMethodDico copy.
	isTimeTitleDisplayed := parentInterface isTimeTitleDisplayed.
	isTimeFieldDisplayed := parentInterface isTimeFieldDisplayed
]

{ #category : #accessing }
SpaceInterface >> cormas [
	
	^self spaceModel cormas
]

{ #category : #accessing }
SpaceInterface >> cormasModel [
	
	^self spaceModel cormasModel
]

{ #category : #accessing }
SpaceInterface >> cormasModelClass [
	
	^self spaceModel cormasModelClass
]

{ #category : #'manipulate instances' }
SpaceInterface >> createEntitiesOn: aFigure [
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self storeBeforeManipulation.
			self createInstancesController
				createInstancesOnCell: aFigure model entity]
]

{ #category : #accessing }
SpaceInterface >> createInstancesController [
	
	^createInstancesController
]

{ #category : #accessing }
SpaceInterface >> createInstancesController: anObject [
	
	anObject ifNil: [self activateInspectTool].
	createInstancesController := anObject
]

{ #category : #'manipulate instances' }
SpaceInterface >> createStartArcEntityOn: aFigure [
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self storeBeforeManipulation.
			self createInstancesController
				createStartArcEntityOn: aFigure model entity]
]

{ #category : #'manipulate instances' }
SpaceInterface >> createStopArcEntityOn: aFigure [
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self createInstancesController createStopArcEntityOn: aFigure model entity]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> currentTool [
	"get the HotDraw Tool of the grid"
	
	^self view controller currentTool
]

{ #category : #delimiteur }
SpaceInterface >> delimiterSize [
	
	^delimiterSize isNil
		ifTrue: [delimiterSize := #pixel1 asValue]
		ifFalse: [delimiterSize]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> disableAllTools [
	"desable all the tool buttons in the toolbar"
	
	1
		to: buttons list size
		do:
			[:i | (buttons list at: i) value ifNotNil: [self disableToolNumber: i]]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> disableToolNumber: anInteger [
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	| previous |
	previous := buttons selectionIndex.
	buttons selectionIndex: anInteger.
	buttons selection disable.
	buttons selectionIndex: previous
]

{ #category : #display }
SpaceInterface >> displayAllPovs [
	"Called when a new instance of SpaceInterface is opened from a parent interface"
	
	| aClass |
	self displayGrid.	"self displayAllOccupants."
	self povMethodDico
		keysAndValuesDo:
			[:aKeyClass :selectorName | 
			aClass := aKeyClass class.
			(aClass isAbstract or: [selectorName = #nil])
				ifFalse: [self drawing changePov: selectorName ofEntity: aClass]]
]

{ #category : #display }
SpaceInterface >> displayArc: anOccupantReference on: parameter [
	
	| aSelector startCellReference stopCellReference aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	startCellReference := parameter key.
	stopCellReference := parameter value.
	newPov entityReference: anOccupantReference.
	self drawing addFigureForArcPov: newPov start: startCellReference end:
			stopCellReference
]

{ #category : #display }
SpaceInterface >> displayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef [
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| aClass selectorName infoName |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	infoName := self infoMethodDicoAt: aClass.
	self drawing loadFigureCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef povSelector: selectorName andInfo: infoName
]

{ #category : #display }
SpaceInterface >> displayCompoundSpatialEntityClass: aClass [
	"Called when 
	- the grid size has been modified 
	- a new instance of SpaceInterface is opened
	- the compoundSpatialEntities of aClass are created"
	
	| selectorName |
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing loadFiguresFrom: aClass povSelector: selectorName
]

{ #category : #display }
SpaceInterface >> displayGrid [
	"Resize the window firstly, to fit to the spaceModel, then display the grid with the default pov of the elementary spatialEntities.
	Called when 
	- a new instance of SpaceInterface is opened, or
	- the model is reinitialized"
	
	| povSelector |
	self resizeWindow.	"self drawing
		addFiguresForSpatialPovs: self spaceModel elementaryEntitiesDefaultPovs.  en fait ce n'est plus n√©cessaire car changePov s'en charge"	"refresh POV if necessary"
	povSelector := self povMethodDico
		at: self activeSpatialEntity name
		ifAbsent: [#nil].
	povSelector = #nil
		ifFalse:
			[self
				changePov: povSelector
				ofEntity: self activeSpatialEntity]
]

{ #category : #display }
SpaceInterface >> displayOccupant: anOccupantReference on: aESEreference [
	
	| aSelector aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	newPov entityReference: anOccupantReference.
	self drawing addFigureForOccupantPov: newPov on: aESEreference
]

{ #category : #'drawing description' }
SpaceInterface >> displayTimeField [
	"the simulation time is displayed in the field"
	
	| timeStep timeFieldMenu |
	timeFieldMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeField.
	self isTimeFieldDisplayed: self isTimeFieldDisplayed not.
	self isTimeFieldDisplayed
		ifTrue:
			[(self builder componentAt: #timeUnitName) beVisible.
			(self builder componentAt: #timeField) beVisible.
			timeStep := spaceModel cormasModel timeStep.
			self timeField value: timeStep.
			timeFieldMenu beOn]
		ifFalse:
			[(self builder componentAt: #timeUnitName) beInvisible.
			(self builder componentAt: #timeField) beInvisible.
			timeFieldMenu beOff]
]

{ #category : #'drawing description' }
SpaceInterface >> displayTimeTitle [
	"the simulation time is displayed in the title of the window"
	
	| timeStep timeTitleMenu |
	timeTitleMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeTitle.
	self isTimeTitleDisplayed: self isTimeTitleDisplayed not.
	self isTimeTitleDisplayed
		ifTrue:
			[timeStep := spaceModel cormasModel timeStepWithUnit.
			self builder window label: self basicTitle , '  Time: ' , timeStep.
			timeTitleMenu beOn]
		ifFalse:
			[self builder window label: self basicTitle.
			timeTitleMenu beOff]
]

{ #category : #'drawing description' }
SpaceInterface >> drawingClass [
	"What type of drawing should we create?"
	
	^SpaceView
]

{ #category : #'menu - actions' }
SpaceInterface >> eightconnexe [
	
	self spaceModel eightconnexe
]

{ #category : #'tool hotDraw' }
SpaceInterface >> enableAllTools [
	
	1
		to: buttons list size
		do:
			[:i | (buttons list at: i) value ifNotNil: [self enableToolNumber: i]]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> enableToolNumber: anInteger [
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	| previous |
	previous := buttons selectionIndex.
	buttons selectionIndex: anInteger.
	buttons selection enable.
	buttons selectionIndex: previous
]

{ #category : #accessing }
SpaceInterface >> enableUndo [
	
	^enableUndo ifNil: [enableUndo := true]
]

{ #category : #accessing }
SpaceInterface >> enableUndo: anObject [
	
	enableUndo := anObject
]

{ #category : #'undo/redo' }
SpaceInterface >> enableUndoOption [
	"Enable (desable) redo, and display (hide) the Redo/Undo buttons"
	
	self enableUndo: self enableUndo not.
	self enableUndo
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOn.
			(self builder componentAt: #undoButton)
				beVisible;
				enable.
			(self builder componentAt: #redoButton)
				beVisible;
				enable]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOff.
			(self builder componentAt: #undoButton) beInvisible.
			(self builder componentAt: #redoButton) beInvisible]
]

{ #category : #accessing }
SpaceInterface >> entityForManipulation [
	
	^entityForManipulation
]

{ #category : #accessing }
SpaceInterface >> entityForManipulation: anObject [
	
	entityForManipulation := anObject
]

{ #category : #accessing }
SpaceInterface >> fillDico [
	"a Dictionary containing #Class name -> true or false"
	
	^fillDico ifNil: [fillDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> fillDico: anObject [
	
	fillDico := anObject
]

{ #category : #'menu-pov' }
SpaceInterface >> fillDicoAt: aClass [
	
	^self fillDico
		at: aClass name
		ifAbsentPut: [true]
]

{ #category : #'menu - actions' }
SpaceInterface >> fourconnexe [
	
	self spaceModel fourconnexe
]

{ #category : #'menu - actions' }
SpaceInterface >> hexagonal [
	
	self spaceModel hexagonal
]

{ #category : #accessing }
SpaceInterface >> infoMethodDico [
	"a Dictionary containing #Class name -> #infoSelector"
	
	^infoMethodDico ifNil: [infoMethodDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> infoMethodDico: anObject [
	
	infoMethodDico := anObject
]

{ #category : #'menu-info' }
SpaceInterface >> infoMethodDicoAt: aClass [
	
	^self infoMethodDico
		at: aClass name
		ifAbsentPut: [#nil]
]

{ #category : #initialisation }
SpaceInterface >> initLegend [
	
	self legend: Legend new init.
	self legend mainInterface: self
]

{ #category : #menus }
SpaceInterface >> initMenuAttributs [
	"Set the sub menu 'clicToChange for the attributes of a Cell"
	
	| menuAttributs menuDyn lesAttributs activeClass |
	lesAttributs := List new.
	activeClass := self activeSpatialEntity.	"activeClass := self model cormasModel class environment at: model activeSpatialEntity."
	lesAttributs := activeClass allInstVarNames.
	(activeClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [lesAttributs removeAll: CMSpatialEntityElement allInstVarNames].
	(activeClass inheritsFrom: CMSpatialEntitySet)
		ifTrue: [lesAttributs removeAll: CMSpatialEntitySet allInstVarNames].
	menuDyn := ((self menuHolder value atNameKey: #tools) submenu atNameKey:
			#clicTo) submenu atNameKey: #clicToChange.
	menuAttributs := Menu new.
	1
		to: lesAttributs size
		do:
			[:i | 
			| attribut |
			attribut := lesAttributs at: i.
			menuAttributs
				addItemLabel: attribut
				value:
					[self drawing activeAttribute: attribut.
					self clicToChange]].
	menuDyn submenu: menuAttributs
]

{ #category : #'menu-info' }
SpaceInterface >> initMenuDelimitor [
	"Set the delimitor menu of the Grid.
a selection of one of this item calls the method displayEntity: aClass pov: aSymbol"
	"set the sub menu 'trackAgents'"
	
	| menuDelimitor menuDyn spatialClasses |
	spatialClasses := List new.
	spatialClasses := self spatialClassesForMenu: #delimitor.
	menuDyn := self menuHolder value atNameKey: #celldelimitation.
	menuDelimitor := Menu new.
	1
		to: spatialClasses size
		do:
			[:i | 
			| aClass |
			aClass := spatialClasses at: i.
			menuDelimitor
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuDelimitor
]

{ #category : #'menu-info' }
SpaceInterface >> initMenuInfo [
	"Set the 'Display' info and Track menu of the Grid.
a selection of one of this item calls the method displayEntity: aClass pov: aSymbol"
	
	| aMenuBuilder menuUpdated oldItems |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self spatialClassesForMenu: #info) asList.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self socialClassesForMenu: #info) asList.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self passiveClassesForMenu: #info) asList.
	menuUpdated := self setCheckInfo: aMenuBuilder menu.
	oldItems := self menuInfo menuItems.	"oldItems do: [:item | (self menuHolder value atNameKey: #pov ) submenuHolder removeItem: item]."
	oldItems do: [:item | self menuInfo removeItem: item].	"	(self menuHolder value atNameKey: #pov) submenuHolder addPart: menuUpdated."
	self menuInfo addPart: menuUpdated
]

{ #category : #'menu-pov' }
SpaceInterface >> initMenuPov [
	"Set the PoV menu of the spatial grid. a selection of one of this item calls the method #displayEntity: aClass pov: aSymbol"
	
	| aMenuBuilder menuUpdated oldItems |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuTo: aMenuBuilder
		from: (self spatialClassesForMenu: #pov) asList.
	self
		addSubMenuTo: aMenuBuilder
		from: (self socialClassesForMenu: #pov) asList.
	self
		addSubMenuTo: aMenuBuilder
		from: (self passiveClassesForMenu: #pov) asList.
	menuUpdated := self setCheck: aMenuBuilder menu.
	oldItems := self menuPov menuItems.	"oldItems do: [:item | (self menuHolder value atNameKey: #pov ) submenuHolder removeItem: item]."
	oldItems do: [:item | self menuPov removeItem: item].	"	(self menuHolder value atNameKey: #pov) submenuHolder addPart: menuUpdated."
	self menuPov addPart: menuUpdated
]

{ #category : #menus }
SpaceInterface >> initMenuTopologie [
	
	self adaptMenuForNewShape.
	self boundariesChanged
]

{ #category : #'menu-track' }
SpaceInterface >> initMenuTrack [
	"set the sub menu 'trackAgents'"
	
	| menuAgents menuDyn agentClasses |
	agentClasses := List new.
	agentClasses := self socialClassesForMenu: #track.
	menuDyn := self menuHolder value atNameKey: #trackAgents.
	menuAgents := Menu new.
	1
		to: agentClasses size
		do:
			[:i | 
			| aClass |
			aClass := agentClasses at: i.
			menuAgents
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuAgents
]

{ #category : #'menu - actions' }
SpaceInterface >> inspectModel [
	
	^Cormas isModelUserMode
		ifTrue:
			[Dialog warn:
					'Sorry, this feature is not available in a model user environment']
		ifFalse: [self cormasModel inspect]
]

{ #category : #testing }
SpaceInterface >> isForHabitus: aString [
	"true if the receiver has a SIConfig with name aString"
	
	^self siConfig
		ifNil: [false]
		ifNotNil: [:si | si configName value = aString]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> isManipulateForTabletEnabled [
	
	^((self menuHolder value atNameKey: #option) submenu atNameKey:
			#isManipulateForTabletEnabled) isOn
]

{ #category : #'tool hotDraw' }
SpaceInterface >> isManipulateForTabletEnabled: aBoolean [
	
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOff]
]

{ #category : #accessing }
SpaceInterface >> isTimeFieldDisplayed [
	
	^isTimeFieldDisplayed ifNil: [isTimeFieldDisplayed := true]
]

{ #category : #accessing }
SpaceInterface >> isTimeFieldDisplayed: anObject [
	
	isTimeFieldDisplayed := anObject
]

{ #category : #accessing }
SpaceInterface >> isTimeTitleDisplayed [
	
	^isTimeTitleDisplayed ifNil: [isTimeTitleDisplayed := true]
]

{ #category : #accessing }
SpaceInterface >> isTimeTitleDisplayed: anObject [
	
	isTimeTitleDisplayed := anObject
]

{ #category : #accessing }
SpaceInterface >> legend [
	
	^legend
		ifNil:
			[self initLegend.
			legend]
]

{ #category : #accessing }
SpaceInterface >> legend: anObject [
	
	legend := anObject
]

{ #category : #changed }
SpaceInterface >> listMethodsChanged [
	"some methods has changed. Rebuild the menu (added while removing the spaceInterfaces from cormas)"
	
	self spaceModel ifNotNil: [self initMenuPov]
]

{ #category : #'menu - actions' }
SpaceInterface >> loadASC [
	
	| parametersWindow |
	parametersWindow := MenuSpaceInterfaces new openDialog: #windowASC with:
			self.
	parametersWindow initASCParametres: self cormasModelClass
]

{ #category : #'menu - actions' }
SpaceInterface >> loadGrid [
	
	| aName |
	aName := Dialog
		choose: (UserMessage defaultString: '' key: #load) asString
		fromList:
			((Cormas mapsPath: spaceModel cormasModelClass name) asFilename
				directoryContents select: [:fn | '*.env' match: fn])
		values:
			((Cormas mapsPath: spaceModel cormasModelClass name) asFilename
				directoryContents select: [:fn | '*.env' match: fn])
		lines: 8
		cancel: [^nil].
	aName isEmpty
		ifTrue: [^nil]
		ifFalse:
			[aName := (Cormas mapsPath: spaceModel cormasModelClass name) construct:
					aName].
	self spaceModel loadEnvironmentFromFile: aName.
	self initMenuTopologie.
	self updateWindowName
]

{ #category : #'SI config' }
SpaceInterface >> loadSilentltySIConfigName: aSymbol [
	
	self siConfig
		ifNil:
			[self siConfig: (SpaceInterfaceConfig newFor: self withConfig: aSymbol)].
	self siConfig applyCurrentSettings.
	self siConfig forceSItoApplyConfigTrackAgents.
	self siConfig siMenuFormat value ~= #siMenuFull
		ifTrue: [self siConfig reopenSI]
]

{ #category : #'grid recorder' }
SpaceInterface >> makeMovie [
	"Create a movie from all *.jpg files setting in aMovFile directory.
aMovFile = <Filename>"
	
	| allJpegFiles anImage stream directory baseName |
	video ifNil: [^self].
	directory := video directory.
	baseName := (Cormas removeExtensionOf: video) tail.
	allJpegFiles := (directory filenamesMatching: baseName , '*.jpg')
		asSortedCollection: [:fn1 :fn2 | fn1 tail < fn2 tail].
	(JunImagesToMovie
		filename: video
		extent: self spatialGridArea extent)
		do:
			[:imagesToMovie | 
			allJpegFiles
				do:
					[:filename | 
					stream := JunJpegImageStream on: filename readStream.
					[Cursor read showWhile: [anImage := stream nextImage]]
						ensure: [stream close].
					imagesToMovie add: anImage milliseconds: 500]].
	self video: nil
]

{ #category : #accessing }
SpaceInterface >> manipInstancesController [
	
	^manipInstancesController
]

{ #category : #accessing }
SpaceInterface >> manipInstancesController: anObject [
	
	manipInstancesController := anObject
]

{ #category : #'menus-access' }
SpaceInterface >> menuBar [
	
	| menu siMenuFormat submenu labelsKept |
	siMenuFormat := self siConfig ifNotNil: [:sic | sic siMenuFormat value].
	(siMenuFormat isNil or: [siMenuFormat = #siMenuFull])
		ifTrue: [^self class menuBar]
		ifFalse:
			[menu := self class menuBar.
			labelsKept := OrderedCollection new.
			siMenuFormat ~= #siMenuNone
				ifTrue:
					[labelsKept
						add: 'PoV';
						add: 'Display'].
			(#(#siMenuLimitedWithHabitus #siMenuLimited2WithHabitus) includes:
					siMenuFormat) ifTrue: [labelsKept add: 'Tools'].
			menu labels
				do:
					[:lab | 
					(labelsKept includes: lab)
						ifFalse: [menu hideItem: (menu menuItemLabeled: lab)]
						ifTrue:
							[submenu := (menu menuItemLabeled: lab) submenu.
							(submenu labels includes: 'Habitus')
								ifTrue:
									[submenu labels
										do:
											[:slab | 
											slab ~= 'Habitus'
												ifTrue: [submenu hideItem: (submenu menuItemLabeled: slab)]]].
							(submenu labels includes: 'Spatial delimitor')
								ifTrue:
									[submenu hideItem: (submenu menuItemLabeled: 'Spatial delimitor').
									submenu hideItem: (submenu menuItemLabeled: 'Time').
									submenu hideItem: (submenu menuItemLabeled: 'BackGround').
									(#(#siMenuLimited2 #siMenuLimited2WithHabitus) includes:
											siMenuFormat)
										ifTrue: [submenu hideItem: (submenu menuItemLabeled: 'track')]]]].
			^menu]
]

{ #category : #'menus-access' }
SpaceInterface >> menuCellshape [
	
	| menuModify |
	menuModify := self menuModify.
	^(menuModify atNameKey: #cellshape) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuGridboundaries [
	
	| menuModify |
	menuModify := self menuModify.
	^(menuModify atNameKey: #gridboundaries) submenu
]

{ #category : #accessing }
SpaceInterface >> menuHolder [
	
	^menuHolder
]

{ #category : #'menus-access' }
SpaceInterface >> menuInfo [
	"return a Menu : #info menu"
	
	^(self menuHolder value atNameKey: #info) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuModify [
	
	| menuFile |
	menuFile := (self menuHolder value atNameKey: #environment) submenu.
	^(menuFile atNameKey: #modify) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuPov [
	"return a Menu : #pov menu"
	
	^(self menuHolder value atNameKey: #pov) submenu
]

{ #category : #display }
SpaceInterface >> moveArcStart: aArcRef to: aCellRef [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStart: aArcRef to: aCellRef
]

{ #category : #display }
SpaceInterface >> moveArcStop: aArcRef to: stopCellReference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStop: aArcRef to: stopCellReference
]

{ #category : #display }
SpaceInterface >> moveOccupant: anOccupantReference on: aESEreference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveOccupant: anOccupantReference on: aESEreference
]

{ #category : #'menu - actions' }
SpaceInterface >> moveableZoom [
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: false.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOff.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOn
]

{ #category : #menus }
SpaceInterface >> notYiet [
	
	^self cormas warn: 'Sorry, not yet ready'
]

{ #category : #updating }
SpaceInterface >> noticeChange: aChange [
	"Debug =>"
	"Cormas print: aChange symbol , ' - '."
	
	aChange dispatchOn: self
]

{ #category : #updating }
SpaceInterface >> noticeEntityChange: anEntityChange [
	
	| changeType anEntityReference parameter |
	changeType := anEntityChange symbol.
	anEntityReference := anEntityChange entity.
	parameter := anEntityChange parameter.
	changeType = #valueChanged
		ifTrue:
			[^parameter
				ifNil: [self updateEntity: anEntityReference]
				ifNotNil: [:p | self updateEntity: anEntityReference onPatch: p]].
	changeType = #movingOccupant
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #newOccupant
		ifTrue: [^self displayOccupant: anEntityReference on: parameter].
	changeType = #removeEntity ifTrue: [^self removeEntity: anEntityReference].
	changeType = #leavingOccupant
		ifTrue: [^self removeOccupant: anEntityReference].
	changeType = #newArc
		ifTrue: [^self displayArc: anEntityReference on: parameter].
	changeType = #movingArc
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #addAggregate
		ifTrue:
			[^self displayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #compositionChanged
		ifTrue:
			[^self redisplayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #newStartPosition
		ifTrue: [^self moveArcStart: anEntityReference to: parameter].
	changeType = #newStopPosition
		ifTrue: [^self moveArcStop: anEntityReference to: parameter].
	changeType = #povSymbolChanged
		ifTrue: [^self updateEntity: anEntityReference ifPovNameIs: parameter].
	changeType = #flash
		ifTrue:
			[^self drawing flashColor: parameter entityReference: anEntityReference]
]

{ #category : #'interface closing' }
SpaceInterface >> noticeOfWindowClose: aWindow [
	"The ApplicationWindow aWindow is in the process of closing. 
	You have been notified."
	
	self changed: #windowClosed
]

{ #category : #updating }
SpaceInterface >> noticeSpaceModelChange: aChange [
	"the spaceModel has change"
	
	self
		update: aChange symbol
		with: aChange parameter
		from: self
]

{ #category : #'interface opening' }
SpaceInterface >> open [
	"Open the SpaceInterface adapted to the spaceModel configuration."
	
	| bdr win hauteur largeur origine etendue ratio screenBounds absBounds |
	screenBounds := Screen default bounds.
	hauteur := (screenBounds height min: screenBounds width) / 2.
	largeur := hauteur.
	origine := (screenBounds width - largeur) @ 0.
	absBounds := self spaceModel absoluteBounds.
	ratio := absBounds extent / (absBounds extent x min: absBounds extent y).
	etendue := (largeur / ratio y) @ (hauteur / ratio x max: 70).
	bdr := self allButOpenInterface: #windowSpec.
	win := bdr window.
	win openIn: (origine extent: etendue).	"self resizeWindow: win toOrigine: origine extent: etendue."	"self displayGrid."
	self setMenuHolder
]

{ #category : #'manipulate instances' }
SpaceInterface >> openCreateInstances [
	
	self createInstancesController
		ifNil: [CreateInstances openOnSpaceInterface: self]
]

{ #category : #'manipulate instances' }
SpaceInterface >> openManipInstances [
	
	self manipInstancesController
		ifNil: [ManipulateInstances openOnSpaceInterface: self]
]

{ #category : #'menu - actions' }
SpaceInterface >> openSIconfig [
	
	self siConfig ifNil: [self siConfig: (SpaceInterfaceConfig newFor: self)].
	self siConfig open
]

{ #category : #'interface opening' }
SpaceInterface >> openWindowGridSize [
	
	| win |
	win := MenuSpaceInterfaces new
		initGridSizeLine: self spaceModel line
		column: self spaceModel column.
	win openDialog: #windowGridSize with: self
]

{ #category : #'manipulate instances' }
SpaceInterface >> openedEntityInspectors_IsTheOnlyOne [
	"Purpose: return an association which key is collection of opened entity inspectors for that space interface, and value is true or false depending if the enity inspecor is set to bethe only one.	"
	
	| result |
	result := OrderedCollection new -> false.
	self myDependents update: #openedEntityInspectors_IsTheOnlyOne with:
			result from: self.
	^result
]

{ #category : #'classes list for menu' }
SpaceInterface >> passiveClassesForMenu: aMenuName [
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of the LocatedObjects classes of the model for which a pov has been defined"
	
	| methodName |
	self siConfig
		ifNil:
			[^self cormasModelClass visualizedClasses
				select: [:e | self cormasModelClass locatedObjectClasses includes: e]]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: CMPassiveObject]
]

{ #category : #'menu - actions' }
SpaceInterface >> photo [
	
	| defaultFileName fileName |
	defaultFileName := (Cormas videoPath: spaceModel cormasModelClass name)
		construct: spaceModel cormasModelClass name , '.jpg'.
	fileName := Dialog
		requestNewFileName: (UserMessage defaultString: '' key: #export) asString
		default: defaultFileName.
	fileName = '' ifFalse: [self snapGridInJpgFile: fileName asFilename]
]

{ #category : #delimiteur }
SpaceInterface >> pixel0 [
	
	self delimiterSize value: #pixel0.
	self view delimiter: 0
]

{ #category : #delimiteur }
SpaceInterface >> pixel1 [
	
	self delimiterSize value: #pixel1.
	self view delimiter: 1
]

{ #category : #delimiteur }
SpaceInterface >> pixel2 [
	
	self delimiterSize value: #pixel2.
	self view delimiter: 2
]

{ #category : #delimiteur }
SpaceInterface >> pixel3 [
	
	self delimiterSize value: #pixel3.
	self view delimiter: 3
]

{ #category : #copying }
SpaceInterface >> postCopy [
	"Do not copy the dependents list."
	
	super postCopy.
	self breakDependents.
	drawing := self drawing copy
]

{ #category : #accessing }
SpaceInterface >> povMethodDico [
	"a Dictionary containing #Class name -> #povSelector"
	
	^povMethodDico ifNil: [povMethodDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> povMethodDico: anObject [
	
	povMethodDico := anObject
]

{ #category : #'menu-pov' }
SpaceInterface >> povMethodDicoAt: aClass [
	
	^self povMethodDico
		at: aClass name
		ifAbsentPut: [#nil]
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povOfCompoundSpatialEntity: aSpatialEntityRef withComponents: componentsRef forSelector: povSelector andInfo: aInfoName [
	"creating the pov of a spatialEntity"
	
	| aPov componentsPovs defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	componentsPovs := OrderedCollection new.
	componentsRef
		do:
			[:ref | 
			componentsPovs
				add: (self spaceModel elementaryEntitiesDefaultPovs at: ref entityId)].
	aPov := aClass createEntityPOVwithSpec: povSpec componentsPovs:
			componentsPovs.
	aPov entityReference: aSpatialEntityRef.
	^aPov
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povOfElementarySpatialEntity: aSpatialEntityRef forSelector: povSelector andInfo: aInfoName [
	"creating the pov of a spatialEntity"
	
	| aPov defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	aPov := aClass createEntityPOVwithSpec: povSpec defaultPov: defaultPov.
	aPov entityReference: aSpatialEntityRef.
	^aPov
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsAndPatchesOfArcEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for arc entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aStartPatchEntityReference aEndPatchEntityReference |
	data := self spaceModel getPovsDataOfArcEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aStartPatchEntityReference := r at: 3.
			aEndPatchEntityReference := r at: 4.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches
				add:
					(Array with: aPov with: aStartPatchEntityReference with:
							aEndPatchEntityReference)].
	^povsAndPatches
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsAndPatchesOfOccupantEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aPatchEntityReference |
	data := self spaceModel getPovsDataOfOccupantEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aPatchEntityReference := r at: 3.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches add: aPov -> aPatchEntityReference].
	^povsAndPatches
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsOfSpatialEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| povs i aPov data aEntityReference aPovSpec componentsPovs |
	data := self spaceModel getPovsDataOfEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povs := OrderedCollection new.
	aClass isElementary
		ifTrue:
			[i := 0.
			data
				do:
					[:d | 
					i := i + 1.
					self spaceModel elementaryEntitiesDefaultPovs size < i
						ifFalse:
							[aEntityReference := d key.
							aPovSpec := d value.
							aPov := aClass
								createEntityPOVwithSpec: aPovSpec
								defaultPov: (self spaceModel elementaryEntitiesDefaultPovs at: i).	"clientSpaceModel also defines it"
							aPov entityReference: aEntityReference.
							povs add: aPov]]]
		ifFalse:
			[data
				do:
					[:d | 
					aEntityReference := d key.
					aPovSpec := d value.
					componentsPovs := OrderedCollection new.
					aPovSpec elementaryComponentsId
						do:
							[:compId | 
							componentsPovs
								add: (self spaceModel elementaryEntitiesDefaultPovs at: compId)].	"clientSpaceModel also defines it"
					aPov := aClass createEntityPOVwithSpec: aPovSpec componentsPovs:
							componentsPovs.
					aPov entityReference: aEntityReference.
					povs add: aPov]].
	^povs
]

{ #category : #display }
SpaceInterface >> redisplayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef [
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| selectorName aClass |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing redisplayCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef
]

{ #category : #'undo/redo' }
SpaceInterface >> redo [
	"reload the last redo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager redo
]

{ #category : #updating }
SpaceInterface >> registerInto: aCollection forHabitus: habitusName [
	"register the receiver into aCollection if it has the habitusName
	always registrer if habitusName is nil"
	
	(habitusName isNil or: [self isForHabitus: habitusName])
		ifTrue: [aCollection add: self]
]

{ #category : #display }
SpaceInterface >> removeEntity: aEntityRef [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aEntityRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeEntity: aEntityRef.
	Cormas refresh: self
]

{ #category : #display }
SpaceInterface >> removeOccupant: anOccupantReference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeOccupant: anOccupantReference
]

{ #category : #'menu - actions' }
SpaceInterface >> reopen [
	"Open a new spatial grid with same properties"
	
	| interface |
	self spaceModel cormas
		ifNil: [^self cormas warn: 'The model should be initialized'].
	interface := SpaceInterface new.
	interface copyPovFrom: self.
	interface open.
	interface drawing fillColor: self drawing fillColor.
	interface setMenuHolder.
	interface displayAllPovs.	"self spaceModel cormas spaceInterfaces add: interface."
	^interface
]

{ #category : #'menu - actions' }
SpaceInterface >> reopenWithSameHabitus [
	"Open a new spatial grid with same properties and same Habitus"
	
	| interface |
	self spaceModel cormas
		ifNil: [^self cormas warn: 'The model should be initialized'].
	interface := SpaceInterface new.
	interface copyPovFrom: self.
	interface configName value: self configName value.
	interface siConfig: self siConfig.
	interface siConfig spaceInterface: interface.
	interface open.
	interface drawing fillColor: self drawing fillColor.
	interface siConfig applyCurrentSettings.
	interface siConfig isUndoRedoEnabled: self siConfig isUndoRedoEnabled.
	interface siConfig
		isManipulateForTabletEnabled: self siConfig isManipulateForTabletEnabled.
	interface siConfig
		isSingleDefaultPovShown: self siConfig isSingleDefaultPovShown.
	interface siConfig
		isSingleDefaultInfoShown: self siConfig isSingleDefaultInfoShown.
	interface siConfig perform: interface siConfig defaultTool value.
	interface siConfig perform: interface siConfig siMenuFormat value.
	^interface
]

{ #category : #'user message' }
SpaceInterface >> request: aMessage [
	"display a message for this window"
	
	^Dialog
		request: aMessage
		for: self mainWindow
]

{ #category : #'user message' }
SpaceInterface >> request: aMessage initialAnswer: initialString [
	"display a message for this window"
	
	^Dialog
		request: aMessage
		initialAnswer: initialString
		for: self mainWindow
]

{ #category : #'user message' }
SpaceInterface >> request: aMessage initialAnswer: initialString then: aBlock [
	"request the user for this window then execute aBlock with the result, in an asynchrounous way.
	no result expected
	used for distributed cormas"
	
	| answer |
	[answer := Dialog
		request: aMessage
		initialAnswer: initialString
		for: self mainWindow.
	aBlock value: answer] promise
]

{ #category : #'interface closing' }
SpaceInterface >> requestForWindowClose [
self flag:#TODO.
	"Ces actions devraient être dans un noticeOfWindowClose:"
	spaceModel ifNotNil: [ self spaceModel: nil ].
	self manipInstancesController
		ifNotNil: [ self manipInstancesController closeWithSpaceInterface ].
	self createInstancesController
		ifNotNil: [ self createInstancesController closeWithSpaceInterface ].
	self siConfig ifNotNil: [ self siConfig closeRequest ].
	^ super requestForWindowClose
]

{ #category : #'interface opening' }
SpaceInterface >> resizeWindow [
	"Automatically resize the SpaceInterface window to fit (+/- 5 %) the spaceModel configuration."

	| hauteur origine etendue newRatio newExtent previousExtent previousRatio |
	self spaceModel class = ClientSpaceModel
		ifFalse: [ self spaceModel autoResizeBounds
				ifFalse: [ ^ nil ] ].
	previousExtent := self drawing bounds extent.
	newExtent := self spaceModel absoluteBounds extent.
	self flag: #TODO.
	"c''est pas vraiment normal que la spaceInterface recupère le absolutebounds de son modèle. il aurai mieux fallu que celui ci lui passe lors de la notification"
	newRatio := newExtent / (newExtent x min: newExtent y).
	previousRatio := previousExtent
		/ (previousExtent x min: previousExtent y).	"((previousRatio y - newRatio y) / newRatio y) abs > 0.05 ifFalse:[^false]."
	(previousRatio / newRatio between: 0.95 * (1 @ 1) and: 1.05 * (1 @ 1))
		ifTrue: [ ^ false ].	"hauteur := self builder window getDisplayBox height max: self builder window getDisplayBox width."
	hauteur := previousExtent x max: previousExtent y.
	etendue := ((hauteur / newRatio y) @ (hauteur / newRatio x)) rounded.
	origine := (Screen default bounds width - etendue x) @ 0.	"origine := self builder window globalOrigin."
	self
		resizeWindow: self builder window
		toOrigine: origine
		extent: etendue
]

{ #category : #'interface opening' }
SpaceInterface >> resizeWindow: win toOrigine: origine extent: newSpaceViewExtent [
	"resize the SpaceInterface window to fit the spaceModel configuration.
SpaceInterface adds decoration + menu + Tools bar. If interface is very thin, the menu may be of 2 or 3 lines. So we have to adapt the window size after opening the interface"
	
	| windowExtraHeight orig ext |
	windowExtraHeight := win height - self drawing bounds extent y.
	orig := (origine
		+ (-10 @ LookPreferences edgeDecorationPolicy markerThickness)) rounded.
	orig y < 30 ifTrue: [orig y: 30].
	ext := (newSpaceViewExtent + (0 @ windowExtraHeight)) rounded.
	win displayBox: (orig extent: ext).	"modification origin"
	(win getDisplayBox corner x > Screen default bounds width
		or: [win getDisplayBox origin y < 30])
		ifTrue:
			[orig := orig
				+
					((Screen default bounds width - win getDisplayBox corner x - 10)
						@ (30 - win getDisplayBox origin y max: 0)).
			win displayBox: (orig extent: ext)].	"when newSpaceViewExtent is too thin, the window does not respect the specified dimension, so we need to increase the height"
	win getDisplayBox extent x > ext x
		ifTrue:
			[ext := (win getDisplayBox extent
				* (1 @ (win getDisplayBox extent x / ext x))) rounded.
			ext y: (ext y min: Screen default bounds corner y - 35).
			win displayBox: (orig extent: ext)]
]

{ #category : #'menu - actions' }
SpaceInterface >> saveASC [
	
	| workingWindow |
	workingWindow := MenuSpaceInterfaces new
		initSaveASC: self cormasModelClass.
	workingWindow openDialog: #windowSaveASC with: self
]

{ #category : #'menu - actions' }
SpaceInterface >> saveGrid [
	
	| workingWindow file |
	workingWindow := MenuSpaceInterfaces new
		initSaveEnv: self cormasModelClass.
	(workingWindow openDialogInterface: #windowSaveEnv) ifFalse: [^nil].
	file := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'Save as' key: #saveas) asString
		default:
			((Cormas mapsPath: self cormasModelClass name) construct: 'filename.env').
	file isEmpty
		ifFalse:
			[self spaceModel
				saveAttributes: workingWindow attributesToBeSaved selections
				inFile: file asFilename]
]

{ #category : #'menu - actions' }
SpaceInterface >> saveGridMapInfo [
	
	self spaceModel saveGridMapInfo
]

{ #category : #'menu - actions' }
SpaceInterface >> saveMIFMID [
	
	| workingWindow c l |
	l := self spaceModel spatialEntities keys asArray.
	c := Dialog
		choose: 'Which class?'
		fromList: l
		values: l
		lines: 8
		cancel: [#noChoice]
		for: Dialog defaultParentWindow.
	c = #noChoice ifTrue: [^nil].
	workingWindow := MenuSpaceInterfaces new
		initSaveMIFMID:
			(self cormasModelClass spatialClasses detect: [:cn | cn name asSymbol = c]).
	workingWindow openDialog: #windowSaveMIFMID with: self
]

{ #category : #'menu - actions' }
SpaceInterface >> saveRSTRDC [
	
	| workingWindow |
	workingWindow := MenuSpaceInterfaces new initSaveRSTRDC: self spaceModel.
	workingWindow openDialog: #windowSaveRSTRDC with: self
]

{ #category : #'grid recorder' }
SpaceInterface >> screenImage [
	
	| cursorPoint aCursor cursorImage hotSpot figureImage shapeImage anImage theY theX coverageValue colorValue paletteIndex |
	cursorPoint := InputSensor cursorPoint - self spatialGridArea origin.
	aCursor := Cursor currentCursor.
	cursorImage := aCursor asOpaqueImage.
	hotSpot := aCursor
		instVarAt: (aCursor class allInstVarNames indexOf: 'hotSpot').
	figureImage := cursorImage figure image.
	shapeImage := cursorImage shape image.
	anImage := Screen default completeContentsOfArea: self spatialGridArea.
	(0 to: cursorImage bounds height - 1)
		do:
			[:y | 
			theY := y + cursorPoint y - hotSpot y.
			(0 to: cursorImage bounds width - 1)
				do:
					[:x | 
					theX := x + cursorPoint x - hotSpot x.
					(anImage bounds containsPoint: theX @ theY)
						ifTrue:
							[coverageValue := shapeImage palette
								at: ((shapeImage atX: x y: y) bitAnd: shapeImage palette maxIndex).
							coverageValue = CoverageValue opaque
								ifTrue:
									[colorValue := figureImage palette
										at:
											((figureImage atX: x y: y) bitAnd: figureImage palette maxIndex).
									paletteIndex := anImage palette indexOfPaintNearest: colorValue.
									anImage atX: theX y: theY put: paletteIndex]]]].
	^anImage
]

{ #category : #delimiteur }
SpaceInterface >> selectColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self view delimiterColor: color
]

{ #category : #background }
SpaceInterface >> setBackGroundColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self drawing backgroundFillColor: color.
	self changed
]

{ #category : #'drawing description' }
SpaceInterface >> setBasicTitle [
	"Set the title of the grid window"
	
	| pov prefix |
	self spaceModel ifNil: [^nil].
	prefix := self spaceModel envSpecStringFor: self activeSpatialEntity name.
	pov := self activeSpatialEntity name asString , ' -> '
		, (self povMethodDicoAt: self activeSpatialEntity) asString.
	basicTitle := prefix , pov
]

{ #category : #'menu-pov' }
SpaceInterface >> setCheck: unMenu [
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := item label class.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self povMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
]

{ #category : #'menu-info' }
SpaceInterface >> setCheckInfo: unMenu [
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := item label class.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self infoMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
]

{ #category : #'manipulate instances' }
SpaceInterface >> setEntityForManipulationToDefault [
	
	self entityForManipulation: #any
]

{ #category : #menus }
SpaceInterface >> setMenuHolder [
	"Set the Menu of the grid"
	
	menuHolder := self builder menuAt: #menuBar.	"menuHolder := self class menuBar asValue."
	self initMenuTopologie.
	self initMenuPov.
	self initMenuInfo.	"self initMenuDelimitor. A faire..."
	self initMenuAttributs.
	self initMenuTrack
]

{ #category : #initialisation }
SpaceInterface >> setSpaceModel: aModel [
	"Set the receiver's model to be aModel."
	
	spaceModel == aModel ifTrue: [^self].
	spaceModel ifNotNil: [spaceModel removeDependent: self].
	spaceModel := aModel.
	spaceModel ifNotNil: [spaceModel addDependent: self]
]

{ #category : #'menu - actions' }
SpaceInterface >> setTrackLength [
	"set the maximum size of the figures' tracks"
	
	| value aClass |
	value := Dialog
		choose: 'Choose the size of the agents tracks'
		fromList:
			#('1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20')
		values: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
		buttons: #('infinite')
		values: #(0)
		lines: 8
		cancel: [#noChoice].
	value = #noChoice ifTrue: [^self].
	TrackFigure maxSize: value.
	self trackedFigureTypes
		do:
			[:symbol | 
			aClass := symbol class.
			(self drawing entityFiguresAt: aClass)
				do:
					[:fig | 
					(fig dependents select: [:tf | tf isKindOf: TrackFigure])
						do:
							[:track | 
							track testAndRemoveOrigine.
							track invalidate]]]
]

{ #category : #accessing }
SpaceInterface >> siConfig [
	
	^siConfig
]

{ #category : #accessing }
SpaceInterface >> siConfig: anObject [
	
	siConfig := anObject
]

{ #category : #'grid recorder' }
SpaceInterface >> snapGridInJpgFile: filename [
	
	| image stream |
	"Un petit refresh juste avant la photo..."
	self drawing invalidate.	"Clic clac..."
	image := self screenImage.
	stream := JunJpegImageStream on: filename writeStream.
	[JunCursors cameraCursor showWhile: [stream nextPutImage: image]]
		valueNowOrOnUnwindDo: [stream close]
]

{ #category : #'grid recorder' }
SpaceInterface >> snapGridTime: t intoDirectory: directory basicName: aName [
	"Creates a image file (.JPG) of the grid at time t, into the 'video' directory of the model.
t = time <Integer>; directory = <Filename>; aName = <String>"
	
	| filename num4 |
	t = 9999
		ifTrue:
			[(self cormas confirm: 'Hoops, what a huge movie !!!!!!... Continue ?')
				ifFalse: [^nil]].
	num4 := WriteStream on: (String new: 4).
	t printOn: num4 base: 10 digitsToPad: 4 highDigit: 4.
	filename := directory construct: aName , num4 contents , '.jpg'.
	self snapGridInJpgFile: filename
]

{ #category : #'grid recorder' }
SpaceInterface >> snapGridTimeForMovie: t [
	"Creates a image file (.JPG) of the grid at time t, into the movieFilename directory.
t = time <Integer>; movieFilename = <Filename>"
	
	| directory aName |
	video ifNil: [^self].
	directory := video directory.
	aName := (video tail tokensBasedOn: $.) first.
	self snapGridTime: t intoDirectory: directory basicName: aName
]

{ #category : #'grid recorder' }
SpaceInterface >> snapGridTimeForMovie: t makingMovie: aBoolean [
	"Called by changed sent from Cormas (added while removing spaceInterfaces from Cormas)"
	
	self snapGridTimeForMovie: t.
	aBoolean ifTrue: [self makeMovie]
]

{ #category : #'classes list for menu' }
SpaceInterface >> socialClassesForMenu: aMenuName [
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of the Social classes of the model for which a pov has been defined and that are for Located agents√í"
	
	| methodName |
	self siConfig
		ifNil:
			[^self cormasModelClass visualizedClasses
				select:
					[:e | (self cormasModelClass socialClasses includes: e) and: [e isSituatedClass]]]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: Agent]
]

{ #category : #accessing }
SpaceInterface >> spaceModel [
	
	^spaceModel
]

{ #category : #accessing }
SpaceInterface >> spaceModel: aModel [
	"Set the receiver's model to aModel."
	
	self setSpaceModel: aModel	"self drawing setSpaceModel: aModel"
]

{ #category : #accessing }
SpaceInterface >> spatialClasses [
	
	^self spaceModel spatialClasses
]

{ #category : #'classes list for menu' }
SpaceInterface >> spatialClassesForMenu: aMenuName [
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of all the spatial classes of the model,  even if no pov has been defined"
	
	| methodName |
	self siConfig
		ifNil: [^self spaceModel spatialClasses]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: CMSpatialEntity]
]

{ #category : #'grid recorder' }
SpaceInterface >> spatialGridArea [
	
	^self builder window displayBox
]

{ #category : #'menu - actions' }
SpaceInterface >> squared [
	"model patchShape ~= #squared ifTrue: 
			[model patchShape: #squared.
			model nbNeighbours: #four.
			model createCells.
			model createCellsImages.
			model displayOn: model vue graphicsContext.
			model displayOn: model vue buffer graphicsContext.
			self shapeChanged]"
	
	
]

{ #category : #'undo/redo' }
SpaceInterface >> storeBeforeManipulation [
	"Store the whole state of the current model as BOS file. This is done before manipulation from the user, in order to enable Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager storeBeforeManipulation
]

{ #category : #'drawing description' }
SpaceInterface >> timeChanged [
	"the simulation time has changed. I update the title of the window and the linked interfaces"
	
	| timeStep |
	spaceModel ifNil: [^nil].
	timeStep := spaceModel timeStep.
	self isTimeTitleDisplayed
		ifTrue:
			[self builder window
				label:
					self basicTitle , '  Time: ' , timeStep printString , ' '
						, self timeUnitName value].
	self isTimeFieldDisplayed ifTrue: [self timeField value: timeStep].
	self changed: #timeChanged
]

{ #category : #aspects }
SpaceInterface >> timeField [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^timeField isNil
		ifTrue: [timeField := 0 asValue]
		ifFalse: [timeField]
]

{ #category : #aspects }
SpaceInterface >> timeUnitName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^timeUnitName isNil
		ifTrue:
			[timeUnitName := spaceModel isNil
				ifTrue: ['steps']
				ifFalse: [spaceModel timeUnitName asValue]]
		ifFalse: [timeUnitName]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> toggleManipulateForTablet [
	
	self isManipulateForTabletEnabled: self isManipulateForTabletEnabled not
]

{ #category : #'tool hotDraw' }
SpaceInterface >> toolNames [
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar.
	To each name (String), an icon should be associated at the class level and an initializeTool method should be design at the level of Tool class (these methods must be draged into Cormas Package)
	Ex: 'Inspect Tool'  -> inspectIcon -> initializeInspectTool
		'Manipulate Tool'  -> manipulateIcon -> initializeManipulateTool
		'Zoom Tool' -> zoomIcon -> initializeZoomTool"
	
	^#('Inspect Tool' 'Manipulate Tool' 'ChangeAttribute Tool' 'CreateEntity Tool' 'Zoom Tool' nil)
]

{ #category : #'menu - actions' }
SpaceInterface >> torroidal [
	spaceModel closed
		ifTrue: [ spaceModel closed: true.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged ]
]

{ #category : #'menu-track' }
SpaceInterface >> trackAgents: agentClass [
	
	| agentFigures menu |
	agentClass withAllSubclasses
		do:
			[:aClass | 
			agentFigures := #().
			(self drawing entityFigures
				at: aClass
				ifAbsent: [nil])
				ifNotNil:
					[agentFigures := (self drawing entityFigures at: aClass) values].
			menu := (self menuHolder value atNameKey: #trackAgents) submenu
				menuItemLabeled: aClass name asString.
			menu isOn
				ifTrue:
					[menu beOff.
					self trackedFigureTypes
						remove: aClass name
						ifAbsent: [nil].
					agentFigures do: [:af | af untrack]]
				ifFalse:
					[menu beOn.
					self trackedFigureTypes add: aClass name.
					agentFigures do: [:af | af track]]]
]

{ #category : #accessing }
SpaceInterface >> trackedFigureTypes [
	"a Collection containing #Class name of the tracked Entities"
	
	^trackedFigureTypes ifNil: [trackedFigureTypes := OrderedCollection new]
]

{ #category : #'undo/redo' }
SpaceInterface >> undo [
	"reload the last undo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager undo
]

{ #category : #'menu - actions' }
SpaceInterface >> unmoveableZoom [
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: true.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOn.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOff
]

{ #category : #updating }
SpaceInterface >> update: anAspectSymbol with: aParameter from: aSender [
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	anAspectSymbol = #noticeChanges
		ifTrue:
			[aParameter isEmpty ifTrue: [^self].
			aParameter do: [:aChange | self noticeChange: aChange].
			^Cormas refresh: self].
	anAspectSymbol = #noticeChange
		ifTrue:
			[self noticeChange: aParameter.
			^Cormas refresh: self].
	anAspectSymbol = #changePov
		ifTrue:
			[^self
				changePov: aParameter povName
				ofEntity: aParameter entityClass].
	anAspectSymbol = #removeAllFigures
		ifTrue: [^self drawing removeAllFigures].
	anAspectSymbol = #openedSpatialGridsForHabitus:
		ifTrue:
			[^self
				registerInto: aParameter value
				forHabitus: aParameter key].	" hack : avoid isKindOf: when getting SpaceInterface from openedSpatialGrid"
	anAspectSymbol = #timeChanged ifTrue: [^self timeChanged].
	anAspectSymbol = #backgroundColor
		ifTrue: [^self drawing fillColor: aParameter].
	anAspectSymbol = #delimitorSize ifTrue: [^self perform: aParameter].
	anAspectSymbol = #newCells
		ifTrue:
			[self displayGrid.
			^self updateWindowName].
	anAspectSymbol = #newAggregates
		ifTrue:
			[self displayCompoundSpatialEntityClass: aParameter.	"= class"
			^self updateWindowName].
	anAspectSymbol = #shapeHasChanged
		ifTrue:
			[self adaptMenuForNewShape.
			^self updateWindowName].
	anAspectSymbol = #removeAllCompoundSpatialEntityFigures
		ifTrue: [^self drawing removeAllCompoundSpatialEntityFigures].
	anAspectSymbol = #boundariesChanged ifTrue: [^self boundariesChanged].
	anAspectSymbol = #closeRequest ifTrue: [^self closeRequest].
	anAspectSymbol = #snapGridTimeForMovie
		ifTrue:
			[^self
				snapGridTimeForMovie: aParameter first
				makingMovie: aParameter last].
	anAspectSymbol = #listMethodsChanged ifTrue: [^self listMethodsChanged].
	anAspectSymbol = #loadSilentltySIConfigName
		ifTrue:
			[aParameter key = self
				ifTrue: [^self loadSilentltySIConfigName: aParameter value]].
	super update: anAspectSymbol with: aParameter from: aSender
]

{ #category : #'manipulate instances' }
SpaceInterface >> updateEntitiesSelectionWith: collecOfFigures lastFigureSelected: aFigure [
	
	self manipInstancesController ifNil: [^nil].
	self manipInstancesController
		updateInstancesSelectionWith:
			(collecOfFigures collect: [:f | f model entity])
		lastSelected: aFigure model entity
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference ifPovNameIs: aPovName [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference
		ifPovNameIs: aPovName
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference onPatch: aPatchEntityReference [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference onPatch:
			aPatchEntityReference
]

{ #category : #'drawing description' }
SpaceInterface >> updateWindowName [
	"Set the title of the grid window"
	
	self setBasicTitle.
	self builder window label: self basicTitle.
	self timeChanged
]

{ #category : #'grid recorder' }
SpaceInterface >> video [
	
	| defaultFileName fileName |
	defaultFileName := (Cormas videoPath: self cormasModelClass name)
		construct: self cormasModelClass name , '.mov'.
	fileName := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'movie file name' key: #export) asString
		default: defaultFileName.
	fileName = ''
		ifTrue: [self video: nil]
		ifFalse: [self video: fileName asFilename]
]

{ #category : #'grid recorder' }
SpaceInterface >> video: nilOrFilename [
	
	nilOrFilename isNil
		ifTrue:
			[video := nil.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOff]
		ifFalse:
			[video := nilOrFilename asFilename.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOn]
]

{ #category : #accessing }
SpaceInterface >> view [
	
	^self drawing
]

{ #category : #'user message' }
SpaceInterface >> warn: aMessage [
	"display a message for this window. Don't block the current thread (usefull for remote dialog when distributed)"
	
	^self
		asynchronousDo:
			[Dialog
				warn: aMessage
				for: self mainWindow]
]

{ #category : #'drawing description' }
SpaceInterface >> windowName [
	"What should our window label be?"
	
	^'Cormas Space'
]

{ #category : #accessing }
SpaceInterface >> zoomInterfaceIsStatic [
	
	^zoomInterfaceIsStatic ifNil: [zoomInterfaceIsStatic := true]
]

{ #category : #accessing }
SpaceInterface >> zoomInterfaceIsStatic: anObject [
	
	zoomInterfaceIsStatic := anObject
]
