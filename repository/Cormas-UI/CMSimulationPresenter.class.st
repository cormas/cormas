Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'builder',
		'translator',
		'diagram',
		'menuToolbar',
		'runButton',
		'stepButton',
		'progressBar'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMSimulationPresenter class >> openForSimulation: aSimulation withTranslator: aTranslator [

	^ self basicNew 
		simulation: aSimulation;
		translator: aTranslator;
		initialize;
		open;
		yourself
]

{ #category : 'accessing' }
CMSimulationPresenter >> canvas [
	" Private - Answer a <RSCanvas> "

	^ diagram canvas
]

{ #category : 'specs' }
CMSimulationPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			add: runButton width: self class buttonWidth;
			add: stepButton width: self class buttonWidth;
			add: progressBar;
			yourself) height: self class buttonHeight;
		add: menuToolbar height: self class toolbarHeight;
		add: diagram;
		yourself
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeCanvasInteractions [

	self canvas addInteraction: RSCanvasController new.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeDiagram [
	" Private - Create the configured receiver's diagram "
	
	builder := CMR3SpaceDiagramBuilder new
		cormasModel: simulation cormasModel.
	
	"diagram := self newRoassal.
	diagram script: [ :canvas | builder renderIn: canvas ].
	"
	diagram := builder asPresenter.
		
	diagram owner: self.
	self update.
	
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePOVMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ :group | 
			simulation cormasModel class socialClasses
				do: [ :socialClass | 
					group
						addItem: [ :item | 
							item
								name: socialClass name;
								subMenu: (self subMenuForClassPov: socialClass) ] ] ];
		addGroup: [ :group | 
			simulation cormasModel class spatialClasses
				do: [ :spatialClasse | 
					group
						addItem: [ :item | 
							item
								name: spatialClasse name;
								subMenu: (self subMenuForClassPov: spatialClasse) ] ] ];
		addGroup: [ :group | 
			simulation cormasModel class passiveObjectClasses
				do: [ :passiveClass | 
					group
						addItem: [ :item | 
							item
								name: passiveClass name;
								subMenu: (self subMenuForClassPov: passiveClass) ] ] ]
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	" Private - See superimplementor's comment "

	menuToolbar := self mainMenuToolbar.
	
	runButton := self newButton
		icon: CMIcons runIcon;
		action: [ self runSimulationUntilEnd ];
		help: 'Run the simulation to the end';
		yourself.
		
	stepButton := self newButton
		icon: CMIcons stepIcon;
		action: [ self stepSimulation ];
		help: 'Run the simulation just one step forward';
		yourself.
		
	progressBar := self newProgressBar
		fixedAt: 0.0;
		yourself.
	
	self initializeDiagram.
	self initializeCanvasInteractions.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeToolsMenuToolbar [
	" Private - See superimplementor's commen "

	^ self newMenu
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: translator tDisplayLegends;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: translator tPhoto;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: translator tVideo;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: translator tManipulateInstances;
						action: [  ] ];
				addItem: [ :item | 
					item
						name: translator tCreateInstances;
						action: [  ] ];
					
				addItem: [ :item | 
					item
						name: translator tInspectModel;
						icon: (self iconNamed: #smallObjects);
						shortcut: $I command;
						action: [ simulation cormasModel inspect ] ] ];
		yourself
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> mainMenuToolbar [
	" Private - See superimplementor's commen "

	| aMenu |
	
	aMenu := self newMenuBar
		addGroup: [ :group | 
			group
"				addItem: [ :item | 
					item
						name: self translator tEnvironment;
						subMenu: self initializeEnvironmentMenuToolbar ];"
				addItem: [ :item | 
					item
						name: translator tPoV;
						subMenu: self initializePOVMenuToolbar ];
"				addItem: [ :item | 
					item
						name: translator tOptions;
						subMenu: self initializeOptionMenuToolbar ];"
				addItem: [ :item | 
					item
						name: translator tTools;
						subMenu: self initializeToolsMenuToolbar ];
				addItem: [ :item | 
					item
						icon: (self iconNamed: #glamorousZoomToFit);
						action: [ 
							self canvas camera zoomToFit.
							self canvas signalUpdate ] ] ].
	^ aMenu
]

{ #category : 'actions' }
CMSimulationPresenter >> runSimulationUntilEnd [

	simulation runAllStepsWithStepDelay: 200 afterEach: 10 do: [ self updateAfterStep ].
]

{ #category : 'accessing' }
CMSimulationPresenter >> simulation: aSimulation [

	simulation := aSimulation
]

{ #category : 'actions' }
CMSimulationPresenter >> stepSimulation [

	simulation runStep.
	self updateAfterStep.
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> subMenuForClassPov: aClass [

	^ self newMenu addGroup: [ :group | 
		(aClass methodsInProtocol: #pov) do: [ :povName | 
			group addItem: [ :item | 
				item
					name: povName selector;
					action: [ 
						simulation cormasModel spaceModel activePoVsDictionary at: aClass put: item name.
						self initializeDiagram ] ] ] ]
]

{ #category : 'accessing' }
CMSimulationPresenter >> translator: anObject [

	translator := anObject
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateAfterStep [

	builder update.
	self updateProgressBar.
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateProgressBar [

	progressBar fixedAt: (simulation currentTimeStep / simulation finalTimeStep) asFloat.
]
