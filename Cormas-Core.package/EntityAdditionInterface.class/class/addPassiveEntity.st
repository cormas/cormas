interface specs
addPassiveEntity
	"Tools.UIPainter new openOnClass: self andSelector: #addPassiveEntity"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Passive Entity' 
			#min: #(Point 300 213) 
			#max: #(Point 300 213) 
			#bounds: #(Rectangle 718 450 1018 663)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 132 29 289 52) 
				#name: #InputField1 
				#model: #newClassName 
				#helpText: 'Enter the name of the new class') #(LabelSpec 
				#layout: #(Point 190 9) 
				#name: #name 
				#label: 'Name') #(ActionButtonSpec 
				#layout: #(Rectangle 166 157 247 180) 
				#name: #Ok 
				#model: #addNewPassivelEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(RadioButtonSpec 
				#layout: #(Point 19 158) 
				#name: #Msg 
				#model: #passiveEntitySuperclass 
				#helpText: 'Message for AgentCommunication (with mailbox)' 
				#label: 'Message' 
				#select: #Msg) #(RadioButtonSpec 
				#layout: #(Point 19 12) 
				#name: #PassiveObject 
				#model: #passiveEntitySuperclass 
				#helpText: 'A simple passive entity' 
				#label: 'Object' 
				#select: #PassiveObject) #(RadioButtonSpec 
				#layout: #(Point 19 37) 
				#name: #ObjectLocation 
				#model: #passiveEntitySuperclass 
				#helpText: 'A passive entity located on a Cell' 
				#label: 'Located Object' 
				#select: #ObjectLocation) #(LabelSpec 
				#layout: #(Point 33 189) 
				#name: #Label3 
				#label: '(or right-click on your own class to specialize it)') #(RadioButtonSpec 
				#layout: #(Point 19 123) 
				#name: #NetworkEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'An oriented Network composed of a set of Arcs and Nodes' 
				#label: 'Full Network' 
				#select: #NetworkEntity) #(RadioButtonSpec 
				#layout: #(Point 19 97) 
				#name: #ArcEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'An Arc of a Network located on 2 Cells' 
				#label: 'Network Arc' 
				#select: #ArcEntity) #(RadioButtonSpec 
				#layout: #(Point 19 72) 
				#name: #NodeEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'A Node of a Network located on a Cell' 
				#label: 'Network Node' 
				#select: #NodeEntity))))