Class {
	#name : 'CMAbstractModel',
	#superclass : 'CMModel',
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'testing' }
CMAbstractModel class >> isDeprecated [
	"Use CMModel instead"
	^ self == CMAbstractModel
]

{ #category : 'see class side' }
CMAbstractModel >> seeClassSide [
]
