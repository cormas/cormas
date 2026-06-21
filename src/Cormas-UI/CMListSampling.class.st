Class {
	#name : 'CMListSampling',
	#superclass : 'CMSampling',
	#instVars : [
		'values'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMListSampling class >> samplingName [

	^ 'List'
]

{ #category : 'translating' }
CMListSampling >> generate [

	^ values
]

{ #category : 'accessing' }
CMListSampling >> numberOfValues [

	^ values size
]

{ #category : 'printing' }
CMListSampling >> printOn: aStream [

	aStream nextPutAll: (', ' join: (values collect: #asString))
]

{ #category : 'accessing' }
CMListSampling >> values: aCollection [

	values := aCollection 
]
