"
I am a deprecated class CMLocatedAgent. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMAgent and use the trait TCMLocated.
"
Class {
	#name : #CMLocatedAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMLocatedAgent class >> isDeprecated [ 
	"CMLocatedAgent was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMAgent and use the trait TCMLocated."
	^ true
]
