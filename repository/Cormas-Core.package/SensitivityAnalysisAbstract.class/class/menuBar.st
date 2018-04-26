resources
menuBar
	"Tools.MenuEditor new openOnClass: self andSelector: #menuBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'File' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Save analysis settings' 
			#value: #chooseAndSaveSettings) #(MenuItem 
			#rawLabel: 'Load analysis settings' 
			#value: #loadAnalysisSettings)) #(2) nil)) #(MenuItem 
		#rawLabel: 'help' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Purpose' 
			#value: #mainHelp)) #(1) nil))) #(2) nil) decodeAsLiteralArray