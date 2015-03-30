converting
asFigure
	
	| fig |
	fig := self figureType new.
	fig model: self.
	fig resetFigure.
	^fig