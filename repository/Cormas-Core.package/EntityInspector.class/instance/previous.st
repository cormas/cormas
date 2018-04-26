actions
previous
	
	| collec i |
	self resetInstanceShow.
	collec := self sortedEntitiesCollec.
	i := collec indexOf: self entity.
	i = 1
		ifTrue: [object := EntityReference on: collec last]
		ifFalse: [object := EntityReference on: (collec at: i - 1)].
	self updateValues.
	self updateInstanceShow