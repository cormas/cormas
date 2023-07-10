"
I am a deprecated class CMAgentComm. I am introduced for backward compatibility and will be removed in the future releases. Please use CMCommunicatingAgent instead.
"
Class {
	#name : #CMAgentComm,
	#superclass : #CMCommunicatingAgent,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMAgentComm class >> isDeprecated [ 
	"CMAgentComm was renamed to CMCommunicatingAgent. Please use CMCommunicatingAgent instead"
	^ true
]
