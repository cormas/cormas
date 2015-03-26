interface specs
watchVarSpec
	"Tools.UIPainter new openOnClass: self andSelector: #watchVarSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #InsertVariableWatch 
				#defaultString: 'Insert Variable Watch' 
				#catalogID: #pdp) 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1237 595)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 318 98 407 128) 
				#model: #accept 
				#tabable: false 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'OK' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 419 98 504 128) 
				#model: #cancel 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Cancel' 
					#catalogID: #pdp) 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 143 55 503 82) 
				#model: #wVar 
				#tabable: false 
				#isReadOnly: true) #(ActionButtonSpec 
				#layout: #(Rectangle 9 20 132 49) 
				#model: #TOS 
				#tabable: false 
				#label: #(UserMessage 
					#key: #TopOfStack 
					#defaultString: 'Top of Stack' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 143 19 332 49) 
				#name: #IvarSwitch 
				#model: #iVar 
				#tabable: true 
				#label: #(UserMessage 
					#key: #InstanceVariableDots 
					#defaultString: 'Instance Variable...' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 342 19 503 50) 
				#name: #TempSwitch 
				#model: #tVar 
				#tabable: false 
				#label: #(UserMessage 
					#key: #TempVariableDots 
					#defaultString: 'Temp Variable...' 
					#catalogID: #pdp) 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 14 61) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #WatchC 
					#defaultString: 'Watch:' 
					#catalogID: #pdp)))))