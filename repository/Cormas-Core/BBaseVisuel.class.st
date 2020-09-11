Class {
	#name : #BBaseVisuel,
	#superclass : #Model,
	#instVars : [
		'centre',
		'listeEtat',
		'adaptor'
	],
	#category : #'Cormas-Core-Observer'
}

{ #category : #'class initialization' }
BBaseVisuel class >> new [
	
	^super new initialize
]

{ #category : #obsolete }
BBaseVisuel >> Rand [
	
	self deprecated: 'obsolete"	"	Rand isNil ifTrue: [Rand := RandomGenerator fromGenerator: 1 seededWith: Time millisecondClockValue].

	^Rand next'
]

{ #category : #accessing }
BBaseVisuel >> adaptor [
	
	^adaptor
]

{ #category : #accessing }
BBaseVisuel >> center [
	
	^centre
]

{ #category : #accessing }
BBaseVisuel >> center: unPt [
	
	centre := unPt
]

{ #category : #accessing }
BBaseVisuel >> centre [
	
	^centre
]

{ #category : #accessing }
BBaseVisuel >> centre: unPt [
	
	centre := unPt
]

{ #category : #private }
BBaseVisuel >> displayOn: aGC [
	
	adaptor level = 0 ifTrue: [ ^ self ].
	self state isNil
		ifTrue: [ aGC paint: Color black ]
		ifFalse: [ aGC paint: self state color ].
	adaptor imageEtDico remplissage == #vide
		ifTrue:
			[adaptor imageEtDico geometric asStroker displayOn: aGC at: centre]
		ifFalse:
			[adaptor imageEtDico geometric asFiller displayOn: aGC at: centre]
]

{ #category : #private }
BBaseVisuel >> displayOnNew: aGC [
	
	adaptor level = 0 ifTrue: [ ^ self ].
	self state isNil
		ifTrue: [ aGC paint: Color black ]
		ifFalse: [ aGC paint: self state color ].
	adaptor imageEtDico remplissage == #vide
		ifTrue: [ adaptor imageEtDico geometric asStroker displayOn: aGC at: centre ]
		ifFalse: [ adaptor imageEtDico geometric asFiller displayOn: aGC at: centre ]
]

{ #category : #private }
BBaseVisuel >> displayOnOld: aGC [
	
	adaptor level ~= 0
		ifTrue: [ 
			self state notNil
				ifTrue: [ aGC paint: self state color ]
				ifFalse: [ aGC paint: Color black ].
			adaptor imageEtDico remplissage == #vide
				ifTrue: [ adaptor imageEtDico geometric asStroker displayOn: aGC at: centre ]
				ifFalse: [ adaptor imageEtDico geometric asFiller displayOn: aGC at: centre ] ]
]

{ #category : #accessing }
BBaseVisuel >> etat [
	
	^listeEtat at: adaptor level
]

{ #category : #accessing }
BBaseVisuel >> etat: unSymbol [
	
	self etatNoChanged: unSymbol.
	self changed: #ObjetVisuel with: self
]

{ #category : #accessing }
BBaseVisuel >> etatNoChanged: unSymbol [
	
	unSymbol notNil
		ifTrue:
			[listeEtat
				at: adaptor level
				put: (adaptor imageEtDico dico at: unSymbol)]
]

{ #category : #'initialize-release' }
BBaseVisuel >> initialize [
	
	^self
]

{ #category : #accessing }
BBaseVisuel >> listeEtat [
	
	^listeEtat
]

{ #category : #accessing }
BBaseVisuel >> listeEtat: anArray [
	
	listeEtat := anArray
]

{ #category : #private }
BBaseVisuel >> privateAdaptor: anAdaptor [
	
	adaptor := anAdaptor.
	listeEtat := Array new: anAdaptor list size
]

{ #category : #random }
BBaseVisuel >> randomState [
	
	| e |
	e := adaptor imageEtDico dico
		detect: [:etat | etat cumul >= (self Rand * 100)].
	listeEtat
		at: adaptor level
		put: e.
	^e
]

{ #category : #'affichage public' }
BBaseVisuel >> show [
	
	self changed: #ObjetVisuel with: self
]

{ #category : #accessing }
BBaseVisuel >> state [
	
	^listeEtat at: adaptor level
]

{ #category : #accessing }
BBaseVisuel >> state: unSymbol [
	
	self etatNoChanged: unSymbol.
	self changed: #ObjetVisuel with: self
]
