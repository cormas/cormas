interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#bounds: #(Rectangle 493 317 814 704)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 11 5) 
				#name: #pdvMethod 
				#label: 'Label') #(TableViewSpec 
				#layout: #(LayoutFrame 0 -0.00934579 0 0.108527 0 1.0 0 0.997416) 
				#name: #povDict 
				#flags: 12 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionForegroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #tableInterface 
				#tabable: false 
				#selectionStyle: #row))))