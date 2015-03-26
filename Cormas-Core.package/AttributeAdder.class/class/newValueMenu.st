resources
newValueMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #newValueMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'new default value' 
		#value: #newRandomValue)) #(1) nil) decodeAsLiteralArray