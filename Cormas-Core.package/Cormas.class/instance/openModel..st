main menu
openModel: aModel
	
	aModel isNil ifTrue: [^nil].
	self cormasModelClass: aModel.	"self cormasModelClass initialize."
	self cormasModelClass allClasses isNil
		ifTrue: [self cormasModelClass initialize].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false.
	self cormasModel: self cormasModelClass newSimulation.
	self resetSimulation