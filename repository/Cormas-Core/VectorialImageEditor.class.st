Class {
	#name : #VectorialImageEditor,
	#superclass : #Object,
	#instVars : [
		'observer',
		'sliderWidth',
		'sliderHeigth'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #resources }
VectorialImageEditor class >> OKicon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #OKicon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 25 @ 23
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette whiteBlack
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 132 8 0 8 68 16 0 16 36 32 0 16 36 64 0 16 36 128 0 16 37 128 0 16 38 64 0 16 36 32 0 8 68 16 0 7 132 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> OKiconOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #OKicon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 29 @ 37
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette whiteBlack
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 225 2 0 2 17 4 0 4 9 8 0 4 9 16 0 4 9 32 0 4 9 96 0 4 9 144 0 4 9 8 0 2 17 4 0 1 225 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> diskIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diskIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 25 @ 20
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 170 128 0 170 170 128 2 170 170 128 0 170 160 21 84 10 170 128 0 170 5 85 85 80 170 128 0 168 85 85 85 85 42 128 0 161 85 85 85 85 74 128 0 133 85 85 85 85 82 128 0 133 85 85 85 85 82 128 0 21 85 85 85 85 82 128 0 21 85 85 85 85 84 128 0 21 85 85 85 85 84 128 0 21 85 85 85 85 88 128 0 21 85 85 85 85 82 128 0 133 85 85 85 85 82 128 0 133 85 85 85 85 98 128 0 161 85 85 85 85 138 128 0 168 85 85 85 86 42 128 0 170 5 85 85 96 170 128 0 170 160 37 104 10 170 128 0 170 170 128 2 170 170 128 0])
]

{ #category : #resources }
VectorialImageEditor class >> diskIconOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #diskIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 31 @ 35
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'**********"**********J*********(**********"**********J*********(**********"**********J***(@B***(*** EUPJ**"** UUUUB**J*(UUUUUR*(**EUUUUUR*"*!UUUUUUR*J*EUUUUUUJ(*!UUUUUUT*"*EUUUUUUT*J(UUUUUUUR(*!UUUUUUVJ"*EUUUUUUR*J*EUUUUUUJ(*(UUUUUUX*"*(UUUUUVJ*J*(UUUUU"*(**(EUUU **"***@%Z@***J***(@B***(**********"**********J*********(**********"**********J*********(**********"**********@@a'))
]

{ #category : #examples }
VectorialImageEditor class >> example [
	"Open a drawing editor with an Hexagon inside"
	"   self example   "
	
	| editor figure |
	editor := self new.
	editor open.
	figure := (HexagonPOV fromRadius: 10) asFigure.	"createAt: (10 @ 10 corner: 50 @ 50)"	"figure corner: 50 @ 50."
	editor drawing add: figure.
	figure translateTo: editor drawing center - (figure extent / 2).
	^editor
]

{ #category : #resources }
VectorialImageEditor class >> hexagonIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
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
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 170 170 168 170 170 160 0 0 170 170 129 10 170 160 0 0 170 168 21 80 170 160 0 0 170 129 85 85 42 160 0 0 168 21 85 85 66 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 161 85 85 85 84 160 0 0 168 21 85 85 66 160 0 0 170 129 85 84 42 160 0 0 170 168 21 82 170 160 0 0 170 170 129 10 170 160 0 0 170 170 168 170 170 160 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> hexagonIcon2 [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 21
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 162 170 170 128 0 0 170 170 4 42 170 128 0 0 170 160 85 66 170 128 0 0 170 5 85 84 170 128 0 0 160 85 85 85 10 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 133 85 85 85 82 128 0 0 160 85 85 85 10 128 0 0 170 5 85 80 170 128 0 0 170 160 85 74 170 128 0 0 170 170 4 42 170 128 0 0 170 170 162 170 170 128 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> hexagonIconOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #hexagonIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 33
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'********* B*********@J********(@********* B*********@J********(@********* B****"****@J*** P***(@*** UTJ** B** UUUJ**@J* UUUUB*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J*EUUUUT*(@*(UUUUUR* B*!UUUUUJ*@J* UUUUB*(@**(EUUB** B***AUR***@J*** P***(@****(**** B*********@J********(@********* B*********@J********(@'))
]

