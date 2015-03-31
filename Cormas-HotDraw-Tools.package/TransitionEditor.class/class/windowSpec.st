interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Transition Editor' 
			#bounds: #(Rectangle 840 552 1206 809) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(MenuButtonSpec 
				#layout: #(LayoutFrame 50 0 5 0 -5 1 35 0) 
				#name: #event 
				#model: #eventType 
				#menu: #eventMenu) #(LabelSpec 
				#layout: #(Point 5 10) 
				#label: 'Event:') #(DividerSpec 
				#layout: #(LayoutFrame 0 0 40 0 0 1 42 0)) #(RadioButtonSpec 
				#layout: #(Point 5 50) 
				#name: #always 
				#model: #transition 
				#label: 'Always' 
				#select: #always) #(RadioButtonSpec 
				#layout: #(Point 5 80) 
				#name: #figure 
				#model: #transition 
				#label: 'Figure' 
				#select: #figure) #(RadioButtonSpec 
				#layout: #(Point 5 110) 
				#name: #character 
				#model: #transition 
				#label: 'Character' 
				#select: #character) #(SequenceViewSpec 
				#layout: #(LayoutFrame 100 0 49 0 0 0.986339 -51 1) 
				#name: #figureList 
				#flags: 61 
				#model: #figureList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(AlignmentOrigin 0 0.666666 -5 1 0.5 1) 
				#name: #cancel 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(AlignmentOrigin 0 0.333333 -5 1 0.5 1) 
				#name: #accept 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 175 0 -95 1 -5 1 -65 1) 
				#name: #characters 
				#flags: 56 
				#model: #charactersHolder) #(LabelSpec 
				#layout: #(LayoutOrigin 100 0 -90 1) 
				#name: #label 
				#flags: 48 
				#label: 'Characters:') #(SequenceViewSpec 
				#layout: #(LayoutFrame 100 0 50 0 -5 1 -100 1) 
				#name: #characterList 
				#flags: 61 
				#model: #characterList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(RadioButtonSpec 
				#layout: #(Point 5 143) 
				#name: #toolCondition 
				#model: #transition 
				#label: 'Tool condition' 
				#select: #toolCondition) #(SequenceViewSpec 
				#layout: #(Rectangle 100 81 205 157) 
				#name: #conditionList 
				#flags: 61 
				#model: #conditionList 
				#multipleSelections: false 
				#useModifierKeys: true 
				#selectionType: #highlight))))