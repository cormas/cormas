resources
manipEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #manipEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeManipEntity)) #(1) nil) decodeAsLiteralArray