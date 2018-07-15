Class {
	#name : #ClassManipulationMethod,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'methodName',
		'isControl',
		'isTesting',
		'isInit'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'As yet unclassified' }
ClassManipulationMethod >> classNameAsString [
	
	^self targetClass name asString
]

{ #category : #accessing }
ClassManipulationMethod >> isControl [
	
	^isControl
]

{ #category : #accessing }
ClassManipulationMethod >> isControl: anObject [
	
	isControl := anObject
]

{ #category : #accessing }
ClassManipulationMethod >> isInit [
	
	^isInit
]

{ #category : #accessing }
ClassManipulationMethod >> isInit: anObject [
	
	isInit := anObject
]

{ #category : #accessing }
ClassManipulationMethod >> isTesting [
	
	^isTesting
]

{ #category : #accessing }
ClassManipulationMethod >> isTesting: anObject [
	
	isTesting := anObject
]

{ #category : #'As yet unclassified' }
ClassManipulationMethod >> methodAsString [
	
	^self methodName
]

{ #category : #accessing }
ClassManipulationMethod >> methodName [
	
	^methodName
]

{ #category : #accessing }
ClassManipulationMethod >> methodName: anObject [
	
	methodName := anObject
]

{ #category : #accessing }
ClassManipulationMethod >> targetClass [
	
	^targetClass
]

{ #category : #accessing }
ClassManipulationMethod >> targetClass: anObject [
	
	targetClass := anObject
]
