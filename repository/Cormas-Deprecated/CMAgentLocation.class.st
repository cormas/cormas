"
I am a deprecated class CMAgentLocation. I am introduced for backward compatibility and will be removed in the future releases. Please use CMLocatedAgent instead.
"
Class {
	#name : #CMAgentLocation,
	#superclass : #CMLocatedAgent,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMAgentLocation class >> isDeprecated [ 
	"CMAgentLocation was renamed to CMLocatedAgent. Please use CMLocatedAgent instead"
	^ true
]
