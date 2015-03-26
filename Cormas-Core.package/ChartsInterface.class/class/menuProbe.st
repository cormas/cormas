resources
menuProbe
	"Tools.MenuEditor new openOnClass: self andSelector: #menuProbe"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #levels 
			#defaultString: 'changeColor') 
		#value: #changeProbeColor 
		#helpText: 'click to change probe color')) #(1) nil) decodeAsLiteralArray