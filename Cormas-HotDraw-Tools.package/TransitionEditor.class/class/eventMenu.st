resources
eventMenu
	"MenuEditor new openOnClass: self andSelector: #eventMenu"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: 'mouseMove' 
		#value: #mouseMove) #(#MenuItem 
		#rawLabel: 'redButtonPress' 
		#value: #redButtonPress) #(#MenuItem 
		#rawLabel: 'redButtonRelease' 
		#value: #redButtonRelease) #(#MenuItem 
		#rawLabel: 'keyPress' 
		#value: #keyPress) #(#MenuItem 
		#rawLabel: 'keyRelease' 
		#value: #keyRelease) #(#MenuItem 
		#rawLabel: 'doubleClick' 
		#value: #doubleClick) #(#MenuItem 
		#rawLabel: 'yellowButtonPress' 
		#value: #yellowButtonPress) #(#MenuItem 
		#rawLabel: 'yellowButtonRelease' 
		#value: #yellowButtonRelease) #(#MenuItem 
		#rawLabel: 'immediate' 
		#nameKey: #immediate 
		#value: #immediate)) #(1 2 2 1 2 1) nil) decodeAsLiteralArray