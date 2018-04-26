+ common-pool resources
treatRequestProrata: res
	"Purpose: for a givern common-pool resource, perform the sharing among requesters according to the rule 'pro rata'
Argument: res = <Symbol>
Example: self treatRequestProrata: #surfaceWater"
	
	| demandesTraitees ressource quantiteDemandee demandeur v aTraiter totDemande accorde |
	aTraiter := self request select: [:a | a first = res].
	totDemande := aTraiter
		inject: 0
		into: [:tot :b | tot + (b at: 2)].
	demandesTraitees := OrderedCollection new.
	ressource := self perform: res.
	ressource = 0
		ifFalse:
			[totDemande <= ressource
				ifTrue: [accorde := totDemande]
				ifFalse: [accorde := ressource].
			aTraiter
				do:
					[:tableau | 
					quantiteDemandee := tableau at: 2.
					demandeur := tableau last.
					v := accorde * quantiteDemandee / totDemande.
					ressource := ressource - v.
					self
						perform: (tableau first asString , ':') asSymbol
						with: ressource.
					demandeur receiveResource: res qty: v.
					demandesTraitees add: tableau]].
	self request removeAll: demandesTraitees