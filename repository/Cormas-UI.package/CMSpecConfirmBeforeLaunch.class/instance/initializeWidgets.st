initialization
initializeWidgets
	self
		instantiateModels:
			#(initMethodList SpcLabeledList controlMethodList SpcLabeledList finalStep SpcLabeledTextField fixRandomSeedCheck CheckBoxModel fixRandomTextField TextInputFieldModel probesList SpcLabeledList releaseRandomCheck CheckBoxModel stepBackCheck CheckBoxModel toolbar SpcTwoButtonToolbar).
	self initMethodList label: 'Select a method of initialization'.
	self controlMethodList label: 'Select a method of control'.
	self probesList label: 'Select probes to record'.
	self fixRandomSeedCheck label: 'Fix the random seed to'.
	self finalStep label: 'Final step'.
	self finalStep
		text: self cormasModel class defaultFinalStep;
		help: self translator tSimFinalStepHelp.
	self finalStep acceptBlock: [  ].
	self stepBackCheck label: 'Enable stepping back'.
	self releaseRandomCheck label: 'Release random seed after initialization'.
	self toolbar
		secondButtonLabel: 'Apply';
		firstButtonLabel: 'Cancel';
		firstButtonAction: [ self delete ];
		secondButtonAction: [ self applyScenarioSettings ]