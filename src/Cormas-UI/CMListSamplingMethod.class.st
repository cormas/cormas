Class {
	#name : 'CMListSamplingMethod',
	#superclass : 'CMSamplingMethod',
	#instVars : [
		'values'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMListSamplingMethod class >> samplingName [

	^ 'List'
]

{ #category : 'as yet unclassified' }
CMListSamplingMethod class >> samplingPresenterFor: aParameter [

	^ (aParameter respondsTo: #values)
		ifTrue: [ CMFixedListSamplingPresenter ]
		ifFalse: [ CMNumberListSamplingPresenter ]
]

{ #category : 'translating' }
CMListSamplingMethod >> generate [

	^ values
]

{ #category : 'initialization' }
CMListSamplingMethod >> initialize [

	super initialize.
	values := OrderedCollection new
]

{ #category : 'accessing' }
CMListSamplingMethod >> numberOfValues [

	^ values size
]

{ #category : 'printing' }
CMListSamplingMethod >> printOn: aStream [

	aStream nextPutAll: (', ' join: (values collect: #asString))
]

{ #category : 'accessing' }
CMListSamplingMethod >> values [

	^ values
]

{ #category : 'accessing' }
CMListSamplingMethod >> values: aCollection [

	values := aCollection 
]
