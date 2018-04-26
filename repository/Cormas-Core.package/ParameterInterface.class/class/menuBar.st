resources
menuBar
	"Tools.MenuEditor new openOnClass: self andSelector: #menuBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'File' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Export attributs values' 
			#value: #exportAttributsValues)) #(1) nil)) #(MenuItem 
		#rawLabel: 'Settings' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Hide parameters...' 
			#value: #hideParameters) #(MenuItem 
			#rawLabel: 'Show all parameters' 
			#value: #showAllParameters) #(MenuItem 
			#rawLabel: 'Save current settings' 
			#value: #saveCurrentSettings)) #(3) nil))) #(2) nil)
		decodeAsLiteralArray