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
	^ #(0.833354 0.833354 0.833354 0.0 0.0 0.0 1 0.6 #center #(0 #@- 17 15 #@- 9 15 #@ 9 0 #@ 17  -15 #@ 9  -15 #@- 9 0 #@- 17))
]

{ #category : #accessing }
CMECECForager class >> catabolicRate [
	| tmp2 |
	tmp2 := catabolicRate.
	^ tmp2 ifNil: [ catabolicRate := 2 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECForager class >> catabolicRate: arg1 [
	catabolicRate := arg1
]

{ #category : #'default value' }
CMECECForager class >> catabolicRate_default [
	^ 2
]

{ #category : #default }
CMECECForager class >> defaultProbes [
	^ self probes
]

{ #category : #'default value' }
CMECECForager class >> energy_default [
	^ 50
]

{ #category : #accessing }
CMECECForager class >> fertilityThreshold [
	| tmp2 |
	tmp2 := fertilityThreshold.
	^ tmp2 ifNil: [ fertilityThreshold := 100 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECForager class >> fertilityThreshold: arg1 [
	fertilityThreshold := arg1
]

{ #category : #'default value' }
CMECECForager class >> fertilityThreshold_default [
	^ 100
]

{ #category : #accessing }
CMECECForager class >> harvestRate [
	^ harvestRate
]

{ #category : #accessing }
CMECECForager class >> harvestRate: arg1 [
	harvestRate := arg1
]

{ #category : #'default value' }
CMECECForager class >> harvestRate_default [
	^ nil
]

{ #category : #testing }
CMECECForager class >> isAbstract [
	^ true
]

{ #category : #biology }
CMECECForager >> consumeEnergy [
	self energy: self energy - self class catabolicRate
]

{ #category : #biology }
CMECECForager >> die [
	self dead: true
]

{ #category : #biology }
CMECECForager >> eat [
	| tmp1 |
	tmp1 := self patch biomass * self class harvestRate.
	self energy: self energy + tmp1.
	self patch biomass: self patch biomass - tmp1
]

{ #category : #probes }
CMECECForager >> energy [
	<probe>
	| tmp2 |
	tmp2 := energy.
	^ tmp2 ifNil: [ energy := 50 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECForager >> energy: arg1 [
	energy = arg1
		ifTrue: [ ^ nil ].
	energy := arg1.
	self changed
]

{ #category : #info }
CMECECForager >> info_energy [
	^ self energy rounded printString
]

{ #category : #testing }
CMECECForager >> isEnergyHigh [
	^ self energy >= self class fertilityThreshold
]

{ #category : #testing }
CMECECForager >> isEnergyTooLow [
	^ self energy <= 0
]

{ #category : #biology }
CMECECForager >> move [
	| tmp1 |
	tmp1 := self patch neighbourhoodAndSelf
		select: [ :arg1 | arg1 biomass > self class catabolicRate and: [ arg1 noOccupant ] ].
	tmp1 isEmpty
		ifTrue: [ self randomWalkConstrainedBy: [ :arg2 | arg2 noOccupant ] ]
		ifFalse: [ self
				moveTo:
					(tmp1
						asSortedCollection: [ :arg3 :arg4 | arg3 biomass > arg4 biomass ])
						first ]
]

{ #category : #pov }
CMECECForager >> pov [
	self subclassResponsibility
]

{ #category : #pov }
CMECECForager >> povEnergy [
	self subclassResponsibility
]

{ #category : #biology }
CMECECForager >> reproduce [
	| tmp1 tmp2 |
	tmp2 := self nearestEmptyLocationWithinRadius: 1.
	tmp2 ifNil: [ ^ nil ].
	tmp1 := self newEntity: self class.
	self energy: self energy - tmp1 energy.
	tmp1 moveTo: tmp2
]

{ #category : #povSize }
CMECECForager >> sizeOfPOV [
	^ 15 + (self energy / self class fertilityThreshold * 40)
]

{ #category : #control }
CMECECForager >> step [
	self
		consumeEnergy;
		move;
		eat.
	self isEnergyHigh
		ifTrue: [ self reproduce ].
	self isEnergyTooLow
		ifTrue: [ self die ]
]
