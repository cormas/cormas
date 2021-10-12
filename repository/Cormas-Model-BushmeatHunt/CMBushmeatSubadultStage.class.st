Class {
	#name : #CMBushmeatSubadultStage,
	#superclass : #CMBushmeatStage,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatSubadultStage class >> maxAgeLimit [

	^ 95
]

{ #category : #accessing }
CMBushmeatSubadultStage class >> minAgeLimit [

	^ 40
]

{ #category : #accessing }
CMBushmeatSubadultStage >> dyingProbability [

	^ 1 - (0.7 raisedTo: 1 / 40)
]
