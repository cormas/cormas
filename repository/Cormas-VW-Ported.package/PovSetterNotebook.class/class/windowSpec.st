interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #screenCenter #openType #advanced) 
			#label: 'PoV Setter' 
			#min: #(Point 765 440) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 674 449 1439 889) 
			#colors: #(LookPreferences)) 
		#component: #(SpecCollection 
			#collection: #(#(NoteBookSpec 
				#layout: #(LayoutFrame 4 0 5 0 772 0 438 0) 
				#name: #pageHolder 
				#isOpaque: true 
				#model: #majorKeys 
				#tabable: true 
				#binderWidth: 10 
				#rightInset: 100 
				#bottomInset: 0))))