private
asFigure
	
	| inst |
	inst := self class asFigure new.
	inst bitmap: self bitmap.
	inst model: self.
	inst scaleBy: self sizeRatio.
	^inst