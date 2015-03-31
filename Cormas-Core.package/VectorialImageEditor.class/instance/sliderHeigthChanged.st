aspects
sliderHeigthChanged
	
	| vectFig y d f figurePosition |
	self drawing components isEmpty ifTrue: [^nil].
	vectFig := self drawing components first.
	figurePosition := vectFig bounds center.
	y := vectFig bounds extent y.
	d := self drawing bounds extent y.
	f := sliderHeigth value.
	vectFig scaleByWithAnswer: 1 @ (f * d / y).
	vectFig translateTo: figurePosition - (vectFig bounds extent / 2)