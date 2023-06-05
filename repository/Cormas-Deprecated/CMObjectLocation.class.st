"
I am a deprecated class CMObjectLocation. I am introduced for backward compatibility and will be removed in the future releases. Please use CMLocatedObject instead.
"
Class {
	#name : #CMObjectLocation,
	#superclass : #CMLocatedObject,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMObjectLocation class >> isDeprecated [ 
	"CMObjectLocation was renamed to CMLocatedObject. Please use CMLocatedObject instead"
	^ true
]
