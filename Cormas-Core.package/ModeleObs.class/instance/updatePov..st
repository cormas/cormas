gestion controller
updatePov: menuSelection
	
	| nomClasse nomMethode class |
	nomClasse := menuSelection copyUpTo: $*.
	class := agents first agentSource class environment at: nomClasse.
	nomMethode := menuSelection
		copyFrom: (menuSelection indexOf: $*) + 1
		to: menuSelection size.
	nomMethode = 'nil'
		ifFalse: [class isObserved: nomMethode asSymbol]
		ifTrue: [class isObserved: nil].
	self setCheck: self vue controller menu