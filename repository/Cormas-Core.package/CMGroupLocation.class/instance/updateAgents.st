+ control
updateAgents
	" Get rid of dead components "
	
	self components 
		select: #dead
		thenDo: [ : a | 
			a patch notNil ifTrue: [ a leave ].
			self deleteComponent: a]