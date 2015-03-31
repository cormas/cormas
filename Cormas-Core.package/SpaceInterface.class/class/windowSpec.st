interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #space 
				#defaultString: 'space') 
			#min: #(Point 10 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 531 1062 874) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(InputFieldSpec 
				#layout: #(LayoutFrame 0 0.333333 4 0 0 0.666666 26 0) 
				#name: #configName 
				#flags: 0 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#model: #configName 
				#tabable: false 
				#isReadOnly: true 
				#type: #text) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -142 1.0 3 0 24 22) 
				#name: #undoButton 
				#model: #undo 
				#tabable: false 
				#helpText: 'Cancel the last manipulation from user' 
				#label: #undoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -117 1.0 3 0 24 22) 
				#name: #redoButton 
				#model: #redo 
				#tabable: false 
				#helpText: 'Redo the last undo from user' 
				#label: #redoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutSizedOrigin 40 0 1 0 48 21) 
					#name: #timeUnitName 
					#flags: 0 
					#isOpaque: true 
					#model: #timeUnitName 
					#isReadOnly: true) #(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 41 0 22 0) 
					#name: #timeField 
					#model: #timeField 
					#isReadOnly: true 
					#type: #number 
					#formatString: '0')) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutSizedOrigin -90 1.0 3 0 88 22) 
					#name: #Composite1)))))