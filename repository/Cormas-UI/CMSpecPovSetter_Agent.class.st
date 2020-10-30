"
CMSpecPovSetter_Agent example.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	colorChooser:		<Object>
	isDistortable:		<Object>
	occupantPosition:		<Object>
	oldValue:		<Object>
	tailleHolder:		<Object>
	tailleSlider:		<Object>


    Implementation Points
"
Class {
	#name : #'CMSpecPovSetter_Agent',
	#superclass : #CMSpecPovSetter,
	#instVars : [
		'tailleSlider',
		'tailleHolder',
		'colorChooser',
		'oldValue',
		'occupantPosition',
		'isDistortable'
	],
	#category : #'Cormas-UI-PoV'
}

{ #category : #resources }
CMSpecPovSetter_Agent class >> bitmapIcon [
	
	^OpaqueImage
		figure: self bitmapImage
		shape: self bitmapMask
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> bitmapImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bitmapImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 20
				depth: 9
				bitsPerPixel: 16
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4946 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4818 4946 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(160 738 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5396 5396)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5332 5396 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1413 1606 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1863 2087 2120)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 2505 2601)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 6938 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2730 2794)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2762 2762)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3822 3822 3822)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4304 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4272 4272 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4497 4464)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4497 4497 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4786 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5235 5428 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5396 5396 5396)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6070 6103 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 6327 6327)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1445 1606 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 6520 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 1895 1927)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1863 2087 2152)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 2376 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2344 2537 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 7195 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 3019 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3308 3404 3437)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3758 3854 3886)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4047 4047 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4304 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4529 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 5010 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5139 5203 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5589 5653 5653)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6520 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1863 2087 2184)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2376 2537 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2409 2537 2537)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7195 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 3212 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3565 3276 2666)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3372 3372 3437)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3629 3629)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3790 3854 3886)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4143 4079 3983)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4336 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4368 4593 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4657 4753 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4914 4978 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5171)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 417 963)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5107)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 963 2505)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(160 1252 2730)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1702 1863 1927)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4336 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4304 4304)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4561 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4497 4593 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4978 4978 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4882 5010 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5203 5203 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5428 5428 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1316 1413 1445)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1670 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6777 6777 6777)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 7002 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7227 7227)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2890 2955 3051)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3212)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3308 3469 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8126 8126 8126)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4336 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4721 4786 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4818 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4978 4978 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 5043 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4689 4786 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1316 1445 1445)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1670 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 6552 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1830 2184 2216)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1959 2120 2152)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2248 2312 2344)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2473 2537 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1638 1702 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3629 3661 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4111 4111)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4015 4143 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4336 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4047 4111 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4978 5010 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 64 64)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5396 5460 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5653 5685 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5910 5910)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1670 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1702 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2633 2794 2858)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3372 3469 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3661 3661 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3886 3886 3886)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 4368 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4272 4336 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4561 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4721 4786 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4786 4786 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4753 4786 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5010 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5043 5043 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5396 5492 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5685 5685 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1445 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 6584 6584)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6809 6809 6809)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1959 2120 2216)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1702 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3404 3469 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4336 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5717 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1734 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1670 1927 2055)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6584 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1959 2184 2184)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2152 2376 2473)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2344 2633 2698)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2633 2826 2890)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2826 2923)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2216 2376 2409)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3372 3501 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3629 3693 3726)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4015 4175 4207)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4625 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4593 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4497 4625 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 160 738)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5043 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5235 5267 5267)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5171 5267 5332)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(321 674 1316)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5460 5492 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1477 1573)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1702 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1509 1734 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6360 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 3501 3565)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4175 4175)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6295 4432 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4143 4143 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4625 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 64 192)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5974 5974)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1477 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6167 6167 6167)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5942 5942 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6392 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6617 6617 6617)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2280 2376 2409)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2505 2601 2633)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2858 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2923 3083 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6841 6841 6841)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3437 3469 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3565 3758 3790)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4272 4432 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4625 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4625 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4818 4818 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4786 4850 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 674 1509)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5749 5717 5717)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1477 1573)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 1734 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1766 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1509 1734 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2505 2633 2633)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2280 2409 2409)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3693 3726 3726)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4368 4400 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4786 4689 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4721 4882 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5043 5075 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5492 5524 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5428 5524 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5685 5749 5781)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5717 5749 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5974 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1316 1509 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 1734 1766)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2923 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 2858 2923)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4111 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4175 4175)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4400 4400 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4368 4400 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4529 4689 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4432 4464)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5267 5300 5332)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5460 5557 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5396 5589 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5974 5974 5974)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5749 5749 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6199 6199 6199)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 1734 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 1477 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6424 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 7098 7098)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 2216 2280)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1509 1766 1863)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3147 3340 3372)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3693 3758 3758)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4207 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4497 4689 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5974 5974 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1541 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 1766 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6456 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2087 2216 2216)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2955 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3051 3083 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3115 3372 3404)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3212 3308 3372)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7998 7998 8030)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3950 3983 3983)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4464 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4657 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4689 4689)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4882 4882)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4657 4625 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5043 5107 5139)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5524 5557 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5781 5781 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5974 6006 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6199 6231 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 6231 6199)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6456 6456)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 1766 1863)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2537 2633 2730)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3790 3244 2216)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3404 3597 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3758)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3918 4015 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4015 3983 3950)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4432 4432 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4657 4657 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4689 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4882 4882 4882)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4818 4914 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4978 5139 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5332 5332 5332)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 6006 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6456 6456 6456)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 2280 2312)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6938 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2666 2923 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3983 4047 3950)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3983 4015 3983)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4464 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4689 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4368 4464 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5139 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5043 5107 5203)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5267 5364 5396)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2055 2087)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 6906 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2762 2890 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3533 3565 3565)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3950 4015 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4207 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4689 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 192 192)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4914 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4786 4946 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4818 4946 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5974 6038 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6199 6263 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1413 1573 1638)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1381 1606 1638)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2055 2120)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6456)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2120 2248 2280)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6938 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 2890 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 2955 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2794 2923 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2858 2890 2923)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3565 3565 3565)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4175 4272 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4464 4464)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4400 4464 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4978 5203 5235)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5589 5589 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6038 6038 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5814 5814 5814)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 1573 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 1606 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 1830 1895)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2087 2120)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 6488 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 2312 2376)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 2955 3051)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2762 2955 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3372)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3469 3597 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 4272 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4657 4721 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4689 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4914 4914 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4946 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5492 5653 5653)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5557 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5685 5878 5910)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6713 6745 6713)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 6970 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4464 4497 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4689 4721 4721)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 CB@LH@0 D)@HT@60BD@TT@H@B=@K4@/PB=@K4@/PB=@K4@/PB=@K4@/PBK@ET@0 CB@LH@0 BO@KHAX0A]@C(AC@E%@MHAFPB^@E$@$@E!@L\AN0AZ@I<@I0EN@V@@IPD7@JL@UPCB@LHAI D!@L(@S E)@TT@%@@S@AL@WPA\@VTAC DI@MP@D @R@M,AQPD''@H\@O0CW@K\@0 CB@TT@: AY@F,@[PE+@O @^@AE@CP@+PCE@Q4@JPA0@M$@[0AH@Q4@N@D_@S0@ P@W@LH@0 EE@R8@/@C4@IT@3@CA@VP@J D>@P\@&0D0@A\@60@S@C$@_@DW@U\@F ET@S\@-0CB@LH@.PCT@P@AP BJ@GH@# D,@O$@>PD7@IDAA@C3@@L@VPA)@G8@@0@6@RTAL0DF@K\@0 CB@RX@@@E[@A,@;0A @H @YPED@BL@60B7@JL@>PB#@P4AM0D6@JHAD@AC@I\@D A!@LH@0 EZ@S@AV0@[@N<@X@@E@UTAU CH@K$AY AZ@TT@H BO@R @5PD6@M\@JPDB@E,@.@CB@LHAV B$@T\@$0E@@HL@)0C\@A8@>0B6@ID@UPB=@V ADPC>@AXAJ0DE@R8@''P@A@OH@0 CB@B<@6@C9@@8@(@C%@Q$@BPAS@A\AYPB2@U(@ @@5@Q(AKPE%@MX@''@B0@G(@WPC2@LH@0 EZ@@P@I@A(@S\@5@E,@QTAR@@W@SH@E0@P@@H@O B%@KDAWPBQ@F(@(0EK@E8@.@CB@LHAI @(@I AL0A@@M4APPCK@FP@, @S@J(@U @=@O@@2PA.@FX@60C:@S,@U0D.@HT@0 CB@OLAOPD*@TH@*@@X@GH@" B3@LX@:0D?@CH@(P@;@KD@,PEF@QHAHPC$@@\AB@@+@LH@0 EE@VH@7 @,@N<@X@A2@H(@?@B:@RD@60CV@T$AEPB>@EXAL@EE@T<A@0EY@I8AP0CB@LHAQP@7@I$@A CL@D4@X@A @GL@W0B;@R4@X DO@VT@6 A1@OTAY0A5@A0AE AF@K\@0 CB@@ @1@B<@FLAD0BR@L4@?PC6@J$@S@CN@LL@:@@S@JX@JPC&@IX@Y0@0@J8@40B6@LH@0 D4@S$@+@D5@@(AE@A4@T AW@C_@L<@& CP@O\@>P@&@U<@KPC?@B8@LPC!@C0@*0CB@LH@U@B#@E$@+PD8@O$@VPD-@P(AKPB-@CP@00CC@MD@L0AW@Q\AE0@4@F0AK0B#@OL@#PCB@E @H@EZ@TTAQPEE@TTAQPEE@L@@S BD@KH@, B2@KH@, B2@M,@-0C2@K$@/PBO@H4b'))
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> bitmapMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bitmapMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192 255 255 255 192])
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> cachedImage [
	"CormasNS.Kernel.ImageEditor new openOnClass: self andSelector: #cachedImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 126 @ 27
				depth: 8
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4368 3693)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 5139 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 3244 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4625 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5267 4786)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5267 4753)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7066 5075 7066)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5717 5300)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4207 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 2955 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6649 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 2087 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 6777 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6038 5653)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4529 3886)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6488 6199)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4978 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6327 2601 6327)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3918 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4625 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6360 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 2826 1927)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4818 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3758 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3758 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4240 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4207 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7291 5653 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 6199 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6649 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5139 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7034 4882 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4079 3372)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7580 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6038 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 3437 6584)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 2826 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4978 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 1541 4240)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 3983 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 1959 867)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 6617 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3918 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7837 7227 7837)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4657 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7355 5878 7355)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6360 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3308 2473)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 4464 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3758 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6681 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3629 2858)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 4207 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7580 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6070 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 5492 7227)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4529 3918)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5010 4464)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6520 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4207 1541 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6970 6777)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 4625 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6617 3404 6617)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3918 3212)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5910 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4400 3758)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6392 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8062 7805 8062)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 1413 4175)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 5300 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4689 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3790 3051)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6263 2473 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 4497 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6231 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6681 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3180 2312)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 4657 5910)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5621 5171)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6520 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 1959 899)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 3308 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6392 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4464 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3790 3051)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7291 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 3051 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 5139 7098)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3661 2890)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4111 3404)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 1316 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8126 8062 8126)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7452 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 1991 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 4689 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3950 3244)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4721 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6392 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 1573 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3822 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6263 2537 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 5171 7098)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4497 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6713 6456)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3661 2890)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 6874 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6103 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4593 3983)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6809 4143 6777)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3983 3276)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5974 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 5364 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4143 1445 4207)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6263 2569 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3822 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4529 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4304 3629)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4304 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6681 3726 6681)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3693 2923)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 2312 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 6906 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7644 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4143 3437)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 1766 3790)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7966 7516 7901)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6584 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6809 4143 6809)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7034 6841)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 5524 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 2023 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 4753 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5974 5589)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 6456 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6424 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3372 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3854 3115)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4497 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 5171 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4561 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7805 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4304 3629)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6745 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 2344 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3693 2923)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7066 4978 7066)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 1445 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6584 6327)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6167 1830 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6841 4111 6841)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5524 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 4786 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7966 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3404 2601)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6745 4015 6713)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4529 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3854 3115)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 5203 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4336 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5846 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6295 5974)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6938 4593 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4015 1445 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3726 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3115 2248)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6617 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6841 4175 6809)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4015 3308)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6006 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6456 6167)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 6520 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3886 3147)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5396 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4561 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 4336 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6327 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3726 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 3726 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 2666 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 4657 4047)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6167 5814)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6617 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5107 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 5557 5107)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 2537 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6038 5653)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 2794 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 6938 6745)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 3437 2633)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 4593 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 7387 7259)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 2376 1381)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L86AN2JWG!Z5C$H@'':=5]WV/+:>_''9>/#''XYBE).D(%3E;DX,)EYZU$4MCP4MCQ)VU&Q^KJ$,SEURFR]+B)@XJ @@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3O@.Q(/)X X_F0PAHHG(DE/C[,7M06)*XVE!Z$7Z;YK(R9"*#-P_9R7GP)LL&!(ZF!(L$0JB!6&-9Q?_5@;C:*GT4LT,@@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3N7MAU$AX<!L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3NYHLF8^3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3U+RZM#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L34KNSL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3N= 3(3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3 U8%L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L6!QISL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3N9JJ43L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L;/+(OL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@!#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L44%L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@&I"X&I"X&I"X&I"X&I"X&I"X&I"X&I"X&I"X&I"X<\TU1\WE1\WF#X9VSV75N_#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@KL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L2\I%#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3NJ^SL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3$I03L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3YV43L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3DZ\3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3\(@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3/IY\L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3H2Q:L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L4$5Z#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3WS9WT)03L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L)@V4?@#L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3@@@3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3MDJ02+GB4[NGAF''&ZKVH.K''):^''):^V@ZRG9"DW1NL#GQ'']F]''UEQTUEQTUEQTUCA''LF]J]J:L(+<S@21GXXP@@CL3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L3L0@@'))
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> iconHexagon [
	
	^SpaceInterface iconHexagon
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> libraryIcon [
	
	^OpaqueImage
		figure: self libraryIconImage
		shape: self libraryIconMask
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> libraryIconImage [
	
	<resource: #image>
	^Image
		extent: 25 @ 24
		depth: 1
		bitsPerPixel: 1
		palette: MonoMappedPalette whiteBlack
		usingBits:
			#[0 0 0 0 112 0 0 0 112 0 0 0 112 0 0 0 112 0 0 0 112 0 112 0 112 0 112 0 112 0 112 0 112 2 112 0 112 7 112 0 112 6 112 0 112 0 120 0 112 0 126 0 112 0 126 0 112 6 119 0 112 6 115 0 112 6 113 0 112 6 113 0 112 6 113 0 127 230 115 0 127 230 118 0 127 224 126 0 127 224 124 0 0 0 0 0]
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> libraryIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #libraryIconMask"
	
	<resource: #image>
	^Image
		extent: 25 @ 24
		depth: 1
		bitsPerPixel: 1
		palette: CoveragePalette monoMaskPalette
		usingBits:
			#[0 0 0 0 112 0 0 0 112 0 0 0 112 0 0 0 112 0 0 0 112 0 112 0 112 0 112 0 112 0 112 0 112 2 112 0 112 7 112 0 112 6 112 0 112 0 120 0 112 0 126 0 112 0 126 0 112 6 119 0 112 6 115 0 112 6 113 0 112 6 113 0 112 6 113 0 127 230 115 0 127 230 118 0 127 224 126 0 127 224 124 0 0 0 0 0]
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> menuSymbolePDV [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuSymbolePDV"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add') 
		#value: #addSymbolPov) #(MenuItem 
		#rawLabel: 'Add - same shape as' 
		#nameKey: #addSymbolSameAs 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'bidon' 
			#nameKey: #bidon)) #(1) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#value: #removeSymbolPov) #(MenuItem 
		#rawLabel: 'Set as default symbol shape' 
		#value: #setSymbolAsDefaultImage) #(MenuItem 
		#rawLabel: 'Set entity default color' 
		#nameKey: #setDefaultColor 
		#value: #setDefaultColor)) #(5) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> vectorIcon [
	
	^OpaqueImage
		figure: self vectorImage
		shape: self vectorMask
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> vectorImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #vectorImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 20
				depth: 8
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2537 3212 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 4625 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7484 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6295 6424 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7837 7837 7837)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5846 5974 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4432 4850 5300)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 6263 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 6617 6681)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8062 8062 8062)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7259 7291 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6070 6199 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6038 6231 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 6199 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1638 4304 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7966 7966)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 5396 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6327 6424 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3244 3886 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5171 5332 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2184 4432 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6649 6713)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7291 7291 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2730 3726 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3051 4047 4882)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 7195 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7195 7227)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5685 6135 6456)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1316 2505 3533)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4978 5139)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1252 3437 4657)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4368 4593 4689)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2409 3533 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 6327 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 3886 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3180 5942 7195)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 7195 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6231 6392 6681)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5267 5300 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3886 4175 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6745 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2473 4946 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1702 4978 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 6006 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3372 3790 4207)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8094 8094 8094)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6970 6970 7034)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4625 4753 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7291 7291 7387)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 6231 6327)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5010 5107 5235)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4786 5107 5460)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1381 2666 3693)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6231 6295)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7966 7998 7998)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 3533 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1060 5332 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4400 5107 5524)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7548 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6456 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(931 3501 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(995 2923 4175)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6584 6681 6745)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1895 4850 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5428 5910 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5942 6231 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5781 5878 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 1573 2666)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5492 5781)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 6552 6617)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6874 6874 6938)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5942 6103 6327)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6424 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7098 7130 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6295 6327 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2987 3822 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3308 4207 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1124 2923 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 5557 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6488 6584 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7998 7998 8030)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6360 6552 6809)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 6167 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7901 7901 7901)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6263 6424 6713)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 1830 2858)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2633 3212 3629)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2794 3533 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4400 5010 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5910 5910 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1381 3693 5075)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6231 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6552 6552 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6841 6906 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5524 5814 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1156 3565 5107)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 6199 6231)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6488 6552)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 6841 7066)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2473 3597 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1027 2890 4272)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6713 6970)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7837)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3950 4497 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 3790 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7709 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 6584 6681)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8030 8030 8030)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(770 2312 3469)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6199)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6456 6584)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3115 4015 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6520 6841 7098)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6745 6841 6874)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5814 5974 6038)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1959 3501 4753)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4561 4818 5139)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6167 6295 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6199 6263 6360)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1766 4015 5428)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2184 3372 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6070 6167 6263)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7901 7934 7966)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5589 5653 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(642 2601 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7484 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2152 2762 3340)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4175 4304)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8158 8158 8158)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4882 5300 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5846 5942 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2120 3597 4529)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 3629 4625)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7420 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3565 4111 4561)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3308 4111 4818)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 4818 6424)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6938 7002)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7612 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(995 2666 3950)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6424 6520 6584)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'HB@ HB@ HB@ HB@ HB@ HB@ HB@ @@@@HB@ HB@ HC(5GF8 HB@ HB@ HB@ @@@@HB@ HB@ HE@$ @YXSB@ HB@ I(UW@@@@HB@ HB@ HGA,]SPL^3L]Z@P/%)I\@@@@HB@ HB@ HAL''] P C0(ZDSBI!#%F@@@@HB@ HB@ AT$7HB@ HB@ H@="WX -@@@@HB@ HB@,$5X HB@ HB@ H@,"!E( @@@@HB@WZ0E:HB@ HB@ HB@OR78OHB@ @@@@HB@TJ$D HB@ HB@ HHP<  < HB@ @@@@HBAQ[A, HB@  5$BQSI7K"@ HB@ @@@@HB@PG2T HB@ Y"FA$FH HB@ HB@ @@@@HB@VSPH HB@ JD@+\YT HB@ HB@ @@@@HB@JA6P HB@ _S =D(\ HB@ HB@ @@@@HB@JA6P HB@ LVAB#F%$HB@ HB@ @@@@HB@JA6P HB@ HB@ H@M#S2@ HB@ @@@@HBBT_5L HB@ HB@ HH(MUD< HB@ @@@@HBACQ1$ HB@ HB@ HB@ M$)*^V< @@@@HC.M#X.WEQTUEQTUEQT?RE8#_E, @@@@HH<^XU=K\7M3\7M3\7M3B@@NY4P @@@@HGJQ$R$.HB@ HB@ HB@ HEHXS&T @@@@'))
]

