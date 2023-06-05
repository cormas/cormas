"
I am a deprecated class CMSimManager. I am introduced for backward compatibility and will be removed in the future releases. Please use CMSimulationManager instead.
"
Class {
	#name : #CMSimManager,
	#superclass : #CMSimulationManager,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMSimManager class >> isDeprecated [ 
	"CMSimManager was renamed to CMSimulationManager. Please use CMSimulationManager instead"
	^ true
]
