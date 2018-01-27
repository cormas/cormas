interface specs
commentsModelWindow
	"Tools.UIPainter new openOnClass: self andSelector: #commentsModelWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Model Version Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 720 450 1364 861) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 15 6) 
				#name: #Label3 
				#label: 'Model Versions' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 213 383 316 409) 
				#name: #CormasVersionOk 
				#isOpaque: true 
				#model: #closeAccept 
				#label: 'Add comments' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 345 6.5 508 29.5) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #authorName 
				#isReadOnly: false) #(TextEditorSpec 
				#layout: #(Rectangle 15 214 632 379) 
				#name: #TextEditor3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #newComments 
				#helpText: 'Write here the comments and purpose of this new version of Cormas' 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 229 9) 
				#name: #DeveloperName 
				#label: 'Developer''s Name') #(LabelSpec 
				#layout: #(Point 16 35) 
				#name: #Label1 
				#label: 'Previous versions'' comments') #(ActionButtonSpec 
				#layout: #(Rectangle 355 383 458 409) 
				#name: #ActionButton2 
				#model: #closeCancel 
				#label: 'No comment' 
				#defaultable: true) #(TextEditorSpec 
				#layout: #(Rectangle 15 52 632 192) 
				#name: #TextEditor1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #previousComments 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 16 196) 
				#name: #Label2 
				#label: 'Some comments on this version'))))