{ #category : #resources }
CMSpecPovSetter_Agent class >> vectorMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #vectorMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 21 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 1 224 0 0 1 248 56 0 1 255 248 0 1 255 248 0 3 248 248 0 7 232 240 0 60 99 224 0 56 127 128 0 56 127 0 0 56 124 0 0 56 125 0 0 56 124 0 0 56 126 0 0 56 7 0 0 56 7 240 0 56 1 240 0 127 255 240 0 127 255 240 0 127 255 240 0])
]

{ #category : #'interface specs' }
CMSpecPovSetter_Agent class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #observationOfEntity 
				#defaultString: 'Observation of Entity') 
			#min: #(Point 637 406) 
			#max: #(Point 414 423) 
			#bounds: #(Rectangle 746 158 1383 564) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle -3 -5 638 408) 
				#name: #fond 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4091 6142 8191) 
					#setBackgroundColor: #(ColorValue 3810 5717 7621)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 7 176 275 371) 
				#name: #Region2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 424 10 631 160) 
				#name: #Region6 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 7 12 383 161) 
				#name: #Region5 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 5 3 385 163) 
				#name: #GroupBox3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: ' PoV definition ')) #(RegionSpec 
				#layout: #(Rectangle 422 172 630 370) 
				#name: #Region3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(LabelSpec 
				#layout: #(Point 239 17) 
				#label: #(UserMessage 
					#key: #associatedSymbols 
					#defaultString: 'Associated Symbols') 
				#style: #pixelDefault) #(SequenceViewSpec 
				#layout: #(Rectangle 221 36 378 155) 
				#name: #pov 
				#model: #listSymbols 
				#menu: #menuSymbolePDV 
				#multipleSelections: false) #(SliderSpec 
				#layout: #(Rectangle 77 283 177 301) 
				#name: #greenSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(SliderSpec 
				#layout: #(Rectangle 77 310 177 328) 
				#name: #blueSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(LabelSpec 
				#layout: #(Point 13 255) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #red 
					#defaultString: 'Red')) #(LabelSpec 
				#layout: #(Point 13 282) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 4986 0) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #green 
					#defaultString: 'Green')) #(LabelSpec 
				#layout: #(Point 13 308) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 0 4986) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #blue 
					#defaultString: 'Blue')) #(SliderSpec 
				#layout: #(Rectangle 77 344 177 360) 
				#name: #brightnessSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(GroupBoxSpec 
				#layout: #(Rectangle 6 167 277 373) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #color 
					#defaultString: ' Set the Color ')) #(ActionButtonSpec 
				#layout: #(Rectangle 107 375 212 402) 
				#name: #boutonAppliquer 
				#flags: 40 
				#model: #validate 
				#label: #(UserMessage 
					#key: #apply 
					#defaultString: 'Apply') 
				#isDefault: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 10 36 205 154) 
				#name: #listMethods 
				#model: #listMethods 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPov) 
				#menu: #menuPDV 
				#multipleSelections: false) #(LabelSpec 
				#layout: #(Point 13 17) 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Methodes returning a Symbol') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 179 254 215 276) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#tabable: true 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 178.5 281 217.0 303) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 179 308 215 331) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 179 341 217 361) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 13 340) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #brightness 
					#defaultString: 'Brightness')) #(SequenceViewSpec 
				#layout: #(Rectangle 430 36 624 152) 
				#name: #List1 
				#model: #listInfo 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyInfo) 
				#menu: #menuInfo 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 537 224 580 264) 
				#name: #openImageEditorButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openBitmapImageEditor 
				#helpText: #(UserMessage 
					#key: #OpenBitmapImageEditor 
					#defaultString: 'Open a Bitmap image editor') 
				#label: #bitmapIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 422 164 632 372) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #createimage 
					#defaultString: ' Create the Image ')) #(LabelSpec 
				#layout: #(Point 460 282) 
				#name: #Label2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#label: #(UserMessage 
					#key: #size1 
					#defaultString: 'Relative size')) #(LabelSpec 
				#layout: #(Point 462 301) 
				#name: #Label3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#label: #(UserMessage 
					#key: #size2 
					#defaultString: 'of the entity:')) #(SliderSpec 
				#layout: #(Rectangle 443 274 461 365) 
				#name: #tailleSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #tailleSlider 
				#orientation: #vertical 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(InputFieldSpec 
				#layout: #(Rectangle 478 325 505 340) 
				#name: #pourcentTailleIndicateur 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #tailleSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0%') #(RegionSpec 
				#layout: #(Rectangle 308 296 391 379) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 422 3 632 162) 
				#name: #GroupBox2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #informationToBeDisplay 
					#defaultString: ' Information to be displayed ')) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 538 183 581 223) 
				#name: #openVectorEditorButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openVectorImageEditor 
				#helpText: #(UserMessage 
					#key: #OpenaVectorialimageeditor 
					#defaultString: 'Open a Vectorial image editor') 
				#label: #vectorIcon 
				#hasCharacterOrientedLabel: false 
				#isDefault: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 472 194) 
				#name: #Label5 
				#label: #(UserMessage 
					#key: #vectorial 
					#defaultString: 'Vectorial:')) #(LabelSpec 
				#layout: #(Point 481 229) 
				#name: #Label6 
				#label: 'Bitmap:') #(LabelSpec 
				#layout: #(Point 451 17) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningString 
					#defaultString: 'Methodes returning a String') 
				#style: #pixelDefault) #(RadioButtonSpec 
				#layout: #(Point 301 183) 
				#name: #RadioButton6 
				#model: #occupantPosition 
				#helpText: 'Put the entity image randomly on its cell' 
				#label: #(UserMessage 
					#key: #randomly 
					#defaultString: 'randomly') 
				#select: #random) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 322 0 295 0 2 84) 
				#name: #Divider3 
				#orientation: #vertical) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 375 0 295 0 2 84) 
				#name: #Divider4 
				#orientation: #vertical) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 307 0 310 0 84 4) 
				#name: #Divider1) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 307 0 364 0 85 4) 
				#name: #Divider2) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 580 224 623 264) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openBitmapLibrary 
				#label: #libraryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 282 167 411 278) 
				#name: #GroupBox4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #createimage 
					#defaultString: ' Position on the cell ')) #(SubCanvasSpec 
				#layout: #(Rectangle 12 190 275 240) 
				#flags: 0 
				#majorKey: PovSetter 
				#minorKey: #palette) #(SliderSpec 
				#layout: #(Rectangle 77 255 177 273) 
				#name: #redSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(RadioButtonSpec 
				#layout: #(Point 328 213) 
				#name: #RadioButton2 
				#model: #occupantPosition 
				#select: #topLeft) #(RadioButtonSpec 
				#layout: #(Point 328 229) 
				#name: #RadioButton7 
				#model: #occupantPosition 
				#select: #leftCenter) #(RadioButtonSpec 
				#layout: #(Point 328 245) 
				#name: #RadioButton4 
				#model: #occupantPosition 
				#select: #bottomLeft) #(RadioButtonSpec 
				#layout: #(Point 343 245) 
				#name: #RadioButton8 
				#model: #occupantPosition 
				#select: #bottomCenter) #(RadioButtonSpec 
				#layout: #(Point 343 229) 
				#name: #RadioButton1 
				#model: #occupantPosition 
				#select: #center) #(RadioButtonSpec 
				#layout: #(Point 343 213) 
				#name: #RadioButton10 
				#model: #occupantPosition 
				#select: #topCenter) #(RadioButtonSpec 
				#layout: #(Point 358 213) 
				#name: #RadioButton5 
				#model: #occupantPosition 
				#select: #topRight) #(RadioButtonSpec 
				#layout: #(Point 358 229) 
				#name: #RadioButton9 
				#model: #occupantPosition 
				#select: #rightCenter) #(RadioButtonSpec 
				#layout: #(Point 358 245) 
				#name: #RadioButton3 
				#model: #occupantPosition 
				#select: #bottomRight) #(RadioButtonSpec 
				#layout: #(Point 314 200) 
				#name: #RadioButton11 
				#model: #occupantPosition 
				#select: #border_topLeft) #(RadioButtonSpec 
				#layout: #(Point 314 229) 
				#name: #RadioButton12 
				#model: #occupantPosition 
				#select: #border_leftCenter) #(RadioButtonSpec 
				#layout: #(Point 314 258) 
				#name: #RadioButton13 
				#model: #occupantPosition 
				#select: #border_bottomLeft) #(RadioButtonSpec 
				#layout: #(Point 372 258) 
				#name: #RadioButton14 
				#model: #occupantPosition 
				#select: #border_bottomRight) #(RadioButtonSpec 
				#layout: #(Point 372 229) 
				#name: #RadioButton15 
				#model: #occupantPosition 
				#select: #border_rightCenter) #(RadioButtonSpec 
				#layout: #(Point 372 200) 
				#name: #RadioButton16 
				#model: #occupantPosition 
				#select: #border_topRight) #(RadioButtonSpec 
				#layout: #(Point 343 200) 
				#name: #RadioButton17 
				#model: #occupantPosition 
				#select: #border_topCenter) #(RadioButtonSpec 
				#layout: #(Point 343 258) 
				#name: #RadioButton18 
				#model: #occupantPosition 
				#select: #border_bottomCenter) #(CheckBoxSpec 
				#layout: #(Point 541 285) 
				#name: #isDistortable 
				#model: #isDistortable 
				#label: 'is distortable') #(LabelSpec 
				#layout: #(Point 540 304) 
				#name: #Label4 
				#label: '(adapt to cell shape)' 
				#style: #pixelSmall) #(RegionSpec 
				#layout: #(Rectangle 320 208 378 267) 
				#name: #virtualCell 
				#lineWidth: 1) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin 284 0 273 0 130 130) 
				#name: #ViewHolder2 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #imageOS) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Rectangle 579 183 622 223) 
				#name: #ActionButton2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openVectorialLibrary 
				#label: 'Lib' 
				#style: #large 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(RegionSpec 
					#layout: #(Rectangle 0 0 108 101) 
					#name: #Region4 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 4915 4915 4915) 
						#setBackgroundColor: #(ColorValue 7700 7700 7700))) #(CompositeSpecCollection 
					#collection: #(#(ActionButtonSpec 
						#layout: #(Rectangle 54 53 96 75) 
						#name: #ActionButton3 
						#model: #shrunkeBitmap 
						#label: '/ 2' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 0 54) 
						#name: #Label9 
						#label: 'shrunke') #(ActionButtonSpec 
						#layout: #(Rectangle 54 27 96 49) 
						#name: #ActionButton5 
						#model: #resetBitmapSize 
						#label: '100%' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 13 28) 
						#name: #Label10 
						#label: 'reset') #(ActionButtonSpec 
						#layout: #(Rectangle 54 0 96 22) 
						#name: #ActionButton4 
						#model: #magnifyBitmap 
						#label: 'x 2' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 0 1) 
						#name: #Label8 
						#label: 'magnify')) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 8 20 104 95) 
						#name: #Composite1))) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 426 267 534 368) 
					#name: #CacheBitmap)))))
]

