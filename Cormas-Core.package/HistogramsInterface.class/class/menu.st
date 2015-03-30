resources
menu
	"Tools.MenuEditor new openOnClass: self andSelector: #menu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Menu' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'open new window' 
			#value: #openNew)) #(1) nil)) #(MenuItem 
		#rawLabel: 'Options' 
		#nameKey: #options 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Change classes' 
			#value: #openClassesSettingWindow) #(MenuItem 
			#rawLabel: 'Y unit' 
			#nameKey: #yunit 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'occurence' 
				#nameKey: #yunitOccurence 
				#value: #beYunitOccurence 
				#indicationSelector: #yUnit) #(MenuItem 
				#rawLabel: 'percentage' 
				#nameKey: #yunitPerc 
				#value: #beYunitPerc 
				#indicationSelector: #yUnit)) #(2) nil))) #(2) nil))) #(2) nil)
		decodeAsLiteralArray