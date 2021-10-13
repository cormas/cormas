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

	^ self age > 95
]

{ #category : #pov }
CMBushmeatMaleAnthelope >> pov [

	^ Color blue
]
