visualisation
openVisuCommunications
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModelClass commClasses isEmpty ifTrue: [^self alertNoComm].
	Dialog warn: 'Under reconstruction'	"
	self currentSimulation isNil
		ifTrue: [self currentSimulation: self cormasModelClass new].
self currentSimulation channel isNil ifTrue: [ self initializeChannel].
	largeurFenPrincipale := self builder window width.
	self obsWin isNil
		ifTrue: 
			[self
				obsWin: (FonctionObs populationSource: self currentSimulation channel population
						at: largeurFenPrincipale).
		self currentSimulation channel addFonctionObs: self obsWin.
			self obsWin msgObs: self cormasModelClass messages]
		ifFalse: [self obsWin reinitializeAt: largeurFenPrincipale]"