init
initRandomly
	
	self createGridX: 100 Y: 100 neighbourhood: 8 closed: true.
	self initCells: #initRandomly