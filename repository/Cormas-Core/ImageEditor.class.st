Class {
	#name : #ImageEditor,
	#superclass : #Object,
	#instVars : [
		'observer'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #resources }
ImageEditor class >> cachedImage [
	"CormasNS.Kernel.ImageEditor new openOnClass: self andSelector: #cachedImage"
	
	<resource: #image>
	^Image
		extent: 31 @ 34
		depth: 10
		bitsPerPixel: 16
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7548 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 770 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7548 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3180 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4047 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 3950 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 3822 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7901 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2312 2601 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(835 2601 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 4304 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 2858 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 2794 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7420 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7548 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 2120 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 2698 2569)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 1927 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 963 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7644 3693 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(899 2601 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 4047 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4753 1638 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7580 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7580 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 2152 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7548 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7580 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5332 7002)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 1509 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 2601 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 2762 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 1670 1895)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 6552 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5300 1477 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 610 642)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1638 3115 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 2152 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 4207 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 5332 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 4368 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 4368 1638)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3469 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6295 1124 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7548 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7612 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 546 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 6070 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 1991 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 4015 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7741)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 2601 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3726 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3469 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3790 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 2601 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7612 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7580 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 4561 5685)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 2087 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 2666 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 2633 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 1220 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 4336 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 4593 6006)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7580 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7612 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 2730 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 835 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 7805 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(931 3115 4336)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2184 3790 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 1156 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1573 4336 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6327 1188 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 3019 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7612 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 7323 7773)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 7580 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 2184 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 192 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 5171 6617)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 3822 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3019 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 2890 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 2987 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 7677 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 546 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7612 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7644 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 4015 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 4368 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7709 3854 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 7934 7677)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3533 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 2698 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 2698 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4304 1959 2184)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 610 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4689 1830 1927)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4240 1991 2216)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 3180 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4786 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7677 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 2601 3693)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(385 2216 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 610 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 7709 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7612 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 2087 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 4079 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7741 3854 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 2698 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 2666 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3083 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4818 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7612 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7644 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 578 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7644 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 2120 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 2730 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 4497 2280)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 1252 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1381 4368 2762)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4079 5171 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4207 5139 5974)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 3019 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7644 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7677 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(417 2248 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 610 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 1766 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 2698 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 2730 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 1573 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 6681 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 3180 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7644 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 7741 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7677 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 2184 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 578 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5717 642 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4529 2890 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 4497 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 2184 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 2730 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 1381 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4786 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7677 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 7741 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7677 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 770 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 2955 4207)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 610 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3758 3758 3790)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4207 5749)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4240 5717)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 1573 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 1798 4079)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 4625 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7773 3950 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 2280 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 2730 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 2216 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3983 2216 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7612 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7741 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7644 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7709 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 1734 2087)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 3276 2312)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 610 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4400 3437 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3629 5010)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 3180 4497)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2794 4786)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1027 2762 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 1316 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 2216 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7644 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 7677 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7709 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5942 578 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4882 6488)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3950 4464 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 7259 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6456 7227 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 1895 1766)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2762 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 642 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 3372 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 7709 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 3340 1991)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 2441 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3276 1092)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 2280 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4175 5878)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 4015 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1477 4432 2794)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2762 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 6713 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 1381 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1670 4497 2537)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3726 2505 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 2312 2505)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 3147 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4882 6552)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7709 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7259 7741 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 610 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5846 835 674)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 3565 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4914 6520)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 2248 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 7098 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4304 5781)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4240 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7805 4047 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3533 3372 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 2762 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 2794 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4015 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 1541 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 3372 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3340 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7355 3180 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 610 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 2023 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 7259 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 1830 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2441 4464 1863)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 2794 4850)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 2794 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 4497 3180)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 3693 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 7741 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 770 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 2312 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 7291 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3051 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3533 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3693 5107)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 1316 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 1670 706)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4946 6584)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 3533 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 2312 4368)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1156 3822 2473)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 610 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(513 2344 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 417 513)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2216 2376 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2087 2344 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(128 1863 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5974 738 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 674 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4368 5846)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7291 7130)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6520 1477 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6392 1670 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4143 256 385)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3372 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 3276 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7709 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 706 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 674 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 642 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 610 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 3629 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 3533 3404)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 7195 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 3276 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2409 3758 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7677 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7291 7644 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5267 385 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4946 5814 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3212 4400 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3758 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1188 2826 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 3565 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3533 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5010 6649)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 3661 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3404 1124)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4882 1477 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(610 2376 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 674 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7387 7709 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 7709 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5814 803 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 803 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 2152 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 7355 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 7291 7291)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 2858 4882)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 2826 4914)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6038 1734 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1541 4561 2858)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(995 4753 5942)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7548 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 2376 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7709 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1124 4079 2409)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 706 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 835 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5781 803 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7323 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 449 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 4914 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 1573 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6584 1541 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(963 4721 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3180 2794 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3244 2762 2987)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7580 7548)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 2376 4464)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 738 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 674 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5878 803 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5910 738 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6424 3083 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2280 3533 4561)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7227 2409 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 1991 1509)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 1959 1573)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4497 128 321)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3629 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 3758 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3340 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7741 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1252 4047 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(642 3051 3983)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1316 4015 2344)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 706 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 738 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7420 7741 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 2473 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3372 3469 3565)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5524 256 546)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3501 1509 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1734 4689 2633)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6488 1670 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 4207 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4272 289 417)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3661 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3629 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5075 6713)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 3404 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1027 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2633 3886 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 803 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 6360 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 931 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 2409 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 2505 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6970 2601 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 321 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 4400 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7452 7773 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 2441 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(32 3180 4529)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 835 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 2441 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 803 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3854 5267)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 1734 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2826 3019 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2666 1349 1027)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3693 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3726 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6938 3501 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5107 6745)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7773 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 2441 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 803 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 6295 6809)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 1316 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5332 1092 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6713 2505 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 2505 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 2569 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7066 2505 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 7355 7259)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 4721 1702)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1284 2923 4946)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1092 4689 3372)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3758 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5107 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 3629 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 7837 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(738 2441 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7805 7484)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7612 7612)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7644 7580)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 96 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5460 1060 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 2473 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 7387 7355)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2858 3051 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3469 4304 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4368 289 449)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3790 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5139 6777)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3758 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3790 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3147 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 3533 3501)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 899 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 3918 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3822 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7837 7420)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 7516 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3051 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 3790 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3790 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3758 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3822 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6809 3854 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1413 4079 2376)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3276 4593)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7516 3469 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7837 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7837 7516)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5171 1445 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3308 4464 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 2666 995)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6617 1766 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2890 3083 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1445 4786 3019)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(674 4978 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7484 7580 7805)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 7869 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6135 995 770)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 2505 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 867 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4561 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1991 3469 5171)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7452 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 7420 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 7452 7323)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5107 5942 6392)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 4400 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2923 3083 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 1734 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3886 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3822 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7869 7452)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 3758 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3147 3597 1188)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6103 1092 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3276 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3308 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1220 4272 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 2505 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1060 4143 2730)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 2505 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 931 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(96 4497 6070)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5396 1124 1413)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5235 1252 1445)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5749 481 353)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5621 353 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(256 2055 4272)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 7677 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1252 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3404 4432 1477)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3083 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 1734 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4914 128 192)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 3790 1381)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 7677 7644)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3693 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3340 4625)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3276 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(770 2505 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 2666 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2955 3115 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1863 4786 2698)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6841 3950 1284)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5235 6841)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 4111 1220)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7548 3565 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2730 4015 5332)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3244 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3340 4657)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(706 3244 4047)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6199 1220 578)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6167 963 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 931 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 2730 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6906 7484 7227)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(2987 3115 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6874 3983 1252)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6070 1220 738)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1830 2955 3244)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3276 4753)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 2537 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 963 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6777 2666 1316)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4625 6135)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7484 7163)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3437 4015 3308)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5589 481 610)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 5942 6424)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 2762 899)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4432 5492 6295)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7580 3597 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3372 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(803 2569 4689)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3822 0 160)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4625 6167)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7516 7066)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 3147 2055)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(481 2055 4175)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3019 3147 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5267 6906)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3372 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(64 3212 4818)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6231 1027 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5075 1413 1606)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7098 7516 7098)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7484 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3051 3147 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 4015 5460)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6681 1927 867)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6649 1895 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6006 2120 1349)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 3404 4721)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 1027 835)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5043 1413 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5010 1445 1670)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7163 2762 931)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7002 7548 7195)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3083 3147 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 1477 3950)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4464 5524 6327)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7612 3661 963)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(1509 4207 2441)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6263 1092 803)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5203 1413 1541)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5685 6488 6874)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(4721 1606 1830)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3886 5043 6038)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6745 2858 1284)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@@@AM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@@@@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SP@@@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@@@AM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@@@@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SPAM@D4@SP@@@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[LA,0F3@[L@@@CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@LL@00CC@@@@@0@C@@L@$@AT@WX@A AZ@F8@[ @1@@TA0 FG@ZL@5PF.@T8A10G]@ $@J C3@@PA@ G8@GL@= E]@X A]0@@@@L@@0@C@DLA$PAK@P\A"PGD@](A)@E5@X\A!0F%@Y8AP0G3@_PA2@HI@CTA\@CY@ L@.PFW@A0@I0F2@R4@@@HZ@!(BF @<@VT@B0BI@NDAF EI@U,A]PFV@ZTA) G#@N0@<PG(@\ B@@A^@!@A.@CV@^PBB@CP@\8@P@AQ@@@BF HZ@!(@D@D&@_\@\ C"@Q,AW@E4@Y A&PGA@_D@I A[@P8A[@F(@^$@+0B^@FXAG@BU@LX@< HJ@K@AQ@@@@ <BC0AG@M0@9PE?@"P@YPC@@O\AGPEJ@Y4A9P@(@JDAM0E)@^(A7 HT@Q @''PCZ@ZH@Q @H@JLAQ EX@OP@@@HO@ <@JPFD@ID@. @4@LPAG GE@CX@70EY@YPA/ GV@Z4AE0F[@Y(@& A(@H4@*0D_@A4A\PA-@TTA @E&@@@BA0HG@P<@''@B\@I0@''@B\@I0@''@B\@I0@''@B\@I0@''@B\@_(@0 @R@HL@?@GQ@I$A:0C5@BTAY0AU@NL@80@@@ \BA0B\@@\@;PCQ@Z(A00GC@\LA00GC@[PA''0FJ@X(@WPB\@]0A6PE(@_,@H0CT@_HAAPAO@_4AB@G&@_<@@@HG@ \@''@B(@R\A;0A=@F$A=PDY@R$AJPD)@@$AJ CA@W @''@C(@DPA4 @.@F(@; GF@N@@N0G.@U8@T A/@@@A<@G0@I0@"0C&@ST@Y0@/@KDB@PBE@G$@! E+@CL@" EL@I0@^ B_@UT@] B[@P@A-PBT@!DA PDQ@E0@10@@@_@A<@B\@J\@6@DP@XL@@@H#@R@@, B>@K8A^PA_@GPAL@B\@\$@?PAP@K @40DJ@Y0@O F/@N<@_0@S@M,@@@G!@^D@''@AV@K,@<@@W@VH@7PB$@K8@/ C^@X,@\@AN@QL@''@D1@ TAV AW@NPA@PE-@!<AN@A8@! A*PB"@@@A8PG!@I0@Z0B<@Z@@2 FE@F@@2PB>@C4@E@E.@GD@K@DS@I0ASPC9@K<AEPC:@P,AXPHK@L,@DPFB@L<BGP@@@]\A50B\@J$AJ@F:@QHA- C)@KHA2 D/@A8@C0@7@DDAD0B\@T<A20E3@T @# DL@S<A= A;@] @50@L@T,@@@GW@]\@''@B5@[,BHPGL@N(@, GJ@]LAE @!@N\@>@AN@QL@''@F''@@(@? HB@SXAC@D2@[\@R@D9@C@AT0A?@@@A/0F?@I0@% G9@!0@>0C*@APA40A>@ PBCPF=@ X@PPD"@I0BG @?@J0A#0FU@J4AT@E:@!T@,0G@@IHA8@@@@[<A/0B\@KXBC G>@HH@$0GS@C(BCP@X@@H@F G<@F0AT B\@D$@_@@U@FHAA BO@T@ATPGM@B,AA@HR@LT@@@F0@[@@''@DT@@4A^0@Y@]<AO DC@E BFP@N@DH@]PB@@V(@''@CL@L @:0EV@@DAW0DM@RDBH@G,@D(AJ0HS@@@A,@F0@I0ABPF<@A,A.PH[@BP@VPBA@B4@N@AL@G\@#@FL@I0AU0D,@S(@G0GO@]@ACPDM@B@A[0G-@H\AQ0@@@ZDA(PB\@RLA$ @9@XLAX@C''@^\@"@BW@I @-0B*@MHA*0B\@^HA,PFF@ELBE HW@P4ACPA!@TDAT@@"@K4@@@F!@ZD@''@AE@VLA#PD=@R8A5@E<@X8A60FN@X8A# FN@CH@''@F,@L4A_PD3@AXBH DM@P4@-@EB@P4BC@A#@@@A$0FS@UP@''@B\@I0@''@B\@I0@''@B\@I0@''@B\@I0@''@B\@J8A_ D;@VPAI@B%@JXAIPFP@S0A5PD4@FP@3 @@@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YLA$0FS@YL@@@E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@@@A\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ @@@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WHA\ E2@WH@@@@a')
]

