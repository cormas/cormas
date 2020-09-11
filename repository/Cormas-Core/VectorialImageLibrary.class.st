Class {
	#name : #VectorialImageLibrary,
	#superclass : #BitmapImageLibrary,
	#category : 'Cormas-Core-Others'
}

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_casa [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.670004 0.0 0.670004 0.0 0.0 0.0 1 1 #center #(-0.51 #@- 20.91 18.87 #@- 1.53 9.69 #@- 0.51 9.69 #@ 19.89 -11.73 #@ 19.89 -9.69 #@- 1.53 -19.89 #@- 1.53 -0.51 #@- 20.91) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_casa2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.87999 0.439995 0.0 1.0 0.0 0.0 3 1 #center #(-0.409821 #@- 22.5402 22.5402 #@ 0.409821 13.5241 #@ 0.409821 15.983 #@ 6.14732 15.983 #@ 12.7045 13.5241 #@ 21.7205 -14.3438 #@ 21.7205 -16.8027 #@ 12.7045 -15.983 #@ 6.14732 -13.5241 #@ 0.409821 -23.3598 #@- 0.409821 -13.5241 #@- 11.0652 -13.5241 #@- 20.9009 -7.78661 #@- 20.9009 -7.78661 #@- 15.983 -0.409821 #@- 22.5402) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_circle [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 1.0 0.0 0.0 0.0 0.0 1 1 #center #(0.149026 #@- 22.6519 5.21591 #@- 21.7578 9.98474 #@- 19.6714 13.5614 #@- 17.287 17.7341 #@- 12.2201 21.9068 #@- 6.55714 22.801 #@- 0.894156 22.2049 #@ 4.76883 20.4166 #@ 11.326 15.6477 #@ 16.989 9.68669 #@ 21.1617 3.4276 #@ 22.3539 -2.83149 #@ 22.3539 -10.2828 #@ 20.2675 -14.7536 #@ 17.287 -17.7341 #@ 14.3065 -19.8205 #@ 10.7299 -21.6088 #@ 7.4513 -23.099 #@ 2.68247 -23.099 #@ 2.68247 -19.8205 #@ 2.68247 -18.0321 #@ 7.15325 -15.6477 #@ 11.326 -13.5614 #@ 14.3065 -9.38864 #@ 17.8831 -4.91786 #@ 19.3734 -0.149026 #@ 19.6714 4.61981 #@ 19.6714 8.49448 #@ 18.4792 13.8594 #@ 15.2007 16.5419 #@ 12.5182 18.3302 #@ 9.23961 19.5224 #@ 5.66299 19.8205 #@ 1.49026 19.8205 #@- 3.57662 18.0321 #@- 7.74935 12.3692 #@- 14.3065 9.68669 #@- 16.6909 6.40812 #@- 18.7773 2.23539 #@- 19.6714 -1.93734 #@- 19.3734 -8.19643 #@- 16.3929 -13.8594 #@- 12.2201 -16.8399 #@- 8.0474 -18.9263 #@- 3.27857 -19.8205 #@- 0.298052 -19.5224 #@ 2.68247 -23.099 #@ 2.68247 -22.801 #@- 1.78831 -20.7146 #@- 7.4513 -17.7341 #@- 12.2201 -11.1769 #@- 17.8831 -6.11006 #@- 21.1617 0.149026 #@- 22.6519) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_cow1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.800024 0.649982 0.500061 0.0 0.0 0.0 1 1 #center #(-3.53077 #@- 8.63077 18.8308 #@- 9.02308 20.7923 #@- 8.23846 22.7538 #@ 0.0 22.7538 #@ 5.49231 20.7923 #@- 3.92308 18.4385 #@ 20.4 15.6923 #@ 20.0077 16.4769 #@ 16.8692 14.5154 #@ 9.41539 13.3385 #@ 12.5538 12.1615 #@ 11.7692 10.5923 #@ 13.3385 9.02308 #@ 10.2 8.23846 #@ 8.23846 3.13846 #@ 9.41539 -2.74615 #@ 9.02308 -6.27692 #@ 7.45385 -9.02308 #@ 20.4 -11.7692 #@ 20.4 -10.5923 #@ 17.2615 -10.5923 #@ 6.66923 -12.9462 #@ 3.53077 -14.1231 #@ 0.784615 -15.3 #@- 6.27692 -19.6154 #@- 5.88462 -21.1846 #@- 4.70769 -23.1462 #@- 7.45385 -21.5769 #@- 10.2 -18.8308 #@- 14.9077 -18.0462 #@- 17.2615 -18.0462 #@- 18.8308 -20.0077 #@- 20.7923 -15.6923 #@- 18.8308 -14.1231 #@- 17.6538 -12.5538 #@- 19.2231 -12.5538 #@- 18.8308 -10.9846 #@- 18.8308 -11.3769 #@- 15.6923 -3.13846 #@- 8.23846) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_cow2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.399951 0.399951 0.399951 0.0 0.0 0.0 1 1 #center #(-8.98044 #@- 5.48804 12.9717 #@- 5.48804 19.9565 #@ 6.48587 12.9717 #@- 1.49674 12.9717 #@ 2.49457 10.9761 #@ 22.4511 6.98478 #@ 12.4728 -1.99565 #@ 10.4772 -8.98044 #@ 10.4772 -13.9696 #@ 22.4511 -16.963 #@ 2.49457 -17.9609 #@- 3.49239 -19.9565 #@- 7.4837 -18.9587 #@- 7.4837 -18.9587 #@- 7.4837 -17.9609 #@- 11.475 -19.9565 #@- 14.4685 -20.9543 #@- 22.4511 -17.9609 #@- 16.4641 -14.9674 #@- 12.4728 -12.9717 #@- 12.4728 -9.97826 #@- 16.4641 -6.98478 #@- 23.4489 -7.98261 #@- 14.4685 -10.9761 #@- 10.4772 -7.98261 #@- 4.49022) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_face1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.869979 0.649982 0.439995 0.0 0.0 0.0 2 1 #center #(-1.8 #@- 16.65 9.0 #@- 17.55 9.0 #@- 7.65 22.5 #@- 7.65 19.8 #@- 5.85 9.9 #@- 4.95 9.9 #@- 0.45 9.9 #@ 4.05 9.0 #@ 9.45 6.3 #@ 13.05 3.6 #@ 16.65 0.9 #@ 16.65 -2.7 #@ 16.65 -6.3 #@ 16.65 -9.0 #@ 13.05 -10.8 #@ 9.45 -12.6 #@ 4.05 -12.6 #@- 0.45 -11.7 #@- 4.95 -20.7 #@- 4.05 -23.4 #@- 7.65 -11.7 #@- 7.65 -10.8 #@- 17.55 -1.8 #@- 16.65) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_fence1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 1.0 1.0 0.0 0.0 0.0 1 1 #center #(#(-1836 #/ 73) #@ #(-1836 #/ 73) #(-1428 #/ 73) #@ #(-1887 #/ 73) #(-1428 #/ 73) #@ #(1479 #/ 73) #(1377 #/ 73) #@ #(1479 #/ 73) #(1377 #/ 73) #@ #(-1479 #/ 73) #(-1428 #/ 73) #@ #(-1479 #/ 73) #(-1428 #/ 73) #@ #(-1887 #/ 73) #(1785 #/ 73) #@ #(-1887 #/ 73) #(1785 #/ 73) #@ #(1836 #/ 73) #(-1836 #/ 73) #@ #(1836 #/ 73) #(-1836 #/ 73) #@ #(-1836 #/ 73)) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_fenceHorizontal [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.680015 0.680015 0.680015 0.0 0.0 0.0 1 1 #topCenter #(22.6558 #@- 3.53077 22.6558 #@ 2.94231 -23.2442 #@ 2.94231 -23.2442 #@- 1.76538 -23.2442 #@- 3.53077 22.6558 #@- 3.53077) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_fenceVertical [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.680015 0.680015 0.680015 0.0 0.0 0.0 1 1 #leftCenter #(#(357 #/ 76) #@ #(-3927 #/ 152) #(357 #/ 76) #@ #(-153 #/ 152) #(357 #/ 76) #@ #(3825 #/ 152) #(-102 #/ 19) #@ #(3825 #/ 152) #(-102 #/ 19) #@ #(-3927 #/ 152) #(357 #/ 76) #@ #(-3927 #/ 152)) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_fish [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 0.0 1.0 0.0 0.0 0.0 1 1 #center #(-12 #@- 18 -3 #@- 17 3 #@- 13 12 #@- 5 24 #@- 13 17 #@ 2 25 #@ 17 10 #@ 8 -2 #@ 11 -17 #@ 11 -25 #@ 6 -13 #@ 2 -26 #@- 1 -24 #@- 9 -19 #@- 15) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_man1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.670004 0.360029 0.670004 0.0 0.0 0.0 1 1 #center #(5.4 #@ 21.6 2.7 #@ 21.6 -1.8 #@ 7.2 -6.3 #@ 21.6 -9.9 #@ 21.6 -6.3 #@ 6.3 -7.2 #@- 6.3 -14.4 #@- 4.5 -10.8 #@ 2.7 -18.9 #@- 4.5 -6.3 #@- 11.7 -7.2 #@- 18.0 -4.5 #@- 22.5 -0.9 #@- 23.4 2.7 #@- 21.6 4.5 #@- 18.0 3.6 #@- 15.3 1.8 #@- 10.8 9.9 #@- 11.7 15.3 #@- 11.7 17.1 #@- 22.5 18.0 #@ 21.6 16.2 #@- 9.0 4.5 #@- 6.3 3.6 #@ 8.1 6.3 #@ 22.5) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_man2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.670004 0.0 0.0 0.0 0.0 0.0 1 1 #center #(9.39685 #@ 22.0465 5.78268 #@ 22.0465 0.722835 #@ 7.95118 -5.42126 #@ 22.0465 -9.39685 #@ 22.0465 -4.69843 #@ 6.50551 -5.42126 #@- 2.89134 -21.3236 #@- 6.86693 -22.7693 #@- 9.03543 -3.61417 #@- 9.03543 -6.50551 #@- 13.3724 -6.86693 #@- 16.6252 -6.14409 #@- 20.2394 -2.89134 #@- 23.1307 1.80709 #@- 23.1307 5.78268 #@- 21.685 7.22835 #@- 18.4323 7.22835 #@- 14.0953 5.42126 #@- 11.2039 3.25276 #@- 9.03543 22.4079 #@- 8.3126 19.878 #@- 6.50551 6.50551 #@- 3.25276 6.50551 #@ 7.58976 9.75827 #@ 22.7693) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_man3 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 0.670004 0.670004 0.0 0.0 0.0 1 1 #center #(7.2 #@ 22.5 4.5 #@ 22.5 2.7 #@ 13.5 0.0 #@ 12.6 -2.7 #@ 13.5 -4.5 #@ 22.5 -8.1 #@ 22.5 -4.5 #@ 15.3 -12.6 #@ 12.6 -4.5 #@- 4.5 -17.1 #@ 0.0 -4.5 #@- 11.7 -4.5 #@- 15.3 -8.1 #@- 11.7 -7.2 #@- 19.8 -2.7 #@- 22.5 0.9 #@- 23.4 4.5 #@- 21.6 6.3 #@- 19.8 7.2 #@- 11.7 4.5 #@- 16.2 3.6 #@- 9.9 16.2 #@ 0.0 5.4 #@- 4.5 8.1 #@ 2.7 15.3 #@ 12.6 6.3 #@ 13.5) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_man4 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(-0.708333 #@ 22.8083 -0.141667 #@ 20.2583 0.991667 #@ 14.5917 -2.125 #@ 9.20833 -5.24167 #@ 15.725 -8.35833 #@ 21.1083 -6.94167 #@ 22.8083 -11.475 #@ 22.8083 -7.225 #@ 14.5917 -4.95833 #@ 6.375 -6.09167 #@- 2.40833 -8.075 #@- 0.708333 -5.80833 #@ 0.708333 -12.8917 #@- 0.425 -4.95833 #@- 6.375 -4.95833 #@- 10.625 -6.09167 #@- 12.0417 -6.09167 #@- 14.875 -4.675 #@- 16.575 -2.40833 #@- 17.1417 -0.141667 #@- 15.1583 0.708333 #@- 13.175 0.425 #@- 10.3417 -0.708333 #@- 8.35833 -0.991667 #@- 7.225 -0.141667 #@- 5.525 4.10833 #@- 5.80833 7.50833 #@- 6.375 10.9083 #@- 7.50833 10.9083 #@- 12.325 9.775 #@- 17.7083 6.65833 #@- 23.0917 10.3417 #@- 19.125 12.0417 #@- 12.6083 12.6083 #@- 6.94167 12.0417 #@- 2.40833 10.0583 #@ 4.95833 6.375 #@ 11.1917 8.64167 #@ 5.80833 10.3417 #@ 0.425 10.9083 #@- 3.825 10.0583 #@- 4.95833 8.64167 #@- 4.95833 9.775 #@- 4.95833 8.35833 #@- 4.95833 0.991667 #@- 2.40833 -0.141667 #@ 5.525 3.25833 #@ 13.4583 1.55833 #@ 21.1083 3.54167 #@ 22.8083) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_plant1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(0.0 #@- 18.059 0.752459 #@ 8.27705 18.059 #@- 12.0393 9.02951 #@ 4.51475 22.5738 #@ 0.752459 -1.50492 #@ 17.3066 -23.3262 #@- 6.77213 -7.52459 #@ 4.51475 -12.0393 #@- 10.5344 -2.25738 #@ 8.27705 0.752459 #@- 18.059) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_plant2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(-0.685075 #@- 18.8396 2.7403 #@- 16.7843 4.79552 #@- 14.7291 0.685075 #@- 6.50821 0.685075 #@- 2.39776 5.4806 #@- 3.08284 0.685075 #@ 2.39776 0.685075 #@ 9.24851 7.53582 #@ 0.342537 9.59105 #@- 5.13806 11.6463 #@- 9.93358 11.6463 #@- 12.6739 16.4418 #@- 12.6739 15.7567 #@- 9.24851 13.0164 #@- 6.50821 7.53582 #@ 3.08284 17.1269 #@- 0.342537 19.8672 #@- 2.39776 22.6075 #@- 1.71269 22.6075 #@ 2.39776 21.9224 #@ 6.50821 17.8119 #@ 4.45299 12.3313 #@ 7.87836 4.11045 #@ 16.7843 0.685075 #@ 18.1545 -4.79552 #@ 17.4694 -6.16567 #@ 13.359 -14.3866 #@ 9.24851 -23.2925 #@ 9.93358 -16.4418 #@ 5.82313 -21.2373 #@ 3.08284 -19.8672 #@- 2.39776 -16.4418 #@ 0.342537 -13.7015 #@- 1.71269 -10.9612 #@ 4.45299 -7.53582 #@ 5.82313 -8.2209 #@- 3.08284 -8.90597 #@- 5.82313 -11.6463 #@- 5.13806 -10.2761 #@- 7.87836 -12.3313 #@- 9.93358 -8.2209 #@- 11.3037 -8.2209 #@- 8.56343 -5.4806 #@- 7.19328 -2.7403 #@ 6.50821 -2.7403 #@- 10.6187 -4.11045 #@- 16.7843 -0.685075 #@- 14.044) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_rabbit [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 1.0 0.0 0.0 0.0 0.0 1 1 #center #(-1.50987 #@ 13.2868 -10.5691 #@ 10.2671 -14.1928 #@ 7.24737 -21.4401 #@ 15.7026 -16.0046 #@ 4.83158 -23.252 #@ 10.8711 -16.6086 #@- 2.41579 -22.0441 #@- 3.01974 -23.252 #@- 7.24737 -22.0441 #@- 10.2671 -19.0243 #@- 12.6829 -14.7967 #@- 13.8908 -6.94539 #@- 21.7421 -11.777 #@- 11.475 -3.32171 #@- 16.9105 -3.32171 #@- 16.9105 1.50987 #@- 16.9105 -3.92566 #@- 14.4947 -9.96513 #@- 9.05921 -9.36118 #@- 5.43553 2.71776 #@- 6.03947 13.5888 #@- 4.83158 15.4007 #@- 3.01974 18.4204 #@- 3.62368 19.0243 #@- 1.20789 16.6086 #@ 0.603947 15.4007 #@ 5.43553 22.648 #@ 17.5145 20.8362 #@ 21.1382 19.6283 #@ 16.9105 14.1928 #@ 11.475 10.5691 #@ 15.7026 6.34145 #@ 16.3066 9.96513 #@ 12.0789 8.15329 #@ 10.8711 -2.11382 #@ 13.2868) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_sheep [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.859968 0.859968 0.859968 0.0 0.0 0.0 2 1 #center #(12.6829 #@- 23.252 18.1184 #@- 22.0441 18.7224 #@- 22.0441 19.3263 #@- 17.8164 21.7421 #@- 16.6086 22.3461 #@- 14.1928 19.9303 #@- 11.777 15.7026 #@- 5.7375 9.05921 #@ 9.36118 7.24737 #@ 10.5691 10.2671 #@ 22.648 6.64342 #@ 22.648 3.01974 #@ 9.36118 -7.24737 #@ 9.36118 -14.4947 #@ 9.36118 -12.0789 #@ 19.6283 -9.66316 #@ 22.648 -15.0987 #@ 22.648 -18.7224 #@ 9.36118 -19.9303 #@ 7.54934 -22.95 #@- 0.301974 -22.95 #@- 6.94539 -22.3461 #@- 11.777 -20.5342 #@- 14.1928 -14.4947 #@- 14.7967 -7.85132 #@- 14.7967 -0.603947 #@- 12.9849 4.83158 #@- 14.1928 9.66316 #@- 20.8362 12.6829 #@- 23.252) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_tractor [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(-10 #@ #(45 #/ 2) -14 #@ #(47 #/ 2) -18 #@ #(47 #/ 2) -21 #@ #(45 #/ 2) -22 #@ #(41 #/ 2) -24 #@ #(41 #/ 2) -25 #@ #(35 #/ 2) -26 #@ #(27 #/ 2) -25 #@ #(23 #/ 2) -22 #@ #(15 #/ 2) -22 #@ #(-13 #/ 2) 1 #@ #(-13 #/ 2) 0 #@ #(-39 #/ 2) -19 #@ #(-39 #/ 2) -18 #@ #(-15 #/ 2) -22 #@ #(-15 #/ 2) -23 #@ #(-49 #/ 2) 3 #@ #(-49 #/ 2) 5 #@ #(-3 #/ 2) 19 #@ #(-5 #/ 2) 19 #@ #(-9 #/ 2) 21 #@ #(-13 #/ 2) 23 #@ #(-11 #/ 2) 23 #@ #(-11 #/ 2) 25 #@ #(-5 #/ 2) 25 #@ #(17 #/ 2) 24 #@ #(31 #/ 2) 19 #@ #(33 #/ 2) 18 #@ #(45 #/ 2) 13 #@ #(47 #/ 2) 10 #@ #(45 #/ 2) 8 #@ #(33 #/ 2) -7 #@ #(33 #/ 2) -9 #@ #(43 #/ 2)) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_tree1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.670004 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(5.92258 #@ 21.8395 -11.8452 #@ 22.5798 -7.40323 #@ 13.696 -4.44194 #@- 0.370161 -12.5855 #@ 0.370161 -17.7677 #@- 1.11048 -19.2484 #@- 12.2153 -11.8452 #@- 20.3589 0.0 #@- 23.3202 11.8452 #@- 20.3589 17.7677 #@- 14.4363 18.5081 #@- 7.03306 16.2871 #@- 2.59113 8.88387 #@- 1.11048 2.22097 #@- 0.370161 2.96129 #@ 15.1766 5.92258 #@ 21.8395) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_tree2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.670004 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(#(51 #/ 7) #@ #(3417 #/ 140) #(51 #/ 70) #@ #(3009 #/ 140) #(-153 #/ 35) #@ #(3519 #/ 140) #(-102 #/ 35) #@ #(561 #/ 28) #(-408 #/ 35) #@ #(3111 #/ 140) #(-153 #/ 35) #@ #(1887 #/ 140) #(-153 #/ 70) #@ #(459 #/ 140) #(-561 #/ 70) #@ #(561 #/ 140) #(-867 #/ 70) #@ #(459 #/ 140) #(-561 #/ 35) #@ #(-867 #/ 140) #(-459 #/ 35) #@ #(-2091 #/ 140) #(-51 #/ 7) #@ #(-3009 #/ 140) #(51 #/ 70) #@ #(-3621 #/ 140) #(306 #/ 35) #@ #(-663 #/ 28) #(459 #/ 35) #@ #(-2397 #/ 140) #(153 #/ 10) #@ #(-255 #/ 28) #(102 #/ 7) #@ #(-153 #/ 140) #(459 #/ 35) #@ #(51 #/ 28) #(153 #/ 35) #@ #(51 #/ 28) #(102 #/ 35) #@ #(1377 #/ 140) #(102 #/ 35) #@ #(2091 #/ 140) #(51 #/ 7) #@ #(3417 #/ 140)) false)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb0 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.690026 0.380051 0.0 0.0 0.0 1 1 #center #(0.498913 #@- 23.4489 3.49239 #@- 22.4511 5.48804 #@- 19.4576 7.4837 #@- 13.4707 9.47935 #@- 6.48587 9.47935 #@- 1.49674 9.47935 #@ 4.49022 8.48152 #@ 10.4772 6.48587 #@ 16.4641 3.49239 #@ 20.4554 0.498913 #@ 22.4511 -1.49674 #@ 22.4511 -5.48804 #@ 19.4576 -6.48587 #@ 17.462 -8.48152 #@ 10.4772 -9.47935 #@ 6.48587 -10.4772 #@ 2.49457 -10.4772 #@ 2.49457 -8.48152 #@ 2.49457 -7.4837 #@ 9.47935 -5.48804 #@ 15.4663 -2.49457 #@ 18.4598 0.498913 #@ 19.4576 3.49239 #@ 17.462 5.48804 #@ 13.4707 7.4837 #@ 7.4837 7.4837 #@ 0.498913 6.48587 #@- 7.4837 5.48804 #@- 14.4685 4.49022 #@- 17.462 2.49457 #@- 19.4576 0.498913 #@- 20.4554 -1.49674 #@- 19.4576 -4.49022 #@- 17.462 -6.48587 #@- 13.4707 -7.4837 #@- 9.47935 -8.48152 #@- 4.49022 -8.48152 #@- 1.49674 -8.48152 #@ 2.49457 -10.4772 #@ 1.49674 -10.4772 #@- 1.49674 -9.47935 #@- 6.48587 -7.4837 #@- 13.4707 -5.48804 #@- 19.4576 -3.49239 #@- 22.4511 0.498913 #@- 23.4489) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb1 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.500061 0.0 0.0 0.0 0.0 1 1 #center #(3.6 #@- 23.4 11.7 #@- 23.4 11.7 #@ 22.5 3.6 #@ 22.5 3.6 #@- 14.4 -5.4 #@- 6.3 -12.6 #@- 5.4 3.6 #@- 23.4) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb2 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(3.9913 #@- 23.4489 8.98044 #@- 21.4533 10.9761 #@- 16.4641 7.98261 #@- 7.4837 1.99565 #@ 3.49239 -3.9913 #@ 17.462 11.9739 #@ 17.462 11.9739 #@ 22.4511 -12.9717 #@ 22.4511 -3.9913 #@ 3.49239 3.9913 #@- 10.4772 3.9913 #@- 13.4707 1.99565 #@- 15.4663 -0.997826 #@- 13.4707 -4.98913 #@- 7.4837 -11.9739 #@- 7.4837 -8.98044 #@- 13.4707 -4.98913 #@- 19.4576 3.9913 #@- 23.4489) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb3 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(1.64769 #@- 23.0677 3.06 #@- 22.3615 4.94308 #@- 19.3015 4.70769 #@- 11.7692 3.76615 #@- 6.59077 1.88308 #@- 1.41231 0.235385 #@ 0.0 1.88308 #@- 0.470769 3.53077 #@ 0.706154 4.70769 #@ 1.64769 5.64923 #@ 4.94308 5.88462 #@ 12.24 5.17846 #@ 17.4185 2.58923 #@ 22.1262 -1.64769 #@ 22.8323 -4.47231 #@ 21.1846 -5.88462 #@ 16.9477 -6.12 #@ 8.47385 -4.23692 #@ 8.47385 -4.00154 #@ 13.1815 -3.53077 #@ 14.8292 -1.17692 #@ 16.4769 2.35385 #@ 15.7708 3.53077 #@ 13.1815 3.29538 #@ 8.00308 2.35385 #@ 5.88462 -0.235385 #@ 4.47231 -2.11846 #@ 2.82462 -2.11846 #@- 0.470769 1.17692 #@- 5.17846 2.58923 #@- 9.88615 3.06 #@- 14.1231 2.58923 #@- 15.0646 1.41231 #@- 16.2415 0.235385 #@- 16.7123 -2.11846 #@- 15.0646 -4.00154 #@- 11.7692 -4.23692 #@- 8.23846 -6.12 #@- 8.23846 -5.88462 #@- 14.5938 -4.00154 #@- 20.0077 -1.41231 #@- 22.3615 1.64769 #@- 22.8323) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb4 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.690026 0.380051 1.0 0.0 0.0 0.0 1 1 #center #(4.59 #@- 23.1916 7.48895 #@- 21.7421 -4.59 #@ 7.73053 4.10684 #@ 7.73053 4.10684 #@- 14.0116 7.48895 #@- 21.2589 7.48895 #@ 7.73053 9.90474 #@ 7.73053 9.90474 #@ 10.6295 7.48895 #@ 11.1126 7.48895 #@ 22.7084 4.10684 #@ 22.7084 4.10684 #@ 11.1126 -10.3879 #@ 11.1126 4.59 #@- 23.1916) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb5 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.0 1.0 0.0 0.0 0.0 1 1 #center #(11.7549 #@- 22.6701 11.7549 #@- 19.8713 -6.71707 #@- 19.3116 -8.39634 #@- 3.63841 0.559756 #@- 4.19817 7.27683 #@- 1.39939 10.6354 #@ 4.75793 11.1951 #@ 13.714 9.51585 #@ 18.7518 3.35854 #@ 22.6701 -12.3146 #@ 22.6701 -11.7549 #@ 18.7518 1.11951 #@ 19.3116 6.15732 #@ 16.5128 7.83659 #@ 8.67622 5.59756 #@ 3.07866 0.0 #@- 0.279878 -8.9561 #@ 0.839634 -11.7549 #@- 2.5189 -9.51585 #@- 23.2299 11.1951 #@- 23.2299) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb6 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.560005 1.0 0.0 0.0 0.0 1 1 #center #(14.3633 #@- 19.3592 13.4265 #@- 16.8612 7.49388 #@- 19.0469 -0.936735 #@- 19.9837 -7.49388 #@- 17.798 -10.3041 #@- 13.7388 -12.1776 #@- 8.11837 -12.802 #@- 0.936735 -7.80612 #@- 2.8102 1.87347 #@- 3.12245 12.4898 #@- 0.62449 16.8612 #@ 5.93265 17.1735 #@ 12.4898 14.051 #@ 17.4857 6.55714 #@ 21.8571 -3.12245 #@ 22.7939 -12.4898 #@ 21.8571 -14.9878 #@ 16.8612 -16.549 #@ 9.0551 -17.4857 #@- 1.87347 -13.1143 #@ 2.8102 -13.1143 #@ 7.18163 -12.4898 #@ 14.3633 -9.99184 #@ 19.0469 -3.12245 #@ 20.2959 2.49796 #@ 19.0469 10.3041 #@ 15.9245 12.802 #@ 13.4265 13.4265 #@ 8.43061 12.802 #@ 5.62041 10.3041 #@ 3.43469 0.936735 #@ 0.312245 -6.2449 #@ 0.62449 -10.6163 #@ 0.936735 -13.4265 #@ 2.8102 -17.4857 #@- 1.56122 -15.3 #@- 13.1143 -12.4898 #@- 19.0469 -7.49388 #@- 22.1694 -0.62449 #@- 23.1061 8.43061 #@- 22.1694 14.3633 #@- 19.6714) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb7 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(0.859968 0.109999 0.49005 0.0 0.0 0.0 1 1 #center #(-14.2448 #@- 23.3457 13.4534 #@- 23.3457 2.37414 #@- 1.18707 -4.74828 #@ 22.5543 -9.49655 #@ 22.5543 -2.37414 #@- 1.97845 5.53965 #@- 17.806 -7.91379 #@- 17.806 -13.4534 #@- 12.2664 -13.4534 #@- 22.5543) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb8 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(4.97972 #@- 22.3005 6.27877 #@- 21.8675 12.7741 #@- 19.2693 14.9392 #@- 14.0731 13.6401 #@- 8.01085 7.57783 #@- 2.81462 3.68066 #@- 1.51557 7.14481 #@- 1.08255 11.042 #@- 0.216509 14.0731 #@ 1.08255 17.1042 #@ 4.11368 18.4033 #@ 10.609 15.8052 #@ 17.1042 9.30991 #@ 21.8675 -3.68066 #@ 22.7335 -13.6401 #@ 21.0014 -18.4033 #@ 16.6712 -18.4033 #@ 7.57783 -14.0731 #@ 1.08255 -7.57783 #@- 0.216509 -16.6712 #@- 4.11368 -18.8363 #@- 9.74292 -12.341 #@- 9.74292 -11.908 #@- 6.27877 -2.3816 #@- 2.81462 -2.3816 #@ 1.08255 -9.74292 #@ 3.24764 -12.341 #@ 7.57783 -12.341 #@ 12.341 -10.1759 #@ 14.0731 -1.51557 #@ 16.2382 9.30991 #@ 15.3722 12.341 #@ 12.341 12.341 #@ 7.14481 9.30991 #@ 4.97972 3.68066 #@ 2.3816 -2.3816 #@ 1.08255 -2.3816 #@- 2.81462 4.5467 #@- 6.71179 9.74292 #@- 9.30991 9.74292 #@- 14.0731 8.01085 #@- 15.3722 4.11368 #@- 17.5373 -1.51557 #@- 18.4033 -8.01085 #@- 16.6712 -12.341 #@- 14.0731 -12.341 #@- 10.1759 -18.4033 #@- 10.1759 -17.9703 #@- 16.2382 -14.0731 #@- 20.1354 -9.74292 #@- 22.3005 -1.51557 #@- 23.1665 4.97972 #@- 22.3005) true)
]

