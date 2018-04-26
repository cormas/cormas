random
randomState
	
	| e |
	e := adaptor imageEtDico dico
		detect: [:etat | etat cumul >= (self Rand * 100)].
	listeEtat
		at: adaptor level
		put: e.
	^e