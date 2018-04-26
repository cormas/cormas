resources
mainMenu
	"MenuEditor new openOnClass: self andSelector: #mainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #settings 
			#defaultString: 'Settings') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #changeParameters 
				#defaultString: 'Change parameters') 
			#value: #actionOpenParametres) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #graphicRepresentation 
				#defaultString: 'Graphic representation') 
			#value: #actionOpenPreferences)) #(2) nil)) #(MenuItem 
		#rawLabel: 'Actions' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Circle position' 
			#value: #actionCircle) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #randomPositions 
				#defaultString: 'Random positions') 
			#value: #actionDistribuer) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #updateGraph 
				#defaultString: 'Update graph') 
			#value: #actionGo)) #(3) nil))) #(2) nil) decodeAsLiteralArray