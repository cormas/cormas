interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #SelectColor 
				#defaultString: 'Select Color' 
				#catalogID: #labels) 
			#min: #(Point 545 236) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1265 686)) 
		#component: #(SpecCollection 
			#collection: #(#(CompositeSpecCollection 
				#collection: #() 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 470 151 536 175) 
					#name: #theActualColor 
					#colors: #(LookPreferences))) #(RegionSpec 
				#layout: #(Rectangle 470 151 536 175) 
				#lineWidth: 1) #(SliderSpec 
				#layout: #(Rectangle 162 9 183 175) 
				#model: #sliderModel 
				#orientation: #vertical) #(LabelSpec 
				#layout: #(Point 473 131) 
				#label: #(UserMessage 
					#key: #V 
					#defaultString: 'V' 
					#catalogID: #labels)) #(LabelSpec 
				#layout: #(Point 520 131) 
				#name: #hueLabel 
				#label: #(UserMessage 
					#key: #H 
					#defaultString: 'H' 
					#catalogID: #labels)) #(CompositeSpecCollection 
				#collection: #() 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 188 8 458 176) 
					#name: #colorSpace 
					#flags: 8 
					#isOpaque: true)) #(SliderSpec 
				#layout: #(Rectangle 516 9 538 133) 
				#name: #hue 
				#model: #hue 
				#orientation: #vertical 
				#start: 0.999 
				#stop: 0 
				#step: -0.001) #(SliderSpec 
				#layout: #(Rectangle 468 9 490 133) 
				#model: #brightness 
				#orientation: #vertical 
				#start: 1.0 
				#stop: 0.0 
				#step: -0.001) #(SliderSpec 
				#layout: #(Rectangle 492 9 514 133) 
				#name: #saturation 
				#model: #saturation 
				#orientation: #vertical 
				#start: 1.0 
				#stop: 0.0 
				#step: -0.001) #(LabelSpec 
				#layout: #(Point 497 131) 
				#name: #saturationLabel 
				#label: #(UserMessage 
					#key: #S 
					#defaultString: 'S' 
					#catalogID: #labels)) #(ActionButtonSpec 
				#layout: #(Rectangle 290 202 361 232) 
				#name: #setColor 
				#model: #setColor 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Apply' 
					#catalogID: #labels) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 389 202 463 232) 
				#name: #applyButton 
				#model: #accept 
				#tabable: false 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'Close' 
					#catalogID: #labels) 
				#isDefault: true) #(SequenceViewSpec 
				#layout: #(Rectangle 8 10 151 229) 
				#name: #ListElements 
				#model: #listElements 
				#useModifierKeys: true 
				#selectionType: #highlight))))