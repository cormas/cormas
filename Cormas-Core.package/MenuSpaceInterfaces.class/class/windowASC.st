interface specs
windowASC
	"UIPainter new openOnClass: self andSelector: #windowASC"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ascWindow 
				#defaultString: 'Load ASC files') 
			#min: #(Point 517 174) 
			#max: #(Point 517 174) 
			#bounds: #(Rectangle 507 384 1024 558) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 310 25) 
				#label: #(UserMessage 
					#key: #filename 
					#defaultString: 'File')) #(ActionButtonSpec 
				#layout: #(Rectangle 260 148 335 178) 
				#model: #validateWindowASC 
				#label: 'OK' 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 226 52 465 126) 
				#model: #listASCFiles 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(ActionButtonSpec 
				#layout: #(Rectangle 351 146 432 177) 
				#model: #cancelWindowASC 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Annuler') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 7 54) 
				#name: #Label1 
				#label: 'First of all, prepare the topology of your grid'))))