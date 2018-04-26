model saving&loading EV
loadEV_file
	"Chargement eventuel des etats visuels des classes du modele"
	
	| evFileName |
	evFileName := (self class modelPath: self cormasModelClass name)
		construct:
			(self cormasModelClass version
				ifNotNil:
					[(self cormasModelClass version tokensBasedOn: $.) first , '.ev']
				ifNil: [self cormasModelClass name , '.ev']).
	evFileName exists
		ifFalse:
			["Facility for models built before november 2002"
			evFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass name , '.ev'].
	evFileName exists
		ifTrue:
			[self readVSFile: evFileName	"self cormasModelClass updateVS"	"initializeWithVS"].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false