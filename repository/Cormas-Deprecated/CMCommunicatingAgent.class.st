"
I am a deprecated class CMCommunicatingAgent. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMAgent and use the trait TCMCommunicating.
"
Class {
	#name : #CMCommunicatingAgent,
	#superclass : #CMAgent,
	#traits : 'TCMCommunicating',
	#classTraits : 'TCMCommunicating classTrait',
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMCommunicatingAgent class >> isDeprecated [ 
	"CMCommunicatingAgent was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMAgent and use the trait TCMCommunicating."
	^ true
]
