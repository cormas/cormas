resources
fullMainMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #fullMainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'File' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'New' 
			#value: #newModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileNew)) #(MenuItem 
			#rawLabel: 'Load' 
			#value: #loadModelFromParcel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen)) #(MenuItem 
			#rawLabel: 'Save' 
			#value: #saveModelAsParcel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave)) #(MenuItem 
			#rawLabel: 'Package model' 
			#value: #launchPackagerForModelUser) #(MenuItem 
			#rawLabel: 'Convert' 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Load from ST' 
				#value: #loadSTModel 
				#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen)) #(MenuItem 
				#rawLabel: 'Save as ST' 
				#value: #exportModel 
				#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave))) #(2) nil)) #(MenuItem 
			#rawLabel: 'Close' 
			#value: #closeModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #delete)) #(MenuItem 
			#rawLabel: 'Re-Open' 
			#value: #openModel) #(MenuItem 
			#rawLabel: 'Exit' 
			#value: #requestForWindowClose 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #abort))) #(4 1 2 1) nil)) #(MenuItem 
		#rawLabel: 'Programming' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'the class for each Entity' 
			#value: #entities 
			#labelImage: #(ResourceRetriever Cormas #agentsEntities)) #(MenuItem 
			#rawLabel: 'the simulation organisation' 
			#labelImage: #(ResourceRetriever Cormas #controllerOrchestra) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'the initial instantiation' 
				#value: #openDefineSchedulerWinInit 
				#labelImage: #(ResourceRetriever Cormas #initImage) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'edit initialization' 
					#value: #openDefineSchedulerWinInit) #(MenuItem 
					#rawLabel: 'edit attributes' 
					#value: #modifySchedulerAttributes)) #(2) nil)) #(MenuItem 
				#rawLabel: 'the scheduler' 
				#value: #openDefineSchedulerWinControl 
				#labelImage: #(ResourceRetriever Cormas #schedulerIcon) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'edit steps' 
					#value: #openDefineSchedulerWinControl) #(MenuItem 
					#rawLabel: 'edit activity diagrams' 
					#value: #modifyScedulerDiagram)) #(2) nil))) #(1 1) nil)) #(MenuItem 
			#rawLabel: 'the observer' 
			#labelImage: #(ResourceRetriever Cormas #pointsOfViews) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Probes' 
				#value: #defineChartsObs 
				#labelImage: #(ResourceRetriever Cormas #probeImage)) #(MenuItem 
				#rawLabel: 'Messages' 
				#value: #defineCommunicationObs 
				#labelImage: #(ResourceRetriever Cormas #messageImage)) #(MenuItem 
				#rawLabel: 'Space and entities' 
				#value: #openPovSetterGUI 
				#labelImage: #(ResourceRetriever Cormas #defineEntityIcon))) #(1 1 1) nil))) #(1 1 1) nil)) #(MenuItem 
		#rawLabel: 'Visualisation' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Probes' 
			#value: #openCharts 
			#labelImage: #(ResourceRetriever Cormas #chartsIcon)) #(MenuItem 
			#rawLabel: 'Messages' 
			#value: #openVisuCommunications 
			#labelImage: #(ResourceRetriever Cormas #defineCommunicationIcon)) #(MenuItem 
			#rawLabel: 'Space' 
			#value: #openSpatialGrid 
			#labelImage: #(ResourceRetriever Cormas #defineSpaceIcon))) #(1 1 1) nil)) #(MenuItem 
		#rawLabel: 'Simulation' 
		#value: #openSimulationGUI 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Simulation Interface' 
			#value: #openSimulationGUI 
			#labelImage: #(ResourceRetriever Cormas #simIcon)) #(MenuItem 
			#rawLabel: 'Display Parameters' 
			#value: #openParamatersGUI 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #tableViewWidget)) #(MenuItem 
			#rawLabel: 'Analysis' 
			#labelImage: #(ResourceRetriever Cormas #analysisIcon) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Simple Stochastic Analysis' 
				#value: #openSimpleStochasticAnalysisGUI) #(MenuItem 
				#rawLabel: 'OAT Sensitivity Analysis' 
				#value: #openOATsensitivityGUI 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Sequential values' 
					#value: #openOATsensitivityGUI) #(MenuItem 
					#rawLabel: 'Predefined by list of values' 
					#value: #openDistributionListOATGUI) #(MenuItem 
					#rawLabel: 'Monte Carlo' 
					#value: #openRandomOATsensitivityGUI) #(MenuItem 
					#rawLabel: 'Classify parameters' 
					#value: #openOATclassifierGUI)) #(3 1) nil)) #(MenuItem 
				#rawLabel: 'Crossed Sensitivity Analysis' 
				#value: #openCrossedSensitivityGUI 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Sequential values' 
					#value: #openCrossedSensitivityGUI) #(MenuItem 
					#rawLabel: 'Predefined by list of values' 
					#value: #openDistributionListCrossedGUI)) #(2) nil))) #(3) nil))) #(2 1) nil)) #(MenuItem 
		#rawLabel: 'Tools' 
		#nameKey: #Tools 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Manipulate instances' 
			#value: #openManipulationGUI 
			#labelImage: #(ResourceRetriever SpaceInterface #manipulateIcon)) #(MenuItem 
			#rawLabel: 'Create instances' 
			#value: #openCreateInstances 
			#labelImage: #(ResourceRetriever SpaceInterface #createEntityIcon)) #(MenuItem 
			#rawLabel: 'Snapshot current state' 
			#value: #snapshotModel 
			#labelImage: #(ResourceRetriever Cormas #storeIcon) 
			#helpText: 'Store the current model state, that would be the initial state of futures simulations') #(MenuItem 
			#rawLabel: 'Add-ons' 
			#labelImage: #(ResourceRetriever Cormas #addOnIcon) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Add-On manager' 
				#value: #openAddOnManager) #(MenuItem 
				#rawLabel: 'How to...' 
				#value: #addOnHowTo)) #(2) nil)) #(MenuItem 
			#rawLabel: 'Model listing as text file' 
			#value: #entitiesListings 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #workspace)) #(MenuItem 
			#rawLabel: 'Model glossary' 
			#value: #openModelGlossary 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #extractMethod)) #(MenuItem 
			#rawLabel: 'Display model'' versions' 
			#value: #displayModelVersion 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #hierarchicalViewWidget)) #(MenuItem 
			#rawLabel: 'Distribute' 
			#value: #openDistributionControl 
			#labelImage: #(ResourceRetriever Cormas #distributeIcon) 
			#helpText: 'Distribute a simulation on several computers') #(MenuItem 
			#rawLabel: 'Use one browser window' 
			#nameKey: #useOnlyOneRB 
			#value: #changeSingleRBrowser 
			#indication: true) #(MenuItem 
			#rawLabel: 'Delay changes' 
			#nameKey: #isChangesDelayed 
			#value: #toggleDelayChanges 
			#indication: false 
			#helpText: 'The agents modifications are displayed at the end of the step')) #(3 4 1 2) nil)) #(MenuItem 
		#rawLabel: '?' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'About this model' 
			#value: #aboutThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #help)) #(MenuItem 
			#rawLabel: 'How to run this model' 
			#value: #howToRunThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #thought)) #(MenuItem 
			#rawLabel: 'Change model Comments' 
			#value: #setModelComments 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #edit)) #(MenuItem 
			#rawLabel: 'About Cormas' 
			#value: #aboutCormas 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #home)) #(MenuItem 
			#rawLabel: 'Cormas version' 
			#value: #displayCormasVersion 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #hierarchicalViewWidget)) #(MenuItem 
			#rawLabel: 'Cormas Glossary' 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #extractMethod) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'All' 
				#value: #openCormasGlossary) #(MenuItem 
				#rawLabel: 'Entity' 
				#value: #openCormasGlossary_Entity) #(MenuItem 
				#rawLabel: 'CormasModel' 
				#value: #openCormasGlossary_CormasModel) #(MenuItem 
				#rawLabel: 'Cormas' 
				#value: #openCormasGlossary_Cormas)) #(1 3) nil)) #(MenuItem 
			#rawLabel: 'Update Cormas' 
			#value: #updateCormas 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #refreshFolder) 
			#helpText: 'Update Cormas using the Parcel stored in VW/Cormas/') #(MenuItem 
			#rawLabel: 'Export Cormas' 
			#value: #exportCormas 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
			#helpText: 'Create a new kernel.st and a new Parcel') #(MenuItem 
			#rawLabel: 'Package Cormas' 
			#value: #launchPackagerForModeler)) #(3 3 3) nil))) #(5 1) nil)
		decodeAsLiteralArray