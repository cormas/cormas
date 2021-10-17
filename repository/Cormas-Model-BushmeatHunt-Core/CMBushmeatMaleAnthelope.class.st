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
	| found |

	patch ifNil: [ ^ nil ].
	patch neighbourhood 
		select: [: bushmeatCell | bushmeatCell hasOccupantType: CMBushmeatFemaleAnthelope ]
		thenDo: [ : bushmeatCell |
			found := (bushmeatCell occupants: CMBushmeatFemaleAnthelope)
				detect: [ : femaleAnthelope | self matchPartnerConditions: femaleAnthelope ]
				ifNone: [ nil ] ].
	^ found
]

{ #category : #accessing }
CMBushmeatMaleAnthelope >> matchPartnerConditions: femaleAnthelope [

	^ femaleAnthelope hasNoPartner & femaleAnthelope isAlive & femaleAnthelope isAdult
]

{ #category : #pov }
CMBushmeatMaleAnthelope >> pov [

	^ Color blue
]

{ #category : #printing }
CMBushmeatMaleAnthelope >> sexString [

	^ 'Male'
]
