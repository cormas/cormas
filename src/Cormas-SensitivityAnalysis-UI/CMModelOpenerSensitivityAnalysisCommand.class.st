Class {
	#name : 'CMModelOpenerSensitivityAnalysisCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand class >> order [

	^ 5
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> action [

	| presenter |
		
	presenter := CMSensitivityAnalysisPresenter
		forModelClass: owner cormasModelClass
		translator: translator.
		
	presenter open.
	presenter window centered
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> icon [

	^ self iconNamed: #testRunner
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> name [

	^ translator tSensitivityAnalysis
]
