interface opening
loadImage: aPOV
	
	| figure |
	self drawing removeAll: self drawing components.
	figure := aPOV asFigure.
	self drawing add: figure.
	figure translateTo: self drawing center - (figure extent / 2)