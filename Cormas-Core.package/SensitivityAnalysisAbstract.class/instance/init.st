initialize-release
init
	
	super init.
	self simNumero: 0.
	nbOfRepeat := 0 asValue.
	randomSeed := Cormas seed asValue.
	fixRandomSeed := false asValue.
	fixRandomSeed onChangeSend: #changedRandomSeed to: self.
	self listProbes.
	listProbes selectionIndexHolder onChangeSend: #changedListProbes to: self.
	self initProbes.
	self initProbeFormat.
	self fileFormat value: self fileFormat value.
	self initFinalStep.
	finalStep onChangeSend: #changedFinalStep to: self.
	Dev todo:
			'on ne va qd meme pas garder toutes les simu sur le disque, non ?
	Non, il faudrait proposer de les virer lorsqu on ferme le modele'.
	self simManager enableBackward: false