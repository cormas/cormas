Class {
	#name : #CMClassManipulationMethod,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'methodName',
		'isControl',
		'isTesting',
		'isInit'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #'As yet unclassified' }
CMClassManipulationMethod >> classNameAsString [
	
	^self targetClass name asString
]

{ #category : #accessing }
CMClassManipulationMethod >> isControl [
	
	^isControl
]

{ #category : #accessing }
CMClassManipulationMethod >> isControl: anObject [
	
	isControl := anObject
]

{ #category : #accessing }
CMClassManipulationMethod >> isInit [
	
	^isInit
]

{ #category : #accessing }
CMClassManipulationMethod >> isInit: anObject [
	
	isInit := anObject
]

{ #category : #accessing }
CMClassManipulationMethod >> isTesting [
	
	^isTesting
]

{ #category : #accessing }
CMClassManipulationMethod >> isTesting: anObject [
	
	isTesting := anObject
]

{ #category : #'As yet unclassified' }
CMClassManipulationMethod >> methodAsString [
	
	^self methodName
]

{ #category : #accessing }
CMClassManipulationMethod >> methodName [
	
	^methodName
]

{ #category : #accessing }
CMClassManipulationMethod >> methodName: anObject [
	
	methodName := anObject
]

{ #category : #accessing }
CMClassManipulationMethod >> targetClass [
	
	^targetClass
]

{ #category : #accessing }
CMClassManipulationMethod >> targetClass: anObject [
	
	targetClass := anObject
]
