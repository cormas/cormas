resources
plusMinusMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #plusMinusMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: '-' 
		#value: #minus) #(MenuItem 
		#rawLabel: '+' 
		#value: #plus)) #(2) nil) decodeAsLiteralArray