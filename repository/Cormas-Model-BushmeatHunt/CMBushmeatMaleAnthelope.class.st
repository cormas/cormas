Class {
	#name : #CMBushmeatMaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatMaleAnthelope class >> minAgeLimit [ 

	^ 95
]

{ #category : #testing }
CMBushmeatMaleAnthelope >> isMature [
	" Answer <true> if the receiver is adult (sexual maturity) "

	^ self age > 95
]

{ #category : #pov }
CMBushmeatMaleAnthelope >> pov [

	^ Color blue
]
