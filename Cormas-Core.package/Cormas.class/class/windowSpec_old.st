interface specs
windowSpec_old
	"UIPainter new openOnClass: self andSelector: #windowSpec_old"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'CORMAS' 
			#min: #(Point 394 423) 
			#max: #(Point 394 423) 
			#bounds: #(Rectangle 512 345 906 768) 
			#flags: 4 
			#menu: #mainMenu_old 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 139 56 256 147) 
				#model: #listSocialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySocialEntityClass) 
				#menu: #socialEntityMenu 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 166 33) 
				#label: #(UserMessage 
					#key: #sociales 
					#defaultString: 'sociales!!!') 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(Rectangle 4 3 390 222) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: #(UserMessage 
					#key: #modelisation 
					#defaultString: 'Modelisation!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 132 363 220 386) 
				#name: #run 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #run 
				#label: #(UserMessage 
					#key: #launch 
					#defaultString: 'Lancer!!!') 
				#isDefault: false 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 324 360 369 386) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #stepCounter 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 286 361) 
				#label: #(UserMessage 
					#key: #time 
					#defaultString: 'Current time-step')) #(ActionButtonSpec 
				#layout: #(Rectangle 115 247 155 286) 
				#model: #openSpatialGrid 
				#label: #defineSpaceIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 19 178 171 203) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #openDefineSchedulerWin 
				#label: #(UserMessage 
					#key: #preparecontrole 
					#defaultString: 'Preparer et Controler!!!') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 174 247 214 286) 
				#model: #openVisuCommunications 
				#label: #defineCommunicationIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 198 154 380 214) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #defineobservation 
					#defaultString: ' Definir l''observation...!!!')) #(InputFieldSpec 
				#layout: #(Rectangle 221 362 267 386) 
				#model: #cycle 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 56 362 126 386) 
				#name: #stepButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #runStepByStep 
				#label: #(UserMessage 
					#key: #step 
					#defaultString: 'Pas a pas') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 75 324 186 352) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #openScenarioBuilderWin 
				#label: #(UserMessage 
					#key: #initialiser 
					#defaultString: 'Initialiser...') 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 10 21 383 154) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #defineentities 
					#defaultString: 'Definir les entites !!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 233 246 271 286) 
				#model: #openCharts 
				#label: #chartsIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 11 154 180 214) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #controletheevolution 
					#defaultString: 'Controler l''evolution!!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 133 362 220 386) 
				#name: #runSimulation 
				#flags: 24 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #runSimulation 
				#label: #(UserMessage 
					#key: #ntimes 
					#defaultString: 'Lancer N fois') 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 15 300 381 396) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: #(UserMessage 
					#key: #cormasModel 
					#defaultString: 'Simulation')) #(MenuButtonSpec 
				#layout: #(Rectangle 212 179 366 203) 
				#model: #defineObservation 
				#menu: #defineObsMenu) #(SequenceViewSpec 
				#layout: #(Rectangle 17 56 134 147) 
				#model: #listSpatialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySpatialEntityClass) 
				#menu: #spatialEntityMenu 
				#style: #pixelLarge) #(SequenceViewSpec 
				#layout: #(Rectangle 260 56 377 147) 
				#model: #listPassiveEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPassiveEntityClass) 
				#menu: #passiveEntityMenu 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 40 33) 
				#label: #(UserMessage 
					#key: #spatiales 
					#defaultString: 'spatiales!!!') 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 282 33) 
				#label: #(UserMessage 
					#key: #passives 
					#defaultString: 'passives!!!') 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(Rectangle 88 225 292 294) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'Visualisation') #(LabelSpec 
				#layout: #(Point 247 328) 
				#name: #Label1 
				#label: 'simulation') #(InputFieldSpec 
				#layout: #(Rectangle 310 325 369 351) 
				#name: #InputField1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #displaySimNumber 
				#alignment: #right 
				#isReadOnly: true))))