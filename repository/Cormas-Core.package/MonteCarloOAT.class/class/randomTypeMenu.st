resources
randomTypeMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #randomTypeMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #asciiFile 
			#defaultString: 'CSV file') 
		#value: #csv) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #excelFile 
			#defaultString: 'Excel file') 
		#value: #excel) #(MenuItem 
		#rawLabel: 'MSAccess' 
		#value: #access)) #(3) nil) decodeAsLiteralArray