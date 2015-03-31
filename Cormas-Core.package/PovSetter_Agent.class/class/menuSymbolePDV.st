resources
menuSymbolePDV
	"Tools.MenuEditor new openOnClass: self andSelector: #menuSymbolePDV"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add') 
		#value: #addSymbolPov) #(MenuItem 
		#rawLabel: 'Add - same shape as' 
		#nameKey: #addSymbolSameAs 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'bidon' 
			#nameKey: #bidon)) #(1) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#value: #removeSymbolPov) #(MenuItem 
		#rawLabel: 'Set as default symbol shape' 
		#value: #setSymbolAsDefaultImage) #(MenuItem 
		#rawLabel: 'Set entity default color' 
		#nameKey: #setDefaultColor 
		#value: #setDefaultColor)) #(5) nil) decodeAsLiteralArray