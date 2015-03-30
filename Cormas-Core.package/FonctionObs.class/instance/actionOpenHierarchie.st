hierarchie
actionOpenHierarchie
	
	hierarchie isNil ifFalse: [^self].
	hierarchie := HierarchieObs new.
	hierarchie appelant: self.
	hierarchie openInterface: #windowSpec