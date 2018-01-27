resources
povMethodsMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #povMethodsMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removePovMethod) #(MenuItem 
		#rawLabel: 'set as default' 
		#value: #setSelectionAsDefaultPov) #(MenuItem 
		#rawLabel: 'no default pov' 
		#value: #cancelDefaultPov)) #(2 1) nil) decodeAsLiteralArray