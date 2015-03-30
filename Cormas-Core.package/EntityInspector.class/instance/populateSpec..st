private-buttons list
populateSpec: prototypeSpec
	"Replicate a prototype spec by creating clones and changing the layout.
	Also send adaptButton:toRepresent: message to chage button's properties.
	The layout algorithm is 'numberOfColumns' icons in a row in the window."
	
	| width height maximumColumns iconPosition currentColumn firstX rows finalExtent |
	width := 6.
	height := 20.
	maximumColumns := 1.
	iconPosition := 0 @ 0.
	firstX := iconPosition x.
	currentColumn := 0.
	self attribute_List list
		do:
			[:att_Item | 
			| newButtonSpec |
			newButtonSpec := prototypeSpec copy.
			newButtonSpec layout: prototypeSpec layout copy.
			(newButtonSpec layout)
				leftOffset: newButtonSpec layout leftOffset + iconPosition x;
				rightOffset: newButtonSpec layout rightOffset + iconPosition x;
				topOffset: newButtonSpec layout topOffset + iconPosition y;
				bottomOffset: newButtonSpec layout bottomOffset + iconPosition y.
			self adaptButton: newButtonSpec toRepresent: att_Item.
			builder add: newButtonSpec.
			currentColumn := currentColumn + 1.
			(currentColumn \\ maximumColumns) isZero
				ifTrue:
					[iconPosition := iconPosition + (0 @ height).
					iconPosition x: firstX]
				ifFalse: [iconPosition := iconPosition + (width @ 0)]].
	rows := (currentColumn - 1) // maximumColumns.
	finalExtent := 0 @ (rows * height).
	finalExtent := builder window minimumSize + finalExtent.
	(builder window)
		changeExtent: finalExtent;
		minimumSize: finalExtent;
		maximumSize: finalExtent