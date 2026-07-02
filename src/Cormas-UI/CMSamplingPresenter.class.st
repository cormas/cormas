Class {
	#name : 'CMSamplingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameter',
		'whenChangedBlock',
		'sampler'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSamplingPresenter class >> example [
	<example>
	(self on: self exampleParameter) open
]

{ #category : 'as yet unclassified' }
CMSamplingPresenter class >> exampleParameter [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMSamplingPresenter >> sampler [

	^ sampler
]

{ #category : 'accessing - model' }
CMSamplingPresenter >> setModelBeforeInitialization: aParameter [

	parameter := aParameter 
]

{ #category : 'announcing' }
CMSamplingPresenter >> whenChangedDo: aBlock [

	whenChangedBlock := aBlock
]
