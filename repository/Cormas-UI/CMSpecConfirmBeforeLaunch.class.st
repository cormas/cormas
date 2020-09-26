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

{ #category : #actions }
CMSpecConfirmBeforeLaunch >> applyScenarioSettings [
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
		text: (self finalStep text ifNil:[0] ifNotNil:[:userDefinedStep | userDefinedStep]).
	self cormasModel initSimulation.
	self delete
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
CMSpecConfirmBeforeLaunch >> initMethodList [
	^ initMethodList
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> initMethodList: anObject [
	initMethodList := anObject
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 700 @ 500
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveControl [

	(self cormasModel activeControl
		ifNotNil: [ : m | self controlMethodList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self controlMethodList selectItem: self cormasModel activeControl ]
			ifFalse: 	 [ self controlMethodList notEmpty
				ifTrue: [ self controlMethodList selectItem: self controlMethodList items first ] ].
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveInit [

	(self cormasModel activeInit
		ifNotNil: [ : m | self initMethodList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self initMethodList selectItem: self cormasModel activeInit ]
			ifFalse: 	 [ self initMethodList items notEmpty
				ifTrue: [ self initMethodList selectItem: self initMethodList first ] ].
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeActiveProbes [

	(self cormasModelClass activeProbes 
		ifNotNil: [ : m | self probesList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self probesList selectItem: self cormasModelClass activeProbes ]
			.
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializePresenter [
	" Private - See superimplementor's comment "
	" SimManager>>initScenarioWindow "
	
	self initMethodList items: self projectManager modelInitMethods.
	self controlMethodList items: self projectManager modelControlInitMethods.
	self probesList items: self projectManager modelProbesMethods.

	self initMethodList isEmpty 
		ifTrue: [ self alertMessage: self translator tMissingInitMethods ].
	self controlMethodList isEmpty 
		ifTrue: [ self alertMessage: self translator tMissingControlMethods ].
		
	self initializeActiveInit.
	self initializeActiveControl.
	self initializeActiveProbes.
	
]

{ #category : #initialization }
CMSpecConfirmBeforeLaunch >> initializeWidgets [
	self
		instantiateModels:
			#(initMethodList SpcLabeledList controlMethodList SpcLabeledList finalStep SpcLabeledTextField fixRandomSeedCheck CheckBoxModel fixRandomTextField TextInputFieldModel probesList SpcLabeledList releaseRandomCheck CheckBoxModel stepBackCheck CheckBoxModel toolbar SpcTwoButtonToolbar).
	self initMethodList label: 'Select a method of initialization'.
	self controlMethodList label: 'Select a method of control'.
	self probesList label: 'Select probes to record'.
	self fixRandomSeedCheck label: 'Fix the random seed to'.
	self finalStep label: 'Final step'.
	self finalStep
		text: self cormasModel simManager finalTime;
		help: self translator tSimFinalStepHelp.
	self finalStep acceptBlock: [  ].
	self stepBackCheck label: 'Enable stepping back'.
	self releaseRandomCheck label: 'Release random seed after initialization'.
	self toolbar
		secondButtonLabel: 'Apply';
		firstButtonLabel: 'Cancel';
		firstButtonAction: [ self delete ];
		secondButtonAction: [ self applyScenarioSettings ]
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

	^ 'Confirmation before launching'
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMSpecConfirmBeforeLaunch >> toolbar: anObject [
	toolbar := anObject
]
