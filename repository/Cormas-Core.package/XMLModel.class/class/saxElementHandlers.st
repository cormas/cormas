private-sax
saxElementHandlers
	
	saxElementHandlers isNil
		ifTrue:
			[saxElementHandlers := Dictionary new.
			saxElementHandlers at: 'modele' put: #ignoreElement:.
			saxElementHandlers at: 'dimension' put: #startElementDimension:.
			saxElementHandlers at: 'cloture' put: #startElementCloture:.
			saxElementHandlers at: 'connexite' put: #startElementConnexite:.
			saxElementHandlers at: 'delimiteur' put: #startElementDelimiteur:.
			saxElementHandlers at: 'attributs' put: #ignoreElement:.
			saxElementHandlers at: 'att' put: #startElementAtt:.
			saxElementHandlers at: 'vues' put: #ignoreElement:.
			saxElementHandlers at: 'vue' put: #startElementVue:.
			saxElementHandlers at: 'grammaire' put: #startElementGrammaire:.
			saxElementHandlers at: 'comp' put: #startElementComp:.
			saxElementHandlers at: 'legende' put: #startElementLegende:.
			saxElementHandlers at: 'attribut' put: #startElementAttribut:.
			saxElementHandlers at: 'seuil' put: #startElementSeuil:.
			saxElementHandlers at: 'urls' put: #startElementUrls:.
			saxElementHandlers at: 'vueref' put: #startElementVueref:.
			saxElementHandlers at: 'agents' put: #ignoreElement:.
			saxElementHandlers at: 'classe' put: #startElementClasse:].
	^saxElementHandlers