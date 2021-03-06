Class {
	#name : #FonctionObs,
	#superclass : #Object,
	#instVars : [
		'level',
		'oneLevel',
		'higherLevels',
		'lastFrom',
		'lastTo',
		'populationSource',
		'populationObservateur',
		'degreMax',
		'observateur',
		'hierarchie',
		'adaptor',
		'listeCanaux',
		'window',
		'msgObs'
	],
	#category : #'Cormas-Core-Observer'
}

{ #category : #'initialize-release' }
FonctionObs class >> new [
	
	^super new initialize
]

{ #category : #'initialize-release' }
FonctionObs class >> populationSource: uneOC [
	
	| tmp |
	tmp := super new initialize.
	^tmp
]

{ #category : #'initialize-release' }
FonctionObs class >> populationSource: uneOC at: unX [
	
	| tmp |
	tmp := super new initializeAt: unX.
	^tmp
]

{ #category : #'initialize-release' }
FonctionObs class >> populationSourceOld: uneOC [
	
	| tmp |
	tmp := super new initialize.
	tmp populationSource: uneOC.
	^tmp
]

{ #category : #'initialize-release' }
FonctionObs >> actionClose [
	
	self actionCloseHierarchie	"listeCanaux do: [:c | c removeFonctionObs: self]"
]

{ #category : #hierarchie }
FonctionObs >> actionCloseHierarchie [
	
	hierarchie notNil
		ifTrue:
			[hierarchie closeRequest.
			hierarchie := nil]
]

{ #category : #canal }
FonctionObs >> addCanal: unCanal [
	
	listeCanaux add: unCanal
]

{ #category : #hierarchie }
FonctionObs >> computeLevel: agentObs [
	"Calcul le niveau d'un agent de l'observateur"
	
	| nb |
	nb := 0.
	agentObs preferences keys
		do: [:p | (agentObs Attirant: p) ifTrue: [nb := nb + 1]].
	agentObs level: (nb / degreMax) ceiling
]

{ #category : #canal }
FonctionObs >> creerSocieteObsFromSocieteSource: listeAgentsSource [
	| cardinal tmp pref |
	listeAgentsSource isNil
		ifTrue: [ ^ self ].
	populationSource := listeAgentsSource.
	cardinal := populationSource size.
	populationObservateur := Array new: cardinal.
	1 to: cardinal do: [ :i | 
		tmp := AgentObs new.
		tmp agentSource: (populationSource at: i).
		tmp adaptor: adaptor.
		tmp fonction: self.
		tmp nom: i.
		tmp addDependent: observateur vueObs.
		populationObservateur at: i put: tmp ].
	populationObservateur
		do: [ :a | 
			a preferences: (Array new: cardinal).
			1 to: cardinal do: [ :i | 
				pref := Pref on: (populationObservateur at: i).
				a preferences at: i put: pref ] ].
	observateur modeleObs agents: populationObservateur.
	observateur modeleObs isInitialized
		ifTrue: [ observateur modeleObs actionDistribuer ]
]

{ #category : #fonctions }
FonctionObs >> definirEtat: unAgentObs [
	
	| agentSource i |
	agentSource := populationSource at: unAgentObs nom.
	i := (agentSource activite pChasseur / 10) rounded max: 2.
	unAgentObs etatNoChanged: i
]

{ #category : #fonctions }
FonctionObs >> definirEtat: unAgentObs pointDeVue: unEntier [
	"	| agentSource i |



	agentSource := populationSource at: unAgentObs nom. 



	unEntier = 1 ifTrue: [i := (agentSource activite pChasseur /10) rounded ].



	unEntier = 2 ifTrue: [i := (agentSource activite pAgriculteur / 50) rounded ].



	i = 0 ifTrue: [ i := 1].



	unAgentObs etatNoChanged: i"
	
	
]

{ #category : #hierarchie }
FonctionObs >> degreMax [
	
	^degreMax
]

{ #category : #hierarchie }
FonctionObs >> degreMax: v [
	
	degreMax := v.
	populationObservateur do: [:a | self computeLevel: a].
	observateur vueObs invalidate
]

{ #category : #test }
FonctionObs >> estPresent: unNiveau [
	
	^oneLevel | (higherLevels & (unNiveau >= level))
		| (higherLevels not & (unNiveau = level))
]

{ #category : #hierarchie }
FonctionObs >> hierarchie [
	
	^hierarchie
]

{ #category : #hierarchie }
FonctionObs >> hierarchie: aVal [
	
	hierarchie := aVal
]

{ #category : #hierarchie }
FonctionObs >> higherLevels [
	
	^higherLevels
]

{ #category : #hierarchie }
FonctionObs >> higherLevels: b [
	
	higherLevels := b.
	observateur vueObs invalidate
]

{ #category : #bakam }
FonctionObs >> intensiteLienPour: unMsg [
	"^unMsg xUG + unMsg xUPA @ (unMsg xUG + unMsg xUPA)"
	
	^1 @ 1
]

{ #category : #bakam }
FonctionObs >> interceptionMessage: unMsg [
	
	| methode |
	methode := unMsg class isObserved.
	methode notNil
		ifTrue: [^unMsg perform: methode]
		ifFalse: [^true]
]

{ #category : #hierarchie }
FonctionObs >> level [
	
	^level
]

{ #category : #hierarchie }
FonctionObs >> level: v [
	
	level := v.
	observateur vueObs invalidate
]

{ #category : #canal }
FonctionObs >> message: unMsg [
	
	| intensite |
	(self interceptionMessage: unMsg) ifFalse: [^self].
	self window isOpen
		ifTrue:
			[intensite := self intensiteLienPour: unMsg.
			lastFrom notNil
				ifTrue:
					[lastFrom cercleCommunication: false.
					lastTo cercleCommunication: false].
			lastFrom := unMsg sender agentObs.
			lastTo := unMsg receiver agentObs.
			lastFrom cercleCommunication: true.
			lastTo cercleCommunication: true.
			lastFrom
				incPref: unMsg receiver agentObs
				with: intensite x.
			lastTo
				incPref: unMsg sender agentObs
				with: intensite y.
			self computeLevel: lastFrom.
			self computeLevel: lastTo.
			lastTo displayOn: observateur vueObs graphicsContext.
			lastFrom displayOn: observateur vueObs graphicsContext.
			observateur actionGo]
]

{ #category : #canal }
FonctionObs >> messageOld: unMsg [
	
	| intensite |
	(self interceptionMessage: unMsg) ifFalse: [^self].
	intensite := self intensiteLienPour: unMsg.
	lastFrom notNil
		ifTrue:
			[lastFrom cercleCommunication: false.
			lastTo cercleCommunication: false].
	lastFrom := populationObservateur at: unMsg sender.
	lastTo := populationObservateur at: unMsg receiver.
	lastFrom cercleCommunication: true.
	lastTo cercleCommunication: true.
	lastFrom
		incPref: unMsg receiver
		with: intensite x.
	lastTo
		incPref: unMsg sender
		with: intensite y.
	self computeLevel: lastFrom.
	self computeLevel: lastTo.
	observateur actionGo
]

{ #category : #accessing }
FonctionObs >> msgObs [
	
	^msgObs
]

{ #category : #accessing }
FonctionObs >> msgObs: anObject [
	
	msgObs := anObject
]

{ #category : #test }
FonctionObs >> niveauxCompatibles: unPoint [
	
	^oneLevel or: [unPoint x = unPoint y]
]

{ #category : #accesssing }
FonctionObs >> observateur [
	
	^observateur
]

{ #category : #hierarchie }
FonctionObs >> oneLevel [
	
	^oneLevel
]

{ #category : #hierarchie }
FonctionObs >> oneLevel: b [
	
	oneLevel := b.
	observateur vueObs invalidate
]

{ #category : #accesssing }
FonctionObs >> populationObservateur [
	
	^populationObservateur
]

{ #category : #canal }
FonctionObs >> populationSource: uneOC [
	
	| tmp unController |
	uneOC isNil ifTrue: [^self].
	populationSource := uneOC.
	populationObservateur := OrderedCollection new.
	populationSource
		do:
			[:unAgent | 
			tmp := AgentObs new.
			tmp agentSource: unAgent.
			tmp preferences: Dictionary new.
			tmp fonction: self.
			tmp addDependent: observateur vueObs.
			unAgent agentObs: tmp.
			populationObservateur add: tmp].
	populationObservateur
		do:
			[:unAgentObs | 
			populationObservateur
				do:
					[:anotherAgentObs | unAgentObs preferences at: anotherAgentObs put: 0]].
	observateur modeleObs agents: populationObservateur.
	observateur modeleObs isInitialized
		ifTrue: [observateur modeleObs actionDistribuer].
	unController := ControllerObs new.
	unController model: observateur modeleObs.
	unController performer: observateur.
	observateur vueObs controller: unController.
	unController initializeMenuCustom
]

{ #category : #canal }
FonctionObs >> populationSourceAddAgent: anAgent [
	
	| tmp |
	anAgent isNil ifTrue: [^self].
	tmp := AgentObs new.
	tmp agentSource: anAgent.
	tmp preferences: Dictionary new.
	tmp fonction: self.
	tmp addDependent: observateur vueObs.
	anAgent agentObs: tmp.
	populationObservateur add: tmp.
	populationObservateur
		do:
			[:anotherAgentObs | 
			tmp preferences at: anotherAgentObs put: 0.
			anotherAgentObs preferences at: tmp put: 0].
	observateur modeleObs actionDistribuer
]

{ #category : #canal }
FonctionObs >> populationSourceRemoveAgent: anAgent [
	
	anAgent isNil ifTrue: [^self].
	populationObservateur
		do:
			[:anotherAgentObs | anotherAgentObs preferences removeKey: anAgent agentObs].
	observateur modeleObs agents remove: anAgent agentObs.
	anAgent agentObs agentSource: nil.
	anAgent agentObs: nil.
	self populationSource remove: anAgent.
	observateur modeleObs actionDistribuer
]

{ #category : #'display liens' }
FonctionObs >> showLink: a to: b withGC: aGC [
	
	oneLevel
		ifTrue:
			[self oneLevel: a to: b withGC: aGC.
			^self].
	higherLevels
		ifTrue:
			[self higherLevels: a to: b withGC: aGC.
			^self].
	self thisLevel: a to: b withGC: aGC
]

{ #category : #accessing }
FonctionObs >> window [
	
	^window
]

{ #category : #accessing }
FonctionObs >> window: anObject [
	
	window := anObject
]
