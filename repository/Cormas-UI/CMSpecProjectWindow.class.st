"
This is the main CORMAS UI window.

"
Class {
	#name : #CMSpecProjectWindow,
	#superclass : #PFStandardProjectWindow,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'simWindow'
	],
	#category : #'Cormas-UI-Spec1-Project'
}

{ #category : #specs }
CMSpecProjectWindow class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c 
				add: #menuToolbar height: self toolbarHeight;
				add: #simWindow height: 105 ];
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
	" Check models are available or should be migrated from the image "
	CMApplicationProject hasUserProjects
		ifFalse: [ CMProjectBuilder buildProjectModels ].
	" Rebuild translator table "
	CMApplicationProject uniqueInstance translator: nil.		
	win := self new 
		openWithSpec;
		startFSM;
		yourself.
	win simWindow hideSimInterface
]

{ #category : #callbacks }
CMSpecProjectWindow >> appSettingsClass [
	" Private - Answer the <Class> responsible to provide application settings "

	^ CMApplicationPreferences
]

{ #category : #callbacks }
CMSpecProjectWindow >> chartVisualizer [
	" Answer a <Class> responsible to display a UI for charting "

	^ self appSettingsClass settingChartViewer
]

{ #category : #private }
CMSpecProjectWindow >> closeAfterCreateProject [
	^ true
]

{ #category : #callbacks }
CMSpecProjectWindow >> closeSimulationWindow [
	" Close the receiver's simulation interface "
	
	self simWindow delete
]

{ #category : #private }
CMSpecProjectWindow >> cormasExpressions [
	" Answer a <String> with useful Cormas expressions to debug/develop/cleanup "
	
	^ '"================= Inspect utilities ================="
CMProjectManager allInstances.
CMProjectManager allInstances first.
CMProjectManager allInstances first pointersTo.

CMSpecProjectWindow allInstances.
CMSpecProjectWindow allInstances first.
CMSpecProjectWindow allInstances first pointersTo.

CMProjectModel allInstances.
CMProjectModel allInstances first.
CMProjectModel allInstances first pointersTo.

CMR3SpaceDiagram allInstances.
CMR3SpaceDiagram allInstances first.
CMR3SpaceDiagram allInstances first pointersTo.
CMR3SpaceDiagram allInstances first announcer.

CMR3SpacePresenter allInstances.
CMR3SpacePresenter allInstances first.
CMR3SpacePresenter allInstances first pointersTo.
CMR3SpacePresenter allInstances first announcer.

CMR3ChartPresenter allInstances.
CMR3ChartPresenter allInstances first.
CMR3ChartPresenter allInstances first pointersTo.
CMR3ChartPresenter allInstances first announcer.

CMConwayModel spatialClasses.
CMConwayModel passiveClasses.
CMConwayModel socialClasses.

SystemNavigation default obsoleteClasses.

"================= Reset utilities ================="

CMProjectBuilder rebuildModels.

CMConwayModel passiveClasses: nil.
CMConwayModel socialClasses: nil.
CMConwayModel spatialClasses: nil.

CMSpecProjectWindow allInstances first projectAnnouncer subscriptions reset.
CMProjectManager allInstances anyOne announcer subscriptions reset.
CMProjectManager allInstances anyOne announcer subscriptions.

CMProjectOpener allInstances.
CMProjectOpener allInstances anyOne.
CMProjectOpener allInstances anyOne projectManager: nil.

"================= Clean script ================="

3 timesRepeat: [ Smalltalk garbageCollect ].

CMProjectManager allInstancesDo: #release.
CMR3SpaceDiagram allInstancesDo: #release.
CMR3SpacePresenter allInstancesDo: #release.
 
SmalltalkImage current fixObsoleteBindings.
SmalltalkImage current fixObsoleteReferences.
	SystemNavigation new obsoleteBehaviors size > 0
		ifTrue: [ SystemNavigation new obsoleteBehaviors inspect.
			self error: ''Still have obsolete behaviors. See inspector'' ].

{ 
CMProjectModel allInstances.
CMProjectManager allInstances.
CMSpecProjectWindow allInstances.
CMR3SpacePresenter allInstances.
} allSatisfy: #isEmpty.'

]

{ #category : #private }
CMSpecProjectWindow >> cormasModel [
	" Answer the receiver's model, a subclass of <CMAbstractModel> "

	^ self projectManager cormasModel
]

{ #category : #private }
CMSpecProjectWindow >> cormasModelClass [
	" Private - See comment in #cormasModelClass "

	^ self projectManager cormasModelClass 
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> cormasPackages [
	" Anwser a <Collection> of <RPackage> which belong to the CORMAS project "
	
	^ RPackageOrganizer default packageNames select: [ : each | each beginsWith: 'Cormas' ]
]

{ #category : #defaults }
CMSpecProjectWindow >> defaultProjectManagerClass [
	" Private - See superimplementor's comment "

	^ CMProjectManager
]

{ #category : #accessing }
CMSpecProjectWindow >> fsmState [

	^ self projectManager fsmState
]

{ #category : #initialization }
CMSpecProjectWindow >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 180
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

{ #category : #'initialization-submenus' }
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

{ #category : #'initialization-submenus' }
CMSpecProjectWindow >> initializeProgrammingSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tProgramming;
				subMenu: self subMenuForProgramming ]
]

{ #category : #'initialization-submenus' }
CMSpecProjectWindow >> initializeSimulationSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tSimulation;
				subMenu: self subMenuForSimulation ]
]

{ #category : #initialization }
CMSpecProjectWindow >> initializeSubscriptions [
	" Private - See superimplementor's comment "

	super initializeSubscriptions.
	self projectAnnouncer
		when: CMFinalStepChangedAnnouncement
		do: [ : ann | self simWindow simWindow finalStepInputText text: ann finalStep. ].
	self projectAnnouncer
		when: CMProjectUpdateAnnouncement, CMProjectRenameAnnouncement
		do: [ : ann | 
				self windowTitle: self formattedWindowTitle.
				self updateTitle. ].
	self projectAnnouncer
		when: CMEditAttributesAnnouncement
		send: #openEditAttributesFor: 
		to: self.
	self projectAnnouncer
		when: 	CMScenarioUpdateAnnouncement
		send: #openSpacePresenterUpdateScenario
		to: self
]

{ #category : #'initialization-submenus' }
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

	self initializeSubscriptions.
	super initializeWidgets.
	self simWindow: ((CMSpecSimulationContainer for: self projectManager)
		owner: self;
		yourself)

]

{ #category : #'initialization-submenus' }
CMSpecProjectWindow >> intializeToolsSubMenu: group [

	group
		addItem: [ : item | 
			item
				name: self translator tTools;
				subMenu: self subMenuForTools ]
]

{ #category : #testing }
CMSpecProjectWindow >> isMainCormasAppWindow [

	^ true
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
		#tClassEditor
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
		#tBrowseModel .
		#tInspectModel
	} do: [ : itemSel | self menuDisableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuDisableVisualizationGroup [
	" Private - Disable all menu items within the Visualization group "

	{ 
		#tProbes .
		#tMessages .
		#tSpace
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
		#tClassEditor .
		#tMessagesProgramming .
		#tProbesProgramming
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
		#tBrowseModel .
		#tPreferences .
		#tInspectModel
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #menu }
CMSpecProjectWindow >> menuEnableVisualizationGroup [
	" Private - Disable all menu items within the Visualization group "

	{ 
		#tProbes .
		#tMessages .
		#tSpace
	} do: [ : itemSel | self menuEnableItem: itemSel ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> openCormasBaselineBrowser [

	Smalltalk tools browser openWithState: [ : browser | 
		browser 
			setUpScopedModeWith: (ClyPackageScope 
				of: BaselineOfCormas package
				in: ClyNavigationEnvironment currentImage 
				named: 'CORMAS Metacello Baseline');
			selectPackage: BaselineOfCormas package;
			selectClass: BaselineOfCormas ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> openCormasIssue [

	Cursor wait showWhile: [ WebBrowser openOn: 'https://github.com/cormas/cormas/issues/new/choose' ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> openCormasSystemBrowser [

	Smalltalk tools browser openWithState: [ : browser | 
		browser 
			setUpScopedModeWith: (ClyPackageScope 
				ofAll: (self cormasPackages collect: #asPackage)
				in: ClyNavigationEnvironment currentImage 
				named: 'CORMAS') ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> openDependenciesGraph [

	| matchingPackages model |

	matchingPackages := self cormasPackages.
	matchingPackages := { 'Cormas-Core' . 'Cormas-UI' }.
	model := UrImageDependenciesMainModel new
		internalPackageNames: matchingPackages;
		yourself.
	^ (UrMainPresenter new
		setModelBeforeInitialization: model;
		openWithSpec)
			withWindowDo: [ : w | 
				w
					extent: 1200 @ 800;
					title: 'CORMAS Dependencies' ]

]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> openDependenciesTool [

	Cursor wait showWhile: [ (DAPackageAnalyzerTreePresenter onPackagesMatch: '*Cormas*') open ]
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

	Smalltalk tools browser openWithState: [ : browser | 
		browser selectClass: self cormasModelClass atMethodTag: #init ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> openEditSteps [
	" Open a browser tool to edit the model steps "

	Smalltalk tools browser openWithState: [ : browser | 
		browser selectClass: self cormasModelClass atMethodTag: #control ]

		
]

{ #category : #accessing }
CMSpecProjectWindow >> openHelpAboutThisModel [
	" Open a window with description and help about the receiver "

	(CMSpAboutWindow 
		owner: self spPresenter 
		on: self cormasModelClass) openWithSpec
			
]

{ #category : #callbacks }
CMSpecProjectWindow >> openPovSetterGUI [

"	| setter |
	setter := CMSpecPovSetterNotebook openFor: self projectManager."
	self alertMessage: 'Not implemented'.

]

{ #category : #callbacks }
CMSpecProjectWindow >> openProbesInterface [
	" Private - Open a window with the chart visualizer configured for the receiver's application "

	self chartVisualizer openOn: self projectManager cormasModel
]

{ #category : #callbacks }
CMSpecProjectWindow >> openProbesInterface: aCollectionOfProbes [
	" Private - Open a window with the chart visualizer configured for the receiver's application "

	self chartVisualizer openOn: self projectManager cormasModel with: aCollectionOfProbes
]

{ #category : #callbacks }
CMSpecProjectWindow >> openProgrammingEntityClass [
	" Private - Open an entities browser "

	CMSpecEntitiesBrowser openFor: self projectManager
]

{ #category : #callbacks }
CMSpecProjectWindow >> openProgrammingMessages [

	self inform: 'shouldBeImplemented'.
]

{ #category : #callbacks }
CMSpecProjectWindow >> openProjectProperties [
	" Private - Open a window to set receiver's properties "

	(CMSpecModelComments for: self projectManager) openWithSpec
]

{ #category : #callbacks }
CMSpecProjectWindow >> openSpacePresenter [
	" Private - Callback for user request to open a new Space Model interface for the receiver's project "

	'Project Window: Open Space Presenter' traceCr.
	CMR3SpacePresenter openFor: self projectManager.
	'Project Window: Announce Changed PoV' traceCr.
 	self projectAnnouncer announce: CMSChangePoVAnnouncement new.
]

{ #category : #callbacks }
CMSpecProjectWindow >> openSpacePresenterUpdateScenario [
	" Private - Open a space model interface. Close all opened space model windows if any "

	'Project Window: Deleting Space Presenters...' traceCr.
	CMR3SpacePresenter allInstancesDo: #delete.
	self spaceModel activePoVsDictionary ifNotEmpty: [ self openSpacePresenter ]


]

{ #category : #callbacks }
CMSpecProjectWindow >> openVizMessages [
self alertMessage: 'No implemented yet'
	"CMSpecVizSpaceWindow new
		owner: self;
		openWithSpec"
]

{ #category : #accessing }
CMSpecProjectWindow >> povClass [
	" Answer a <CMSpatial> class "
	
	^ self spaceModel povClass
]

{ #category : #accessing }
CMSpecProjectWindow >> projectAnnouncer [

	^ self projectManager announcer
]

{ #category : #private }
CMSpecProjectWindow >> quitApplicationWindow [
	" Part of the #quitApplicationHack "

	self quitSubApplicationWindows.
	super quitApplicationWindow.
]

{ #category : #private }
CMSpecProjectWindow >> quitSubApplicationWindows [
	" Private - Close all opened Cormas windows "
	
	World submorphs
		select: [ :sm | sm isCormasSubApplicationWindow ]
		thenDo: [ :w | w delete ].
	UIManager default defer: [ 
		"(Delay forSeconds: 1) wait."
		self projectAnnouncer subscriptions reset.
		CMApplicationProject allInstancesDo: #release.
		CMApplicationProject release. 
		3 timesRepeat: [ Smalltalk garbageCollect ] ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> runCormasTests [

	^ Cursor wait showWhile: [ 
		(SubunitRunner runAndCollectPackages: #('Cormas-Tests')) anyOne inspect ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> showSimulationWindow [

	self simWindow showSimInterface
]

{ #category : #accessing }
CMSpecProjectWindow >> simWindow [
	^ simWindow
]

{ #category : #accessing }
CMSpecProjectWindow >> simWindow: anObject [
	simWindow := anObject
]

{ #category : #accessing }
CMSpecProjectWindow >> spPresenter [
	" This is used while migrating to Spec2, which needs presenters with an owner with SpApplication linked "

	^ CMSpPresenter new
]

{ #category : #accessing }
CMSpecProjectWindow >> spaceModel [

	^ self cormasModel spaceModel.
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

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuDependenciesGraph: item [

	item
		name: self translator tPackageDepedenciesGraph;
		icon: (self iconNamed: #references);
		shortcut: $D command;
		action: [ self openDependenciesGraph ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuDependenciesTool: item [

	item
		name: self translator tPackageDepedenciesTool;
		icon: (self iconNamed: #smallWindow);
		shortcut: $D command;
		action: [ self openDependenciesTool ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuDevTools [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuDependenciesTool: item ];
				addItem: [ : item | self subMenuDependenciesGraph: item ];
				addItem: [ : item | self subMenuToolsBrowseBaseline: item ] ];			
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuToolsExpressions: item ];
				addItem: [ : item | self subMenuToolsCormasBrowser: item ];
				addItem: [ : item | self subMenuToolsBrowseFlags: item ];
				addItem: [ : item | self subMenuToolsBrowseHalts: item ];
				addItem: [ : item | self subMenuOpenCormasIssue: item ];
				addItem: [ : item | self subMenuRunCormasTests: item ] ]
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
				"addItem: [ :item | self subMenuToolsAddOns: item ];"
				addItem: [ :item | self subMenuToolsDeveloperTools: item ];
				addItem: [ :item | self subMenuToolsModelListing: item ];
				addItem: [ :item | self subMenuToolsModelGlossary: item ];
				addItem: [ :item | self subMenuToolsVersions: item ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | self subMenuToolsDistributeAsClient: item ];
				addItem: [ :item | self subMenuToolsDistributeAsServer: item ];
				addItem: [ :item | self subMenuToolsBrowseScoped: item ] ;
				addItem: [ :item | self subMenuToolsInspectUI: item ];
				addItem: [ :item | self subMenuToolsPreferences: item ] ]
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

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuOpenCormasIssue: item [

	item
		name: self translator tOpenCormasIssue;
		icon: (self iconNamed: #repair);
		shortcut: $I command;
		action: [ self openCormasIssue ]
]

{ #category : #'submenu-programming' }
CMSpecProjectWindow >> subMenuProgrammingEntityClass: item [

	item
		name: self translator tProgrammingEntityClass;
		icon: (self iconNamed: #smallHierarchyBrowser);
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
		name: self translator tMessagesProgramming;
		icon: (self iconNamed: #smallObjects);
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
		name: self translator tProbesProgramming;
		icon: (self iconNamed: #group);
		shortcut: $P command;
		action: [ self inform: 'shouldBeImplemented' ]
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
		icon: (self iconNamed: #openIcon);
		shortcut: $U command;
		action: [ OPProject openOnModel: (OPUMLPackage new name: self projectManager cormasModelName) ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuRunCormasTests: item [

	item
		name: self translator tRunCormasTests;
		icon: (self iconNamed: #testRunner);
		shortcut: $T command;
		action: [ self runCormasTests ]
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
		icon: (self iconNamed: #smallInspectIt);
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
		icon: (self iconNamed: #group);
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
		icon: (self iconNamed: #edit);
		shortcut: $S command;
		action: [ self openEditSteps ]		


]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimInformation: item [

	item
		name: self translator tSimInformation;
		icon: (self iconNamed: #smallInfo);
		shortcut: $F command;
		action: [ self openSimInformation ]
]

{ #category : #'submenu-simulation' }
CMSpecProjectWindow >> subMenuSimInterface: item [

	item
		name: self translator tSimInterface;
		icon: (self iconNamed: #window);
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

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsBrowseBaseline: item [

	item
		name: 'Browse CORMAS Baseline';
		icon: (self iconNamed: #smallHierarchyBrowser);
		shortcut: $P command;
		action: [ self openCormasBaselineBrowser ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsBrowseFlags: item [

	item
		name: 'CORMAS Methods with #flag:';
		icon: (self iconNamed: #flag);
		shortcut: $F command;
		action: [ self openCormasFlagMethods ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsBrowseHalts: item [

	item
		name: 'CORMAS Methods with #halt';
		icon: (self iconNamed: #halt);
		shortcut: $H command;
		action: [ self openCormasHaltMethods ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsBrowseScoped: item [

	item
		name: self translator tBrowseModel;
		icon: (self iconNamed: #class);
		shortcut: $K command;
		action: [ Smalltalk tools browserTool openOnPackage: (RPackage organizer packageOfClassNamed: self cormasModelClass name) ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsCormasBrowser: item [

	item
		name: self translator tCORMASBrowser;
		icon: (self iconNamed: #smallHierarchyBrowser);
		shortcut: $B command;
		action: [ self openCormasSystemBrowser ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsCreateInstances: item [

	item
		name: self translator tCreateInstances;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $C command;
		action: [ self openToolsCreateInstances ]
]

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsDeveloperTools: item [

	item
		name: self translator tDeveloperTools;
		icon: (self iconNamed: #smallExpert);
		shortcut: $D command;
		subMenu: self subMenuDevTools
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

{ #category : #'submenu-tools-developer' }
CMSpecProjectWindow >> subMenuToolsExpressions: item [

	item
		name: self translator tUsefulExpressions;
		icon: (self iconNamed: #workspace);
		shortcut: $P command;
		action: [ (Workspace openLabel: 'CORMAS - Useful expressions') contents: self cormasExpressions. ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsInspectUI: item [

	item
		name: self translator tInspectModel;
		icon: (self iconNamed: #smallObjects);
		shortcut: $I command;
		action: [ self cormasModel inspect ]
]

{ #category : #'submenu-tools' }
CMSpecProjectWindow >> subMenuToolsMain: item [

	item
		name: self translator tOpenPharoMenu;
		icon: (self iconNamed: #pharo);
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
CMSpecProjectWindow >> subMenuToolsPreferences: item [

	item
		name: self translator tPreferences;
		icon: (self iconNamed: #configuration);
		shortcut: $O command;
		action: [ CMSettingsBrowser open ]

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
		action: [ self openProbesInterface ]
]

{ #category : #'submenu-visualization' }
CMSpecProjectWindow >> subMenuVizSpace: item [

	item
		name: self translator tSpace;
"		icon: Smalltalk ui icons openIcon;"
		shortcut: $S command;
		action: [ self openSpacePresenter ]
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateSimulationWindow [
	" Open or update the receiver's simulation interface "
	
	self simWindow toggleSimInterface
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateUINewProject: aString [
	" Private - See superimplementor's comment "

	super updateUINewProject: aString.
	self 
		menuEnableProgrammingGroup;
		menuEnableSimulationGroup;
		menuEnableToolsGroup;
		menuEnableVisualizationGroup;
		menuEnableHelpGroup;
		updateSimulationWindow.
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateUIOpenedProject: aString [
	" Private - See superimplementor's comment "

	super updateUIOpenedProject: aString.
	self 
		menuEnableProgrammingGroup;
		menuEnableSimulationGroup;
		menuEnableToolsGroup;
		menuEnableVisualizationGroup;
		menuEnableHelpGroup;
		updateSimulationWindow
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateUIStateForClose: aString [
	" Private - See superimplementor's comment "

	super updateUIStateForClose: aString.
	self 
		menuDisableFileGroup;	
		menuDisableProgrammingGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableVisualizationGroup;	
		menuDisableHelpGroup;
		updateSimulationWindow;
		quitSubApplicationWindows.
]

{ #category : #callbacks }
CMSpecProjectWindow >> updateUIStateForInit [
	" Private - See superimplementor's comment "

	super updateUIStateForInit.
	self 
		menuDisableProgrammingGroup;
		menuDisableVisualizationGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableHelpGroup
]
