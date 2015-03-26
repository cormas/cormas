acces
incPref: agent
	
	| unePref |
	unePref := preferences at: agent.
	unePref pref = 0 ifTrue: [nbAmis := nbAmis + 1].
	unePref pref: unePref pref + 1.
	nbMsg := nbMsg + 1