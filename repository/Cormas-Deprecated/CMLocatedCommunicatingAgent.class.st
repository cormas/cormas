"
I am a deprecated class CMLocatedCommunicatingAgent. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMAgent and use the traits TCMLocated and TCMCommunicating.
"
Class {
	#name : #CMLocatedCommunicatingAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated + TCMCommunicating',
	#classTraits : 'TCMLocated classTrait + TCMCommunicating classTrait',
	#instVars : [
		'mailBox',
		'channel'
	],
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMLocatedCommunicatingAgent class >> isAgentCommClass [
	
	^true
]

{ #category : #testing }
CMLocatedCommunicatingAgent class >> isDeprecated [ 
	"CMLocatedCommunicatingAgent was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMAgent and use the traits TCMLocated and TCMCommunicating."
	^ true
]
