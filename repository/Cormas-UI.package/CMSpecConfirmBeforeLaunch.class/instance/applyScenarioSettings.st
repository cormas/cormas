actions
applyScenarioSettings
	self initMethodList selectedItem
		ifNotNil: [ :aInitMethod | self cormasModel activeInit: aInitMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a init method' ].
	self controlMethodList selectedItem
		ifNotNil: [ :aControlMethod | self cormasModel activeControl: aControlMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a control method' ].
	self cormasModel initSimulation.
	self delete