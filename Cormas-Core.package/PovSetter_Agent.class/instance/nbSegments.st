image
nbSegments
	
	| n |
	(n := Cormas current
		request: 'Nombre de Segments : '
		initialAnswer: imageOS model nbSegments displayString) isEmpty
		ifFalse:
			[imageOS model nbSegments: n asNumber.
			(self builder componentAt: #boutonAppliquer) enable.
			imageOS invalidate]