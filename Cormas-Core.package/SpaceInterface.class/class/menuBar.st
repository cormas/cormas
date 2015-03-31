resources
menuBar
	"Tools.MenuEditor new openOnClass: self andSelector: #menuBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Environment' 
		#nameKey: #environment 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'New' 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileNew) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Grid size' 
				#nameKey: #gridsize 
				#value: #openWindowGridSize 
				#helpText: 'Create a new regular grid')) #(1) nil)) #(MenuItem 
			#rawLabel: 'Load' 
			#nameKey: #load 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileOpen) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Regular Tesselation' 
				#nameKey: #spatialGridType 
				#labelImage: #(ResourceRetriever SpaceInterface #iconSquare) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'asc type' 
					#nameKey: #loadASC 
					#value: #loadASC) #(MenuItem 
					#rawLabel: 'env type' 
					#nameKey: #loadGrid 
					#value: #loadGrid)) #(2) nil)) #(MenuItem 
				#rawLabel: 'Irregular Tesselation' 
				#nameKey: #irregularSpatialGrid 
				#value: #subMenuTesselationIrr 
				#labelImage: #(ResourceRetriever SpaceInterface #iconIrregular) 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'MIF/MID Files' 
					#nameKey: #openWindowMifMid 
					#value: #openWindowMifMid)) #(1) nil))) #(2) nil)) #(MenuItem 
			#rawLabel: 'Save' 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Asc type' 
				#nameKey: #saveASC 
				#value: #saveASC) #(MenuItem 
				#rawLabel: 'Env type' 
				#nameKey: #saveGrid 
				#value: #saveGrid) #(MenuItem 
				#rawLabel: 'MIF/MID type' 
				#nameKey: #saveMIFMID 
				#value: #saveMIFMID) #(MenuItem 
				#rawLabel: 'Rst/Rdc type' 
				#nameKey: #saveRSTRDC 
				#value: #saveRSTRDC)) #(4) nil)) #(MenuItem 
			#rawLabel: 'Modify' 
			#nameKey: #modify 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Cell shape' 
				#nameKey: #cellshape 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Square' 
					#nameKey: #square 
					#value: #squared 
					#indication: true 
					#labelImage: #(ResourceRetriever SpaceInterface #iconSquare) 
					#submenu: #(Menu #(#(MenuItem 
						#rawLabel: '4-Connexe' 
						#nameKey: #fourconnexe 
						#value: #fourconnexe 
						#indication: true) #(MenuItem 
						#rawLabel: #(UserMessage 
							#key: #eightconnexe 
							#defaultString: '8-Connexe') 
						#nameKey: #eightconnexe 
						#value: #eightconnexe 
						#indication: false)) #(2) nil)) #(MenuItem 
					#rawLabel: 'Hexagonal' 
					#nameKey: #hexagonal 
					#value: #hexagonal 
					#indication: false 
					#labelImage: #(ResourceRetriever SpaceInterface #iconHexagon)) #(MenuItem 
					#rawLabel: 'Irregular' 
					#nameKey: #irregular 
					#value: #notYiet 
					#indication: false 
					#labelImage: #(ResourceRetriever SpaceInterface #iconIrregular))) #(3) nil)) #(MenuItem 
				#rawLabel: 'Grid boundaries' 
				#nameKey: #gridboundaries 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: 'Torroidal' 
					#nameKey: #torroidal 
					#value: #torroidal) #(MenuItem 
					#rawLabel: 'Closed' 
					#nameKey: #closed 
					#value: #closed)) #(2) nil))) #(2) nil)) #(MenuItem 
			#rawLabel: 'Re-Open' 
			#value: #reopen) #(MenuItem 
			#rawLabel: 'Close' 
			#value: #closeRequest 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #abort))) #(3 2 1) nil)) #(MenuItem 
		#rawLabel: 'PoV' 
		#nameKey: #pov 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'bidon' 
			#nameKey: #bidon)) #(1) nil) 
		#helpText: 'Point of View') #(MenuItem 
		#rawLabel: 'Display' 
		#nameKey: #display 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'info' 
			#nameKey: #info 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'bidon' 
				#nameKey: #bidon)) #(1) nil)) #(MenuItem 
			#rawLabel: 'track' 
			#nameKey: #trackAgents 
			#indication: false) #(MenuItem 
			#rawLabel: 'Spatial delimitor' 
			#nameKey: #celldelimitation 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #size 
					#defaultString: 'Size:') 
				#nameKey: #sizeLimitation 
				#submenu: #(Menu #(#(MenuItem 
					#rawLabel: '0 pixel' 
					#nameKey: #pixel0 
					#value: #pixel0 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '1 pixel' 
					#nameKey: #pixel1 
					#value: #pixel1 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '2 pixels' 
					#nameKey: #pixel2 
					#value: #pixel2 
					#indication: true 
					#indicationSelector: #delimiterSize) #(MenuItem 
					#rawLabel: '3 pixels' 
					#nameKey: #pixel3 
					#value: #pixel3 
					#indication: true 
					#indicationSelector: #delimiterSize)) #(4) nil) 
				#helpText: 'Set the size of the cells'' delimitors') #(MenuItem 
				#rawLabel: 'Color' 
				#value: #selectColor 
				#helpText: 'Set the color of the cells'' delimitors')) #(2) nil)) #(MenuItem 
			#rawLabel: 'Time' 
			#nameKey: #time 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: #(UserMessage 
					#key: #displayTimeTitle 
					#defaultString: 'Display time in the title') 
				#nameKey: #timeTitle 
				#value: #displayTimeTitle 
				#indication: true) #(MenuItem 
				#rawLabel: 'Display time on the interface' 
				#nameKey: #timeField 
				#value: #displayTimeField 
				#indication: true)) #(2) nil) 
			#helpText: 'Display the current time step') #(MenuItem 
			#rawLabel: 'BackGround' 
			#value: #setBackGround 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Change background color' 
				#value: #setBackGroundColor)) #(1) nil))) #(2 3) nil)) #(MenuItem 
		#rawLabel: 'Tools' 
		#nameKey: #tools 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Display legends' 
			#nameKey: #activateLegend 
			#value: #activateLegend) #(MenuItem 
			#rawLabel: 'Photo' 
			#nameKey: #photo 
			#value: #photo) #(MenuItem 
			#rawLabel: 'Video' 
			#nameKey: #video 
			#value: #video) #(MenuItem 
			#rawLabel: 'Manipulate instances' 
			#value: #openManipInstances) #(MenuItem 
			#rawLabel: 'Create instances' 
			#value: #openCreateInstances) #(MenuItem 
			#rawLabel: 'Click to...' 
			#nameKey: #clicTo 
			#value: #clicTo 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Change attribute...' 
				#nameKey: #clicToChange 
				#value: #clicToChange) #(MenuItem 
				#rawLabel: 'Inspect' 
				#value: #clicToInspect)) #(2) nil)) #(MenuItem 
			#rawLabel: 'Habitus' 
			#value: #openSIconfig)) #(7) nil)) #(MenuItem 
		#rawLabel: 'Option' 
		#nameKey: #option 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Unmoveable zoom' 
			#nameKey: #unmoveableZoom 
			#value: #unmoveableZoom 
			#indication: true 
			#helpText: 'The zoom you will open will be static') #(MenuItem 
			#rawLabel: 'Moveable zoom' 
			#nameKey: #moveableZoom 
			#value: #moveableZoom 
			#indication: false 
			#helpText: 'The zoom you will open will be moveable') #(MenuItem 
			#rawLabel: 'Set track length' 
			#nameKey: #setTrackLength 
			#value: #setTrackLength) #(MenuItem 
			#rawLabel: 'Enable Undo/Redo' 
			#nameKey: #enableUndoOption 
			#value: #enableUndoOption 
			#indication: true 
			#helpText: 'Display or hide the Undo/Redo buttons') #(MenuItem 
			#rawLabel: 'Touchpad manipulate mode' 
			#nameKey: #isManipulateForTabletEnabled 
			#value: #toggleManipulateForTablet 
			#indication: false 
			#helpText: 'Clicking for manipulation adapated to touchpad')) #(2 2 1) nil)) #(MenuItem 
		#rawLabel: '?' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #aboutThisModel 
				#defaultString: 'About this model') 
			#value: #aboutThisModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #help)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #inspectModel 
				#defaultString: 'inspect model') 
			#value: #inspectModel 
			#labelImage: #(ResourceRetriever ToolbarIconLibrary #debugIt))) #(2) nil))) #(6) nil)
		decodeAsLiteralArray