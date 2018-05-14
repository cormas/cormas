test
testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel
	| aCMProjectManager simWindow |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	simWindow := aCMProjectManager projectWindow simWindow simWindow.
	
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	
	aCMProjectManager openImageProject: 'CMECECModel'.
	aCMProjectManager updateNewProject: 'CMECECModel'.
	self assert: simWindow currentStepInputText text equals: 0.