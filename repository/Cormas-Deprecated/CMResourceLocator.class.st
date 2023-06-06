"
I am a deprecated class CMResourceLocator. I am introduced for backward compatibility and will be removed in the future releases. Please use CMGitBridge instead.
"
Class {
	#name : #CMResourceLocator,
	#superclass : #CMGitBridge,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMResourceLocator class >> isDeprecated [ 
	"CMResourceLocator was renamed to CMGitBridge. Please use CMGitBridge instead"
	^ true
]
