Class {
	#name : #ActivityModel,
	#superclass : #AbstractActivityModel,
	#category : 'Cormas-Core-Tools'
}

{ #category : #'interface specs' }
ActivityModel class >> setterWindows [
	"Tools.UIPainter new openOnClass: self andSelector: #setterWindows"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Activity setter' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 729 662 1156 881) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 6655 5119)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 201 29 416 52) 
				#name: #InputFieldActivity 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7167 6143)) 
				#model: #selectedActivity 
				#helpText: 'Right click to display the code' 
				#menu: #menuInspect) #(SequenceViewSpec 
				#layout: #(Rectangle 8 7 186 215) 
				#name: #List1 
				#model: #listActivity 
				#helpText: 'Choose a method' 
				#menu: #menuInspect 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(Rectangle 283 193 341 216) 
				#name: #ActionButton1 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 201 8) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Activity:') #(TextEditorSpec 
				#layout: #(Rectangle 199 76 416 183) 
				#name: #purposeEditor 
				#flags: 5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #purpose 
				#helpText: 'Right click to display the code' 
				#menu: #menuInspect 
				#style: #small 
				#tabRequiresControl: true) #(GroupBoxSpec 
				#layout: #(Rectangle 195 57 420 191) 
				#name: #GroupBox1 
				#label: 'Activity purpose:'))))
]

{ #category : #'interface specs' }
ActivityModel class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 5 5) 
			#max: #(Point 0 20) 
			#bounds: #(Rectangle 720 450 885 470) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle -1 2 449 22) 
				#name: #InputField1 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 8191 5119 2048) 
					#setSelectionForegroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue 8191 5119 2048)) 
				#model: #selectedActivity 
				#tabable: false 
				#isReadOnly: true 
				#type: #string))))
]

{ #category : #'interface specs' }
ActivityModel class >> windowSpec2 [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1336 462 1486 504) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ComboBoxSpec 
				#layout: #(LayoutFrame 2 0 7 0 -2 1 30 0) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6793 5676)) 
				#model: #selectedActivity 
				#comboList: #activityChoices))))
]

{ #category : #accessing }
ActivityModel >> figureType [
	
	^ActivityFigure
]
