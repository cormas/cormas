+ common-pool resources
treatRequestOrder: res
	"Purpose: for a givern common-pool resource, perform the sharing among requesters according to the rule 'first demand first served'
Argument: res = <Symbol>
Example: self treatRequestOrder: #surfaceWater"
	
	| demandesTraitees ressource quantiteDemandee demandeur v aTraiter |
	demandesTraitees := OrderedCollection new.
	aTraiter := self request select: [:a | a first = res].
	aTraiter
		do:
			[:tableau | 
			ressource := self perform: res.
			quantiteDemandee := tableau at: 2.
			demandeur := tableau last.
			ressource > quantiteDemandee
				ifTrue: [v := quantiteDemandee]
				ifFalse: [v := ressource].
			ressource := ressource - v.
			self
				perform: (tableau first asString , ':') asSymbol
				with: ressource.
			demandeur
				receiveResource: tableau first
				qty: v.
			demandesTraitees add: tableau].
	self request removeAll: demandesTraitees