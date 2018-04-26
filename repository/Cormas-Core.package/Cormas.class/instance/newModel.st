main menu
newModel
	
	| nomM |
	(nomM := self request: self alertModelName) isEmpty ifTrue: [^self].
	nomM beMutable.
	nomM
		at: 1
		put: nomM first asUppercase.
	nomM := Cormas checkIfNameContainsBlank: nomM.
	((Kernel includesKey: nomM asSymbol)
		or:
			[(Kernel includesKey: nomM asSymbol) or: [Core includesKey: nomM asSymbol]])
		ifTrue:
			[self alert_NameAlreadyExist.
			^self newModel].
	self cormasModelClass notNil
		ifTrue:
			[self cormasModelClass visualStateIsOpen
				ifTrue: [self visualStateWin closeRequest]].
	self closeModel.	" le modele courant est ferme, on peut en creer un autre"
	self cormasModelClass: (self createClassModelNamed: nomM).
	self packagingNamespace: self cormasModelClass environment.
	self cormasModelClass createDefaultMethods.
	self cormasModelClass initialize.
	self cormasModel: self cormasModelClass new.
	self
		setModelVersionEqualTo: (self cormasModelClass name , '.st') asFilename.
	self updateGUI.
	self modelName: nomM asSymbol.
	self dependents first label: 'Cormas [' , nomM , ']'.
	self setModelComments