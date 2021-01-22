Class {
	#name : #CMECECForager,
	#superclass : #CMAgentLocation,
	#instVars : [
		'energy'
	],
	#classInstVars : [
		'fertilityThreshold',
		'catabolicRate',
		'harvestRate',
		'palette'
	],
	#category : #'Cormas-Model-ECEC'
}

{ #category : #'pov symbols' }
CMECECForager class >> VectorialPOV_Forager [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	^#(0.833354 0.833354 0.833354 0.0 0.0 0.0 1 0.6 #center #(0 #@- 17 15 #@- 9 15 #@ 9 0 #@ 17 -15 #@ 9 -15 #@- 9 0 #@- 17))
]

{ #category : #accessing }
CMECECForager class >> catabolicRate [
	"Getter accessor with default value = 2 "
	
	^catabolicRate ifNil: [catabolicRate := 2]
]

{ #category : #accessing }
CMECECForager class >> catabolicRate: anObject [
	"Setter accessor of attribute catabolicRate "
	
	catabolicRate := anObject
]

{ #category : #'- default value' }
CMECECForager class >> catabolicRate_default [
	"Return the default value of catabolicRate attribute"
	
	^2
]

{ #category : #default }
CMECECForager class >> defaultProbes [

^self probes
]

{ #category : #'- default value' }
CMECECForager class >> energy_default [
	"Return the default value of energy attribute"
	
	^50
]

{ #category : #accessing }
CMECECForager class >> fertilityThreshold [
	"Getter accessor with default value = 100 "
	
	^fertilityThreshold ifNil: [fertilityThreshold := 100]
]

{ #category : #accessing }
CMECECForager class >> fertilityThreshold: anObject [
	"Setter accessor of attribute fertilityThreshold "
	
	fertilityThreshold := anObject
]

{ #category : #'- default value' }
CMECECForager class >> fertilityThreshold_default [
	"Return the default value of fertilityThreshold attribute"
	
	^100
]

{ #category : #accessing }
CMECECForager class >> harvestRate [
	"Getter accessor without default value "
	
	^harvestRate
]

{ #category : #accessing }
CMECECForager class >> harvestRate: anObject [
	"Setter accessor of attribute harvestRate "
	
	harvestRate := anObject
]

{ #category : #'- default value' }
CMECECForager class >> harvestRate_default [
	"Return the default value of harvestRate attribute"
	
	^nil
]

{ #category : #testing }
CMECECForager class >> isAbstract [
	
	^true
]

{ #category : #biology }
CMECECForager >> consumeEnergy [
	"the forager burns a quantity of energy equivalent to the catabolicRate (-2 per time step)"
	
	self energy: self energy - self class catabolicRate
]

{ #category : #biology }
CMECECForager >> die [
	"no commente... 
	set dead attribute to true"
	
	self dead: true
]

{ #category : #biology }
CMECECForager >> eat [
	"The forager eats a quatity of biomass of its current location. The quantity depends on the harvestRate: a proportion of biomass (50% or 99% according to forager type)"
	
	| qty |
	qty := self patch biomass * self class harvestRate.
	self energy: self energy + qty.
	self patch biomass: self patch biomass - qty
]

{ #category : #probes }
CMECECForager >> energy [
	"Getter accessor with default value = 50 "

	<probe>
	^ energy ifNil: [ energy := 50 ]
]

{ #category : #accessing }
CMECECForager >> energy: anObject [
	"Setter accessor of attribute energy "
	
	energy = anObject ifTrue: [^nil].	"for optimization"
	energy := anObject.
	self changed
]

{ #category : #info }
CMECECForager >> info_energy [
	"return a String "
	
	^self energy rounded printString
]

{ #category : #testing }
CMECECForager >> isEnergyHigh [
	"Tests if energy is upper than the fertilityThreshold (100), in order to reproduce"
	
	^self energy >= self class fertilityThreshold
]

{ #category : #testing }
CMECECForager >> isEnergyTooLow [
	"Tests if energy is 0 or less, so that the forager will die"
	
	^self energy <= 0
]

{ #category : #biology }
CMECECForager >> move [
	"The Forager examines its current location and around. From those not occupied, he chooses the one containing the plant with the highest energy. If the chosen plant would yield enough food to meet their catabolic rate (2 units), he moves there. If not, he moves instead to a randomly chosen adjacent free place (not occupied by another forager)"
	
	| goodCells |
	goodCells := self patch neighbourhoodAndSelf
		select:
			[:cell | cell biomass > self class catabolicRate and: [cell noOccupant]].
	goodCells isEmpty
		ifTrue: [self randomWalkConstrainedBy: [:c | c noOccupant]]
		ifFalse:
			[self
				moveTo:
					(goodCells asSortedCollection: [:c1 :c2 | c1 biomass > c2 biomass]) first]
]

{ #category : #'+ pov' }
CMECECForager >> pov [
	"To get the option in the grid visualisation window"
self subclassResponsibility 
]

{ #category : #'+ pov' }
CMECECForager >> povEnergy [
	"To get the option in the grid visualisation window"
self subclassResponsibility 
]

{ #category : #biology }
CMECECForager >> reproduce [
	"The forager reproduces asexually, creating an offspring with the same heritable traits as itself (e.g., feeding strategy). At the same time the parent's energy is reduced by the offspring's initial energy (50).  Newborn offspring occupies the nearest free place to its parent. "
	
	| newForager freePlace |
	freePlace := self nearestEmptyLocationWithinRadius: 1.
	freePlace ifNil: [^nil].
	newForager := self newEntity: self class.
	self energy: self energy - newForager energy.
	newForager moveTo: freePlace
]

{ #category : #povSize }
CMECECForager >> sizeOfPOV [
^ 15 + ((self energy / self class fertilityThreshold) * 40)
]

{ #category : #control }
CMECECForager >> step [

	self consumeEnergy.
	self move.
	self eat.
	self isEnergyHigh ifTrue: [self reproduce].
	self isEnergyTooLow ifTrue:[self die]
]
