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

{ #category : #hierarchie }
FonctionObs >> actionOpenHierarchie [
	
	hierarchie isNil ifFalse: [^self].
	hierarchie := HierarchieObs new.
	hierarchie appelant: self.
	hierarchie openInterface: #windowSpec
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
FonctionObs >> goFirstLevel [
	
	hierarchie notNil
		ifFalse:
			[hierarchie := HierarchieObs new.
			hierarchie appelant: self].
	hierarchie levelHolder value: 0
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

{ #category : #'display liens' }
FonctionObs >> higherLevels: a to: b withGC: aGC [
	
	| r o e |
	r := 1.	"adaptor imageEtDico geometric bounds width / 2 floor"
	(a center - b center) rrr = 0 ifTrue: [^self].
	o := a center + ((b center - a center) unitVector * r).
	e := b center + ((a center - b center) unitVector * r).
	(a level = b level & a level) = level
		ifTrue:
			[aGC paint: (ColorValue perform: #black).
			aGC displayLineFrom: o to: e.
			^self].
	a level >= level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: o
				to: o + ((e - o) unitVector * 10)].
	b level >= level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: e
				to: e + ((o - e) unitVector * 10)]
]

{ #category : #'initialize-release' }
FonctionObs >> initialize [
	
	| tmp win |
	msgObs := List new.
	level := 1.
	oneLevel := true.
	higherLevels := true.
	observateur := InterfaceObs new.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	win := tmp window.
	win openIn: (380 @ 20 extent: win minimumSize).	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	listeCanaux := OrderedCollection new.
	observateur modeleObs fonction: self.
	^self
]

{ #category : #'initialize-release' }
FonctionObs >> initializeAt: unX [
	
	| tmp largeurOpt hauteurOpt origine etendue |
	level := 1.
	oneLevel := true.
	higherLevels := true.
	observateur := InterfaceObs new.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	window := tmp window.
	largeurOpt := Screen default bounds width - (20 + unX + 10).
	hauteurOpt := (Screen default bounds height - 40) / 2.
	origine := (unX + 20) @ (hauteurOpt + 50).
	etendue := largeurOpt @ (hauteurOpt - 40).
	window openIn: (origine extent: etendue).	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	listeCanaux := OrderedCollection new.
	observateur modeleObs fonction: self.
	^self
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

{ #category : #'display liens' }
FonctionObs >> oneLevel: a to: b withGC: aGC [
	
	| r o e |
	r := 1.	"(adaptor imageEtDico geometric bounds width / 2 floor)"
	(b center - a center) rrr = 0 ifTrue: [^self].
	o := a center + ((b center - a center) unitVector * r).
	e := b center + ((a center - b center) unitVector * r).
	aGC paint: (ColorValue perform: #black).
	aGC displayLineFrom: o to: e
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

{ #category : #'initialize-release' }
FonctionObs >> reinitializeAt: unX [
	
	| tmp largeurOpt hauteurOpt origine etendue unController |
	level := 1.
	oneLevel := true.
	higherLevels := true.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	window := tmp window.
	largeurOpt := Screen default bounds width - (20 + unX + 10).
	hauteurOpt := (Screen default bounds height - 40) / 2.
	origine := (unX + 20) @ (hauteurOpt + 50).
	etendue := largeurOpt @ (hauteurOpt - 40).
	window openIn: (origine extent: etendue).
	unController := ControllerObs new.
	unController model: observateur modeleObs.
	unController performer: observateur.
	observateur vueObs controller: unController.
	unController initializeMenuCustom.	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	^self
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

{ #category : #'display liens' }
FonctionObs >> thisLevel: a to: b withGC: aGC [
	
	| r o e |
	r := adaptor imageEtDico geometric bounds width / 2 floor.
	(a center - b center) rrr = 0 ifTrue: [^self].
	o := a center + ((b center - a center) unitVector * r).
	e := b center + ((a center - b center) unitVector * r).
	(a level = b level & a level) = level
		ifTrue:
			[aGC paint: (ColorValue perform: #black).
			aGC displayLineFrom: o to: e.
			^self].
	a level = level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: o
				to: o + ((e - o) unitVector * 10)].
	b level = level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: e
				to: e + ((o - e) unitVector * 10)]
]

{ #category : #accessing }
FonctionObs >> window [
	
	^window
]

{ #category : #accessing }
FonctionObs >> window: anObject [
	
	window := anObject
]
