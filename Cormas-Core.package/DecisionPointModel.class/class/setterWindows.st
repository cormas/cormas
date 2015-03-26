interface specs
setterWindows
	"Tools.UIPainter new openOnClass: self andSelector: #setterWindows"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Testing activity setter' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1147 669) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 3072)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 201 29 416 52) 
				#name: #InputFieldActivity 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 8191 6143)) 
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
					#setForegroundColor: #(ColorValue #black)) 
				#label: 'Test:') #(TextEditorSpec 
				#layout: #(Rectangle 199 76 416 183) 
				#name: #purposeEditor 
				#flags: 5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 8191 7167)) 
				#model: #purpose 
				#helpText: 'Right click to display the code' 
				#menu: #menuInspect 
				#style: #small 
				#tabRequiresControl: true) #(GroupBoxSpec 
				#layout: #(Rectangle 195 57 420 191) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black)) 
				#label: 'Test purpose:'))))