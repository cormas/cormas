Class {
	#name : #CMLinearTrapLocationStategy,
	#superclass : #CMTrapLocationStategy,
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMLinearTrapLocationStategy >> chooseTrapLocation [ 

	self flag: #toReview.
	^ self space "???" coordinates
]
