resources
createEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #createEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeCreateEntity)) #(1) nil) decodeAsLiteralArray