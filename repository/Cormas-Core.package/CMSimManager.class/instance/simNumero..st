accessing
simNumero: nb
	
	undoList := nil.
	redoList := nil.
	simNumero := nb.
	self flag: #shouldBeRevised.
	"the following instruction is obsolete isn't it?
	self cormas simNum value: 'Sim number: ' , nb printString"