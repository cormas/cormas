+ common-pool resources
treatRequestProrataSatisfaction: res
	"Purpose: for a given common-pool resource, performs the sharing among unsatisfied requesters according to the rule 'pro rata'
the requesting entities must have 
	- an attribute 'satisfaction', 
	- an attribute 'potentialConsumption',
	- an attribute 'consumption',
	- a procedure 'calculSatisafaction'
Argument: res = <Symbol>
Example: self treatRequestProrataSatisfaction: #surfaceWater"
	
	| demandesTraitees ressource quantiteDemandee demandeur v aTraiter totDemande accorde agent |
	aTraiter := self request
		select: [:a | a first = res and: [a last satisfaction not]].
	totDemande := 0.
	aTraiter
		do:
			[:b | 
			agent := b at: 3.
			b
				at: 2
				put: agent potentialConsumption - agent consumption.
			totDemande := totDemande
				+ (agent potentialConsumption - agent consumption)].
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
					demandeur calculSatisfaction.
					demandesTraitees add: tableau]].
	self request removeAll: demandesTraitees