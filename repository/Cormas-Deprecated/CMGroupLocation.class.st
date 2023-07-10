"
I am a deprecated class CMGroupLocation. I am introduced for backward compatibility and will be removed in the future releases. Please use CMLocatedGroup instead.
"
Class {
	#name : #CMGroupLocation,
	#superclass : #CMLocatedGroup,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMGroupLocation class >> isDeprecated [ 
	"CMGroupLocation was renamed to CMLocatedGroup. Please use CMLocatedGroup instead"
	^ true
]
