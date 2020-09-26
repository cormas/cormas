Class {
	#name : #CMClassAttributeValueModel,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #accessing }
CMClassAttributeValueModel class >> method: aMethod [

	^ self new
		initializeMethod: aMethod;
		yourself
]

{ #category : #initialization }
CMClassAttributeValueModel >> initializeMethod: aMethod [

	self initialize.
	self method: aMethod
]

{ #category : #accessing }
CMClassAttributeValueModel >> method [
	^ method
]

{ #category : #accessing }
CMClassAttributeValueModel >> method: anObject [
	method := anObject
]
