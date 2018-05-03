init
initSmallGrid
	self
		createGridX: 10
		Y: 10
		neighbourhood: 4
		closed: false.
	self initCells: #initRandomly