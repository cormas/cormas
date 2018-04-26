interface specs
ecranPreferences
	"UIPainter new openOnClass: self andSelector: #ecranPreferences"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Preferences' 
			#min: #(Point 20 20) 
			#max: #(Point 1024 768) 
			#bounds: #(Rectangle 512 384 808 452)) 
		#component: #(SpecCollection 
			#collection: #(#(CheckBoxSpec 
				#layout: #(Point 21 14) 
				#model: #lienHolder 
				#label: 'Draw line') #(CheckBoxSpec 
				#layout: #(Point 21 38) 
				#model: #cercleCommHolder 
				#label: 'Circle for communicating agents') #(ActionButtonSpec 
				#layout: #(Rectangle 201 11 282 34) 
				#name: #ActionButton1 
				#model: #closePreferences 
				#label: 'Action' 
				#defaultable: true))))