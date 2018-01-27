resources
manipMethodsMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #manipEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeManipMethod)) #(1) nil) decodeAsLiteralArray