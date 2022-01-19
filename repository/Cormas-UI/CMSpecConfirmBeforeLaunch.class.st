"
CMSpecConfirmBeforeLaunch new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	controlMethodList:		<Object>
	finalStep:		<Object>
	fixRandomSeedCheck:		<Object>
	fixRandomTextField:		<Object>
	initMethodList:		<Object>
	probesList:		<Object>
	releaseRandomCheck:		<Object>
	stepBackCheck:		<Object>
	toolbar:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecConfirmBeforeLaunch,
	#superclass : #CMSpecObject,
	#instVars : [
		'fixRandomSeedCheck',
		'fixRandomTextField',
		'finalStep',
		'initMethodList',
		'controlMethodList',
		'probesList',
		'stepBackCheck',
		'releaseRandomCheck',
		'toolbar'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecConfirmBeforeLaunch class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :r | 
			r
				newRow: [ :col | 
					col
						add: #fixRandomSeedCheck;
						add: #fixRandomTextField ]
					height: self toolbarHeight;
				newRow: [ :col | 
					col
						newColumn: [ :row | 
							row
								add: #initMethodList;
								add: #controlMethodList;
								add: #finalStep height: self toolbarHeight];
						newColumn: [ :row | 
							row
								add: #probesList;
								add: #stepBackCheck height: self toolbarHeight ] ];
				add: #toolbar height: self toolbarHeight ];
		yourself
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> announcer [

	^ self projectManager announcer
]

{ #category : #callbacks }
CMSpecConfirmBeforeLaunch >> applyActiveProbesChanges [

	self flag: #toBeRevised.
	"CMFireAutomataModel>>nbTrees'."
	"refactoredProbesList := 'CMFireAutomataModel>>nbTrees'."
	self cormasModelClass setActiveProbes: self probesList selectedItems.

]

{ #category : #actions }
CMSpecConfirmBeforeLaunch >> applyScenarioSettings [
	" Callback for the Apply scenario operation. 
	
	The Space Interface should be created after performing the receiver's activeInit method and before updating entities, channel, agents communication and initialization of simulation (timeChanged: 0 for the space).

	This is because agents should be located when they are created, otherwise the Space Diagram gets their CMSimInitializationAnnouncement callback registered **after** simulation init, and the 'timeChanged: 0' callback is never executed. This event causes the first Step does not move the agents, because UI update agents positions for the previous step values for each agent.
	
	"   
	self initMethodList selectedItem
		ifNotNil: [ :aInitMethod | self cormasModel activeInit: aInitMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a init method' ].
	self controlMethodList selectedItem
		ifNotNil: [ :aControlMethod | self cormasModel activeControl: aControlMethod asSymbol ]
		ifNil: [ ^ self alertMessage: 'Choose a control method' ].
		
	self applyActiveProbesChanges.
	self projectAnnouncer announce: (CMFinalStepChangedAnnouncement new finalStep: self getFinalStep).

	self delete.
	
	'Scenario Settings: Init CORMAS model simulation = initializeProbes + initEntities + activeInit' traceCr.
	self cormasModel initSimFromScnrStage1.
	
	'Scenario Settings: Re-open Space Interface (openSpacePresenterUpdateScenario)' traceCr.
	self projectAnnouncer announce: CMScenarioUpdateAnnouncement new.
	
	'Scenario Settings: Init CORMAS model simulation = initializeEvents' traceCr.
	self cormasModel initSimFromScnrStage2.
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> controlMethodList [
	^ controlMethodList
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> controlMethodList: anObject [
	controlMethodList := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> finalStep [
	^ finalStep
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> finalStep: anObject [
	finalStep := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> fixRandomSeedCheck [
	^ fixRandomSeedCheck
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> fixRandomSeedCheck: anObject [
	fixRandomSeedCheck := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> fixRandomTextField [
	^ fixRandomTextField
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> fixRandomTextField: anObject [
	fixRandomTextField := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> getFinalStep [
	" Answer a valid <Integer> for the value entered in the final step input "
	
	^ self finalStep text 
		ifNil: [ 0 ] 
		ifNotNil: [ : userDefinedStep | userDefinedStep ]

]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initControlListMenu: aMenu [

	aMenu
		add: 'Browse'
		target: self
		selector: #openControlMethodBrowser.
	^ aMenu

]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> initMethodList [
	^ initMethodList
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> initMethodList: anObject [
	initMethodList := anObject
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initMethodListMenu: aMenu [

	aMenu
		add: 'Browse'
		target: self
		selector: #openInitMethodBrowser.
	^ aMenu

]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 700 @ 500
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveControl [
	" If there is a control method already selected or the model only has one active control method available, select it "

	self controlMethodList 
		items: (self projectManager modelControlInitMethods collect: #asSymbol);
		label: self translator tSelectControlMethod;
		menu: [ :aMenu | self initControlListMenu: aMenu ].

	(self cormasModel hasControlInit or: [ self projectManager modelControlInitMethods size = 1 ])
		ifTrue: [ self controlMethodList selectItem: self cormasModel activeControl ].
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveInit [
	" If there is a init method already selected, select it "

	self initMethodList 
			label: self translator tSelectInitMethod;
			items: (self projectManager modelInitMethods collect: #asSymbol);
			menu: [ :aMenu | self initMethodListMenu: aMenu ].

	self cormasModel hasActiveInit 
		ifTrue: [ self initMethodList selectItem: self cormasModel activeInit ].
	self initMethodList isEmpty 
		ifTrue: [ self alertMessage: self translator tMissingInitMethods ].
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveProbes [
	
	| apGlobals |
	self probesList items: (self projectManager modelProbesMethods collect: #asSymbol).
	self cormasModel hasActiveProbes
		ifFalse: [ ^ self ].
	apGlobals := self cormasModelClass activeProbes
		collect: [ :apName | ('Global>>' , apName) asSymbol ].
	self probesList listItems withIndexDo: [ :item :index |
		self probesList 
			setSelectionStateFor: index 
			at: (apGlobals includes: item) ]
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializePresenter [
	" Private - See superimplementor's comment "
	" SimManager>>initScenarioWindow "
	
	self initializeActiveInit.
	self initializeActiveControl.
	self initializeActiveProbes.
	
	self controlMethodList isEmpty 
		ifTrue: [ self alertMessage: self translator tMissingControlMethods ].
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeWidgets [
	self
		instantiateModels:
			#(initMethodList SpcLabeledList controlMethodList SpcLabeledList finalStep SpcLabeledTextField fixRandomSeedCheck CheckBoxModel fixRandomTextField TextInputFieldModel probesList SpcLabeledList releaseRandomCheck CheckBoxModel stepBackCheck CheckBoxModel toolbar SpcTwoButtonToolbar).

	self probesList 
		beMultipleSelection;
		label: self translator tSelectProbesToRecord.
	self fixRandomSeedCheck label: self translator tFixRandomSeed.

	self finalStep 
		label: self translator tFinalStepChoice;
		text: self cormasModel simManager finalTime;
		help: self translator tSimFinalStepHelp.

	self finalStep acceptBlock: [  ].
	self stepBackCheck label: self translator tEnableStepBack.
	self releaseRandomCheck label: self translator tReleaseRandomSeed.
	self toolbar
		secondButtonLabel: self translator tApply;
		firstButtonLabel: self translator tCancel;
		firstButtonAction: [ self delete ];
		secondButtonAction: [ self applyScenarioSettings ]
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> openControlMethodBrowser [

	self openBrowserAt: self cormasModelClass selector: self controlMethodList selectedItem
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> openInitMethodBrowser [

	self openBrowserAt: self cormasModelClass selector: self initMethodList selectedItem
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> probesList [
	^ probesList
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> probesList: anObject [
	probesList := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> releaseRandomCheck [
	^ releaseRandomCheck
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> releaseRandomCheck: anObject [
	releaseRandomCheck := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> stepBackCheck [
	^ stepBackCheck
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> stepBackCheck: anObject [
	stepBackCheck := anObject
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> title [
	" Private - See superimplementor's comment "

	^ self formattedWindowTitle: self translator tConfirmBeforeLaunch
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> toolbar: anObject [
	toolbar := anObject
]
