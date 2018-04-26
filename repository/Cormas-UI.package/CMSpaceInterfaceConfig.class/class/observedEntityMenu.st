resources
observedEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #observedEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeObservedEntity)) #(1) nil) decodeAsLiteralArray