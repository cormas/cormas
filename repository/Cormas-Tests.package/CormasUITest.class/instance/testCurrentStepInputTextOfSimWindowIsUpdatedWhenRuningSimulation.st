test
testCurrentStepInputTextOfSimWindowIsUpdatedWhenRuningSimulation
	| aCMProjectManager simWindow |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #Conway.
	simWindow := aCMProjectManager projectWindow simWindow simWindow.
	simWindow openWithSpec.
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	self
		assert: simWindow currentStepInputText text
		equals: aCMProjectManager currentProject cormasModel timeStep. simWindow delete