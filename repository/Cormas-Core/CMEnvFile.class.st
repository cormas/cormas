"
An .env file is a 'grid' file, which can be read using a CMEnvFileReader through the message #loadEnvironmentFromFile: aFileReference. This method uses the Cormas resource locator to read the file and answers a new CMEnvFile object, which attributes populated from the CMEnvFileReader. 

Internal Representation and Key Implementation Points.

    Instance Variables
	attype:		<Object>
	ce:		<Object>
	cp:		<Object>
	delimiteur:		<Object>
	dimX:		<Object>
	dimY:		<Object>
	spaceModel:		<Object>


    Implementation Points
"
Class {
	#name : #CMEnvFile,
	#superclass : #Object,
	#instVars : [
		'dimX',
		'dimY',
		'ce',
		'cp',
		'delimiteur',
		'attype',
		'spaceModel',
		'matrix'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'accessing - attributes' }
CMEnvFile >> attributeAt: aNumber [

	^ self attributes at: aNumber 
]

{ #category : #accessing }
CMEnvFile >> attributes [

	^ attype
		ifNil: [ attype := OrderedCollection new ]
]

{ #category : #accessing }
CMEnvFile >> attype [
	^ attype
]

{ #category : #accessing }
CMEnvFile >> attype: anObject [
	attype := anObject
]

{ #category : #accessing }
CMEnvFile >> ce [
	^ ce
]

{ #category : #accessing }
CMEnvFile >> ce: anObject [
	ce := anObject
]

{ #category : #accessing }
CMEnvFile >> cp [
	^ cp
]

{ #category : #accessing }
CMEnvFile >> cp: anObject [
	cp := anObject
]

{ #category : #accessing }
CMEnvFile >> delimiteur [
	^ delimiteur
]

{ #category : #accessing }
CMEnvFile >> delimiteur: anObject [
	delimiteur := anObject
]

{ #category : #accessing }
CMEnvFile >> dimX [
	^ dimX
]

{ #category : #accessing }
CMEnvFile >> dimX: anObject [
	dimX := anObject
]

{ #category : #accessing }
CMEnvFile >> dimY [
	^ dimY
]

{ #category : #accessing }
CMEnvFile >> dimY: anObject [
	dimY := anObject
]

{ #category : #accessing }
CMEnvFile >> matrix [
	^ matrix
]

{ #category : #accessing }
CMEnvFile >> matrix: aCollection [ 
	" Store the originally read matrix from the env file reader into the receiver "

	matrix := aCollection
]

{ #category : #accessing }
CMEnvFile >> spaceModel [
	^ spaceModel
]

{ #category : #accessing }
CMEnvFile >> spaceModel: anObject [
	spaceModel := anObject
]
