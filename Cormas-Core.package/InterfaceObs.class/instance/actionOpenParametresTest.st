parametres
actionOpenParametresTest
	"modeleObs isInitialized ifFalse: [^self]."
	
	| dialogModel |
	dialogModel := SimpleDialog new.
	dialogModel
		postBuildBlock:
			[self builder componentAt: #fonction.
			self halt].
	dialogModel openFor: self interface: #ecranParametres.
	dialogModel
		postBuildBlock:
			[self builder componentAt: #fonction.
			self halt]