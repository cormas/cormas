"
I am a deprecated class CMSimInitializationAnnouncement. I am introduced for backward compatibility and will be removed in the future releases. Please use CMSimulationInitializationAnnouncement instead.
"
Class {
	#name : #CMSimInitializationAnnouncement,
	#superclass : #CMSimulationInitializationAnnouncement,
	#category : #'Cormas-Deprecated'
}

{ #category : #testing }
CMSimInitializationAnnouncement class >> isDeprecated [ 
	"CMSimInitializationAnnouncement was renamed to CMSimulationInitializationAnnouncement. Please use CMSimulationInitializationAnnouncement instead"
	^ true
]
