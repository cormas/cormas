init
init58WithFire
	self initCells: #init58.
	self pickCell ifNotNil:[:c| c state: #fire]