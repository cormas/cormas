Class {
	#name : #CMBushmeatNewbornStage,
	#superclass : #CMBushmeatStage,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatNewbornStage class >> maxAgeLimit [

	^ 21
]

{ #category : #accessing }
CMBushmeatNewbornStage class >> minAgeLimit [

	^ 0
]

{ #category : #accessing }
CMBushmeatNewbornStage >> dyingProbability [

	^ 1 - (0.99 raisedTo: 1 / 21)
]

{ #category : #accessing }
CMBushmeatNewbornStage >> friendlyName [

	^ 'Newborn'
]

{ #category : #accessing }
CMBushmeatNewbornStage >> sizeOfPOV [

	^ 5
]
