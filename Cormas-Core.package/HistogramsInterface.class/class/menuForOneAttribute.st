resources
menuForOneAttribute
	"Tools.MenuEditor new openOnClass: self andSelector: #menuForOneAttribute"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
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
				#indicationSelector: #yUnit)) #(2) nil)) #(MenuItem 
			#rawLabel: 'refresh each step' 
			#nameKey: #refreshEachStep 
			#value: #refreshEachStepOption)) #(3) nil))) #(1) nil)
		decodeAsLiteralArray