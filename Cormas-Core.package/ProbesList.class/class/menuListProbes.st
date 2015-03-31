resources
menuListProbes
	"Tools.MenuEditor new openOnClass: self andSelector: #menuListProbes"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #addx 
			#defaultString: 'Add...') 
		#nameKey: #addx 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #specificProbe 
				#defaultString: 'a specific probe') 
			#nameKey: #specificProbe 
			#value: #addProbe) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #probeOnAttributex 
				#defaultString: 'a probe on attribute...') 
			#nameKey: #probeOnAttributex) #(MenuItem 
			#rawLabel: 'a probe on population metrics' 
			#nameKey: #probeOnPopMetrics)) #(3) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Modify') 
		#nameKey: #modify 
		#value: #modifyProbe) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Delete') 
		#nameKey: #delete 
		#value: #deleteProbe)) #(3) nil) decodeAsLiteralArray