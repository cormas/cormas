aspects
sliderWidthChanged
	
	| vectFig y d f figurePosition |
	self drawing components isEmpty ifTrue: [^nil].
	vectFig := self drawing components first.
	figurePosition := vectFig bounds center.
	y := vectFig bounds extent x.
	d := self drawing bounds extent x.
	f := sliderWidth value.
	vectFig scaleByWithAnswer: (f * d / y) @ 1.
	vectFig translateTo: figurePosition - (vectFig bounds extent / 2)