{ #category : #'images - vector' }
VectorialImageLibrary class >> VectorialPOV_z_nb9 [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
	
	^#(1.0 0.565132 0.681235 0.0 0.0 0.0 1 1 #center #(-1.05923 #@- 23.3031 5.29615 #@- 21.8908 10.9454 #@- 16.2415 10.9454 #@ 14.8292 6.00231 #@ 20.4785 0.353077 #@ 22.5969 -5.29615 #@ 21.8908 -8.82692 #@ 19.0662 -8.82692 #@ 13.4169 -4.59 #@ 16.9477 -0.353077 #@ 18.36 3.17769 #@ 16.9477 6.70846 #@ 11.2985 6.70846 #@ 0.706154 6.70846 #@- 12.0046 6.70846 #@- 14.1231 3.88385 #@- 16.9477 -0.353077 #@- 17.6538 -3.88385 #@- 16.2415 -5.29615 #@- 13.4169 -6.00231 #@- 10.5923 -6.00231 #@- 6.35539 -1.76538 #@- 3.53077 7.41462 #@- 6.35539 7.41462 #@- 1.41231 -3.17769 #@ 0.706154 -8.82692 #@- 1.41231 -11.6515 #@- 7.76769 -10.9454 #@- 14.8292 -7.41462 #@- 20.4785 -1.05923 #@- 22.5969) true)
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> casa1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #casa1Image"
	
	<resource: #image>
	^Image
		extent: 63 @ 70
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 0 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*********************J********************"********************(*********************J*********T**********"*********ER*********(*********EUJ*********J********EUT*********"********EUUJ********(********EUUT*********J*******EUUUR********"*******EUUUUJ*******(*******!UUUUT********J******!UUUUUR*******"******!UUUUUUJ******(******!UUUUUUR*******J*****!UUUUUUUJ******"*****!UUUUUUUT******(*****!UUUUUUUUR******J****!UUUUUUUUUJ*****"****!UUUUUUUUUT*****(****!UUUUUUUUUUR*****J***!UUUUUUUUUUUJ****"***!UUUUUUUUUUUR****(***!UUUUUUUUUUUUJ****J**!UUUUUUUUUUUUT****"**(UUUUUUUUUUUUUR***(**(UUUUUUUUUUUUUUJ***J*(UUUUUUUUUUUUUUT***"*(UUUUUUUUUUUUUUUR**(*(UUUUUUUUUUUUUUUT***J(UUUUUUUUUUUUUUUUR**"(@@UUUUUUUUUUUUUUUJ*(*** @EUUUUUUUUU@@@@**J****!UUUUUUUUUR*****"****(UUUUUUUUUT*****(*****EUUUUUUUUUJ*****J****!UUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****!UUUUUUUUUT*****(****(UUUUUUUUUUJ*****J****EUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****!UUUUUUUUUUJ*****J***(UUUUUUUUUUR*****"****EUUUUUUUUUT*****(****EUUUUUUUUUUJ*****J***!UUUUUUUUUUR*****"***(UUUUUUUUUUT*****(****EUUUUUUUUUUJ*****J*** @@@@@@@@@@B*****"********************(*********************J********************"********************(*********************J********************"********************(*********************@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> casa2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #casa2Image"
	
	<resource: #image>
	^Image
		extent: 53 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 3597 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUT@@@EUUUUUUUUUUUUUUUUU@@@AUUUUUUUPEUUUUUUUUP@@@UUUUUUUP@UUUUUUUUT@@@EUUP@@EP@AUUUUUUUU@@@AUUT@@APB@EUUUUUUUP@@@UUU@@@PB(@UUUUUUUT@@@EUUPJ @B* AUUUUUUU@@@AUUTB(@B**@EUUUUUUP@@@UUU@*@B**(@UUUUUUT@@@EUUPJ B*** AUUUUUU@@@AUUTB(B****@EUUUUUP@@@UUU@*B****(@UUUUUT@@@EUUPJ****** AUUUUU@@@AUUTB*******@EUUUUP@@@UUU@*******(@UUUUT@@@EUU@******** AUUUU@@@AUU@J********@EUUUP@@@UU@J********(@UUUT@@@EUPJ********* AUUU@@@AUPJ**********@EUUP@@@UPJ**********(@UUT@@@EPB*********** AUU@@@APB************@EUP@@@TB************(@UT@@@D@@@B*******(@@@AU@@@@@@@@******** @@@EP@@@@@@@********(@@@@T@@@EUUPJ******** EUUU@@@AUUPB********(AUUUP@@@UUTB*********@EUUT@@@EUU@*********(AUUU@@@AUU@J*********@UUUP@@@UUPJ********* EUUT@@@EUTB*********(AUUU@@@AUU@**********@UUUP@@@UUPJ********* EUUT@@@EUTB*********(AUUU@@@AUU@**********@UUUP@@@UUP********** EUUT@@@EUPB*********(AUUU@@@AUU@**********@UUUP@@@UUPJ********* EUUT@@@EUT@*********(AUUU@@@AUUPJ********(@UUUP@@@UUTB*********@UUUT@@@EUU@J******** EUUU@@@AUUT@@@@@@@@@@AUUUP@@@UUU@@@@@@@@@@@UUUT@@@EUUP@@@@@@@@@@UUUU@@@AUUUUUUUUUUUUUUUUUP@@@UUUUUUUUUUUUUUUUUT@@@@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> circleImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #circleImage"
	
	<resource: #image>
	^Image
		extent: 81 @ 83
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
			(ByteArray fromPackedString:
					'***************************@@@@@***************************@@@@@***************************@@@@@***************************@@@@@***************************@@@@@***************************@@@@@***************************@@@@@*************@@************@@@@@***********@@UU@J**********@@@@@**********@UUUUUPJ*********@@@@@********* UUUUUUUP*********@@@@@*********EUUUUUUUUB********@@@@@********(UUUU@UUUUTJ*******@@@@@********AUUU@*@EUUUP*******@@@@@*******(UUUP*** EUUUB******@@@@@*******!UUPJ**** UUUTJ*****@@@@@*******EUTJ******AUUUR*****@@@@@******(UUR*******(UUUR*****@@@@@******!UUJ********AUUT*****@@@@@******EUP*********(UUUJ****@@@@@*****(UUJ**********EUUR****@@@@@*****!UT*********** UUR****@@@@@*****EUR************EUT****@@@@@****(UUJ************!UUJ***@@@@@****(UT*************!UUJ***@@@@@****!UR*************(UUR***@@@@@****!UJ**************EUR***@@@@@****EUJ**************EUT***@@@@@***(UT***************!UUJ**@@@@@***(UR***************(UUJ**@@@@@***!UJ****************EUR**@@@@@***!UJ****************EUR**@@@@@***ET*****************!UT**@@@@@***ET*****************!UT**@@@@@**(UR*****************(UT**@@@@@**(UR*****************(UT**@@@@@**(UJ*****************(UT**@@@@@**(UJ******************EUJ*@@@@@**!UJ******************EUJ*@@@@@**!T*******************EUJ*@@@@@**!T*******************!UJ*@@@@@**!T*******************!UJ*@@@@@**ER*******************!UJ*@@@@@**ER*******************(UJ*@@@@@**ER*******************(UJ*@@@@@*(UJ*******************(UJ*@@@@@*(@@*******************(UJ*@@@@@**!T*******************!UJ*@@@@@**!UJ******************!UJ*@@@@@**!UJ******************!UJ*@@@@@**(UR******************!UJ*@@@@@**(UR******************EUJ*@@@@@**(UR******************EUJ*@@@@@**(UT******************EUJ*@@@@@**(UT******************ET**@@@@@***EUJ****************(UT**@@@@@***EUJ****************(UT**@@@@@***!UR****************(UT**@@@@@***!UR****************!UR**@@@@@***(UT****************EUR**@@@@@***(UUJ**************(UUR**@@@@@****EUR**************!UUJ**@@@@@****EUT**************EUUJ**@@@@@****!UT*************(UUT***@@@@@****(UUJ************!UUR***@@@@@****(UUR***********(EUUJ***@@@@@*****EUT***********!UUUJ***@@@@@*****!UUJ*********(EUUT****@@@@@*****(UUPJ********!UUUR****@@@@@*****(UUUPB******(EUUUR****@@@@@******EUUUT@J***(AUUUTJ****@@@@@****** UUUUUPB* AUUUUB*****@@@@@*******AUUUUUT@EUUUU@******@@@@@*******(EUUUUUUUUUUP*******@@@@@******** UUUUUUUUUPJ*******@@@@@*********@UUUUUUUTJ********@@@@@**********AUUUUUUB*********@@@@@**********(AUUUUP**********@@@@@***********(@@@@J**********@@@@@***************************@@@@@***************************@@@@@***************************@@@@@***************************@@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> cow1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #cow1Image"
	
	<resource: #image>
	^Image
		extent: 51 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(6552 5332 4111)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*****************@@@@J**************** @@@B****************(@@@@*****************@@@@J**************** @@@B* **************(@@@@**@**************@@@@J*(P J*********** @@@B**EQR***********(@@@@**!UR************@@@@J*!UT************ @@@B*(UUJ***********(@@@@*(UUT************@@@@J*EUUP*********** @@@B*EUUUR**********(@@@@*!UUUUJ**********@@@@J!UUUUTJ********* @@@B(UUUUUT@@@@@@@@J(@@@@(UUUUUUUUUUUUUUT*@@@@JEUUUUUUUUUUUUUUJ @@@B!@@EUUUUUUUUUUUR(@@@@*J*!UUUUUUUUUUUUJ@@@@J**(UUUUUUUUUUUUB @@@B***EUUUUUUUUUUUP(@@@@***!UUUUUUUUUUUTJ@@@@J***EUUUUUUUUUUU@ @@@B***!UUUUUUUUUUUPH@@@@***(UUUUUUUUUUURB@@@@J***EUUUUUUUUUUT  @@@B***!UUUUUUUUUUUHH@@@@****EUUUUUUUUUUR"@@@@J***!UUUUUUUUUUT( @@@B****EUUUUUUUUUUJH@@@@****(UUUUUUUUUUR*@@@@J****ETUUUUUUUUT* @@@B****!U@UUUPEUUT*(@@@@****(UR @@B!UQUJ*@@@@J****ER*****ETUR* @@@B****!T*****!UET*(@@@@****(UJ*****E@UJ*@@@@J****ER*****!HER* @@@B****!R******J!T*(@@@@****(T*******(UJ*@@@@J****EJ*******!R* @@@B****!R*******(R*(@@@@****(T********D**@@@@J***(T********EJ* @@@B****EJ******* R*(@@@@**** B******** **@@@@J**************** @@@B****************(@@@@*****************@@@@@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> cow2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #cow2Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(3276 3276 3276)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J****************(@@@B*****************@@@@*J**(************ @@@J"***J***********(@@@B(***"************@@@@(J**(J*********** @@@JB**(R***********(@@@B ***D************@@@@(R**EJ*********** @@@J!J*!J***********(@@@B(T@AR************@@@@*!UUR************ @@@J(UUT************(@@@B*EUUJ************@@@@*EUUT************ @@@J!UUUJ***********(@@@B(EUUT************@@@@*EUUUJ**** @@@@** @@@J!UUUT@@@@AUUUUP*(@@@B*EUUUUUUUUUUUUUJ*@@@@*!UUUUUUUUUUUUUR* @@@J(UUUUUUUUUUUUUUJ(@@@B*!UUUUUUUUUUUUTR*@@@@*(UUUUUUUUUUUUUD* @@@J*EUUUUUUUUUUUUPJ(@@@B*!UUUUUUUUUUUUTB*@@@@**EUUUUUUUUUUUUHJ @@@J*!UUUUUUUUUUUURB(@@@B**EUUUUUUUUUUUT *@@@@**!UUUUUUUUUUUUJJ @@@J**EUUUUUUUUUUUR (@@@B**!UUUUUUUUUUUT*J@@@@***EUUUUUUUUUUT*" @@@J**!UUUUUUUUUUUJ*(@@@B**(UUUUUUUUTEUR**@@@@***ETEUUUUUP!UT** @@@J**!UHAUUU@B(UUJ*(@@@B**(UJ*@@@J**EUR**@@@@***ER*******!UT** @@@J**!T*******(UT**(@@@B***EJ*******!UJ**@@@@***!J*******(UR** @@@J**(R********!T**(@@@B***D********(UJ**@@@@***!J********!R** @@@J**(R********(T**(@@@B***D********* ***@@@@*** *********(J** @@@J**!J********(R**(@@@B**(B*********@***@@@@***************** @@@J****************(@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> face1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #face1Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7130 5332 3597)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J****************(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@***************** @@@J***********J****(@@@B****@@@@@@@B*****@@@@**** @@@@@@@***** @@@J***(EUUUUUTJ****(@@@B****AUUUUUUB*****@@@@**** UUUUUUP***** @@@J***(EUUUUUTJ****(@@@B****AUUUUUUB*****@@@@**** UUUUUUP***** @@@J***(EUUUUUTJ****(@@@B@@@@AUUUUUU@@@@@@@@@@(@@@@UUUUUUP@@@@@@@@@JAUUUUUUUUUUUUUUP(@@@B(@@@AUUUUUUP@@@@*@@@@* @@@UUUUUUT@@@B* @@@J*** UUUUUUUB****(@@@B***(EUUUUUUP*****@@@@****AUUUUUUTJ**** @@@J***@UUUUUUUB****(@@@B*** UUUUUUUP*****@@@@***(EUUUUUUTJ**** @@@J***AUUUUUUUB****(@@@B*** UUUUUUUP*****@@@@***(EUUUUUUTJ**** @@@J***AUUUUUUUB****(@@@B*** EUUUUUUP*****@@@@****AUUUUUUTJ**** @@@J*** EUUUUUUB****(@@@B****AUUUUUUP*****@@@@**** UUUUUUP***** @@@J***(AUUUUUTJ****(@@@B**** UUUUUTB*****@@@@****(AUUUUTB***** @@@J**** UUUUTB*****(@@@B*****AUUUUB******@@@@*****(@@@@@****** @@@J***** @@@@******(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@***************** @@@J****************(@@@B*****************@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> fence1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fence1Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 47
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*********************************************************************************(@@@@@@@@@@@@J**(AUUUUUUUUUUUJ**(TEUUUUUUUUUUJ**(UP@@@@@@@@AUJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UR********!UJ**(UP@@@@@@@@AUJ**(UUUUUUUUUUUUJ**(UUUUUUUUUUUUJ**(@@@@@@@@@@@@J*****************************************************************')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> fenceHorizontalImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fenceHorizontalImage"
	
	<resource: #image>
	^Image
		extent: 51 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AP@@@@@@@@@@@@@@@D@@@@T***************!@@@@EJ**************(P@@@AR***************D@@@@T***************!@@@@EJ**************(P@@@AP@@@@@@@@@@@@@@@D@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> fenceVerticalImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fenceVerticalImage"
	
	<resource: #image>
	^Image
		extent: 53 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5557 5557 5557)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUT@@@EUUUUUUUUUUUUUUUUU@@@AT@@@EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@AT***EUUUUUUUUUUUUP@@@UJ**!UUUUUUUUUUUUT@@@ER**(UUUUUUUUUUUUU@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> fishImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #fishImage"
	
	<resource: #image>
	^Image
		extent: 82 @ 66
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@******* J****************** @@@@*******EP@J**************** @@@@****** UUUP**************"* @@@@******EUUUUT************(B* @@@@*****(UUUUUUB***********!J* @@@@*****!UUUUUUT***********EJ* @@@@*****EUUUUUUUB********* T** @@@@**** UUUUUUUUT*********ET** @@@@****EUUUUUUUUUJ******* UR** @@@@***(UUUUUUUUUUP*******EUR** @@@@***(UUUUUUUUUUUJ*****(UUR** @@@@***!UUUUUUUUUUUP*****AUUJ** @@@@***!UUUUUUUUUUUUJ***(UUUJ** @@@@***EUUUUUUUUUUUUP***AUUT*** @@@@***EUUUUUUUUUUUUUJ*(UUUT*** @@@@**(UUUUUUUUUUUUUUR*!UUUT*** @@@@**(UUUUUUUUUUUUUUTHEUUUR*** @@@@**!UUUUUUUUUUUUUUUQUUUUR*** @@@@**!UUUUUUUUUUUUUUUUUUUUJ*** @@@@**EUUUUUUUUUUUUUUUUUUUUJ*** @@@@**AUUUUUUUUUUUUUUUUUUUT**** @@@@**(@UUUUUUUUUUUUUUUUUUT**** @@@@****@EUUUUUUUUUUUUUUUUT**** @@@@***** AUUUUUUUUUUUUUUUR**** @@@@******(@UUUUUUUUUUUUUUR**** @@@@*******(AUUUUUUUUUUUUUJ**** @@@@****** AUUUUUUUUUUUUUUJ**** @@@@*****@EUUUUUUUUUUUUUUUJ**** @@@@***(@UUUUUUUUUUUUUUUUUR**** @@@@** AUUUUUUUUUUUUUUUUUUR**** @@@@*(EUUUUUUUUUUUUUUUUUUUR**** @@@@**EUUUUUUUUUUUUUUUUUUUT**** @@@@**!UUUUUUUUUUUUUUUUUUUT**** @@@@**(UUUUUUUUUUUUUUTEUUUT**** @@@@***EUUUUUUUUUUUUUB!UUUUJ*** @@@@***!UUUUUUUUUUUUP*(UUUUJ*** @@@@***!UUUUUUUUUUUTJ**EUUUJ*** @@@@***(UUUUUUUUUUUB***!UUUR*** @@@@****EUUUUUUUUUP****(EUUR*** @@@@****!UUUUUUUUTJ*****!UUR*** @@@@****(UUUUUUUUB******(UUT*** @@@@*****@@@AUUUP********EUT*** @@@@********(@@@J********!UUJ** @@@@*********************(UUJ** @@@@**********************EUJ** @@@@**********************!UR** @@@@**********************(UR** @@@@***********************AR** @@@@***********************(T** @@@@************************D** @@@@************************ ** @@@@************************(J* @@@@*************************J* @@@@*************************** @@@@*************************** @@@@*************************** @@@@*************************** @@@@')
]

{ #category : #resources }
VectorialImageLibrary class >> loadVectorialPOV: selector [
	"Le format d'enregistrement dans la m√©thode de classe est √† de la forme suivante
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage color linecolor linewidth sizeR position vertiCollec data verticesDecalle a2 a1 |
	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	data := self perform: selector.
	color := ColorValue
		red: (data at: 1) asNumber
		green: (data at: 2) asNumber
		blue: (data at: 3) asNumber.
	linecolor := ColorValue
		red: (data at: 4) asNumber
		green: (data at: 5) asNumber
		blue: (data at: 6) asNumber.
	linewidth := (data at: 7) asNumber.
	sizeR := (data at: 8) asNumber.
	position := (data at: 9) asSymbol.
	verticesDecalle := (data at: 10) tokensBasedOn: #@.
	vertiCollec := OrderedCollection new.
	a2 := nil.
	verticesDecalle
		do:
			[:a1b2 | 
			a2
				ifNotNil:
					[a1 := a1b2 at: 1.
					a1 isSequenceable
						ifTrue:
							[a1 := Fraction
								numerator: a1 first
								denominator: a1 last]
						ifFalse: [a1b2 at: 1].
					vertiCollec add: (Point x: a2 y: a1)].
			a2 := a1b2 last.
			a2 isSequenceable
				ifTrue:
					[a2 := Fraction
						numerator: a2 first
						denominator: a2 last]].	"verticesDecalle do:[: a1b2 | 
vertiCollec add: (Point x: ((a1b2  first tokensBasedOn: #/) first first)  y: ((a1b2  first tokensBasedOn: #/) last first)).]."	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := VectorialElementaryPOV
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	data size >= 11 ifTrue: [aNewImage isDistortable: (data at: 11)].
	^aNewImage
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> man1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man1Image"
	
	<resource: #image>
	^Image
		extent: 45 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 2955 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************@*****(@@*****J*@*****(UUB****J*@*****!UUR****J*@*****!UUT***(J*@*****EUUT***(J*@*****EUUUJ**(J*@*****EUUUJ**(J*@*****EUUT***(J*@*****EUUT***(J*@*****!UUR***!J*@*****!UUR***!J*@*****!UUJ @@AJ*@****(EUU@EUUUJ*@****AUUUUUUUUJ*@*** UUUUUUUUPJ*@**(EUUUUUUU@HJ*@**AUUUUUUT@*(J*@* UU@EUUUB**(J*@*ET@*EUUUJ**(J*@*!T**EUUUJ**(J*@*(UJ*EUUUJ**(J*@**EJ*EUUUJ**(J*@**!J*EUUUJ**(J*@**!R*EUUUJ**(J*@**(R*!UUUJ**(B*@***B*!UUT****B*@*** *!UUT****B*@***(*!UUT****B*@*****!UUT****B*@*****!UUT****B*@*****!UUT****B*@*****!TUT****B*@*****ETUT****B*@*****ERET****B*@*****ERET****B*@*****ERET****B*@****(UR!UJ***B*@****(UJ!UJ***B*@****(UJ!UJ***B*@****(UJ(UJ***"*@****!UJ(UJ***"*@****!T*(UJ***"*@****!T**EJ***"*@****!T**EJ***"*@****ET**ER***"*@****ER**!R***"*@****@B** B***"*@***************@***************@***************@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> man2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man2Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 0 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUT@@EUUUUUUP@@@@UUUUUUT**(EUUUUUT@@@@EUUUUUT***!UUUUUU@@@@AUUUUUT****EUUUUUP@@@@UUUUUUJ***!UUUUUT@@@@EUUUUUJ****EUUUUU@@@@AUUUUUR****!UUUUUP@@@@UUUUUT****(UUUUUT@@@@EUUUUUJ****EUUUUU@@@@AUUUUUT****!UUUUUP@@@@UUUUUUJ***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ**(UUUUUUP@@@@UUUUUUT**(UUUUUUT@@@@D@@@@@@J**@@@EUUU@@@@AJ***********(@@@P@@@@TB************* T@@@@EU@J********** AU@@@@AUUT@******* @AUUP@@@@UUUUPB**** AUUUUT@@@@EUUUUU@***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUT***(UUUUUU@@@@AUUUUUUJ***EUUUUUP@@@@UUUUUUR***!UUUUUT@@@@EUUUUUR**J(UUUUUU@@@@AUUUUUT**B*EUUUUUP@@@@UUUUUUJ*!J(UUUUUT@@@@EUUUUUR*!R*EUUUUU@@@@AUUUUUR*(T*!UUUUUP@@@@UUUUUT*(UJ(UUUUUT@@@@EUUUUUJ*ET*!UUUUU@@@@AUUUUUR*EUJ(UUUUUP@@@@UUUUUR*!UR*EUUUUT@@@@EUUUUT*!UUJ!UUUUU@@@@AUUUUUJ(UUR*EUUUUP@@@@UUUUUR(UUT*!UUUUT@@@@EUUUUR*EUUJ(UUUUU@@@@AUUUUT*EUUT*EUUUUP@@@@UUUUU@AUUU@@UUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUUUUUUUUUUUP@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> man3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man3Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5492 5492)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************************************@@J************ UUP************EUUT***********(UUUUJ**********(UUUUJ**********(UUUUJ**********(UUUUJ**********!UUUTJ**********!QUUTR**********!AUUTB********** !UURB**********"!UUR"***********EUUR***********(UUUR***********!UUUT***********EUUUUB*********(UUUUUT*********!UUUUUUJ********EUAUUTER*******(UP!UUT T*******!PJEUUUJAB******DJ*EUUUJ(D*****(B*(UUUUJ* J**** **(UUUUR**B*******!UUUUR**********!UUUUR**********!UUUUT**********EUUUUT**********EUUUUUJ********(UUUUUUJ********(UUUUUUR********(UUUUUUT********!UUUUUUT********!UUUUUUUJ*******EUUUUUUUR*******EUUUUUUUT******(UUUUUUUUT******(AUUTAUUT@J******(@UB(E B**********AJ*EZ***********!J*EZ***********D**!Z***********D**!Z**********(T**!Z**********(T**!Z**********(R**(Z**********!R**(Z********** B**(B*********************')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> man4Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #man4Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 50
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
					'**************** @@@@J*********"*****(@@@@B**********J*****@@@@@**********(***** @@@@J**********B****(@@@@B**********(J****@@@@@***********"**** @@@@J*****(J***(J***(@@@@B*****(TJ***B****@@@@@*****(UTJ**(**** @@@@J*****EUT***B***(@@@@B*****!UT*** ****@@@@@*****(UUJ**(J*** @@@@J*****!UJ***B***(@@@@B*****(UR*** ****@@@@@******ER***(R*** @@@@J*****!T****D***(@@@@B*****(UJ**(AJ***@@@@@******ER**@UR*** @@@@J****(EU@@D@R***(@@@@B****(UUUT@* ****@@@@@****(TUUP**(J*** @@@@J*** TEUT**(R***(@@@@B***!T!UUJ**D****@@@@@*** EPUUJ** **** @@@@J***(@EUR**(J***(@@@@B***** UT***B****@@@@@******EUJ**D**** @@@@J*****!UJ** ****(@@@@B*****(UR**(J****@@@@@******ET***B**** @@@@J*****!UR**B****(@@@@B*****(UT** *****@@@@@*****(UUR* ***** @@@@J*****EQT*(*****(@@@@B*****!RER(J*****@@@@@*****(T(T*J***** @@@@J****(T*ER******(@@@@B*****EJ(T*******@@@@@*****!J*!R****** @@@@J****!R*(T******(@@@@B****(R*(T*******@@@@@****(T**EJ****** @@@@J****D**!R******(@@@@B****EJ*(T*******@@@@@****!J*(T******* @@@@J***!R**EJ******(@@@@B***(T**ET*******@@@@@***(@B*"******** @@@@J***************(@@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> plant1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #plant1Image"
	
	<resource: #image>
	^Image
		extent: 48 @ 49
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5492 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUT%UUUUUUUUUUUUUUT!UUUUUUUUUUUUUUT!UUUUUUUUUUUUUUTEUUUUUUUUUUUUUUTEUUUUUUUUUUUUUUTEUUUUUUUUUUUUUUTEUUUUUEUUUUTUUUUEUUUUTUUUUUTUUUTEUUUUPUUUUUUEUUTEUUUUAUUUUUUEUUTEUUUUAUUEUUUAUUTEUUUTEUUPUUUQUUTEUUUREUUTEUUPUUREUUUHUUUUAUUPUUREUUT(UUUUHEUREUREUUR!UUUUR!UTEUREUUJ!UUUUT(UT!UREUUJEUUUUUJAT!UREUT*EUUUUUR(UHUJEUR(UUUPUUT*EHUJ!UJ(UU@AUUUJ JEJ!T*!U@ UUUUR*BEJ!R* @*EUUUUR*"!J!R*B* UUUUUT** *!J***EUUUUUUJ*(* *** UUUUUUUR*(*"**(EUUUUUUUT******!UUUUUUUUUJ****(EUUUUUUUUUR****AUUUUUUUUUUT***(UUUUUUUUUUUT***AUUUUUUUUUUUUJ*(UUUUUUUUUUUUUR*AUUUUUUUUUUUUUT UUUUUUUUUUUUUUUEUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> plant2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #plant2Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 50
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 5492 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUPUUUUUUUUP@@@@EUUUUUUV UUUUUUUT@@@@AUUUUUTU* UUUUUUU@@@@@UUUUUU@Z*!UUUUUUP@@@@EUUUUUT"*(UUUUUUT@@@@AUUUUUUJ**!UUUUUU@@@@@UUUUUUR**!UU@AUUP@@@@EUUUUAUJ*(UUR(UUT@@@@AUUUTHUR*(UUT*EUU@@@@@UUUP*ET**EUUJ!UUP@@@@EUUUB!UJ*EUUR(UUT@@@@AUUUUJAR*!UUR(UUU@@@@@UUUUJ*D*!UUT(UUUP@@@@EUUUR*!J(UUT(UUUT@@@@AUUUPB(R*EUUHUUUU@@@@@UUUUT*D*!UUJEUUUP@@@@EQUUUR(J(@EREUUAT@@@@ATATUT*B**EREUUJA@@@@@T*DEUJ **!T!UUJ(P@@@@EJ((UR(J*!T!UTJ*D@@@@AR**ET*B*!T!T@**!@@@@@R**(UR *(UH@***(P@@@@DJ**ET*J(UHJ****D@@@@ATB*(UJ"*EJ*****!@@@@@UUB*@B(*!R****@!P@@@@EUB****J(R***(EPT@@@@AUJ******B*** UUU@@@@@UJ****** ***!UUUP@@@@DJ@B****(***!UUUT@@@@@@EUB*******!UUUU@@@@@UUUUB******!UUUUP@@@@EUUUUJ*****!UUUUT@@@@AUUUUTJ****(UUUUU@@@@@UUUUUT****(UUUUUP@@@@EUUUUUJ***(UUUUUT@@@@AUUUUUT***(UUUUUU@@@@@UUUUUU@J*@UUUUUUP@@@@EUUUUUUT@EUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@AUUUUUUUUUUUUUUUU@@@@@UUUUUUUUUUUUUUUUP@@@@EUUUUUUUUUUUUUUUT@@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> rabbitImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #rabbitImage"
	
	<resource: #image>
	^Image
		extent: 50 @ 51
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
			(ByteArray fromPackedString:
					'****************(@@@@J****************@@@@B**************** @@@@****************(@@@@J****************@@@@B*****"********** @@@@*****"**********(@@@@J**** ***********@@@@B**** *********** @@@@****!J**********(@@@@J***(J*@@B*******@@@@B***(R(ETJ******* @@@@***(R UP********(@@@@J**@T!UB*********@@@@B* ETAUJ********* @@@@*!UUETJ*********(@@@@J!UUUT***********@@@@B!UUUT*********** @@@@(UUUT***********(@@@@HUUUUJ***********@@@@BEUUUR*********** @@@@!UUUUJ* @@@J****(@@@@HUUUUP@AUUUT@B***@@@@B!UUUUUUUUUUUT(J* @@@@(@@UUUUUUUUUUPR*(@@@@J*(UUUUUUUUUUUUJ*@@@@B**EUUUUUUUUUUUR* @@@@**EUUUUUUUUUUUB*(@@@@J*!UUUUUUUUUUUJ**@@@@B*!UUUUUUUUUUUR** @@@@*(UUUUUUUUUUUR**(@@@@J(UUUUUUUUUUUT***@@@@B*EQUUUUUUUUUUJ** @@@@*EQUUUUUUUUUUT**(@@@@J!PTUUUUUUUUUUJ**@@@@B!@T!UUUUUUUUUT** @@@@(JD*EUUUUUUUUUR*(@@@@HJD*(EUUUUUUUUT**@@@@BJD**(EUUUUPEUUR* @@@@* ***(EUUPB(UEUJ(@@@@J ****(EPB*(UHUR*@@@@B(*****(B**(UJ UJ @@@@(*********(PJ*!T(@@@@J*********(B***EJ@@@@B**************(T @@@@***************D(@@@@J**************!J@@@@B***************J @@@@***************"(@@@@J****************@@@@B**************** @@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> sheepImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sheepImage"
	
	<resource: #image>
	^Image
		extent: 52 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7034 7034 7034)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUUP@@@EUUUUUUUUUUUUUUUUT@@@AUUUUUUUUUUUUUUUUU@@@@UUUUUUUUUUUUT@@EUP@@@EUUUUUUUUUUUP@@AUT@@@AUUUUUUUUUUUPB* UU@@@@UUUUUUUUUUUTJ*(EUP@@@EUUUUUUUUUUTB**AUT@@@AUUUUUUUUUUTB** AU@@@@UUUUUUUUUUUB*** EP@@@EUUUUUUUUUU@****AT@@@AUP@@@EUUUU@**** E@@@@UP@@@@@@@@@*****AP@@@EP****@@@@B***** T@@@A@**************@U@@@@P*************(AUP@@@DJ*************@UT@@@AB*************@UU@@@@P*************@UUP@@@DJ************ EUT@@@AB************ EUU@@@@P************ EUUP@@@DJ***********(EUUT@@@AB************AUUU@@@@P************@UUUP@@@DJ*********** UUUT@@@AB*********** EUUU@@@@PJ**********(EUUUP@@@EB***********AUUUT@@@APJ**********@UUUU@@@@UB********** UUUUP@@@EP********** EUUUT@@@ATB*********(EUUUU@@@@UP**********AUUUUP@@@ETJ*********@UUUUT@@@AU@*@@@@@@B* UUUUU@@@@UTJ(@@@@@@* EUUUUP@@@EU@*AUUUUUB(EUUUUT@@@AUTJ UUUUUP(EUUUUU@@@@UUB(EUUUUTHAUUUUUP@@@EUPJAUUUUUB UUUUUT@@@AUUB UUUUUPHEUUUUU@@@@UUP*AUUUUUBAUUUUUP@@@EUTJ UUUUUP EUUUUT@@@AUU@(EUUUUTJAUUUUU@@@@UUTJAUUUUUB UUUUUP@@@EUUB UUUUUPHEUUUUT@@@AUUPHEUUUUUB@UUUUU@@@@UUUB@UUUUUP(EUUUUP@@@EUUP@AUUUUT@AUUUUT@@@AUUT@@UUUUU@@UUUUU@@@@UUUUUUUUUUUUUUUUUP@@@EUUUUUUUUUUUUUUUUT@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> tractorImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tractorImage"
	
	<resource: #image>
	^Image
		extent: 51 @ 53
		depth: 1
		bitsPerPixel: 1
		palette: MonoMappedPalette whiteBlack
		usingBits:
			(ByteArray fromPackedString:
					'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O???<@@@@@@????0@@@@@C????@@@@@@O???<@@@@@@????0@@@@@C????@@@@@@O @A>@@@@@@>@@G8@@@@@C8@@_ @@@@@G @@>@@@@@@^@@C8@@@@@A<@@O @@@@@G0@@>@@@@@@_@@C8@@@@@A<@@O @@@@@G0@@^@@@@@@_@@A<@@@@@A????0@N@@@G????@A<@@@_???<@G8@@A????0_?0@@G???????@@@_??????<@@A???????0@@G???????@@@_??????<@@A???????0@@G???????@@@_??????<@@A???????0@@G???????@@@???????<@@G???????0@@_???????@@C???????8@@O??????? @@???????>@@C???????8@@O??????<@@@???@@_?@@@C??8@@?<@@@G?? @C? @@@_?<@@O>@@@@_? @@_8@@@@?>@@A? @@@@?@@@A0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> tree1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree1Image"
	
	<resource: #image>
	^Image
		extent: 51 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'*****************@@@@J****** @B******* @@@B****(@AUU@@*****(@@@@****@UUUUUUPB****@@@@J***EUUUUUUUUJ*** @@@B***EUUUUUUUUT***(@@@@***EUUUUUUUUUR***@@@@J**EUUUUUUUUUT*** @@@B**!UUUUUUUUUUR**(@@@@**!UUUUUUUUUUUJ**@@@@J*!UUUUUUUUUUUT** @@@B*!UUUUUUUUUUUUJ*(@@@@*(UUUUUUUUUUUUR**@@@@J*EUUUUUUUUUUUT** @@@B*!UUUUUUUUUUUUR*(@@@@*(UUUUUUUUUUUUT**@@@@J*EUUUUUUUUUUUUJ* @@@B*!UUUUUUUUUUUUR*(@@@@**EUUUUUUUUUUUR**@@@@J*!UUUUUUUUUUUR** @@@B*(UUUUUUUUUUUT**(@@@@**EUUUUUUUUUUP***@@@@J*!UUUUUUUUUPB*** @@@B*(AUUUUUUU@B****(@@@@***@@@AUU@J******@@@@J*****(UUR******* @@@B******EUT*******(@@@@******!UUJ*******@@@@J*****!UUR******* @@@B*****(UUT*******(@@@@******EUUJ*******@@@@J*****!UUR******* @@@B*****(UUT*******(@@@@******EUUR*******@@@@J*****!UUT******* @@@B*****(UUUJ******(@@@@*****(UUUR*******@@@@J*****EUUT******* @@@B*****!UUUJ******(@@@@*****(UUUR*******@@@@J****(UUUT******* @@@B*****EUUUJ******(@@@@*****EUUUT*******@@@@J****!UUUUJ****** @@@B****!UUUUT******(@@@@****(UUUUUJ******@@@@J***(UUUUUT****** @@@B****EUU@@@J*****(@@@@****@@@J*********@@@@J**************** @@@B****************(@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> tree2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #tree2Image"
	
	<resource: #image>
	^Image
		extent: 52 @ 53
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5492 5492 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'***************** @@@J********@*******(@@@B*******(EPB******@@@@******* UUUB***** @@@J******!UUUUJ****(@@@B******AUUUUR*****@@@@******EUUUUUJ**** @@@J*****EUUUUUR****(@@@B*****EUUUUUUJ****@@@@*****EUUUUUUR**** @@@J****EUUUUUUUJ***(@@@B****EUUUUUUUR****@@@@****EUUUUUUUT**** @@@J***!UUUUUUUUR***(@@@B***!UUUUUUUUT****@@@@***(UUUUUUUUUJ*** @@@J***EUUUUUUUUR***(@@@B***EUUUUUUUUUJ***@@@@***!UUUUUUUUUR*** @@@J**(UUUUUUUUUT***(@@@B**(UUUUUUUUUUJ***@@@@***EUUUUUUUUUR*** @@@J**!UUUUUUUUUT***(@@@B***EUUUUUUUUUJ***@@@@***!UUUUUUUUUR*** @@@J***EUUUUUUUUT***(@@@B***!UUUUUUUUUJ***@@@@****EUUUUUUUUJ*** @@@J***!UUUUUUUUR***(@@@B****EUUUUP@@B****@@@@**** ET@UT******* @@@J****(@*EUJ******(@@@B*******!UR*******@@@@*******!UR******* @@@J******(UT*******(@@@B*******EUJ*******@@@@*******!UR******* @@@J******(UT*******(@@@B******(UUJ*******@@@@*******EUR******* @@@J******!UT*******(@@@B******!UUJ*******@@@@******!UUR******* @@@J*****!UUT*******(@@@B*****!UUUR*******@@@@*****(UUUT******* @@@J****(UUUUR******(@@@B****(UPEUT*******@@@@****(PB!TER****** @@@J***(B*(T(D******(@@@B******(P*(B******@@@@*******B**(****** @@@J******"*********(@@@@b')
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib1 [
	
	^self vectorLib: 1
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib10 [
	
	^self vectorLib: 10
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib11 [
	
	^self vectorLib: 11
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib12 [
	
	^self vectorLib: 12
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib2 [
	
	^self vectorLib: 2
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib3 [
	
	^self vectorLib: 3
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib4 [
	
	^self vectorLib: 4
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib5 [
	
	^self vectorLib: 5
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib6 [
	
	^self vectorLib: 6
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib7 [
	
	^self vectorLib: 7
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib8 [
	
	^self vectorLib: 8
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib9 [
	
	^self vectorLib: 9
]

{ #category : #resources }
VectorialImageLibrary class >> vectorLib: numero [
	
	| num |
	(num := (self imLibPage - 1) * 12 + numero)
		> (self class organization listAtCategoryNamed: #'images - vector') size
		ifTrue: [^self blankImage].
	^self
		loadVectorialPOV:
			((self class organization listAtCategoryNamed: #'images - vector') at: num)
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb0Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb0Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 5653 3115)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUUUUUUUUUUUP@@@@UUUUUUU@@@UUUUUUT@@@@EUUUUUUR**EUUUUUU@@@@AUUUUUUR*@(UUUUUUP@@@@UUUUUUT(EREUUUUUT@@@@EUUUUUUHUUAUUUUUU@@@@AUUUUUUHUUREUUUUUP@@@@UUUUUUPUUUAUUUUUT@@@@EUUUUUTEUUPUUUUUU@@@@AUUUUUTEUUT!UUUUUP@@@@UUUUUUAUUUHUUUUUT@@@@EUUUUUPUUUREUUUUU@@@@AUUUUUPUUUT(UUUUUP@@@@UUUUUTEUUUJEUUUUT@@@@EUUUUT!UUUT!UUUUU@@@@AUUUUUHUUUUJEUUUUP@@@@UUUUUREUUUR!UUUUT@@@@EUUUUREUUUT*EUUUU@@@@AUUUUT!UUUUJ!UUUUP@@@@UUUUUHUUUUR(UUUUT@@@@EUUUUJEUUUT*EUUUU@@@@AUUUUR!UUUUJ!UUUUP@@@@UUUUT(UUUUT(UUUUT@@@@EUUUUJEUUUUJEUUUU@@@@AUUUUR!UUUUR!UUUUP@@@@UUUUT(UUUUT(UUUUT@@@@EUUUUJEUUUUJEUUUU@@@@AUUUUP!UUUUR!UUUUP@@@@UUUUT@UUUUT(UUUUT@@@@EUUUUJEUUUUJEUUUU@@@@AUUUUT!UUUUR!UUUUP@@@@UUUUUHUUUUT(UUUUT@@@@EUUUUR!UUUUHUUUUU@@@@AUUUUUHUUUUREUUUUP@@@@UUUUUREUUUR!UUUUT@@@@EUUUUUAUUUT!UUUUU@@@@AUUUUUPUUUUHUUUUUP@@@@UUUUUT!UUUREUUUUT@@@@EUUUUUPUUUREUUUUU@@@@AUUUUUT!UUT!UUUUUP@@@@UUUUUUHUUUAUUUUUT@@@@EUUUUUTEUUHUUUUUU@@@@AUUUUUUHUUREUUUUUP@@@@UUUUUUREUREUUUUUT@@@@EUUUUUUHAR!UUUUUU@@@@AUUUUUUR*B!UUUUUUP@@@@UUUUUUUJ*(UUUUUUT@@@@EUUUUUUT* UUUUUUU@@@@AUUUUUUUPAUUUUUUUP@@@@UUUUUUUUUUUUUUUUT@@@@@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb1Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb1Image"
	
	<resource: #image>
	^Image
		extent: 51 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 4111 0)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUUUUUP@@EUUUT@@@@UUUUUUUUUR**!UUUU@@@@EUUUUUUUUR**(UUUUP@@@AUUUUUUUUR***EUUUT@@@@UUUUUUUUR***!UUUU@@@@EUUUUUUUR***(UUUUP@@@AUUUUUUUR****EUUUT@@@@UUUUUUUR****!UUUU@@@@EUUUUUUR****(UUUUP@@@AUUUUUUR**"**EUUUT@@@@UUUUUUT** **!UUUU@@@@EUUUUUT**!J*(UUUUP@@@AUUUUUT**!R**EUUUT@@@@UUUUUT**AT**!UUUU@@@@EUUUUT**EUJ*(UUUUP@@@AUUUUT**EUR**EUUUT@@@@UUUUT**EUT**!UUUU@@@@EUUUT(@EUUJ*(UUUUP@@@AUUUT@UUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUUJ*(UUUUP@@@AUUUUUUUUUR**EUUUT@@@@UUUUUUUUUT**!UUUU@@@@EUUUUUUUUU@@@UUUUP@@@AUUUUUUUUUUUUUUUUT@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb2Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb2Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 51
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
					'**************** @@@@J***************(@@@@B*********@J*****@@@@@******** ETB**** @@@@J******(AUUT****(@@@@B****** UUUUR****@@@@@******!UUUUT**** @@@@J*****(UUUUUJ***(@@@@B*****(UUUUUT****@@@@@*****(UUUUUUJ*** @@@@J*****EUU@UUR***(@@@@B*****EUTJ!UR****@@@@@*****!UT*(UT**** @@@@J****!UUJ*EUJ***(@@@@B****(UUJ*!UJ****@@@@@****(UUR*!UR**** @@@@J****EUR*(UT****(@@@@B****EUT*(UT*****@@@@@**** @@**EUJ**** @@@@J********EUJ****(@@@@B********!UR*****@@@@@********!UR***** @@@@J*******(UT*****(@@@@B*******(UT******@@@@@********EUJ***** @@@@J*******EUJ*****(@@@@B*******!UR******@@@@@*******!UR****** @@@@J******(UT******(@@@@B******(UT*******@@@@@*******EUJ****** @@@@J******!UR******(@@@@B******!UR*******@@@@@******(UT******* @@@@J*****(UT*******(@@@@B******EUJ*******@@@@@******EUJ******* @@@@J*****!UR*******(@@@@B*****!UR********@@@@@*****(UT******** @@@@J****(UT********(@@@@B*****EUJ********@@@@@*****EUJ******** @@@@J****!UP@@@@@***(@@@@B****!UUUUUUUJ***@@@@@****(UUUUUUUR*** @@@@J***(UUUUUUUT***(@@@@B****EUUUUUUUJ***@@@@@****EUUUUUUUR*** @@@@J*** @@@@@@@@***(@@@@B****************@@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb3Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb3"
	
	<resource: #image>
	^Image
		extent: 50 @ 53
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
					'****************(@@@@J****************@@@@B**************** @@@@******* @B******(@@@@J******!UT*******@@@@B******(UUR****** @@@@******(UUT******(@@@@J******EUUR******@@@@B******EUUT****** @@@@******!UAUJ*****(@@@@J*****(UJAR******@@@@B*****(UJ*D****** @@@@******EJ*!J*****(@@@@J*****!R*(R******@@@@B*****(R**D****** @@@@******D**!J*****(@@@@J***** **(R******@@@@B*****(J**B****** @@@@******B**D******(@@@@J********!J******@@@@B********!R****** @@@@********(R******(@@@@J*******(T*******@@@@B*******(T******* @@@@*******(UJ******(@@@@J******(TB*******@@@@B*******DEJ****** @@@@*******!UR******(@@@@J******(UUJ******@@@@B*******EUT****** @@@@*******!UUJ*****(@@@@J*******EUR******@@@@B*******(AT****** @@@@*********AJ*****(@@@@J********(R******@@@@B*****(J** ****** @@@@******B**(J*****(@@@@J***** ***D******@@@@B*****(J**!J***** @@@@******D**(R*****(@@@@J*****!J**D******@@@@B*****(R**!J***** @@@@******EB*!J*****(@@@@J*****!U@@R******@@@@B*****(UUUT****** @@@@******EUUUJ*****(@@@@J*****!UUUJ******@@@@B******EUUR****** @@@@******!UUT******(@@@@J*****(EUT*******@@@@B******(@@J****** @@@@****************(@@@@J****************@@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb4Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb4"
	
	<resource: #image>
	^Image
		extent: 50 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(5653 3115 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUUUUTEUUUUUP@@@@UUUUUUUUUUHUUUUUT@@@@EUUUUUUUUUJEUUUUU@@@@AUUUUUUUUURAUUUUUP@@@@UUUUUUUUUR UUUUUT@@@@EUUUUUUUUT EUUUUU@@@@AUUUUUUUUT(AUUUUUP@@@@UUUUUUUUUJHUUUUUT@@@@EUUUUUUUUJBEUUUUU@@@@AUUUUUUUUR !UUUUUP@@@@UUUUUUUUR(HUUUUUT@@@@EUUUUUUUT(REUUUUU@@@@AUUUUUUUUJD!UUUUUP@@@@UUUUUUUUJEHUUUUUT@@@@EUUUUUUUR!REUUUUU@@@@AUUUUUUUR(T!UUUUUP@@@@UUUUUUUT(UHUUUUUT@@@@EUUUUUUT*EREUUUUU@@@@AUUUUUUUJET!UUUUUP@@@@UUUUUUUJ!UHUUUUUT@@@@EUUUUUUR(UREUUUUU@@@@AUUUUUUR(UT!UUUUUP@@@@UUUUUUT*EUHUUUUUT@@@@EUUUUUT*EUREUUUUU@@@@AUUUUUUJ!UT!UUUUUP@@@@UUUUUUR(UUHUUUUUT@@@@EUUUUUR(UUREUUUUU@@@@AUUUUUT*EUT!UUUUUP@@@@UUUUUT*!UUHUUUUUT@@@@EUUUUUJ!UUREUUUUU@@@@AUUUUUJ(UUT!UUUUUP@@@@UUUUUR(UUUHUUUUUT@@@@EUUUUR*@@@B@EUUUU@@@@AUUUUT******!UUUUP@@@@UUUUT******(UUUUT@@@@EUUUU@@@@@B@EUUUU@@@@AUUUUUUUUUT!UUUUUP@@@@UUUUUUUUUUHUUUUUT@@@@EUUUUUUUUUREUUUUU@@@@AUUUUUUUUUT!UUUUUP@@@@UUUUUUUUUUHUUUUUT@@@@EUUUUUUUUUREUUUUU@@@@AUUUUUUUUUT!UUUUUP@@@@UUUUUUUUUUHUUUUUT@@@@EUUUUUUUUUREUUUUU@@@@AUUUUUUUUUT!UUUUUP@@@@UUUUUUUUUUHUUUUUT@@@@EUUUUUUUUUPEUUUUU@@@@AUUUUUUUUUUUUUUUUP@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb5Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb5"
	
	<resource: #image>
	^Image
		extent: 48 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 0 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'******************** @@@@@@D********!UUUUUUT********!UUUUUUT********!UUUT@@@********!T@@B***********ET**************ET**************ET**************ER**************ER**************ER**************ER**************ER**************ER**************ER*************(UR*************(UJ*************(UJ*************(UJ(@B**********(U@AUTJ*********(UUUUUP**********EUUUUUJ*********EUUUUUJ*********!UU@UUR*********!T@*EUR*********(B** UT**************ET**************!UJ*************!UJ*************(UR*************(UR**************ER**************ER**************!R**************!R**************ER**************ER**************ER**************ER*************(UR*************(UR*************AUJ************ UUJ*******(@@@@EUUJ*******(UUUUUUP********!UUUUUUJ********!UUUUUP********* @@@@@J**************************************')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb6Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb6"
	
	<resource: #image>
	^Image
		extent: 51 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 4593 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUU@@@@EUUUUUUUUUUUUUUUUP@@@AUUUUUT@@@@@AUUUUT@@@@UUUUUP******AUUUU@@@@EUUUUR*******AUUUP@@@AUUUUB** @J***EUUT@@@@UUUUJ*(AUT@B*!UUU@@@@EUUUR* UUUUU@HUUUP@@@AUUUR*!UUUUUUTEUUT@@@@UUUT*!UUUUUUUUUUU@@@@EUUT*(UUUUUUUUUUUP@@@AUUUJ(UUUUUUUUUUUT@@@@UUUR(UUUUUUUUUUUU@@@@EUUT*EUUUUUUUUUUUP@@@AUUT*EUUUUUUUUUUUT@@@@UUUJ!UUUUUUUUUUUU@@@@EUUR!UUUUUUUUUUUUP@@@AUUT(UUUUUUUUUUUUT@@@@UUUJEUUUUUUUUUUUU@@@@EUUR!UUUUUUUUUUUUP@@@AUUR(UUUUUUUUUUUUT@@@@UUT*EUUUUUUUUUUUU@@@@EUUJ!T@@@@AUUUUUUP@@@AUUR(P*****@@UUUUT@@@@UUT*B******* EUUU@@@@EUUB****(B***!UUUP@@@AUUP***(@UB***EUUT@@@@UUT"(@@UUUB**!UUU@@@@EUUH UUUUUUB**EUUP@@@AUUR!UUUUUUUB*!UUT@@@@UUUHUUUUUUUUB*EUU@@@@EUUREUUUUUUUUB!UUP@@@AUUT!UUUUUUUUT*EUT@@@@UUUHUUUUUUUUUR!UU@@@@EUUREUUUUUUUUT(UUP@@@AUUT!UUUUUUUUUJEUT@@@@UUUHUUUUUUUUUR!UU@@@@EUUR!UUUUUUUUR(UUP@@@AUUT(UUUUUUUUT*EUT@@@@UUUJEUUUUUUUUJ!UU@@@@EUUT!UUUUUUUUR!UUP@@@AUUUJEUUUUUUUB!UUT@@@@UUUR!UUUUUUTJ(UUU@@@@EUUT*EUUUUUP*(UUUP@@@AUUUJ!UUUUUB* UUUT@@@@UUUT*AUUUPJ*AUUUU@@@@EUUUJ*@EPB**EUUUUP@@@AUUUT**(B**(EUUUUT@@@@UUUU@@***@@UUUUUU@@@@EUUUUUP@@EUUUUUUUP@@@AUUUUUUUUUUUUUUUUT@@@@')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb7Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb7Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 52
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(7195 0 3597)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'UUUUUUUUUUUUUUUUT@@@@EUUUP@@@B@@@AUUUU@@@@AUUUT*******(UUUUP@@@@UUUUJ*******EUUUT@@@@EUUUJ*******!UUUU@@@@AUUUR** @@B*(UUUUP@@@@UUUT@@AUUT*(UUUUT@@@@EUUUUUUUUT**EUUUU@@@@AUUUUUUUUUJ*EUUUUP@@@@UUUUUUUUUJ*!UUUUT@@@@EUUUUUUUUR*!UUUUU@@@@AUUUUUUUUT*(UUUUUP@@@@UUUUUUUUT*(UUUUUT@@@@EUUUUUUUUJ*EUUUUU@@@@AUUUUUUUUR*EUUUUUP@@@@UUUUUUUUR*!UUUUUT@@@@EUUUUUUUT*!UUUUUU@@@@AUUUUUUUT*(UUUUUUP@@@@UUUUUUUUJ(UUUUUUT@@@@EUUUUUUUR*EUUUUUU@@@@AUUUUUUUR*EUUUUUUP@@@@UUUUUUUT*!UUUUUUT@@@@EUUUUUUUJ!UUUUUUU@@@@AUUUUUUUJ(UUUUUUUP@@@@UUUUUUUR(UUUUUUUT@@@@EUUUUUUR*EUUUUUUU@@@@AUUUUUUT*EUUUUUUUP@@@@UUUUUUUJ!UUUUUUUT@@@@EUUUUUUJ!UUUUUUUU@@@@AUUUUUUR(UUUUUUUUP@@@@UUUUUUT*EUUUUUUUT@@@@EUUUUUUJ!UUUUUUUU@@@@AUUUUUUR(UUUUUUUUP@@@@UUUUUUT(UUUUUUUUT@@@@EUUUUUUJEUUUUUUUU@@@@AUUUUUUR!UUUUUUUUP@@@@UUUUUUT(UUUUUUUUT@@@@EUUUUUUJEUUUUUUUU@@@@AUUUUUUR!UUUUUUUUP@@@@UUUUUUR!UUUUUUUUT@@@@EUUUUUT(UUUUUUUUU@@@@AUUUUUUJEUUUUUUUUP@@@@UUUUUUR!UUUUUUUUT@@@@EUUUUUT(UUUUUUUUU@@@@AUUUUUUJEUUUUUUUUP@@@@UUUUUUREUUUUUUUUT@@@@EUUUUUT!UUUUUUUUU@@@@AUUUUUUHUUUUUUUUUP@@@@UUUUUUPEUUUUUUUUT@@@@EUUUUUUUUUUUUUUUU@@@@AUUUUUUUUUUUUUUUUP@@@@UUUUUUUUUUUUUUUUT@@@@@@a')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb8Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb8Image"
	
	<resource: #image>
	^Image
		extent: 50 @ 50
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
					'****************(@@@@J****************@@@@B****(@@@@@****** @@@@**** UUUUUP*****(@@@@J***!UUUUUUP*****@@@@B***!UUUUUUUP**** @@@@***!UUUUUUUUP***(@@@@J**!UUU@@EUUUJ***@@@@B**!UUPJ*(@UUT*** @@@@**!UUB**** UUJ**(@@@@J*(UTJ***** UT***@@@@B**ET*******!UJ** @@@@**!UJ******(UR**(@@@@J*(UR*******ET***@@@@B**ET*******!T*** @@@@**@@J******(UJ**(@@@@J*!UR*******ER***@@@@B**ET******(ET*** @@@@**!UR***** UP***(@@@@J**ETJ****AUR****@@@@B** UTB** EUR**** @@@@*** UU@*AUUB****(@@@@J*** UUPEUTJ*****@@@@B**** UUEUP****** @@@@***** UQUUPB****(@@@@J*****ATUUUUB****@@@@B****@EUEUUUUB*** @@@@***(EUU@UUUUUJ**(@@@@J**(UUTJ AUUUT***@@@@B***EUP***@UUUJ** @@@@***EUB**** UUT**(@@@@J**EUJ***** EUR**@@@@B**!UJ******(ET** @@@@**!UJ*******(UJ*(@@@@J*(UR********ER**@@@@B**ET********!UJ* @@@@**!UJ*******(UR*(@@@@J*(UR********ET**@@@@B**ET********!UJ* @@@@**!UB******* UJ*(@@@@J*(UU@J*****AUR**@@@@B**EUUT@** @EUT** @@@@**!UUUUP@AUUUT**(@@@@J*(UUUUUUUUUUUJ**@@@@B**!UUUUUUUUUTJ** @@@@***EUUUUUUUUT***(@@@@J**(UUUUUUUUT****@@@@B*** EUUUUUUP**** @@@@****(@EUUP@B****(@@@@J*****(@@B*******@@@@@b')
]

{ #category : #'images - bitmap' }
VectorialImageLibrary class >> z_nb9Image [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #z_nb9Image"
	
	<resource: #image>
	^Image
		extent: 49 @ 51
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 4625 5589)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			(ByteArray fromPackedString:
					'**************** @@@@J***************(@@@@B*******@B*******@@@@@****** EU@****** @@@@J*****AUUUR*****(@@@@B*****EUUUUJ*****@@@@@*****!UUUUT***** @@@@J****!UU@EUR****(@@@@B****(UTJ(EUJ****@@@@@****(UT**(UT**** @@@@J****ET***EUJ***(@@@@B****EUJ**(UR****@@@@@****!UR***ET**** @@@@J***(UR***!UJ***(@@@@B***(UT***(UR****@@@@@****EUJ***ET**** @@@@J***!UR***!UJ***(@@@@B***(UT***(UR****@@@@@****EUJ***ET**** @@@@J***(UP***@UJ***(@@@@B****EUP*@DER****@@@@@****(UUPEUAT**** @@@@J****EUUUUPUJ***(@@@@B****(UUUUTER****@@@@@*****!UUU@ET**** @@@@J*****AUTJ!UJ***(@@@@B******E@*(UR****@@@@@******(J**ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J*********!UJ***(@@@@B*********(UR****@@@@@**********ET**** @@@@J****"****EUJ***(@@@@B****(B***!UJ****@@@@@*****EJ**!UR**** @@@@J****!TB*@UR****(@@@@B****(UU@EUR*****@@@@@*****EUUUUR***** @@@@J****(EUUUT*****(@@@@B*****(UUUP******@@@@@****** ETB****** @@@@J******(@*******(@@@@B****************@@@@@')
]

{ #category : #'initialize-release' }
VectorialImageLibrary >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.	" *** Replace this comment with the appropriate initialization code *** "
	^self
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib1 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib10 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib11 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib12 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib2 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib3 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib4 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib5 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib6 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib7 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib8 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib9 [
	
	| text |
	text := thisContext selector.
	self selectImLib: text
]

{ #category : #actions }
VectorialImageLibrary >> selectImLib: text [
	
	self observer
		setNewVectorialImage:
			(self class
				perform:
					('vectorLib'
						,
							(text
								copyFrom: 12
								to: text size)) asSymbol).
	self closeAndUnschedule
]
