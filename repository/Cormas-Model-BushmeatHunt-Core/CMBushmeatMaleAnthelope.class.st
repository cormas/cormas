Class {
	#name : #CMBushmeatMaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatMaleAnthelope class >> asGetterForEntityClass [

	^ #maleAnthelopes
]

{ #category : #accessing }
CMBushmeatMaleAnthelope class >> minAgeLimit [

	^ 95
]

{ #category : #accessing }
CMBushmeatMaleAnthelope >> findPartner [

	| tmp2 |
	patch ifNil: [ ^ nil ].
	patch neighbourhood
		select: [ :arg1 | arg1 hasOccupantType: CMBushmeatFemaleAnthelope ]
		thenDo: [ :arg2 | 
			tmp2 := (arg2 occupants: CMBushmeatFemaleAnthelope)
				        detect: [ :arg3 | self matchPartnerConditions: arg3 ]
				        ifNone: [  ] ].
	^ tmp2
]

{ #category : #testing }
CMBushmeatMaleAnthelope >> isMature [

	^ self age > 95
]

{ #category : #accessing }
CMBushmeatMaleAnthelope >> matchPartnerConditions: arg1 [

	^ arg1 hasNoPartner & arg1 isAlive & arg1 isAdult
]

{ #category : #pov }
CMBushmeatMaleAnthelope >> pov [

	^ Color blue
]

{ #category : #pov }
CMBushmeatMaleAnthelope >> povColor [

	^ Color blue
]

{ #category : #printing }
CMBushmeatMaleAnthelope >> sexString [

	^ 'Male'
]
