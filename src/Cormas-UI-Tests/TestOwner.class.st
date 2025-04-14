Class {
	#name : #TestOwner,
	#superclass : #Object,
	#instVars : [
		'dataValue'
	],
	#category : 'Cormas-UI-Tests'
}

{ #category : #'as yet unclassified' }
TestOwner >> data [
    ^ dataValue
]

{ #category : #'as yet unclassified' }
TestOwner >> data: aValue [
    dataValue := aValue
]
