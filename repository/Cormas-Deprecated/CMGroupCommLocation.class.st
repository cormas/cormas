"
I am a deprecated class CMGroupCommLocation. I am introduced for backward compatibility and will be removed in the future releases. Please use CMLocatedCommunicatingGroup instead.
"
Class {
	#name : #CMGroupCommLocation,
	#superclass : #CMLocatedCommunicatingGroup,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMGroupCommLocation class >> isDeprecated [ 
	"CMGroupCommLocation was renamed to CMLocatedCommunicatingGroup. Please use CMLocatedCommunicatingGroup instead"
	^ true
]
