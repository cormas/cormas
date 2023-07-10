"
I am a deprecated class CMAgentCommLocation. I am introduced for backward compatibility and will be removed in the future releases. Please use CMLocatedCommunicatingAgent instead.
"
Class {
	#name : #CMAgentCommLocation,
	#superclass : #AnObsoleteCMLocatedCommunicatingAgent,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMAgentCommLocation class >> isDeprecated [ 
	"CMAgentCommLocation was renamed to CMLocatedCommunicatingAgent. Please use CMLocatedCommunicatingAgent instead"
	^ true
]
