interface specs
commentsCormasWindow
	"Tools.UIPainter new openOnClass: self andSelector: #commentsCormasWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Cormas Version Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 719 449 1370 860) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 9 10) 
				#name: #Label3 
				#label: 'Cormas Versions' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 303 371 375 397) 
				#name: #CormasVersionOk 
				#isOpaque: true 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 339 12 502 35) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #authorName 
				#isReadOnly: false) #(TextEditorSpec 
				#layout: #(Rectangle 15 82 633 362) 
				#name: #TextEditor3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #cormasComments 
				#helpText: 'Write here the comments and purpose of this new version of Cormas' 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 223 15) 
				#name: #DeveloperName 
				#label: 'Developer''s Name') #(LabelSpec 
				#layout: #(Point 16 57) 
				#name: #Label1 
				#label: 'Some comments on this Cormas version'))))