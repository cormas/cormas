Class {
	#name : 'CMInstanceParameter',
	#superclass : 'CMParameter',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'evaluating' }
CMInstanceParameter >> value: anObject [
	"Set value of a parameter on receiver object"
	
	receiver perform: setterSelector with: anObject
]
