accessing
simName: aName
	
	simName := aName.
	
		self flag: #shouldBeRevised.
	"the following instruction is obsolete isn't it?
	self cormas simName value: 'Sim name: ' , simName"