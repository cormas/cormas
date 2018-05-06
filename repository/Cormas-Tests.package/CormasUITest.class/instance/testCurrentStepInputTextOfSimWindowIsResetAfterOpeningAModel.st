test
testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel
	| aCMProjectManager simWindow |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #Conway.
	simWindow := aCMProjectManager projectWindow simWindow simWindow.
	
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	
	aCMProjectManager openImageProject: #ECEC.
	aCMProjectManager updateNewProject: 'CMECECModel'.
	self assert: simWindow currentStepInputText text equals: 0.