Class {
	#name : #CMPRMessage,
	#superclass : #CMMsg,
	#instVars : [
		'object',
		'amount'
	],
	#category : #'Cormas-Model-PlotsRental'
}

{ #category : #procedures }
CMPRMessage >> amount [
	^ amount 
]

{ #category : #procedures }
CMPRMessage >> amount: aValue [
	amount := aValue 
]

{ #category : #pov }
CMPRMessage >> calls [
	^ self symbol = #call 
]

{ #category : #pov }
CMPRMessage >> finalisations [
	^ self symbol = #finalise 
]

{ #category : #procedures }
CMPRMessage >> object [
	^ object 
]

{ #category : #procedures }
CMPRMessage >> object: anObject [
	object := anObject
]

{ #category : #pov }
CMPRMessage >> proposals [
	^ self symbol = #proposal 
]
