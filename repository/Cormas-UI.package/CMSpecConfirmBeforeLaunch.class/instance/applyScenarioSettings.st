actions
applyScenarioSettings
	| refactoredProbesList |
	self initMethodList selectedItem
		ifNotNil: [ :aInitMethod | self cormasModel activeInit: aInitMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a init method' ].
	self controlMethodList selectedItem
		ifNotNil: [ :aControlMethod | self cormasModel activeControl: aControlMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a control method' ].
	self probesList selectedItem
		ifNotNil: [ self flag: #toBeRevised.
			"CMFireAutomataModel>>nbTrees'."
			"refactoredProbesList := 'CMFireAutomataModel>>nbTrees'."
			self cormasModelClass setActiveProbes: (Array with: self probesList selectedItem) ].
	self projectManager projectWindow simWindow simWindow finalStepInputText
		text: self finalStep text asInteger .
	self cormasModel initSimulation.
	self delete