init
init58WithFireWithFiremen
	| aCell |
	self createGridX: 80 Y: 80 neighbourhood: 4 closed: false.
	self initCells: #init58.
	1 to: self numberOfFires do: [:i | 
			aCell :=  self pickCell.
			aCell = nil ifTrue:[self halt].
			aCell state: #fire].
	self initAgents.