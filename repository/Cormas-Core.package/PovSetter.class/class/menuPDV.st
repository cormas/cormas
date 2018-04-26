resources
menuPDV
	"Tools.MenuEditor new openOnClass: self andSelector: #menuPDV"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add...') 
		#nameKey: #addx 
		#value: #addPov) #(MenuItem 
		#rawLabel: 'Add Pov on attribute' 
		#value: #addPovOnAttribute) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Modify...') 
		#value: #modifyPov) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Delete') 
		#value: #removePov)) #(3 1) nil) decodeAsLiteralArray