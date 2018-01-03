control
stepSynchronously: t
	self activeCells
		do: [ :a | 
			a evaporate.
			a diffuse ].
	self updateActiveCells.
	self activeCells do: [ :a | a updateState ].
	self theAnts do: [ :a | a step ].
	self updateActiveCells