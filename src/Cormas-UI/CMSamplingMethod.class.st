Class {
	#name : 'CMSamplingMethod',
	#superclass : 'Object',
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMSamplingMethod class >> samplingName [

	^ self name
]

{ #category : 'as yet unclassified' }
CMSamplingMethod class >> samplingPresenterFor: aParameter [

	self subclassResponsibility
]

{ #category : 'translating' }
CMSamplingMethod >> generate [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMSamplingMethod >> numberOfValues [

	self subclassResponsibility
]
