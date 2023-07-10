"
I am a deprecated class CMGroupComm. I am introduced for backward compatibility and will be removed in the future releases. Please use CMCommunicatingGroup instead.
"
Class {
	#name : #CMGroupComm,
	#superclass : #AnObsoleteCMCommunicatingGroup,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMGroupComm class >> isDeprecated [ 
	"CMGroupComm was renamed to CMCommunicatingGroup. Please use CMCommunicatingGroup instead"
	^ true
]
