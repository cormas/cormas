resources
modelUserMainMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #modelUserMainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'File' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Exit' 
			#value: #requestForWindowClose 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #abort))) #(1) nil)) #(MenuItem 
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
			#rawLabel: 'Model listing as text file' 
			#value: #entitiesListings 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #workspace)) #(MenuItem 
			#rawLabel: 'Display model'' versions' 
			#value: #displayModelVersion 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #hierarchicalViewWidget)) #(MenuItem 
			#rawLabel: 'Distribute' 
			#value: #openDistributionControl) #(MenuItem 
			#rawLabel: 'Delay changes' 
			#nameKey: #isChangesDelayed 
			#value: #toggleDelayChanges)) #(2 2 1 1) nil)) #(MenuItem 
		#rawLabel: '?' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'About this model' 
			#value: #aboutThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #help)) #(MenuItem 
			#rawLabel: 'How to run this model' 
			#value: #howToRunThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #thought)) #(MenuItem 
			#rawLabel: 'About Cormas' 
			#value: #aboutCormas 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #home)) #(MenuItem 
			#rawLabel: 'Cormas version' 
			#value: #displayCormasVersion 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #hierarchicalViewWidget))) #(2 2) nil))) #(4 1) nil)
		decodeAsLiteralArray