resources
mainMenu_old
	"Tools.MenuEditor new openOnClass: self andSelector: #mainMenu_old"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #file 
			#defaultString: 'file') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #new 
				#defaultString: 'Nouveau...') 
			#value: #newModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileNew)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #load 
				#defaultString: 'load...') 
			#value: #loadModelFromParcel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #fileOutModel 
				#defaultString: 'Save...') 
			#value: #saveModelAsParcel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #convert 
				#defaultString: 'Convert') 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #fileInModel 
					#defaultString: 'load from ST') 
				#value: #loadSTModel 
				#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen)) #(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #fileOutModelAsST 
					#defaultString: 'save as ST') 
				#value: #exportModel 
				#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave))) #(2) nil)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #close 
				#defaultString: 'Fermer') 
			#value: #closeModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #delete)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #re_open 
				#defaultString: 'Re-Open...') 
			#value: #openModel) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #exit 
				#defaultString: 'exit') 
			#value: #requestForWindowClose 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #abort))) #(3 1 2 1) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #program 
			#defaultString: 'Program...') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #entitiesClass 
				#defaultString: 'the class for each Entity') 
			#value: #entities 
			#labelImage: #(ResourceRetriever Cormas #agentsEntities)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #simulationOrganisation 
				#defaultString: 'l''organisation de la simulation') 
			#labelImage: #(ResourceRetriever Cormas #controller) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #initialInstanciation 
					#defaultString: 'the initial instanciation') 
				#value: #openDefineSchedulerWinInit 
				#labelImage: #(ResourceRetriever Cormas #initImage)) #(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #scheduler 
					#defaultString: 'the scheduler') 
				#value: #openDefineSchedulerWinControl 
				#labelImage: #(ResourceRetriever Cormas #scheduleImage))) #(1 1) nil)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #observer 
				#defaultString: 'the observer...') 
			#labelImage: #(ResourceRetriever Cormas #pointsOfViews) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #probes 
					#defaultString: ' of probes') 
				#value: #defineChartsObs 
				#labelImage: #(ResourceRetriever Cormas #probeImage)) #(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #Messages 
					#defaultString: 'Messages') 
				#value: #defineCommunicationObs 
				#labelImage: #(ResourceRetriever Cormas #messageImage)) #(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #spaceAndEntities 
					#defaultString: 'Space and entities') 
				#value: #openPovSetterGUI 
				#labelImage: #(ResourceRetriever Cormas #defineEntityIcon))) #(1 1 1) nil))) #(1 1 1) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #visualisation 
			#defaultString: 'Visualisation') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #probes 
				#defaultString: 'Probes') 
			#value: #openCharts 
			#labelImage: #(ResourceRetriever Cormas #chartsIcon)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #Messages 
				#defaultString: 'Messages') 
			#value: #openVisuCommunications 
			#labelImage: #(ResourceRetriever Cormas #defineCommunicationIcon)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #space 
				#defaultString: 'Space') 
			#value: #openSpatialGrid 
			#labelImage: #(ResourceRetriever Cormas #defineSpaceIcon))) #(1 1 1) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #openSimulationGUI 
			#defaultString: 'Simulation') 
		#value: #openSimulationGUI 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #seeParameters 
				#defaultString: 'Param√®tres...') 
			#value: #openParamatersGUI 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #tableViewWidget)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #interfaceSimulation 
				#defaultString: 'Interface Simulation') 
			#value: #openSimulationGUI 
			#labelImage: #(ResourceRetriever Cormas #simIcon))) #(2) nil)) #(MenuItem 
		#rawLabel: '?' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #aboutThisModel 
				#defaultString: 'About this model') 
			#value: #aboutThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #help)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #howToRunThisModel 
				#defaultString: 'How to run this model') 
			#value: #howToRunThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #thought)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #changeModelComments 
				#defaultString: 'Change Model Comments') 
			#value: #setModelComments 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #properties)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #entitiesListings 
				#defaultString: 'Entities listings') 
			#value: #entitiesListings 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #workspace)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #aboutCormas 
				#defaultString: 'aboutCormas') 
			#value: #aboutCormas 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #home)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #switchInterface 
				#defaultString: 'switchInterface') 
			#value: #switchInterface)) #(6) nil))) #(5) nil) decodeAsLiteralArray