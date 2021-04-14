Class {
	#name : #ModeleObs,
	#superclass : #Model,
	#instVars : [
		'agents',
		'cardinal',
		'nomFichier',
		'init',
		'fonction',
		'level',
		'vue'
	],
	#classInstVars : [
		'random'
	],
	#category : #'Cormas-Core-Observer'
}

{ #category : #'class initialization' }
ModeleObs class >> new [
	
	^super new initialize
]

{ #category : #obsolete }
ModeleObs >> Rand [
	
	self deprecated: 'obsolete"	"	RandomNumber isNil ifTrue: [RandomNumber := RandomGenerator fromGenerator: 1 seededWith: Time millisecondClockValue].

	^RandomNumber next'
]

{ #category : #action }
ModeleObs >> actionCircle [
	
	| angle a |
	angle := (360 / agents size) asFloat degreesToRadians.
	1
		to: agents size
		do:
			[:i | 
			a := agents at: i.
			a Cadre: self vue bounds.
			a emplacementCircle: angle * i].
	fonction goFirstLevel
]

{ #category : #action }
ModeleObs >> actionClear [
	
	agents do: [:a | a clear].
	self displayOn: vue graphicsContext
]

{ #category : #action }
ModeleObs >> actionDistribuer [
	
	agents
		do:
			[:a | 
			a Cadre: self vue bounds.
			a emplacementAleatoire].
	fonction goFirstLevel
]

{ #category : #action }
ModeleObs >> actionUnTour [
	
	| b |
	b := false.
	agents
		do: [:a | (fonction estPresent: a level) ifTrue: [b := b | a bouger]].
	b ifTrue: [self displayOn: vue graphicsContext].
	^b
]

{ #category : #'gestion agents' }
ModeleObs >> agents [
	
	^agents
]

{ #category : #'gestion agents' }
ModeleObs >> agents: uneOC [
	
	agents := uneOC
]

{ #category : #fichier }
ModeleObs >> cheminObs [
	
	^'./obs/'
]

{ #category : #acces }
ModeleObs >> fonction [
	
	^fonction
]

{ #category : #acces }
ModeleObs >> fonction: uneFD [
	
	fonction := uneFD
]

{ #category : #'initialize-release' }
ModeleObs >> initialize [
	
	nomFichier := 'Observateur'.
	init := false.	"adaptor := BAdaptor name: 'les agents'
				model: self
				selector: #agents."
	level := 0.
	^self
]

{ #category : #test }
ModeleObs >> isInitialized [
	
	^agents notNil	"adaptor list size > 0 &"
]

{ #category : #'gestion controller' }
ModeleObs >> performRedButton: unPoint [
	
	agents isNil ifTrue: [^self].
	agents
		do:
			[:a | 
			(unPoint - a center) rrr
				<= (a agentSource class image rMax * a agentSource class image size)
				ifTrue:
					[a agentSource inspect.
					^self]]
]

{ #category : #'initialize-release' }
ModeleObs >> removeData [
	
	self halt	"obsolete"	"	RandomNumber := nil.



	fonction actionClose"
]

{ #category : #'gestion controller' }
ModeleObs >> setCheck: unMenu [
	
	| tmp subM testPdvActif |
	self fonction msgObs isNil
		ifFalse:
			[tmp := self fonction msgObs asList.
			tmp
				do:
					[:i | 
					i isObserved isNil
						ifTrue: [testPdvActif := 'nil']
						ifFalse: [testPdvActif := i isObserved asString].
					subM := (unMenu menuItemLabeled: i name asString) submenu.
					subM menuItems
						do:
							[:item | 
							item label = testPdvActif
								ifTrue: [item beOn]
								ifFalse: [item beOff]]]].
	^unMenu
]

{ #category : #'gestion controller' }
ModeleObs >> updatePov: menuSelection [
	
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
]

{ #category : #test }
ModeleObs >> view: v [
	
	vue := v
]

{ #category : #accessing }
ModeleObs >> vue [
	
	^vue
]

{ #category : #test }
ModeleObs >> vue: v [
	
	vue := v
]
