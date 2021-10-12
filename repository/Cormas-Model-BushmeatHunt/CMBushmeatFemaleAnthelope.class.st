Class {
	#name : #CMBushmeatFemaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatFemaleAnthelope class >> minAgeLimit [ 

	^ 72
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> gestationLength [
	" The gestation lasts 30 weeks "

	^ 30
]

{ #category : #testing }
CMBushmeatFemaleAnthelope >> isMature [
	" Answer <true> if the receiver is adult (sexual maturity) "

	^ self age > 72
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> pov [

	^ Color pink
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> povPartner [ 

	^ Color red
]
