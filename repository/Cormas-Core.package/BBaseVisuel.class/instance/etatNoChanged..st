accessing
etatNoChanged: unSymbol
	
	unSymbol notNil
		ifTrue:
			[listeEtat
				at: adaptor level
				put: (adaptor imageEtDico dico at: unSymbol)]