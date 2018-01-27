interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Cormas Launcher' 
			#min: #(Point 185 126) 
			#max: #(Point 185 126) 
			#bounds: #(Rectangle 640 427 825 553)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 106 84 143 113) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #launchCormasInFrench 
				#helpText: 'Ouvrir Cormas en Francais' 
				#label: #cormasFr 
				#hasCharacterOrientedLabel: false 
				#style: #small) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 106 42 143 71) 
				#name: #ActionButton2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #launchCormasInEnglish 
				#helpText: 'Open Cormas in English' 
				#label: #cormasEn 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 8 2) 
				#name: #Label1 
				#label: 'Open Cormas' 
				#style: #large) #(LabelSpec 
				#layout: #(Point 19 47) 
				#name: #Label2 
				#label: 'in English') #(LabelSpec 
				#layout: #(Point 19 89) 
				#name: #Label3 
				#label: 'en Francais'))))