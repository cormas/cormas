acces
incPrefOld: indice with: uneValeur
	
	| unePref |
	unePref := preferences at: indice.
	unePref pref = 0 ifTrue: [nbAmis := nbAmis + 1].
	unePref pref: unePref pref + uneValeur.
	nbMsg := nbMsg + uneValeur