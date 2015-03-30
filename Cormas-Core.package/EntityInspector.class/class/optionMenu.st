resources
optionMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #optionMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Inspect &Entity..' 
		#nameKey: #changeEntity 
		#value: #changeEntity) #(MenuItem 
		#rawLabel: 'Inspect instance &id..' 
		#nameKey: #goToId 
		#value: #goToId) #(MenuItem 
		#rawLabel: '&Show inspected instance' 
		#nameKey: #show 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: '&No' 
			#nameKey: #showNo 
			#value: #showNo 
			#indication: true) #(MenuItem 
			#rawLabel: 'With &selection marks' 
			#nameKey: #showSelection 
			#value: #showSelection) #(MenuItem 
			#rawLabel: 'With specific &color' 
			#nameKey: #showColor 
			#value: #showColor 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Define color' 
				#nameKey: #chooseColor 
				#value: #chooseColor)) #(1) nil))) #(3) nil)) #(MenuItem 
		#rawLabel: 'Be the &only entity inspector' 
		#nameKey: #onlyInspector 
		#value: #onlyInspector)) #(4) nil) decodeAsLiteralArray