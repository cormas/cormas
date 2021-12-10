Class {
	#name : #CMRandomTrapLocationStategy,
	#superclass : #CMTrapLocationStategy,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMRandomTrapLocationStategy >> chooseTrapLocation [ 

	^ self space randomCell coordinates
]
