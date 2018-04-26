resources
menuChartsLevel
	"Tools.MenuEditor new openOnClass: self andSelector: #menuChartsLevel"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #levels 
			#defaultString: 'Level') 
		#nameKey: #level 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #global 
				#defaultString: 'Global') 
			#nameKey: #global 
			#value: #setGlobalChartsList) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #local 
				#defaultString: 'Local') 
			#nameKey: #local 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: ' ')) #(1) nil))) #(2) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #save 
			#defaultString: 'Save') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'duplicate this windows' 
			#value: #duplicate) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #asciiFile 
				#defaultString: 'Ascii file') 
			#value: #saveInAscii) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #excelFile 
				#defaultString: 'Excel file') 
			#value: #saveInExcel)) #(3) nil)) #(MenuItem 
		#rawLabel: 'Option' 
		#nameKey: #Option 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'display sim. information' 
			#value: #displaySimInformation) #(MenuItem 
			#rawLabel: 'displayMarkers' 
			#nameKey: #displayMarkers 
			#value: #displayMarkersOption 
			#indication: true 
			#indicationSelector: #displayMarkers 
			#helpText: 'display point markers on the curves') #(MenuItem 
			#rawLabel: 'change line color...' 
			#value: #changeProbeColor) #(MenuItem 
			#rawLabel: 'scale to min and max' 
			#nameKey: #autoScale 
			#value: #autoScaleOption 
			#indication: true 
			#indicationSelector: #autoScale 
			#helpText: 'adapt the Y axis at the minimum value') #(MenuItem 
			#rawLabel: 'display legend' 
			#nameKey: #displayLegend 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'top_right' 
				#nameKey: #top_right 
				#value: #displayLegendOption_top_right 
				#indication: true) #(MenuItem 
				#rawLabel: 'top_left' 
				#nameKey: #top_left 
				#value: #displayLegendOption_top_left) #(MenuItem 
				#rawLabel: 'bottom_right' 
				#nameKey: #bottom_right 
				#value: #displayLegendOption_bottom_right) #(MenuItem 
				#rawLabel: 'bottom_left' 
				#nameKey: #bottom_left 
				#value: #displayLegendOption_bottom_left) #(MenuItem 
				#rawLabel: 'hide' 
				#nameKey: #hide 
				#value: #displayLegendOption_hide)) #(4 1) nil)) #(MenuItem 
			#rawLabel: 'display values' 
			#nameKey: #displayValues 
			#value: #displayValuesOption 
			#indication: false) #(MenuItem 
			#rawLabel: 'start from step 0' 
			#nameKey: #startAt0 
			#value: #startAt0Option 
			#indication: true)) #(7) nil))) #(3) nil) decodeAsLiteralArray