{ #category : #new }
ImageEditor class >> openOnClass: aClass [
	
	| editor |
	editor := self new.
	editor targetClass: aClass.
	self openOn: editor.
	^editor
]

{ #category : #image }
ImageEditor class >> photoIcon [
	
	^SpaceInterface iconPhoto
]

{ #category : #'interface specs' }
ImageEditor class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ImageEditor 
				#defaultString: 'Image Editor' 
				#catalogID: #UIPainter) 
			#min: #(Point 395 244) 
			#max: #(Point 1152 864) 
			#bounds: #(Rectangle 777 287 1212 686) 
			#flags: 4 
			#menu: #maskEditorMenu) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 43 0 61 0 0 0.204598 101 0) 
				#name: #readButton 
				#model: #grab 
				#tabable: false 
				#helpText: 'Select a part of the screen' 
				#label: #photoIcon 
				#hasCharacterOrientedLabel: false 
				#isDefault: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.749425 0 0 0 1.0 32 0) 
				#name: #installButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#model: #install 
				#tabable: false 
				#label: #(UserMessage 
					#key: #InstallDot 
					#defaultString: 'Install')) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.503448 0 0 0 0.751724 32 0) 
				#name: #loadButton 
				#model: #load 
				#tabable: false 
				#label: #(UserMessage 
					#key: #LoadDot 
					#defaultString: 'Load...' 
					#catalogID: #UIPainter)) #(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -44 1 -204 1 -24 1) 
				#name: #redButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red) 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #doRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -44 1 -164 1 -24 1) 
				#name: #yellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #doYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -44 1 -124 1 -24 1) 
				#name: #greenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #green) 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #doGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -44 1 -84 1 -24 1) 
				#name: #cyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #cyan) 
					#setSelectionBackgroundColor: #(ColorValue #cyan)) 
				#model: #doCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -44 1 -44 1 -24 1) 
				#name: #blueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #blue) 
					#setSelectionBackgroundColor: #(ColorValue #blue)) 
				#model: #doBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -44 1 -4 1 -24 1) 
				#name: #magentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #magenta) 
					#setSelectionBackgroundColor: #(ColorValue #magenta)) 
				#model: #doMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -44 1 -244 1 -24 1) 
				#name: #greyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #lightGray) 
					#setSelectionBackgroundColor: #(ColorValue #lightGray)) 
				#model: #doGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -24 1 -4 1 -4 1) 
				#name: #darkMagentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkMagenta) 
					#setSelectionBackgroundColor: #(ColorValue #darkMagenta)) 
				#model: #doDarkMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -24 1 -204 1 -4 1) 
				#name: #darkRedButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkRed) 
					#setSelectionBackgroundColor: #(ColorValue #darkRed)) 
				#model: #doDarkRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -24 1 -164 1 -4 1) 
				#name: #darkYellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #olive) 
					#setSelectionBackgroundColor: #(ColorValue #olive)) 
				#model: #doDarkYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -24 1 -124 1 -4 1) 
				#name: #darkGreenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkGreen) 
					#setSelectionBackgroundColor: #(ColorValue #darkGreen)) 
				#model: #doDarkGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -24 1 -84 1 -4 1) 
				#name: #darkCyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkCyan) 
					#setSelectionBackgroundColor: #(ColorValue #darkCyan)) 
				#model: #doDarkCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -24 1 -44 1 -4 1) 
				#name: #darkBlueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #navy) 
					#setSelectionBackgroundColor: #(ColorValue #navy)) 
				#model: #doDarkBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -24 1 -244 1 -4 1) 
				#name: #darkGreyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #gray) 
					#setSelectionBackgroundColor: #(ColorValue #gray)) 
				#model: #doDarkGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -44 1 -284 1 -24 1) 
				#name: #whiteButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #doWhite 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -24 1 -284 1 -4 1) 
				#name: #blackButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #black)) 
				#model: #doBlack 
				#tabable: false) #(InputFieldSpec 
				#layout: #(LayoutFrame 4 0 -44 1 -324 1 -4 1) 
				#name: #currentColorID 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black)) 
				#model: #doTheCurrentColor 
				#tabable: false 
				#isReadOnly: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 3 0 -72 1 55 0 -48 1) 
				#model: #fillCurrentColor 
				#label: #fillRectangleImage 
				#hasCharacterOrientedLabel: false) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 61 0 -72 1 113 0 -48 1) 
				#model: #toCurrentColor 
				#label: #changeColorImage 
				#hasCharacterOrientedLabel: false) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame -8 0.333333 40 0 -8 1 -48 1) 
				#name: #magnifiedBitView 
				#flags: 11 
				#component: #magnifiedBitView) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin 32 0 119 0 69 69) 
				#name: #directBitView 
				#component: #directBitView) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 0.25 32 0) 
				#name: #readButton 
				#model: #read 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Read 
					#defaultString: 'Read' 
					#catalogID: #UIPainter) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.25 0 0 0 0.5 32 0) 
				#name: #applyButton 
				#model: #apply 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Apply 
					#defaultString: 'Apply' 
					#catalogID: #UIPainter) 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 43 40) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #Capture 
					#defaultString: 'Capture')))))
]

{ #category : #'initialize-release' }
ImageEditor >> initialize [
	
	| image buffer white colorImage |
	super initialize.
	Screen default colorDepth == 1
		ifTrue: [storeMask := ValueHolder with: true]
		ifFalse: [storeMask := ValueHolder with: false].
	useCachedImage := ValueHolder with: true.
	colorImage := self class colorPaletteImage image.
	image := Image
		extent: 63 @ 63
		depth: colorImage depth
		palette: colorImage palette.
	buffer := Array new: image width.
	white := image palette indexOf: ColorValue white.
	1
		to: buffer size
		do: [:colIndex | buffer at: colIndex put: white].
	0
		to: image height - 1
		do: [:rowIndex | image rowAt: rowIndex putAll: buffer].
	acceptedState := image copy.
	magnifiedBitView := ColorBitView model: image.
	magnifiedBitView scale: 4 @ 4.
	magnifiedBitView controller
		currentColor: (image palette indexOf: ColorValue black).
	directBitView := DirectBitView model: image.
	magnifiedBitView changedPreferredBounds: nil.
	modified := false.
	storeMask onChangeSend: #storeMaskChanged to: self
]

{ #category : #actions }
ImageEditor >> install [
	
	(Dialog confirm:
			'You are about to change the image. The relative size will be set to 100% and the position on the cell will be at center.
Do you want to continue?') ifFalse: [^nil].
	self targetClass: self observer class.
	super install isNil ifFalse: [self observer setNewBitMapImage]
]

{ #category : #private }
ImageEditor >> installInSystem [
	
	super installInSystem
]

{ #category : #private }
ImageEditor >> installInSystem2 [
	
	| class image s |
	storeMask value
		ifTrue: [image := self generateMask]
		ifFalse: [image := magnifiedBitView model].
	class := self observer class.
	s := WriteStream on: (String new: image bits size // 8).
	s
		nextPutAll: self targetSelector;
		cr.	"Put in a nice comment for re-opening the mask maker."
	s
		tab;
		nextPutAll: '"UIMaskEditor new openOnClass: self andSelector: #';
		nextPutAll: self targetSelector;
		nextPut: $";
		cr;
		crtab;
		nextPutAll: '<resource: #image>';
		crtab;
		nextPut: $^.
	useCachedImage value ifTrue: [s nextPutAll: 'CachedImage on: '].	"ifTrue: [s nextPutAll: 'EntityImage on: ']."
	s nextPutAll: image minimalStorageString.
	class
		compile: s contents
		classified: #resources.
	Transcript
		cr;
		show: class name , '>' , self targetSelector , ' defined'.
	class removeSelector: #markedAsSystemClass.
	UIFinderVW2
		installed:
			(Array
				with: class
				with: self targetSelector).
	self accept.
	self magnifiedBitView controller imageHasChanged: false.
	self modified: false
]

{ #category : #actions }
ImageEditor >> loadCurrentImage [
	
	| image |
	(self observer imageOS model isKindOf: VectorialPOV) ifTrue: [^self].
	image := self observer imageOS figure cache figure.
	(image isKindOf: CachedImage)
		ifTrue:
			[image := image image.
			useCachedImage value: true]
		ifFalse: [useCachedImage value: false].
	storeMask value: image paintBasis == CoverageValue.
	Cursor execute
		showWhile:
			[storeMask value ifTrue: [image palette: MonoMappedPalette whiteBlack].
			image := image
				convertToPalette: Screen default colorPalette
				bitsPerPixel: Screen default colorDepth
				renderedBy: NearestPaint new
				paintTransfer: nil.
			magnifiedBitView
				model: image;
				changedPreferredBounds: nil;
				invalidate.
			directBitView
				model: image;
				changedPreferredBounds: nil;
				invalidate.
			self accept].
	self magnifiedBitView controller imageHasChanged: false.
	self modified: false
]

{ #category : #accessing }
ImageEditor >> observer [
	
	^observer
]

{ #category : #accessing }
ImageEditor >> observer: anObject [
	
	observer := anObject
]

{ #category : #private }
ImageEditor >> runInstallationDialog [
	
	self closeRequest.
	self targetSelector: #cachedImage.
	^Array
		with: self targetClass
		with: self targetSelector
]
