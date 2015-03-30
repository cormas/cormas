interface specs
addAgent
	"Tools.UIPainter new openOnClass: self andSelector: #addAgent"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Agent' 
			#min: #(Point 311 126) 
			#max: #(Point 311 126) 
			#bounds: #(Rectangle 720 450 1031 576)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 135 36 287 59) 
				#name: #InputField1 
				#model: #newClassName 
				#helpText: 'Enter the name of the new class') #(LabelSpec 
				#layout: #(Point 190 16) 
				#name: #name 
				#label: 'Name') #(ActionButtonSpec 
				#layout: #(Rectangle 168 67 249 90) 
				#name: #Ok 
				#model: #addNewSocialEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 17 18) 
				#name: #cbComm 
				#model: #cbComm 
				#helpText: 'Agent with mailbox' 
				#label: 'Communication') #(CheckBoxSpec 
				#layout: #(Point 17 45) 
				#name: #cbGroup 
				#model: #cbGroup 
				#helpText: 'Agent as a group of agents' 
				#label: 'Group') #(CheckBoxSpec 
				#layout: #(Point 17 72) 
				#name: #cbLocation 
				#model: #cbLocation 
				#helpText: 'Agent located on a Cell' 
				#label: 'Location') #(LabelSpec 
				#layout: #(Point 35 99) 
				#name: #Label1 
				#label: '(or right-click on your own class to specialize it)'))))