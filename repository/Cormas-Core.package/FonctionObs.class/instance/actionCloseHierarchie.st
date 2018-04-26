hierarchie
actionCloseHierarchie
	
	hierarchie notNil
		ifTrue:
			[hierarchie closeRequest.
			hierarchie := nil]