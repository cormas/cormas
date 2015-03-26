interface specs
loginSpec
	"UIPainter new openOnClass: self andSelector: #loginSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: ' ' 
			#min: #(Point 337 153) 
			#max: #(Point 640 153) 
			#bounds: #(Rectangle 512 384 849 537)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(AlignmentOrigin 10 0 66 0 0 1) 
				#label: #(UserMessage 
					#key: #UserName 
					#defaultString: 'User Name:' 
					#catalogID: #lens)) #(LabelSpec 
				#layout: #(AlignmentOrigin 10 0 96 0 0 1) 
				#label: #(UserMessage 
					#key: #Password 
					#defaultString: 'Password:' 
					#catalogID: #lens)) #(LabelSpec 
				#layout: #(Point 10 12) 
				#label: #(UserMessage 
					#key: #LOGINToDatabase 
					#defaultString: 'LOGIN to Database' 
					#catalogID: #lens)) #(ActionButtonSpec 
				#layout: #(LayoutFrame 16 0.5 -35 1 82 0.5 -5 1) 
				#model: #cancel 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Cancel' 
					#catalogID: #lens) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame -82 0.5 -35 1 -16 0.5 -5 1) 
				#model: #accept 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'OK' 
					#catalogID: #lens) 
				#isDefault: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 118 0 10 0 -10 1 35 0) 
				#name: #InputField1 
				#model: #dataBase 
				#tabable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 118 0 40 0 -10 1 65 0) 
				#name: #InputField2 
				#model: #username) #(InputFieldSpec 
				#layout: #(LayoutFrame 118 0 70 0 -10 1 95 0) 
				#name: #InputField3 
				#model: #pwd))))