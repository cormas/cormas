resources
menuGroupesOSObservationSimulation
	"Tools.MenuEditor new openOnClass: self andSelector: #menuGroupesOSObservationSimulation"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add') 
		#value: #groupeOSVisible) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #extract 
			#defaultString: 'Remove') 
		#value: #groupeOSInvisible)) #(2) nil) decodeAsLiteralArray