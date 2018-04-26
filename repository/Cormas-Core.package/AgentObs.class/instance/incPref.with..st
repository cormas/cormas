acces
incPref: agent with: uneValeur
	
	| unePref |
	unePref := preferences at: agent.
	unePref = 0 ifTrue: [nbAmis := nbAmis + 1].
	preferences
		at: agent
		put: unePref + uneValeur.
	nbMsg := nbMsg + uneValeur