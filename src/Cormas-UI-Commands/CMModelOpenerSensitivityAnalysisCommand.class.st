Class {
	#name : 'CMModelOpenerSensitivityAnalysisCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand class >> order [

	^ 70
]

{ #category : 'action' }
CMModelOpenerSensitivityAnalysisCommand >> action [

	| presenter |
		
	presenter := CMSensitivityAnalysisSetupPresenter new.
	presenter selectModel: owner cormasModelClass.
	presenter open.
	presenter window centered
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> icon [

	^ self iconNamed: #testRunner
]

{ #category : 'accessing' }
CMModelOpenerSensitivityAnalysisCommand >> name [

	^ 'Sensitivity Analysis'
]
