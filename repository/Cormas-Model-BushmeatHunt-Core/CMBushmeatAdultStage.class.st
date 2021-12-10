Class {
	#name : #CMBushmeatAdultStage,
	#superclass : #CMBushmeatStage,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #testing }
CMBushmeatAdultStage class >> ageDifferenceBetweenSex [

	^ true
]

{ #category : #accessing }
CMBushmeatAdultStage class >> maxAgeLimit [

	^ SmallInteger maxVal
]

{ #category : #accessing }
CMBushmeatAdultStage class >> minAgeLimit [

	^ 95
]

{ #category : #accessing }
CMBushmeatAdultStage >> dyingProbability [

	^ 1 - (0.01 raisedTo: 1 / 100)
]

{ #category : #accessing }
CMBushmeatAdultStage >> friendlyName [

	^ 'Adult'
]

{ #category : #testing }
CMBushmeatAdultStage >> isAdult [

	^ true
]

{ #category : #accessing }
CMBushmeatAdultStage >> sizeOfPOV [

	^ 25
]
