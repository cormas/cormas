parametres
actionOpenParametresOld
	"modeleObs isInitialized ifFalse: [^self]."
	
	| dialogModel |
	dialogModel := SimpleDialog new.
	InputFieldSpec new.
	dialogModel builder
		aspectAt: #fonction
		put: 10 asValue.
	self halt.
	dialogModel openFor: self interface: #ecranParametres