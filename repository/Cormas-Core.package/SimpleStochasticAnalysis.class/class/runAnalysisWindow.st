interface specs
runAnalysisWindow
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Stochastic Sensitivity Analysis Control' 
			#min: #(Point 551 165) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1418 615) 
			#flags: 8) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle 495 112 565 151) 
				#name: #Region2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(LabelSpec 
				#layout: #(Point 43 25) 
				#name: #Label8 
				#label: 'Current simulation:') #(LabelSpec 
				#layout: #(Point 43 66) 
				#name: #Label3 
				#label: 'Overal analysis:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 503 116 556 146) 
				#name: #runButton 
				#model: #runAnalysis 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 415 119) 
				#name: #Label4 
				#label: 'Run analysis') #(InputFieldSpec 
				#layout: #(Rectangle 575.25 65 666.75 89) 
				#name: #InputField3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #displaySimNumber 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 595 47) 
				#name: #Label1 
				#label: 'Simulation') #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 28 563 43) 
				#name: #PercentDoneBar3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 8191 8191)) 
				#model: #simProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 69 563 84) 
				#name: #PercentDoneBar1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 8191 7167 7167)) 
				#model: #analysisProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(LabelSpec 
				#layout: #(Point 597 5) 
				#name: #Label5 
				#label: 'final step') #(InputFieldSpec 
				#layout: #(Rectangle 594.5 23 647.5 47) 
				#name: #InputField1 
				#model: #finalStep 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 45 116) 
				#name: #Label2 
				#label: 'Set the folder') #(LabelSpec 
				#layout: #(Point 45 131) 
				#name: #Label6 
				#label: 'for output files:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 133 118 185 148) 
				#name: #ActionButton3 
				#model: #prepareFiles 
				#label: #directoryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 16 -2 680 97) 
				#name: #GroupBox2 
				#label: 'Analysing'))))