Class {
	#name : 'CMSensitivityAnalysisSettingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'generator'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSettingPresenter class >> nameForTranslator: aTranslator [

	self subclassResponsibility
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisSettingPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]
