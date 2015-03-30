actions
next
	
	| collec i |
	self resetInstanceShow.
	collec := self sortedEntitiesCollec.
	i := collec indexOf: self entity.
	i = collec size
		ifTrue: [object := EntityReference on: collec first]
		ifFalse: [object := EntityReference on: (collec at: i + 1)].
	self updateValues.
	self updateInstanceShow