{ #category : #adding }
CMSpecPovSetter_Agent >> addSameSymbolAs: aSymbolString ofEntity: aClass [
	
	| aString |
	(aString := self addSymbolPov) ifNotNil: [
		selectedClass povDict
			at: aString asSymbol
			put: (aClass povDict at: aSymbolString asSymbol) copy.
		self updateMenuAddSameAs.
		self listSymbolsChanged ]
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> addSubMenuSymbolSameAsTo: aMenuBuilder from: aListOfStrings for: aClass [
	"a selection of an item calls the method addSameSymbolAs: aSymbol ofEntity: aClass"
	
	aMenuBuilder beginSubMenuLabeled: aClass name asString.
	aListOfStrings
		do:
			[:aSymbolString | 
			aMenuBuilder
				addLabel: aSymbolString
				value: [self addSameSymbolAs: aSymbolString ofEntity: aClass]].
	aMenuBuilder endSubMenu.
	aMenuBuilder line
]

{ #category : #action }
CMSpecPovSetter_Agent >> addSymbolPov: aString [
	
	(super addSymbolPov: aString) ifNotNil: [self updateMenuAddSameAs].
	^aString
]

{ #category : #changed }
CMSpecPovSetter_Agent >> colorChanged [
	
	| color |
	color := super colorChanged.
	self imageOS model color: color.
	imageOS figure fillColor: color.
	imageOS invalidate
]

{ #category : #image }
CMSpecPovSetter_Agent >> filledPolygon [
	
	imageOS model isStroked: false.
	self updateMenuImage.
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> initMenuAddSameAs [
	"a selection of one of this item create a new symbol which shape is a copy of the selected item"
	
	| aMenuBuilder ve listOfSymbolsString |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuSymbolSameAsTo: aMenuBuilder
		from: self listSymbols list
		for: selectedClass.
	ve := self visualizedEntities.
	ve remove: selectedClass.
	ve
		do:
			[:aClass | 
			listOfSymbolsString := List new.
			aClass povDict keys do: [:aS | listOfSymbolsString add: aS asString].
			self addSubMenuSymbolSameAsTo: aMenuBuilder from: listOfSymbolsString
				for: aClass].
	self menuAddSameAs addPart: aMenuBuilder menu.
	self menuAddSameAs hideItem: (self menuAddSameAs menuItemLabeled: 'bidon')
]

{ #category : #'initialize-release' }
CMSpecPovSetter_Agent >> initialize [
	super initialize.
	tailleHolder := 1" asValue".
	"tailleHolder onChangeSend: #sizeSliderChanged to: self.
	tailleSlider := RangeAdaptor on: tailleHolder start: 0.1 stop: 1 grid: 0.1.
	self occupantPosition onChangeSend: #positionChanged to: self"
]

{ #category : #aspects }
CMSpecPovSetter_Agent >> isDistortable [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^isDistortable isNil
		ifTrue: [isDistortable := false asValue]
		ifFalse: [isDistortable]
]

{ #category : #image }
CMSpecPovSetter_Agent >> lineWidth [
	
	| n |
	n := Cormas current
		request: 'Epaisseur du Trait : '
		initialAnswer: imageOS model lineWidth displayString.
	imageOS model lineWidth: n asNumber.
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate
]

{ #category : #changed }
CMSpecPovSetter_Agent >> listSymbolsChanged [
	
	| anImage aColor |
	self listSymbols selection ifNil: [^nil].
	anImage := selectedClass imageAtPov: listSymbols selection asSymbol.
	imageOS model: anImage copy.	"The model is the copy of the stored image and is be used to store the parameters of the bitmapPov"
	imageOS figure: imageOS model asFigure.	"imageOS figure is resized according to the sizeRatio of the image. It is used for the display on the povSetter view"
	self tailleSlider value: anImage sizeRatio.
	self isDistortable value: anImage isDistortable.
	anImage isBitmapPOV
		ifTrue: [(self builder componentAt: #CacheBitmap) beVisible]
		ifFalse:
			[aColor := anImage color.
			imageOS model color: aColor.
			self updateSlidersFromColor: aColor.
			(self builder componentAt: #CacheBitmap) beInvisible.
			(self builder componentAt: #tailleSlider) beVisible].
	self occupantPosition value: anImage position.
	imageOS invalidate
]

{ #category : #actions }
CMSpecPovSetter_Agent >> magnifyBitmap [
	"imageOS figure cache magnifiedBy: 2 @ 2."
	
	(imageOS figure scaleByWithAnswer: 2) ifFalse: [^self].	"pour les bitmap, un petit changement ne produit pas de d√©formation du bitmap, et il n efaut donc pas changer le size Ratio"
	self positionChanged.	"ici on recacul la position en fonction de la position sp√©cifi√© sur l''interface"
	imageOS model sizeRatio: 2.
	self builder ifNil: [^self].
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate.
	(self builder componentAt: #CacheBitmap) beVisible.
	(self builder componentAt: #tailleSlider) beInvisible
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> menuAddSameAs [
	"return a Menu : #menuSymbolePDV menu"
	
	^((self builder menuAt: #menuSymbolePDV) value atNameKey: #addSymbolSameAs)
		submenu
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> menuDefaultColor [
	"return a Menu : #menuSymbolePDV menu"
	
	^((self builder menuAt: #menuSymbolePDV) value atNameKey:
			#submenuSetDefaultColor) submenu
]

{ #category : #actions }
CMSpecPovSetter_Agent >> modifyPov: povName [
	
	selectedClass
		compile:
			(povName asString ,
					'\"return a symbol that is associated to an image"\   ^#aSymbol\')
				withCRs
		classified: 'pov'
		notifying: nil.
	self editMethod: povName fromClass: selectedClass
]

{ #category : #image }
CMSpecPovSetter_Agent >> nbSegments [
	
	| n |
	(n := Cormas current
		request: 'Nombre de Segments : '
		initialAnswer: imageOS model nbSegments displayString) isEmpty
		ifFalse:
			[imageOS model nbSegments: n asNumber.
			(self builder componentAt: #boutonAppliquer) enable.
			imageOS invalidate]
]

{ #category : #aspects }
CMSpecPovSetter_Agent >> occupantPosition [
	
	^occupantPosition isNil
		ifTrue: [occupantPosition := #center asValue]
		ifFalse: [occupantPosition]
]

{ #category : #editor }
CMSpecPovSetter_Agent >> openBitmapImageEditor [
	
	| editor |
	editor := ImageEditor openOnClass: self class.
	editor observer: self.
	editor loadCurrentImage
]

{ #category : #'image library' }
CMSpecPovSetter_Agent >> openBitmapLibrary [
	
	| lib |
	BitmapImageLibrary imLibPage: 1.
	lib := BitmapImageLibrary new.
	lib observer: self.
	lib open
]

{ #category : #editor }
CMSpecPovSetter_Agent >> openVectorImageEditor [
	
	| editor |
	"editor := VectorialImageEditor example."
	editor := VectorialImageEditor open.
	editor observer: self.
	editor loadCurrentImage
]

{ #category : #'image library' }
CMSpecPovSetter_Agent >> openVectorialLibrary [
	
	| lib |
	VectorialImageLibrary imLibPage: 1.
	lib := VectorialImageLibrary new.
	lib observer: self.
	lib open
]

{ #category : #changed }
CMSpecPovSetter_Agent >> positionChanged [
	"Display the figure at the right position on the virtualCell"
	
	| figurePosition |
	imageOS model position: occupantPosition value.
	self builder ifNil: [^self].
	(self builder componentAt: #virtualCell) bounds.
	(self builder componentAt: #boutonAppliquer) enable.	"figurePosition := imageOS figure calculateNewPositionOnPatchBounds: ((self builder componentAt: #virtualCell) bounds moveTo: -17 @ -19)."
	occupantPosition value = #topLeft ifTrue: [figurePosition := -17 @ -17].
	occupantPosition value = #leftCenter ifTrue: [figurePosition := -17 @ 0].
	occupantPosition value = #bottomLeft ifTrue: [figurePosition := -17 @ 17].
	occupantPosition value = #topRight ifTrue: [figurePosition := 17 @ -17].
	occupantPosition value = #rightCenter ifTrue: [figurePosition := 17 @ 0].
	occupantPosition value = #bottomRight ifTrue: [figurePosition := 17 @ 17].
	occupantPosition value = #topCenter ifTrue: [figurePosition := 0 @ -17].
	occupantPosition value = #center ifTrue: [figurePosition := 0 @ 0].
	occupantPosition value = #bottomCenter ifTrue: [figurePosition := 0 @ 17].
	occupantPosition value = #random ifTrue: [figurePosition := 4 @ 6].
	occupantPosition value = #border_topLeft
		ifTrue: [figurePosition := -25 @ -25].
	occupantPosition value = #border_leftCenter
		ifTrue: [figurePosition := -25 @ 0].
	occupantPosition value = #border_bottomLeft
		ifTrue: [figurePosition := -25 @ 25].
	occupantPosition value = #border_topRight
		ifTrue: [figurePosition := 25 @ -25].
	occupantPosition value = #border_rightCenter
		ifTrue: [figurePosition := 25 @ 0].
	occupantPosition value = #border_bottomRight
		ifTrue: [figurePosition := 25 @ 25].
	occupantPosition value = #border_topCenter
		ifTrue: [figurePosition := 0 @ -25].
	occupantPosition value = #border_bottomCenter
		ifTrue: [figurePosition := 0 @ 25].
	imageOS figure isBitmapFigure
		ifTrue: [imageOS figure translateTo: figurePosition]
		ifFalse:
			["it is a vectorialFigure"
			imageOS figure
				translateTo: figurePosition - (imageOS figure bounds extent / 2)].
	imageOS invalidate
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_Agent >> removeClassMethodForSymbol: aSymbol [
	
	imageOS model copy isBitmapPOV
		ifTrue:
			[selectedClass class removeSelector: ('BitmapPOV_' , aSymbol) asSymbol.
			selectedClass class removeSelector: (aSymbol , 'BitmapImage') asSymbol]
		ifFalse:
			[selectedClass class removeSelector: ('VectorialPOV_' , aSymbol) asSymbol]
]

{ #category : #action }
CMSpecPovSetter_Agent >> removeSymbolPov [
	
	| aString |
	aString := super removeSymbolPov.
	aString
		ifNotNil:
			[selectedClass povDict
				removeKey: aString asSymbol
				ifAbsent: [nil].
			self updateMenuAddSameAs]
]

{ #category : #actions }
CMSpecPovSetter_Agent >> resetBitmapSize [
	
	self listSymbolsChanged
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> saveBitmapImage: aPOV in: aClass [
	"Dans le cas d'image Bitmap, l'image est sauvegard√©e au niveau de la classe de l'entit√© /// protocol 'images - bitmap'
(dans le cas d'un VectorialPOV, la sauveagrde se fait au niveau du fichier ev, dans le cas on inscrit l'ensemble des attributs de l'image).
Par contre l'attribut position du POV, m√™me pour un POV d type Bitmap image,est sauvegard√© adans le fichier ev "
	
	| image s class imageName |
	aPOV isBitmapPOV
		ifTrue:
			[image := aPOV bitmap.
			class := aClass class.
			imageName := self listSymbols selection , 'BitmapImage'.
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
				classified: #'images - bitmap']
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_Agent >> saveBitmapImage: aPOV intoClass: aClass symbol: aSymbol [
	"Dans le cas d'image Bitmap, l'image est sauvegard√©e au niveau de la classe de l'entit√© /// protocol 'images - bitmap'
(dans le cas d'un VectorialPOV, la sauveagrde se fait au niveau du fichier ev, dans le cas on inscrit l'ensemble des attributs de l'image).
Par contre l'attribut position du POV, m√™me pour un POV d type Bitmap image,est sauvegard√© adans le fichier ev "
	
	| image s class imageName |
	aPOV isBitmapPOV
		ifTrue:
			[image := aPOV bitmap figure image.
			class := aClass class.
			imageName := aSymbol , 'BitmapImage'.
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
				classified: 'pov symbols']
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_Agent >> saveBitmapPOV: aPOV intoClass: aClass symbol: aSymbol [
	
	| selector |
	selector := 'BitmapPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Situated entity bitmap pov symbol in the following order:\(position)\The bitmap itself corresponding to the symbol is in the selector '
				, aSymbol printString , 'BitmapImage"\^Array with: '
				, aPOV position printString) withCRs
		classified: 'pov symbols'
		notifying: nil.
	self saveBitmapImage: aPOV intoClass: aClass symbol: aSymbol
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_Agent >> savePOVsymbol: aSymbol [
	
	| aPOV |
	aPOV := imageOS model copy.
	aPOV isBitmapPOV
		ifTrue:
			[self
				saveBitmapPOV: imageOS model copy
				intoClass: selectedClass
				symbol: aSymbol.
			selectedClass class removeSelector: ('VectorialPOV_' , aSymbol) asSymbol]
		ifFalse:
			[self
				saveVectorialPOV: imageOS model copy
				intoClass: selectedClass
				symbol: aSymbol.
			selectedClass class removeSelector: ('BitmapPOV_' , aSymbol) asSymbol.
			selectedClass class removeSelector: (aSymbol , 'BitmapImage') asSymbol]
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_Agent >> saveVectorialPOV: aPOV intoClass: aClass symbol: aSymbol [
	
	| selector |
	selector := 'VectorialPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:\(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable." \^#('
				, aPOV color red printString , ' ' , aPOV color green printString , ' '
				, aPOV color blue printString , ' ' , aPOV lineColor red printString ,
					' ' , aPOV lineColor green printString , ' '
				, aPOV lineColor blue printString , ' ' , aPOV lineWidth printString ,
					' ' , aPOV sizeRatio printString , ' ' , aPOV position printString ,
					' ' , aPOV outline vertices printString , ' '
				, aPOV isDistortable printString , ')') withCRs
		classified: 'pov symbols'
		notifying: nil
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> setDefaultColor [
	
	| aCV green red blue |
	aCV := PovSetter colorChooser.
	aCV ifNil: [^nil].
	green := aCV green.
	red := aCV red.
	blue := aCV blue.
	selectedClass class
		compile:
			('defaultColor 
				\^ColorValue red: ' , red printString , ' green: ' , green printString
				, ' blue: ' , blue printString) withCRs
		classified: 'pov symbols'
		notifying: nil
]

{ #category : #'initialize-release' }
CMSpecPovSetter_Agent >> setListSymbols [
	
	| liste |
	listSymbols selectionIndexHolder onChangeSend: #listSymbolsChanged to:
			self.
	liste := OrderedCollection new.
	liste addAll: (selectedClass povDict keys collect: [:pov | pov asString]).
	(liste includes: selectedClass name asString)
		ifFalse: [liste addFirst: selectedClass name asString].
	self listSymbols list: liste sort.
	liste isEmpty ifFalse: [listSymbols selection: listSymbols list first]
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> setModelClass: aClass [
	
	super setModelClass: aClass.	"set the background color adapted to class"
	(aClass inheritsFrom: CMAgent)
		ifFalse:
			[(self builder componentAt: #fond) component component
				insideColor: (Color red: 1.0 green: 0.624954 blue: 0.250031)].
	self initMenuAddSameAs
]

{ #category : #editor }
CMSpecPovSetter_Agent >> setNewBitMapImage [
	
	self setNewBitmapImage: self class cachedImage asImage
]

{ #category : #editor }
CMSpecPovSetter_Agent >> setNewBitmapImage: anImage [
	
	| im |
	"on adapte le slider avant de coller l'image dans imageOS"
	"tailleHolder value: ((im preferredBounds extent x / self imageOS bounds extent x 
				max: im preferredBounds extent y / self imageOS bounds extent y) min: 2)."
	tailleHolder value: 1.
	im := anImage.	"si image trop grande, on la r√©tr√©cit"
	[im preferredBounds extent > (self imageOS bounds extent * 1.5)]
		whileTrue:
			[im := im shrunkenBy: 2 @ 2.
			tailleHolder value: tailleHolder value / 2].
	imageOS model: (BitmapPOV newFrom: im).
	imageOS figure: imageOS model asFigure.
	(self builder componentAt: #boutonAppliquer) enable.
	(self builder componentAt: #isDistortable) disable.
	(self builder componentAt: #CacheBitmap) beVisible.
	imageOS invalidate
]

{ #category : #editor }
CMSpecPovSetter_Agent >> setNewVectorialImage: aPOV [
	
	(aPOV isKindOf: VectorialPOV) ifFalse: [^nil].
	aPOV
		scaledBy:
			PovSetter standardCellBounds extent
				/ (aPOV bounds extent x max: aPOV bounds extent y).
	imageOS model: aPOV.
	imageOS figure: imageOS model asFigure.
	self tailleSlider value: aPOV sizeRatio.	"on met le tailleSlider √† 100% sans alerter les listeners"
	couleur := imageOS model color.
	self updateSlidersFromColor: couleur.
	(self builder componentAt: #boutonAppliquer) enable.
	(self builder componentAt: #isDistortable) enable.
	(self builder componentAt: #CacheBitmap) beInvisible.
	(self builder componentAt: #tailleSlider) beVisible.
	imageOS invalidate
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> setSymbolAsDefaultImage [
	"selectedClass povDict at: listSymbols selection asSymbol"
	
	(self cormas confirm:
			'The selected image will be the shape for the next symbols of the class')
		ifFalse: [^nil].
	listSymbols selection isNil
		ifTrue: [^self cormas warn: 'Please, select a symbol'].
	((selectedClass povDict at: listSymbols selection asSymbol) isKindOf:
			BitmapPOV)
		ifTrue: [^self cormas warn: 'Cannot define a shape from a bitmap'].
	selectedClass class
		compile:
			('defaultImage' ,
					'\"returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"\^((self povDict at: #'
				, listSymbols selection , ' ifAbsent:[super defaultImage]) copy')
				withCRs
		classified: 'pov symbols'
		notifying: nil
]

{ #category : #actions }
CMSpecPovSetter_Agent >> shrunkeBitmap [
	
	(imageOS figure scaleByWithAnswer: 0.5) ifFalse: [^self].	"pour les bitmap, un petit changement ne produit pas de d√©formation du bitmap, et il n efaut donc pas changer le size Ratio"
	self positionChanged.	"ici on recacul la position en fonction de la position sp√©cifi√© sur l''interface"
	imageOS model sizeRatio: 0.5.
	self builder ifNil: [^self].
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate.
	(self builder componentAt: #CacheBitmap) beVisible.
	(self builder componentAt: #tailleSlider) beInvisible
]

{ #category : #changed }
CMSpecPovSetter_Agent >> sizeSliderChanged [
	
	tailleHolder value = imageOS model sizeRatio ifTrue: [^self].	"on est oblig√© de repartir de la figure de d√©part pour pas perdre la r√©solution du bitmap de d√©part
Lorsqu''on part de la figure de d√©part la position est au milieu sur la vue du povSetter. Il faut donc appeler un positionChanged ; mais on fait cela apr√®s avoir ajuster la taille au sizeRatio demand√©"
	imageOS figure: imageOS model asFigure.	"newScale = newValue / oldValue"
	(imageOS figure
		scaleByWithAnswer: tailleHolder value / imageOS model sizeRatio)
		ifFalse: [^self].	"pour les bitmap, un petit changement ne produit pas de d√©formation du bitmap, et il n efaut donc pas changer le size Ratio"
	self positionChanged.	"ici on recacul la position en fonction de la position sp√©cifi√© sur l''interface"
	imageOS model sizeRatio: tailleHolder value.
	self builder ifNil: [^self].
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate
]

{ #category : #image }
CMSpecPovSetter_Agent >> strokedPolygon [
	
	self imageOS model isStroked: true.
	self updateMenuImage.
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate
]

{ #category : #aspects }
CMSpecPovSetter_Agent >> tailleSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^tailleSlider isNil
		ifTrue: [tailleSlider := 0 asValue]
		ifFalse: [tailleSlider]
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> updateMenuAddSameAs [
	"a selection of one of this item create a new symbol which shape is a copy of the selected item"
	
	self visualizedEntities
		do:
			[:aClass | 
			self menuAddSameAs
				removeItem: (self menuAddSameAs menuItemLabeled: aClass name asString)].
	self initMenuAddSameAs
]

{ #category : #image }
CMSpecPovSetter_Agent >> updateMenuImage [
	
	| menu |
	menu := (self builder componentAt: #imageOS) widget controller menu.
	imageOS model isStroked
		ifTrue:
			[(menu menuItemAt: 1)
				beOn;
				enable.
			(menu menuItemAt: 2)
				beOff;
				enable]
		ifFalse:
			[(menu menuItemAt: 1)
				beOff;
				enable.
			(menu menuItemAt: 2)
				beOn;
				enable].
	(menu menuItemAt: 3) enable.
	(menu menuItemAt: 4) enable.
	(self builder componentAt: #tailleSlider) enable
]

{ #category : #action }
CMSpecPovSetter_Agent >> validate [
	
	| selectedSymbol aPOV |
	listSymbols selection
		ifNil: [ ^ self alertMessage: self translator tSelectPoVSymbol ]
		ifNotNil: [:aSelec | selectedSymbol := aSelec asSymbol].
	aPOV := imageOS model.	"copy"
	(aPOV isKindOf: BitmapPOV)
		ifFalse: [
			aPOV scaledBy: imageOS model sizeRatio.
			aPOV sizeRatio: nil.
			aPOV isDistortable: self isDistortable value ]
		ifTrue: [ aPOV bitmap: imageOS figure bitmap copy ].
	selectedClass povDict at: selectedSymbol put: aPOV.	"on met √† jour le dico povDict"
	self savePOVsymbol: selectedSymbol.	"on sauvegarde au niveau de la classe de l''entit√©"	""	"on demande aux agents de rafraichir leur afficage pour ce povResult"
	self cormas currentSimulation
		ifNotNil: [ : sim | 
			(sim allTheEntities: selectedClass) do: [ : entity | 
				sim
					registerEntityChange: #povSymbolChanged
					with: selectedSymbol
					from: (EntityReference on: entity) ] ].	"ne fonctionne pas lorsque le povResult est un povId ou un povEnergy ; c''est √† dire un pov dont la couleur est calcul√©, car ds ce cas le povResult est une couleur au 	niveau de la figure alors que c''est le povName sumbol (povId) pour l''entityPov"
	self tailleSlider value: 1
]

{ #category : #'menu-symbol' }
CMSpecPovSetter_Agent >> visualizedEntities [
	
	| ve |
	ve := self cormas currentModel visualizableClasses.
	ve removeAll: self cormas currentModel spatialClasses.
	ve removeAllSuchThat: [:c | c inheritsFrom: CMArcEntity].
	^ve
]
