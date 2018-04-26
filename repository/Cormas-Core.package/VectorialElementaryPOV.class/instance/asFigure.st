private
asFigure
	| inst |
	inst := self class asFigure new: self polyline.
	inst model: self.
	self isStroked
		ifFalse: [ inst opaque ].
	inst lineWidth: self lineWidth.
	inst lineColor: self lineColor.
	inst fillColor: self color.
	inst scaleBy: self sizeRatio.
	inst pov: self name.
	inst isDistortable: self isDistortable.
	^ inst