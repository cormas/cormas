changed
listEntitiesChanged
	
	| selectedClass |
	(listEntities selection = nil or: [listEntities selection = '---'])
		ifTrue:
			[(self menuHolder value atNameKey: #addx) disable.
			^listProbes list: List new].
	(self menuHolder value atNameKey: #addx) enable.
	selectedClass := listEntities selection = 'Global'
		ifTrue: [self cormasModel]
		ifFalse:
			[self cormasModel environment at: listEntities selection asSymbol].
	self listProbes list: selectedClass probes.
	self initMenuAttributs