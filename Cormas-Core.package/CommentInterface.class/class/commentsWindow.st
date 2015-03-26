interface specs
commentsWindow
	"Tools.UIPainter new openOnClass: self andSelector: #commentsWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Model Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 373 357 1024 768) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 503 16 630 39) 
				#name: #creationDate 
				#model: #creationDate) #(LabelSpec 
				#layout: #(Point 9 10) 
				#name: #Label3 
				#label: 'Version' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 303 371 375 397) 
				#name: #ok 
				#isOpaque: true 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 419 17) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #creationDate 
					#defaultString: 'creation date')) #(LabelSpec 
				#layout: #(Point 9 46) 
				#name: #Label5 
				#label: #(UserMessage 
					#key: #authors 
					#defaultString: 'Authors') 
				#style: #large) #(LabelSpec 
				#layout: #(Point 97 17) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #name 
					#defaultString: 'Name')) #(InputFieldSpec 
				#layout: #(Rectangle 132 16 232 39) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #modelName 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 9 167) 
				#name: #Label7 
				#label: #(UserMessage 
					#key: #modelComments 
					#defaultString: 'Model comments') 
				#style: #large) #(TextEditorSpec 
				#layout: #(Rectangle 95 199 633 362) 
				#name: #TextEditor3 
				#model: #modelComments 
				#helpText: 'Write here the comments and purpose of the model' 
				#tabRequiresControl: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showHorizontalLines true #allowColumnResizing true #showVerticalLines true #allowColumnReordering false) 
				#layout: #(Rectangle 96 55 631 165) 
				#name: #Dataset1 
				#model: #authorMailList 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow name' 
					#label: #(UserMessage 
						#key: #name 
						#defaultString: 'Name') 
					#labelIsImage: false 
					#width: 200 
					#editorType: #InputField 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting false #labelFromApplication false) 
					#model: #'selectedRow email' 
					#label: 'e-mail' 
					#labelIsImage: false 
					#width: 315 
					#editorType: #InputField 
					#noScroll: false 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#layout: #(Rectangle 10 139 85 163) 
				#name: #ActionButton1 
				#model: #addRow 
				#label: #(UserMessage 
					#key: #addRow 
					#defaultString: 'Add Row') 
				#defaultable: true))))