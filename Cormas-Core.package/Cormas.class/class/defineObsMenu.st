resources
defineObsMenu
	"MenuEditor new openOnClass: self andSelector: #defineObsMenu"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #ofthespace 
			#defaultString: 'Space') 
		#value: #openPovSetterGUI) #(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #ofthecommunication 
			#defaultString: 'Communication') 
		#value: #defineCommunicationObs) #(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #probes 
			#defaultString: 'Probes') 
		#value: #defineChartsObs)) #(3) nil) decodeAsLiteralArray