"
I am a deprecated class CMMsg. I am introduced for backward compatibility and will be removed in the future releases. Please use CMMessage instead.
"
Class {
	#name : #CMMsg,
	#superclass : #CMMessage,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMMsg class >> isDeprecated [ 
	"CMMsg was renamed to CMMessage. Please use CMMessage instead"
	^ true
]
