interface specs
activityChooser
	"Tools.UIPainter new openOnClass: self andSelector: #activityChooser"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: ' ' 
			#min: #(Point 40 20) 
			#bounds: #(Rectangle 720 450 916 677) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0 0 0.00440529 0 0.989796 0 0.814978) 
				#name: #list 
				#flags: 15 
				#model: #list 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #doubleClick) 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.0918367 0 0.85022 0 0.357143 0 0.960352) 
				#name: #ok 
				#model: #doAccept 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'OK' 
					#catalogID: #labels) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.642857 0 0.85022 0 0.908163 0 0.960352) 
				#name: #cancel 
				#model: #closeCancel 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Cancel' 
					#catalogID: #labels) 
				#defaultable: true))))