Class {
	#name : #CMBushmeatMaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatMaleAnthelope class >> minAgeLimit [

	^ 95
]

{ #category : #accessing }
CMBushmeatMaleAnthelope >> findPartner [
	| found |
"	tmp := patch extensiveNeighbourhood select: [:unP | (unP theOccupants at: self class name) notNil & (self estAccueillant: unP)]."
	patch ifNil: [ ^ nil ].
	patch neighbourhood 
		select: [: bushmeatCell | bushmeatCell hasOccupantType: CMBushmeatFemaleAnthelope ]
		thenDo: [ : bushmeatCell |
			found := (bushmeatCell occupants: CMBushmeatFemaleAnthelope)
				detect: [ : femaleAnthelope | self matchPartnerConditions: femaleAnthelope ]
				ifNone: [ nil ] ].
	^ found
]

{ #category : #testing }
CMBushmeatMaleAnthelope >> isMature [

	^ self age > 95
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
