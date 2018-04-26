resources
infoMethodsMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #infoMethodsMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeInfoMethod) #(MenuItem 
		#rawLabel: 'set as default' 
		#value: #setSelectionAsDefaultInfo) #(MenuItem 
		#rawLabel: 'no default info' 
		#value: #cancelDefaultInfo)) #(2 1) nil) decodeAsLiteralArray