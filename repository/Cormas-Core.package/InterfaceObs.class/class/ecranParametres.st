interface specs
ecranParametres
	"UIPainter new openOnClass: self andSelector: #ecranParametres"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parametres' 
			#min: #(Point 20 20) 
			#max: #(Point 1324 968) 
			#bounds: #(Rectangle 559 416 944 650)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 239 131) 
				#label: 'Movement') #(InputFieldSpec 
				#layout: #(Rectangle 329 132 369 154) 
				#model: #deplacement 
				#type: #number) #(SliderSpec 
				#layout: #(Rectangle 204 13 224 149) 
				#name: #bSlider 
				#model: #bSlider 
				#orientation: #vertical) #(SliderSpec 
				#layout: #(Rectangle 20 149 203 169) 
				#name: #aSlider 
				#model: #aSlider 
				#orientation: #horizontal) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 20 13 204 149) 
				#name: #vueEllipse 
				#component: #vueEllipse) #(LabelSpec 
				#layout: #(Point 261 49) 
				#label: 'a :') #(InputFieldSpec 
				#layout: #(Rectangle 294 50 334 72) 
				#name: #a 
				#model: #aHolder 
				#type: #number) #(GroupBoxSpec 
				#layout: #(Rectangle 243 14 354 117)) #(LabelSpec 
				#layout: #(Point 262 77) 
				#label: 'b :') #(InputFieldSpec 
				#layout: #(Rectangle 294 77 334 99) 
				#name: #b 
				#model: #bHolder 
				#type: #number) #(CheckBoxSpec 
				#layout: #(Point 258 23) 
				#model: #interieurHolder 
				#label: 'Repulsion') #(LabelSpec 
				#layout: #(Point 241 161) 
				#label: 'Iterations') #(InputFieldSpec 
				#layout: #(Rectangle 329 155 369 180) 
				#model: #cycle 
				#type: #number) #(ActionButtonSpec 
				#layout: #(Rectangle 101 191 182 214) 
				#name: #ActionButton1 
				#model: #closeParametres 
				#label: 'Close' 
				#defaultable: true))))