Class {
	#name : #CMApplicationProject,
	#superclass : #CMApplication,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMApplicationProject class >> isDeprecated [ 
	"CMApplicationProject was renamed to CMApplication. Please use CMApplication instead"
	^ true
]
