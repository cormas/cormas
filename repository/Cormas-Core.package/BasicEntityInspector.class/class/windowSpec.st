interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #UnlabeledCanvas 
				#defaultString: 'Unlabeled Canvas' 
				#catalogID: #labels) 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 640 512 878 662)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 0.4 0 1) 
				#name: #fieldList 
				#model: #fieldListHolder 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #doubleClickField 
					#requestValueChangeSelector: #changeRequest)) #(TextEditorSpec 
				#layout: #(LayoutFrame 0 0.4 0 0 1 1 0 1) 
				#name: #text 
				#model: #textHolder 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #textAccepted: 
					#requestValueChangeSelector: #textAcceptAllowed:) 
				#tabRequiresControl: true))))