hierarchie
goFirstLevel
	
	hierarchie notNil
		ifFalse:
			[hierarchie := HierarchieObs new.
			hierarchie appelant: self].
	hierarchie levelHolder value: 0