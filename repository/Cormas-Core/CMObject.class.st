Class {
	#name : 'CMObject',
	#superclass : 'Object',
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
CMObject class >> cmEnvironment [
	" Answer a <Collection> or receiver's package as replacement for VW Namespaces "
	
	^ self package classes
]
