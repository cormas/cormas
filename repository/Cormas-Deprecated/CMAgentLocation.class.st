"
I am a deprecated class CMAgentLocation. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMAgent and use the trait TCMLocated.
"
Class {
	#name : #CMAgentLocation,
	#superclass : #AnObsoleteCMLocatedAgent,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMAgentLocation class >> isDeprecated [ 
	"CMAgentLocation was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMAgent and use the trait TCMLocated."
	^ true
]
