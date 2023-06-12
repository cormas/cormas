"
I am a deprecated class CMCommunicatingGroup. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMGroup and use the trait TCMCommunicating.
"
Class {
	#name : #CMCommunicatingGroup,
	#superclass : #CMGroup,
	#traits : 'TCMCommunicating',
	#classTraits : 'TCMCommunicating classTrait',
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMCommunicatingGroup class >> isDeprecated [ 
	"CMCommunicatingGroup was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMGroup and use the trait TCMCommunicating."
	^ true
]
