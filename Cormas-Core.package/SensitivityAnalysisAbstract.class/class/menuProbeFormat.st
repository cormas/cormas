resources
menuProbeFormat
	"Tools.MenuEditor new openOnClass: self andSelector: #menuProbeFormat"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #asciiFile 
			#defaultString: 'help') 
		#value: #help)) #(1) nil) decodeAsLiteralArray