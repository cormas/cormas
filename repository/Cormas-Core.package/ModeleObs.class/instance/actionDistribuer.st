action
actionDistribuer
	
	agents
		do:
			[:a | 
			a Cadre: self vue bounds.
			a emplacementAleatoire].
	fonction goFirstLevel