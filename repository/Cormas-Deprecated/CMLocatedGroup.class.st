"
I am a deprecated class CMLocatedGroup. I am introduced for backward compatibility and will be removed in the future releases.
Instead of subclassing me, please subclass CMGroup and use the trait TCMLocated.

"
Class {
	#name : #CMLocatedGroup,
	#superclass : #CMGroup,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMLocatedGroup class >> isDeprecated [ 
	"CMLocatedGroup was deprecated and will be removed soon.
	Instead of subclassing it, please subclass CMGroup and use the trait TCMLocated."
	^ true
]
