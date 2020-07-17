Class {
	#name : #CMEnvironment,
	#superclass : #Object,
	#instVars : [
		'label',
		'dimX',
		'dimY',
		'ce',
		'cp',
		'delimiteur',
		'attype',
		'spaceModel'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'accessing - attributes' }
CMEnvironment >> attributeAt: aNumber [

	^ self attributes at: aNumber 
]

{ #category : #accessing }
CMEnvironment >> attributes [

	^ attype
		ifNil: [ attype := OrderedCollection new ]
]

{ #category : #accessing }
CMEnvironment >> attype [
	^ attype
]

{ #category : #accessing }
CMEnvironment >> attype: anObject [
	attype := anObject
]

{ #category : #accessing }
CMEnvironment >> ce [
	^ ce
]

{ #category : #accessing }
CMEnvironment >> ce: anObject [
	ce := anObject
]

{ #category : #accessing }
CMEnvironment >> cp [
	^ cp
]

{ #category : #accessing }
CMEnvironment >> cp: anObject [
	cp := anObject
]

{ #category : #accessing }
CMEnvironment >> delimiteur [
	^ delimiteur
]

{ #category : #accessing }
CMEnvironment >> delimiteur: anObject [
	delimiteur := anObject
]

{ #category : #accessing }
CMEnvironment >> dimX [
	^ dimX
]

{ #category : #accessing }
CMEnvironment >> dimX: anObject [
	dimX := anObject
]

{ #category : #accessing }
CMEnvironment >> dimY [
	^ dimY
]

{ #category : #accessing }
CMEnvironment >> dimY: anObject [
	dimY := anObject
]

{ #category : #accessing }
CMEnvironment >> label [
	^ label
]

{ #category : #accessing }
CMEnvironment >> label: anObject [
	label := anObject
]

{ #category : #accessing }
CMEnvironment >> spaceModel [
	^ spaceModel
]

{ #category : #accessing }
CMEnvironment >> spaceModel: anObject [
	spaceModel := anObject
]
