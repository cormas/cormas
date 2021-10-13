Class {
	#name : #CMBushmeatJuvenileStage,
	#superclass : #CMBushmeatStage,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatJuvenileStage class >> maxAgeLimit [

	^ 40
]

{ #category : #testing }
CMBushmeatJuvenileStage class >> minAgeLimit [

	^ 21
]

{ #category : #accessing }
CMBushmeatJuvenileStage >> dyingProbability [

	^ 1 - (0.95 raisedTo: 1 / 95)
]

{ #category : #accessing }
CMBushmeatJuvenileStage >> friendlyName [

	^ 'Adult'
]
