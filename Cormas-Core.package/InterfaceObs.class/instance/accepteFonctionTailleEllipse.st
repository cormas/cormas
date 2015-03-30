parametres
accepteFonctionTailleEllipse
	
	| controlr |
	self halt.
	controlr := (self builder componentAt: #fonction) widget controller.
	FonctionObs
		compile: controlr text
		classified: 'user functions'
		notifying: controlr