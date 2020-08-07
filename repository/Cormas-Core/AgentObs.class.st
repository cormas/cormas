Class {
	#name : #AgentObs,
	#superclass : #BBaseVisuel,
	#instVars : [
		'preferences',
		'nbMsg',
		'nbAmis',
		'nom',
		'agentSource',
		'fonction',
		'displayForces',
		'H',
		'level',
		'cercleCommunication',
		'A',
		'AA',
		'B',
		'BB',
		'Cadre',
		'Deplacement',
		'Eint',
		'Eext',
		'Extent',
		'Lien'
	],
	#category : #'Cormas-Core-Observer'
}

{ #category : #'instance creation' }
AgentObs class >> new [
	
	^super new initialize
]

{ #category : #'instance creation' }
AgentObs class >> on: anAgent adaptor: anAdaptor function: aFunction [
	
	| tmp |
	tmp := super new initialize.
	tmp privateSource: anAgent.
	tmp privateFunction: aFunction.
	tmp privateAdaptor: anAdaptor.
	anAgent isNil
		ifTrue: [tmp etatNoChanged: 2]
		ifFalse:
			[tmp
				etatNoChanged:
					(aFunction
						agent: anAgent
						niveau: anAdaptor level)].
	^tmp
]

{ #category : #'acces parametres' }
AgentObs >> A [
	
	A isNil ifTrue: [^10].
	^A
]

{ #category : #'acces parametres' }
AgentObs >> A: v [
	
	A := v
]

{ #category : #'acces parametres' }
AgentObs >> AA [
	
	AA isNil ifTrue: [^10].
	^AA
]

{ #category : #'acces parametres' }
AgentObs >> AA: v [
	
	AA := v
]

{ #category : #attirance }
AgentObs >> AttirancePour: unAgent [
	"	nbAmis = 0



		ifTrue: [^false]



		ifFalse: [^(preferences at: unAgent)



				>= (nbMsg / nbAmis)]"
	
	^(preferences at: unAgent) > 0
]

{ #category : #attirance }
AgentObs >> Attirant: unAgentObs [
	
	^(self AttirancePour: unAgentObs) | (unAgentObs AttirancePour: self)
]

{ #category : #deplacement }
AgentObs >> AttractionCentre [
	
	(Cadre containsPoint: centre) ifFalse: [^Cadre extent / 2 - centre].
	^0 @ 0
]

{ #category : #'acces parametres' }
AgentObs >> B [
	
	B isNil ifTrue: [^10].
	^B
]

{ #category : #'acces parametres' }
AgentObs >> B: v [
	
	B := v
]

{ #category : #'acces parametres' }
AgentObs >> BB [
	
	BB isNil ifTrue: [^10].
	^BB
]

{ #category : #'acces parametres' }
AgentObs >> BB: v [
	
	BB := v
]

{ #category : #'acces parametres' }
AgentObs >> Cadre [
	
	^Cadre
]

{ #category : #'acces parametres' }
AgentObs >> Cadre: v [
	
	Cadre := v
]

{ #category : #'acces parametres' }
AgentObs >> Deplacement [
	
	Deplacement isNil ifTrue: [Deplacement := 3].
	^Deplacement
]

{ #category : #'acces parametres' }
AgentObs >> Deplacement: v [
	
	Deplacement := v
]

{ #category : #'display forces' }
AgentObs >> Eext: v [
	
	Eext := v
]

{ #category : #'display forces' }
AgentObs >> Eint: v [
	
	Eint := v
]

{ #category : #deplacement }
AgentObs >> Force: unePref [
	
	| D d |
	D := unePref agent agentObs center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unePref agent agentObs center
		fromEllipse: self A @ self B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(fonction niveauxCompatibles: level @ unePref agent agentObs level)
		ifFalse: [^0 @ 0].
	(self Attirant: unePref)
		ifTrue:
			[d := self
				distance: unePref agent agentObs center
				fromEllipse: self AA @ self BB.
			D rrr <= d ifTrue: [^0 @ 0].
			^(self valAtt: unePref agent) * 10 * D unitVector]
		ifFalse: [^0 @ 0]
]

{ #category : #deplacement }
AgentObs >> Force: unAgentObs valeur: uneVal [
	
	| D d |
	D := unAgentObs center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unAgentObs center
		fromEllipse: self A @ self B.
	D rrr < d ifTrue: [^10 * D unitVector negated * d / D rrr].
	(self Attirant: unAgentObs)
		ifTrue:
			[d := self
				distance: unAgentObs center
				fromEllipse: self AA @ self BB.
			D rrr <= d ifTrue: [^0 @ 0].	"/10"
			^uneVal * D unitVector]
		ifFalse: [^0 @ 0]
]

{ #category : #'display forces' }
AgentObs >> ForceEllipse: unePref [
	
	| D d |
	D := unePref agent center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unePref agent center
		fromEllipse: A @ B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(self Attirant: unePref)
		ifTrue:
			[d := self
				distance: unePref agent center
				fromEllipse: A @ B + Extent.
			D rrr <= d ifTrue: [^0 @ 0].
			^unePref pref / nbMsg * D]
		ifFalse: [^0 @ 0]
]

{ #category : #'display forces' }
AgentObs >> ForceEllipse: unAgent valeur: uneVal [
	
	| D d |
	D := unAgent center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unAgent center
		fromEllipse: A @ B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(self Attirant: unAgent)
		ifTrue:
			[d := self
				distance: unAgent center
				fromEllipse: A @ B + Extent.
			D rrr <= d ifTrue: [^0 @ 0].
			^uneVal / nbMsg * D]
		ifFalse: [^0 @ 0]
]

{ #category : #display }
AgentObs >> Lien: unB [
	
	Lien := unB
]

{ #category : #initialize }
AgentObs >> adaptor: unAdaptor [
	adaptor := unAdaptor.
	listeEtat := Array new: unAdaptor list size
]

{ #category : #acces }
AgentObs >> agentSource [
	
	^agentSource
]

{ #category : #initialize }
AgentObs >> agentSource: unAgentSource [
	
	agentSource := unAgentSource
]

{ #category : #deplacement }
AgentObs >> bouger [
	
	| F d |
	F := 0 @ 0.
	preferences
		keysAndValuesDo:
			[:unAgentObs :uneVal | F := F + (self Force: unAgentObs valeur: uneVal)].
	F := F + self AttractionCentre.
	d := F rrr rounded.	"min: Deplacement."
	d * 5 > self Deplacement
		ifTrue:
			[centre := centre + (d rounded * F unitVector).
			^true].
	^false
]

{ #category : #display }
AgentObs >> cercleCommunication: v [
	
	cercleCommunication := v
]

{ #category : #acces }
AgentObs >> clear [
	
	preferences keysDo: [:unAgentObs | preferences at: unAgentObs put: 0].
	nbMsg := 0.
	nbAmis := 0
]

{ #category : #'display forces' }
AgentObs >> displayForces: unB [
	
	displayForces := unB.
	self changed: #ObjetVisuel with: self
]

{ #category : #display }
AgentObs >> displayOn: aGC [
	
	self agentSource displayOn: aGC at: centre.
	aGC
		displayString: self agentSource id printString
		at:
			(centre x + (self agentSource class image wp component bounds width * 0.7))
				@ centre y.
	Lien
		ifTrue:
			[preferences keys
				do:
					[:unAgentObs | 
					(self Attirant: unAgentObs)
						ifTrue: [fonction showLink: self to: unAgentObs withGC: aGC]]].
	cercleCommunication
		ifTrue:
			[(Circle center: centre radius: 10) asStroker
				displayOn: (aGC paint: (ColorValue perform: #black))].
	displayForces ifTrue: [self showForces: aGC]
]

{ #category : #deplacement }
AgentObs >> distance: aPoint fromEllipse: abPoint [
	
	| alpha E |
	E := aPoint - centre.
	E y = 0 ifTrue: [^abPoint].
	alpha := (E x / E y * abPoint y / abPoint x) arcTan.
	^((abPoint x * alpha sin) @ (abPoint y * alpha cos)) rrr
]

{ #category : #deplacement }
AgentObs >> emplacementAleatoire [
	
	| x y start endX endY extX extY r |
	r := self agentSource class image rMax * self agentSource class image size.
	start := Cadre origin x + r.
	endX := Cadre corner x - r.
	endY := Cadre corner y - r.
	extX := endX - start.
	extY := endY - start.
	x := (self Rand * extX + start) rounded.
	y := (self Rand * extY + start) rounded.
	centre := x @ y
]

{ #category : #deplacement }
AgentObs >> emplacementCircle: angle [
	
	| x y distanceFromCenter |
	self agentSource class image rMax * self agentSource class image size.
	distanceFromCenter := (Cadre height min: Cadre width) / 2 - 20.
	x := distanceFromCenter * angle cos.
	y := distanceFromCenter * angle sin.
	centre := (Cadre center x + x) @ (Cadre center y + y)
]

{ #category : #initialize }
AgentObs >> fonction: uneFonction [
	
	fonction := uneFonction
]

{ #category : #acces }
AgentObs >> incPref: agent [
	
	| unePref |
	unePref := preferences at: agent.
	unePref pref = 0 ifTrue: [nbAmis := nbAmis + 1].
	unePref pref: unePref pref + 1.
	nbMsg := nbMsg + 1
]

{ #category : #acces }
AgentObs >> incPref: agent with: uneValeur [
	
	| unePref |
	unePref := preferences at: agent.
	unePref = 0 ifTrue: [nbAmis := nbAmis + 1].
	preferences
		at: agent
		put: unePref + uneValeur.
	nbMsg := nbMsg + uneValeur
]

{ #category : #acces }
AgentObs >> incPrefOld: indice [
	
	| unePref |
	unePref := preferences at: indice.
	unePref pref = 0 ifTrue: [nbAmis := nbAmis + 1].
	unePref pref: unePref pref + 1.
	nbMsg := nbMsg + 1
]

{ #category : #acces }
AgentObs >> incPrefOld: indice with: uneValeur [
	
	| unePref |
	unePref := preferences at: indice.
	unePref pref = 0 ifTrue: [nbAmis := nbAmis + 1].
	unePref pref: unePref pref + uneValeur.
	nbMsg := nbMsg + uneValeur
]

{ #category : #initialize }
AgentObs >> initialize [
	
	super initialize.
	cercleCommunication := false.
	nbAmis := 0.
	nbMsg := 0.
	displayForces := false.
	H := 0 @ 0.
	level := 0.
	Lien := true.
	^self
]

{ #category : #acces }
AgentObs >> level [
	
	^level
]

{ #category : #acces }
AgentObs >> level: v [
	
	level := v
]

{ #category : #acces }
AgentObs >> nbAmis [
	
	^nbAmis
]

{ #category : #acces }
AgentObs >> nbAmis: v [
	
	nbAmis := v
]

{ #category : #acces }
AgentObs >> nbMsg [
	
	^nbMsg
]

{ #category : #acces }
AgentObs >> nbMsg: v [
	
	nbMsg := v
]

{ #category : #acces }
AgentObs >> nom [
	
	^nom
]

{ #category : #acces }
AgentObs >> nom: unEntier [
	
	nom := unEntier
]

{ #category : #acces }
AgentObs >> preferences [
	
	^preferences
]

{ #category : #acces }
AgentObs >> preferences: v [
	
	preferences := v
]

{ #category : #'display forces' }
AgentObs >> showForces: aGC [
	
	| V D d |
	Eint asStroker
		displayOn: (aGC paint: Color black)
		at: centre.
	Eext asStroker
		displayOn: (aGC paint: Color green)
		at: centre.
	preferences keysAndValuesDo: [ : unAgent : uneVal | 
		D := unAgent center - centre.
		D rrr = 0 ifFalse: [
			d := self
				distance: unAgent center
				fromEllipse: A @ B.
			D rrr < d 
				ifTrue: [
					V := D unitVector negated * d / D rrr.
					(aGC paint: Color red)
						displayLineFrom: unAgent center
						to: V + unAgent center]
				ifFalse: [
					(self Attirant: unAgent)
						ifTrue: [
							d := self
									distance: unAgent center
									fromEllipse: A @ B + Extent.
							D rrr <= d
								ifTrue: [ V := 0 @ 0 ]
								ifFalse: [ V := uneVal / nbMsg * ((unAgent preferences at: self) / unAgent nbMsg) * D ].
							(aGC paint: Color blue)
								displayLineFrom: unAgent center
								to: V + unAgent center ] ] ] ].
	V := 0 @ 0.
	preferences
		keysAndValuesDo:
			[:unAgent :uneVal | V := V + (self ForceEllipse: unAgent valeur: uneVal)].
	(aGC paint: Color black)
		displayLineFrom: centre
		to: V + centre
]

{ #category : #attirance }
AgentObs >> valAtt: unAgent [
	
	nbAmis = 0
		ifTrue: [^0]
		ifFalse: [^(preferences at: unAgent) pref / nbAmis]
]
