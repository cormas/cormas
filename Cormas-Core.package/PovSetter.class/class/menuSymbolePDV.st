resources
menuSymbolePDV
	"Tools.MenuEditor new openOnClass: self andSelector: #menuSymbolePDV"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add') 
		#value: #addSymbolPov) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#value: #removeSymbolPov)) #(2) nil) decodeAsLiteralArray