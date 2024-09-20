Class {
	#name : 'CMModelOpenerSensitivityAnalysisCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> action [

	| presenter |
		
	presenter := CMSensitivityAnalysisPresenter
		forModelClass: owner selectedModelClass
		translator: translator.
		
	presenter open.
	presenter window centered.
	owner window close
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> icon [

	^ self iconNamed: #testRunner
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> name [

	^ translator tSensitivityAnalysis
]
