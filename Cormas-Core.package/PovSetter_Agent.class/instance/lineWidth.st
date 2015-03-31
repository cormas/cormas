image
lineWidth
	
	| n |
	n := Cormas current
		request: 'Epaisseur du Trait : '
		initialAnswer: imageOS model lineWidth displayString.
	imageOS model lineWidth: n asNumber.
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate