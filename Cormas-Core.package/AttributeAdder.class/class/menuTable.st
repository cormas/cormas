resources
menuTable
	"Tools.MenuEditor new openOnClass: self andSelector: #menuTable"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove attribute' 
		#value: #removeAttribute) #(MenuItem 
		#rawLabel: 'rename attribute' 
		#value: #renameAttribute) #(MenuItem 
		#rawLabel: 'notify observers when changed' 
		#value: #setChanged)) #(3) nil) decodeAsLiteralArray