{ #category : #resources }
VectorialImageEditor class >> modifyFigureInEditorIcon [
	
	^OpaqueImage
		figure: self modifyFigureInEditorIconImage
		shape: self modifyFigureInEditorIconMask
]

{ #category : #resources }
VectorialImageEditor class >> modifyFigureInEditorIconImage [
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
VectorialImageEditor class >> modifyFigureInEditorIconMask [
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

{ #category : #examples }
VectorialImageEditor class >> open [
	"Open an empty drawing editor"
	"   self open   "
	
	| editor |
	editor := self new.
	editor open.
	^editor
]

{ #category : #resources }
VectorialImageEditor class >> squareIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #squareIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 22 @ 20
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 160 0 0 128 0 0 0 0 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 133 85 85 85 85 32 0 0 128 0 0 0 0 32 0 0 170 170 170 170 170 160 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> squareIconOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #squareIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 27 @ 34
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'*********@B********(@J******** @*********@B********(@J******** @*********@B********(@J(@@@@@@J @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*@@@@@@B(@J******** @*********@B********(@J******** @*********@B********(@J******** @*********@@b'))
]

{ #category : #resources }
VectorialImageEditor class >> toolBar [
	"Tools.MenuEditor new openOnClass: self andSelector: #toolBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #hexagon 
		#labelImage: #(ResourceRetriever VectorialImageEditor #hexagonIcon) 
		#helpText: 'Reset the image') #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #square 
		#labelImage: #(ResourceRetriever VectorialImageEditor #squareIcon)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #circle 
		#labelImage: #(ResourceRetriever VectorialImageEditor #diskIcon)) #(MenuItem 
		#rawLabel: 'Reset' 
		#value: #triangle 
		#labelImage: #(ResourceRetriever VectorialImageEditor #triangleIcon))) #(4) nil)
		decodeAsLiteralArray
]

{ #category : #resources }
VectorialImageEditor class >> triangleIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #triangleIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 22
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 168 170 170 168 0 0 170 170 161 42 170 168 0 0 170 170 133 74 170 168 0 0 170 170 133 74 170 168 0 0 170 170 21 82 170 168 0 0 170 170 21 82 170 168 0 0 170 168 85 84 170 168 0 0 170 168 85 84 170 168 0 0 170 161 85 85 42 168 0 0 170 133 85 85 74 168 0 0 170 133 85 85 74 168 0 0 170 21 85 85 82 168 0 0 170 21 85 85 82 168 0 0 168 85 85 85 84 168 0 0 161 85 85 85 85 40 0 0 128 0 0 0 0 8 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0 170 170 170 170 170 168 0 0])
]

{ #category : #resources }
VectorialImageEditor class >> triangleIconOLD [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #squareIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 27 @ 34
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'*********@B********(@J******** @*********@B********(@J******** @*********@B********(@J(@@@@@@J @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*EUUUUUR(@J(UUUUUUJ @*!UUUUUT*@B*@@@@@@B(@J******** @*********@B********(@J******** @*********@B********(@J******** @*********@@b'))
]

{ #category : #'interface specs' }
VectorialImageEditor class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #figureEditor 
				#defaultString: 'Figure Editor') 
			#min: #(Point 176 272) 
			#max: #(Point 759 614) 
			#bounds: #(Rectangle 720 450 963 786) 
			#toolBar: #toolBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(ActionButtonSpec 
				#layout: #(Rectangle 37 4 79 34) 
				#name: #ActionButton1 
				#model: #openVectorialLibrary 
				#label: 'Lib' 
				#style: #large 
				#defaultable: true) #(SliderSpec 
				#layout: #(LayoutFrame 20 0 39 0 41 0 -60 0.916666) 
				#name: #sliderHeigth 
				#model: #sliderHeigth 
				#orientation: #vertical 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 50 0 37 0 -30 1 -80 1) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(SliderSpec 
				#layout: #(LayoutFrame 52 0 -70 1 -30 1 -50 1) 
				#name: #sliderWidth 
				#model: #sliderWidth 
				#orientation: #horizontal 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(ActionButtonSpec 
				#layout: #(LayoutFrame -15 0.5 -38 1 35 0.5 -10 1) 
				#name: #install 
				#model: #install 
				#label: 'OK' 
				#style: #large 
				#defaultable: true))))
]

{ #category : #actions }
VectorialImageEditor >> circle [
	
	| image |
	image := VectorialElementaryPOV circle scaledBy: 8.
	image sizeRatio: 1.
	self loadImage: image
]

{ #category : #'drawing description' }
VectorialImageEditor >> drawingClass [
	"What type of drawing should we create?"
	"^Refactory.HotDraw.Drawing"
	
	^VectorialView
]

{ #category : #actions }
VectorialImageEditor >> hexagon [
	
	self drawing removeAll: self drawing components.
	self loadDefaultImage
]

{ #category : #'initialize-release' }
VectorialImageEditor >> initialize [
	
	super initialize.
	self sliderWidth onChangeSend: #sliderWidthChanged to: self.
	self sliderHeigth onChangeSend: #sliderHeigthChanged to: self
]

{ #category : #actions }
VectorialImageEditor >> install [
	
	| figure |
	(Dialog confirm:
			'You are about to change the image. The relative size will be set to 100% and the position on the cell will be at center.
Do you want to continue?') ifFalse: [^nil].
	figure := self drawing components first.
	figure translateTo: self drawing origin.
	figure scaleBy: 0.5.
	(figure isKindOf: CompositeFigure)
		ifTrue:
			[figure model: (VectorialCompositePOV newFromFigures: figure components)]
		ifFalse:
			[figure
				model:
					(VectorialElementaryPOV
						new:
							((Polyline vertices: figure points) translatedBy: figure center negated))].
	figure model color: figure fillColor.
	figure model isStroked: figure isOpaque not.
	figure model sizeRatio: 1.	"(scaleFactor x max: scaleFactor y)"
	figure model lineWidth: figure lineWidth.
	figure model lineColor: figure lineColor.
	observer setNewVectorialImage: figure model.
	self closeAndUnschedule
]

{ #category : #'interface opening' }
VectorialImageEditor >> loadCurrentImage [
	
	(self observer imageOS model isKindOf: VectorialPOV)
		ifTrue: [self loadImage: (self observer imageOS model copy scaledBy: 2)]
		ifFalse: [self loadDefaultImage]
]

{ #category : #'interface opening' }
VectorialImageEditor >> loadDefaultImage [
	
	self loadImage: (HexagonPOV fromRadius: 60)
]

{ #category : #'interface opening' }
VectorialImageEditor >> loadImage: aPOV [
	
	| figure |
	self drawing removeAll: self drawing components.
	figure := aPOV asFigure.
	self drawing add: figure.
	figure translateTo: self drawing center - (figure extent / 2)
]

{ #category : #accessing }
VectorialImageEditor >> observer [
	
	^observer
]

{ #category : #accessing }
VectorialImageEditor >> observer: anObject [
	
	observer := anObject
]

{ #category : #actions }
VectorialImageEditor >> openVectorialLibrary [
	
	| lib |
	VectorialImageLibrary imLibPage: 1.
	lib := VectorialImageLibrary new.
	lib observer: self.
	lib open
]

{ #category : #'interface opening' }
VectorialImageEditor >> setNewVectorialImage: aPOV [
	
	self loadImage: aPOV
]

{ #category : #aspects }
VectorialImageEditor >> sliderHeigth [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^sliderHeigth isNil
		ifTrue: [sliderHeigth := 1 asValue]
		ifFalse: [sliderHeigth]
]

{ #category : #aspects }
VectorialImageEditor >> sliderHeigthChanged [
	
	| vectFig y d f figurePosition |
	self drawing components isEmpty ifTrue: [^nil].
	vectFig := self drawing components first.
	figurePosition := vectFig bounds center.
	y := vectFig bounds extent y.
	d := self drawing bounds extent y.
	f := sliderHeigth value.
	vectFig scaleByWithAnswer: 1 @ (f * d / y).
	vectFig translateTo: figurePosition - (vectFig bounds extent / 2)
]

{ #category : #aspects }
VectorialImageEditor >> sliderWidth [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^sliderWidth isNil
		ifTrue: [sliderWidth := 1 asValue]
		ifFalse: [sliderWidth]
]

{ #category : #aspects }
VectorialImageEditor >> sliderWidthChanged [
	
	| vectFig y d f figurePosition |
	self drawing components isEmpty ifTrue: [^nil].
	vectFig := self drawing components first.
	figurePosition := vectFig bounds center.
	y := vectFig bounds extent x.
	d := self drawing bounds extent x.
	f := sliderWidth value.
	vectFig scaleByWithAnswer: (f * d / y) @ 1.
	vectFig translateTo: figurePosition - (vectFig bounds extent / 2)
]

{ #category : #actions }
VectorialImageEditor >> square [
	
	| image |
	image := (VectorialElementaryPOV newNbSegments: 4) scaledBy: 1.5.
	image sizeRatio: 1.
	self loadImage: image
]

{ #category : #'drawing description' }
VectorialImageEditor >> toolNames [
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar."
	
	^#('ModifyFigureInEditor Tool' nil)	"	^#('Selection Tool' 
	'Hand Tool' 
	nil )"
]

{ #category : #actions }
VectorialImageEditor >> triangle [
	
	| image |
	image := (VectorialElementaryPOV newNbSegments: 3) scaledBy: 1.5.
	image sizeRatio: 1.
	self loadImage: image
]
