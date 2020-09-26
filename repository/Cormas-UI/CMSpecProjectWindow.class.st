Class {
	#name : #CMSpecProjectWindow,
	#superclass : #PFStandardProjectWindow,
	#instVars : [
		'simWindow'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #specs }
CMSpecProjectWindow class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c 
				add: #menuToolbar height: self toolbarHeight;
				add: #simWindow ];
		yourself
]

{ #category : #'world menu' }
CMSpecProjectWindow class >> menuCommandOn: aBuilder [
	<worldMenu>
	
	(aBuilder item: #'CORMAS')
		action: [ self open ]; 
		icon: CMIcons smallCormasLogoIcon;
		order: 5.
		
	aBuilder withSeparatorAfter
]

{ #category : #opening }
CMSpecProjectWindow class >> open [
 	" Open the receiver's window " 

	| win |
	
	CMApplicationProject release.
	PFProjectSettings currentApplicationClass: CMApplicationProject.
	" Rebuild translator table "
	CMApplicationProject uniqueInstance translator: nil.		
	win := self new 
		openWithSpec;
		centered;
		startFSM;
		yourself.
	win simWindow hideSimInterface
]

{ #category : #callbacks }
CMSpecProjectWindow >> applicationProperties [
	" Private - Open a window to set receiver's properties "

	(CMSpecModelComments for: self projectManager) openWithSpec
]

{ #category : #private }
CMSpecProjectWindow >> closeAfterCreateProject [
	^ true
]

{ #category : #private }
CMSpecProjectWindow >> cormasModelClass [
	" Private - See comment in #cormasModelClass "

	^ self projectManager cormasModelClass 
]

{ #category : #defaults }
CMSpecProjectWindow >> defaultProjectManagerClass [
	" Private - See superimplementor's comment "

	^ CMProjectManager
]

{ #category : #defaults }
CMSpecProjectWindow >> defaultWindowTitle [
	" Private - See superimplementor's comment "

	^ 'Cormas'
]

{ #category : #initialization }
CMSpecProjectWindow >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 300
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeApplication [
	" Private - Configure the receiver's application class "

	ShortcutReminder enabled: false.

]

{ #category : #initialization }
CMSpecProjectWindow >> initializeButtonToolbar [
	" Private - Set up the main window toolbar "

]

{ #category : #initialization }
CMSpecProjectWindow >> initializeMenuToolbar [
	" Private - See superimplementor's commen "

	menuToolbar := MenuModel new
		addGroup: [ : group | 
			self initializeFileSubMenu: group.
			self initializeProgrammingSubMenu: group.
			self initializeVisualizationSubMenu: group.
			self initializeSimulationSubMenu: group.
			self intializeToolsSubMenu: group.
			self initializeHelpMenu: group ];
		addGroup: [ : group |
			"self initializeFileToolbarButtons: group.			"
			self initializeActionsButtons: group ].
	menuToolbar applyTo: self.
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeProgrammingSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tProgramming;
				subMenu: self subMenuForProgramming ]
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeSimulationSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tSimulation;
				subMenu: self subMenuForSimulation ]
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeSubscriptions [

	self projectAnnouncer
		when: CMProjectOpenAnnouncement
		send: #updateStateOpened
		to: self.
	self projectAnnouncer
		when: CMProjectNewAnnouncement
		send: #updateStateNew
		to: self.
	self projectAnnouncer
		when: CMProjectUpdateAnnouncement, CMProjectRenameAnnouncement
		do: [ : ann | 
				self windowTitle: self formattedWindowTitle.
				self updateTitle. ].
	self projectAnnouncer
		when: CMEditAttributesAnnouncement
		send: #openEditAttributesFor: 
		to: self.
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeVisualizationSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tVisualization;
				subMenu: self subMenuForVisualization ]
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeWidgets [
	" Private - See superimplementor's comment "

	self 
		initializeApplication;
		initializeSubscriptions.
	super initializeWidgets.
	self simWindow: ((CMSpecSimulationContainer for: self projectManager)
		owner: self;
		yourself)

]

{ #category : #initialization }
CMSpecProjectWindow >> intializeToolsSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tTools;
				subMenu: self subMenuForTools ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableClassForEachEntity [

	(self selectMenuItemNamed: self translator tProgrammingEntityClass) enabled: true.

]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableFileGroup [
	" Private - Disable all menu items within the File group "

	{ 
		#tClose .
		#tSave .
		#tSaveAs .
		#tExplore .
		#tRemove .
"		#tRename .
		#tRenameAs ."
		#tProperties
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableHelpGroup [
	" Private - Disable all menu items within the Help group "

	{ 
		#tAboutModel .
		#tHowToRunModel .
		#tChangeModelComments
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableItem: aSelector [

	(self selectMenuItemNamed: (self translator perform: aSelector)) enabled: false.

]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableProgrammingGroup [
	" Private - Disable all menu items within the Programming group "

	{ 
		#tProgrammingEntityClass .
		#tEditInit .
		#tEditAttributes .
		#tEditSteps .
		#tEditActivityDiagrams .
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableSimulationGroup [
	" Private - Disable all menu items within the Simulation group "

	{ 
		#tDisplayParams .
		#tSimInformation .
		#tSimpleStochAnalysis .
		#tOATSeqValues .
		#tOATPredefValues .
		#tMonteCarlo .
		#tClassifyByParams .
		#tCrossedSeqValues .
		#tCrossedPredefValues .
		#tStopRWebService 
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableToolsGroup [
	" Private - Disable all menu items within the Tools group "

	{ 
		#tManipulateInstances .
		#tCreateInstances .
		#tSnapshot .
		#tModelListing .
		#tModelGlossary .
		#tDisplayModelVersions .
		#tDistributeAsServer .
		#tDistributeAsClient .
		#tPackageClient
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableVisualizationGroup [
	" Private - Disable all menu items within the Visualization group "

	{ 
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuDisableItem: itemSel ]

]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableFileGroup [
	" Private - Enable all menu items within the File group "

	{ 
		#tClose .
		#tSave .
		#tSaveAs .
		#tExplore .
		#tRemove .
"		#tRename .
		#tRenameAs ."
		#tProperties
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableHelpGroup [
	" Private - Enable all menu items within the Tools group "

	{ 
		#tAboutModel .
		#tHowToRunModel .
		#tChangeModelComments	
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableItem: aSelector [

	(self selectMenuItemNamed: (self translator perform: aSelector)) enabled: true.

]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableProgrammingGroup [
	" Private - Enable all menu items within the Programming group "

	{ 
		#tProgrammingEntityClass .
		#tEditInit .
		#tEditAttributes .
		#tEditSteps .
		#tEditActivityDiagrams .
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableSimulationGroup [
	" Private - Enable all menu items within the Simulation group "

	{ 
		#tDisplayParams .
		#tSimInformation .
		#tSimpleStochAnalysis .
		#tOATSeqValues .
		#tOATPredefValues .
		#tMonteCarlo .
		#tClassifyByParams .
		#tCrossedSeqValues .
		#tCrossedPredefValues .
		#tStopRWebService 
	} do: [ : itemSel | self menuEnableItem: itemSel ]

]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableToolsGroup [
	" Private - Enable all menu items within the Tools group "

	{ 
		#tManipulateInstances .
		#tCreateInstances .
		#tSnapshot .
		#tModelListing .
		#tModelGlossary .
		#tDisplayModelVersions .
		#tDistributeAsServer .
		#tDistributeAsClient .
		#tPackageClient
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableVisualizationGroup [
	" Private - Disable all menu items within the Visualization group "

	{ 
		#tProgrammingEntityClass .
		#tEditInit .
		#tEditAttributes .
		#tEditSteps .
		#tEditActivityDiagrams .
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> openEditAttributes [
	" Open the edit attributes window "

	(CMSpecEditAttributes 
		for: self cormasModelClass 
		owner: self) openWithSpec.
]

{ #category : #callbacks }
CMSpecProjectWindow >> openEditAttributesFor: aCMEditAttributesAnnouncement [ 

	(CMSpecEditAttributes 
		for: aCMEditAttributesAnnouncement targetClass 
		owner: self) openWithSpec.
]

{ #category : #callbacks }
CMSpecProjectWindow >> openEditInitialization [
	" Open a browser tool to edit the receiver's model initialization "

	ClyFullBrowser openWithState: [ : browser | 
		browser selectClass: self cormasModelClass atMethodTag: #init ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> openEditSteps [
	" Open a browser tool to edit the model steps "

	Smalltalk tools browser 
		openOnCategory: #control
		ofClass: self cormasModelClass 
		
]

{ #category : #callbacks }
CMSpecProjectWindow >> openPovSetterGUI [

	| setter |
	
	self cormasModelClass isNil ifTrue: [ ^ self alertMessage: self translator tNoModel ].
	self cormasModelClass cellClass isNil ifTrue: [ ^ self alertMessage: self translator tWhichAttribute ].
	setter := CMSpecPovSetterNotebook openFor: self projectManager.

]

{ #category : #callbacks }
CMSpecProjectWindow >> openProgrammingEntityClass [
	" Private - Open an entities browser "

	CMSpecEntitiesBrowser openFor: self projectManager

]

{ #category : #callbacks }
CMSpecProjectWindow >> openVizMessages [
self alertMessage: 'No implemented yet'
	"CMSpecVizSpaceWindow new
		owner: self;
		openWithSpec"
]

{ #category : #callbacks }
CMSpecProjectWindow >> openVizProbes [
	| aModel |
	aModel := self projectManager cormasModel.
	aModel data isEmpty
		ifTrue: [ ^ self alertMessage: 'No data to visualize' ].
	CMSimpleChart openOn: aModel
]

{ #category : #callbacks }
CMSpecProjectWindow >> openVizSpace [
	| aModel viz |
	aModel := self projectManager cormasModel.
	aModel spaceModel isNil
		ifTrue: [ ^ self alertMessage: 'No spaceModel to visualize' ].
	viz := CMSpaceInterface openFor: self projectManager.
	viz spaceView: viz specSpaceView spec instance view.
	viz window extent: viz spaceView canvas extent + (20 @ 20).
	viz spaceView canvas focusOnCenterScaled.
	viz spaceView signalUpdate
]

{ #category : #accessing }
CMSpecProjectWindow >> projectAnnouncer [

	^ self projectManager announcer
]

{ #category : #accessing }
CMSpecProjectWindow >> simWindow [
	^ simWindow
]

{ #category : #accessing }
CMSpecProjectWindow >> simWindow: anObject [
	simWindow := anObject
]

{ #category : #'submenu-help' }
CMSpecProjectWindow >> subMenuAboutThisModel: anItem [

	anItem
		name: self translator tAboutModel;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $I command;
		action: [ self openHelpAboutThisModel ]
]

{ #category : #'submenu-help' }
CMSpecProjectWindow >> subMenuChangeModelComments: anItem [

	anItem
		name: self translator tChangeModelComments;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $R command;
		action: [ self openHelpChangeModelComments ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuCormasR [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuStartWSR: item ];
				addItem: [ : item | self subMenuStopWSR: item ] ]
]

{ #category : #'submenu-help' }
CMSpecProjectWindow >> subMenuForHelp [
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | self subMenuAboutThisModel: item ];
				addItem: [ :item | self subMenuHowToRunThisModel: item ];
				addItem: [ :item | self subMenuChangeModelComments: item ];
				addItem: [ :item | self subMenuAbout: item ]]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuForProgramming [

	^ MenuModel new
		addGroup: [ : group |
			group addItem: [ : item | self subMenuProgrammingEntityClass: item ] ];
		addGroup: [ : group | 
			group addItem: [ : item | self subMenuProgrammingSimulationOrganisation: item ] ];
		addGroup: [ : group | 
			group addItem: [ : item | self subMenuProgrammingObserver: item ] ];
		addGroup: [ : group |
			group addItem: [ : item | self subMenuProgrammingUML: item ] ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuForSimCrossedSensitivityAnalysis [

	^ MenuModel new
		addGroup: [ : group |
			group 	
				addItem: [ : item | self subMenuSimCrossedSensSequentialValues: item ];
				addItem: [ : item | self subMenuSimCrossedSensPredefinedValues: item ] ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuForSimInitInstantiation [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : anItem | self subMenuSimEditInitialization: anItem ];
				addItem: [ : anItem | self subMenuSimEditAttributes: anItem ] ]
		


]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuForSimOATSensitivityAnalysis [

	^ MenuModel new
		addGroup: [ : group |
			group 	
				addItem: [ : item | self subMenuSimOATSensSequentialValues: item ];
				addItem: [ : item | self subMenuSimOATSensPredefinedValues: item ];
				addItem: [ : item | self subMenuSimOATSensMC: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimOATSensByParams: item ] ]			
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuForSimScheduler [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : anItem | self subMenuSimEditSteps: anItem ];
				addItem: [ : anItem | self subMenuSimEditActivityDiagrams: anItem ] ]
		


]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuForSimulation [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuSimInterface: item ];
				addItem: [ : item | self subMenuSimDisplayParams: item ];
				addItem: [ : item | self subMenuSimInformation: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimAnalysis: item ] ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuForTools [
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | self subMenuToolsManipulateInstances: item ];
				addItem: [ :item | self subMenuToolsCreateInstances: item ];
				addItem: [ :item | self subMenuToolsSnapshot: item ];
				addItem: [ :item | self subMenuToolsMain: item ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | self subMenuToolsAddOns: item ];
				addItem: [ :item | self subMenuToolsModelListing: item ];
				addItem: [ :item | self subMenuToolsModelGlossary: item ];
				addItem: [ :item | self subMenuToolsVersions: item ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | self subMenuToolsDistributeAsClient: item ];
				addItem: [ :item | self subMenuToolsDistributeAsServer: item ];
				addItem: [ :item | self subMenuToolsPackageClient: item ] ;
				addItem: [ :item | 
					item
						name: 'inspect';
						action: [ self inspect ] ] ]
]

{ #category : #'submenu-visualization' }
CMSpecProjectWindow >> subMenuForVisualization [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuVizProbes: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuVizMessages: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuVizSpace: item ] ]
]

{ #category : #'submenu-help' }
CMSpecProjectWindow >> subMenuHowToRunThisModel: anItem [

	anItem
		name: self translator tHowToRunModel;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $R command;
		action: [ self openHelpHowToRunModel ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuOpenClassEditor: item [
	item
		name: 'Class Editor...';
		icon:
			(self iconNamed: #openIcon);
		shortcut: $c command;
		action: [ OPUmlProject
				openOnModel: (OPUMLModel new name: self projectManager cormasModelName) ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingClassEditor [

	^ MenuModel new
		addGroup: [ : group |
			group addItem: [ : item | self subMenuOpenClassEditor: item ] ]
		

]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingEntityClass: item [

	item
		name: self translator tProgrammingEntityClass;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $C command;
		action: [ self openProgrammingEntityClass ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingMessages [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuProgrammingProbes: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingMessages: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingSpaceAndEntities: item ] ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingMessages: item [

	item
		name: self translator tMessages;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $M command;
		action: [ self openProgrammingMessages ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingObserver [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuProgrammingProbes: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingMessages: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingSpaceAndEntities: item ] ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingObserver: item [

	item
		name: self translator tObserver;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $O command;
		subMenu: self subMenuProgrammingObserver
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingProbes: item [

	item
		name: self translator tProbes;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openProgrammingProbes ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingSimInitialInstantiation: item [

	item
		name: self translator tInitInstantiation;
"		icon: Smalltalk ui icons openIcon;"
		subMenu: self subMenuForSimInitInstantiation
		


]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingSimScheduler: item [

	item
		name: self translator tScheduler;
"		icon: Smalltalk ui icons openIcon;"
		subMenu: self subMenuForSimScheduler
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingSimulationOrganisation [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuProgrammingSimInitialInstantiation: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingSimScheduler: item ] ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingSimulationOrganisation: item [

	item
		name: self translator tSimOrganization;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		subMenu: self subMenuProgrammingSimulationOrganisation
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingSpaceAndEntities: item [

	item
		name: self translator tSpaceEntities;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openPovSetterGUI ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingUML: item [

	item
		name: self translator tClassEditor;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $U command;
		subMenu: self subMenuProgrammingClassEditor
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimAnalysis [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuSimStochasticAnalysis: item ];
				addItem: [ : item | self subMenuSimOATSensitivityAnalysis: item ];
				addItem: [ : item | self subMenuSimCrossedSensitivityAnalysis: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimCormasR: item ] ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimAnalysis: item [

	item
		name: self translator tAnalysis;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $A command;
		subMenu: self subMenuSimAnalysis
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimCormasR: item [

	item
		name: 'Cormas <-> R';
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $R command;
		subMenu: self subMenuCormasR
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimCrossedSensPredefinedValues: item [

	item
		name: self translator tOATPredefValues;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openSimCrossedSensPredefinedValues ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimCrossedSensSequentialValues: item [

	item
		name: self translator tCrossedSeqValues;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $V command;
		action: [ self openSimCrossedSensSequentialValues ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimCrossedSensitivityAnalysis: item [

	item
		name: self translator tCrossSensAnalysis;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $C command;
		subMenu: self subMenuForSimCrossedSensitivityAnalysis

]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimDisplayParams: item [

	item
		name: self translator tDisplayParams;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $D command;
		action: [ self openSimDisplayParams ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuSimEditActivityDiagrams: anItem [

	anItem
		name: self translator tEditActivityDiagrams;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openActivityDiagrams ]		
		


]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuSimEditAttributes: anItem [

	anItem
		name: self translator tEditAttributes;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $A command;
		action: [ self openEditAttributes ]

]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuSimEditInitialization: anItem [

	anItem
		name: self translator tEditInit;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $I command;
		action: [ self openEditInitialization ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuSimEditSteps: anItem [

	anItem
		name: self translator tEditSteps;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openEditSteps ]		


]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimInformation: item [

	item
		name: self translator tSimInformation;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $F command;
		action: [ self openSimInformation ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimInterface: item [

	item
		name: self translator tSimInterface;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $I command;
		action: [ self simWindow toggleSimInterface ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimOATSensByParams: item [

	item
		name: self translator tClassifyByParams;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openSimOATSensClassifyByParams ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimOATSensMC: item [

	item
		name: self translator tMonteCarlo;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $V command;
		action: [ self openSimOATSensMC ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimOATSensPredefinedValues: item [

	item
		name: self translator tCrossedPredefValues;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openSimOATSensPredefinedValues ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimOATSensSequentialValues: item [

	item
		name: self translator tOATSeqValues;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $V command;
		action: [ self openSimOATSensSequentialValues ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimOATSensitivityAnalysis: item [

	item
		name: self translator tOATSensAnalysis;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $O command;
		subMenu: self subMenuForSimOATSensitivityAnalysis
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimStochasticAnalysis: item [

	item
		name: self translator tSimpleStochAnalysis;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openSimStochasticAnalysis ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuStartWSR: item [

	item
		name: self translator tStartRWebService;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openStartWSForR ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuStopWSR: item [

	item
		name: self translator tStopRWebService;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openStopWSForR ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsAddOns: item [

]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsCreateInstances: item [

	item
		name: self translator tCreateInstances;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $C command;
		action: [ self openToolsCreateInstances ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsDistributeAsClient: item [

	item
		name: self translator tDistributeAsClient;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $C command;
		action: [ self openToolsDistribteAsClient ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsDistributeAsServer: item [

	item
		name: self translator tDistributeAsServer;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openToolsDistribteAsServer ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsMain: item [

	item
		name: self translator tOpenPharoMenu;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ World worldMenu openCenteredInWorld ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsManipulateInstances: item [

	item
		name: self translator tManipulateInstances;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $I command;
		action: [ self openToolsManipulateInstances ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsModelGlossary: item [

	item
		name: self translator tModelGlossary;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $G command;
		action: [ self openToolsModelGlossary ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsModelListing: item [

	item
		name: self translator tModelListing;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $L command;
		action: [ self openToolsModelListing ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsPackageClient: item [

	item
		name: self translator tPackageClient;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $K command;
		action: [ self openToolsPackageClient ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsSnapshot: item [

	item
		name: self translator tSnapshot;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openToolsSnapshotState ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsVersions: item [

	item
		name: self translator tDisplayModelVersions;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $V command;
		action: [ self openToolsModelVersions ]
]

{ #category : #'submenu-visualization' }
CMSpecProjectWindow >> subMenuVizMessages: item [

	item
		name: self translator tMessages;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $M command;
		action: [ self openVizMessages ]
]

{ #category : #'submenu-visualization' }
CMSpecProjectWindow >> subMenuVizProbes: item [

	item
		name: self translator tProbes;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $P command;
		action: [ self openVizProbes ]
]

{ #category : #'submenu-visualization' }
CMSpecProjectWindow >> subMenuVizSpace: item [

	item
		name: self translator tSpace;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openVizSpace ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateCloseProject [
	" Private - See superimplementor's comment "

	super updateCloseProject.
	self 
		menuDisableFileGroup;	
		menuDisableProgrammingGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableVisualizationGroup;	
		menuDisableHelpGroup;
		updateSimulationWindow.
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateSimulationWindow [
	" Open or update the receiver's simulation interface "
	
	self simWindow toggleSimInterface
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateStateNew [
	" Private - See superimplementor's comment "

	super updateStateNew.
	self 
		menuEnableProgrammingGroup;
		menuEnableSimulationGroup;
		menuEnableToolsGroup;
		menuEnableVisualizationGroup;
		menuEnableHelpGroup;
		updateSimulationWindow;
		windowTitle: self formattedWindowTitle;
		updateTitle.
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateStateOpened [
	" Private - See superimplementor's comment "

	super updateStateOpened.
	self 
		menuEnableProgrammingGroup;
		menuEnableSimulationGroup;
		menuEnableToolsGroup;
		menuEnableVisualizationGroup;
		menuEnableHelpGroup;
		updateSimulationWindow;
		windowTitle: self formattedWindowTitle;
		updateTitle.
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateStateWaitNewOrOpen [
	" Private - See superimplementor's comment "

	self flag: #toBeReviewed. "Apparently menugroupmorph does not disable correctly "
	super updateStateWaitNewOrOpen.
	self 
		menuDisableProgrammingGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableVisualizationGroup;
		menuDisableHelpGroup

]
