"
I am a deprecated class CMLocatedCommunicatingGroup. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMGroup and use the traits TCMLocated and TCMCommunicating.
"
Class {
	#name : #CMLocatedCommunicatingGroup,
	#superclass : #CMGroup,
	#traits : 'TCMLocated + TCMCommunicating',
	#classTraits : 'TCMLocated classTrait + TCMCommunicating classTrait',
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMLocatedCommunicatingGroup class >> isDeprecated [ 
	"CMLocatedCommunicatingGroup was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMGroup and use the traits TCMLocated and TCMCommunicating."
	^ true
]
