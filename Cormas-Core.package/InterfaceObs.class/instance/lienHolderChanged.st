preferences
lienHolderChanged
	
	| unAgent |
	unAgent := AgentObs new.
	unAgent Lien: lienHolder value.
	vueObs invalidate