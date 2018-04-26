resources
percentMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #percentMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: '5 %' 
		#value: 5) #(MenuItem 
		#rawLabel: '10 %' 
		#value: 10) #(MenuItem 
		#rawLabel: '15 %' 
		#value: 15) #(MenuItem 
		#rawLabel: '20 %' 
		#value: 20)) #(4) nil) decodeAsLiteralArray