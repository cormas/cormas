init
init53WithFire
	self createGridX: 80 Y: 80 neighbourhood: 4 closed: false.
	self initCells: #init53.
	self pickCell state: #fire.