Class {
	#name : #CMAgentLocation,
	#superclass : #CMLocatedAgent,
	#category : #'Cormas-Core-Compatibility'
}

{ #category : #'subclass creation' }
CMAgentLocation class >> subclass: t instanceVariableNames: f classVariableNames: d poolDictionaries: s package: cat [

	^ self = CMAgentLocation
		  ifTrue: [ 
			  CMLocatedAgent
				  subclass: t
				  instanceVariableNames: f
				  classVariableNames: d
				  poolDictionaries: s
				  package: cat ]
		  ifFalse: [ 
			  super
				  subclass: t
				  instanceVariableNames: f
				  classVariableNames: d
				  poolDictionaries: s
				  package: cat ]
]
