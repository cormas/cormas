interface specs
windowNewDeviation
	"Tools.UIPainter new openOnClass: self andSelector: #windowNewDeviation"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Back to simulation' 
			#min: #(Point 543 330) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1263 780) 
			#colors: #(LookPreferences 
				#setForegroundColor: nil 
				#setBackgroundColor: #(ColorValue #white) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil 
				#setBorderColor: nil)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 22 12) 
				#name: #Label1 
				#label: 'A new forwards-in-time branch may be taken at time T: ' 
				#style: #large) #(LabelSpec 
				#layout: #(Point 22 198) 
				#name: #Label2 
				#label: 'The new simulation history files will be stored into:' 
				#style: #systemDefault) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Point 22 224) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6089 762 3426)) 
				#label: #newFolderName) #(LabelSpec 
				#layout: #(Point 230 264) 
				#name: #Label4 
				#label: 'Ok to continue?' 
				#style: #large) #(CheckBoxSpec 
				#layout: #(Point 22 248) 
				#name: #CheckBox1 
				#model: #enableBackwardValue 
				#label: 'Enable stepping back' 
				#style: #systemDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 196 297 249 317) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'OK' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 316 297 369 317) 
				#name: #ActionButton2 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 334 150 537 228) 
				#name: #ViewHolder1 
				#flags: 0 
				#component: #deviationImage) #(InputFieldSpec 
				#layout: #(Rectangle 420 15.5 476 36.5) 
				#name: #InputField2 
				#flags: 0 
				#model: #nextStep 
				#tabable: false 
				#style: #large 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 23 37) 
				#name: #Label7 
				#label: 'Please, choose the simulation way:' 
				#style: #large) #(RadioButtonSpec 
				#layout: #(Point 23 70) 
				#name: #RadioButton1 
				#model: #deviationChoice 
				#label: 'Same way' 
				#select: #noDeviation) #(LabelSpec 
				#layout: #(Point 38 83) 
				#name: #Label8 
				#label: '(same #step method, same random seed)' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 23 113) 
				#name: #RadioButton2 
				#model: #deviationChoice 
				#label: 'Probably same way' 
				#select: #deviationRandom) #(LabelSpec 
				#layout: #(Point 38 126) 
				#name: #Label9 
				#label: '(same #step method, new random seed)' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 23 156) 
				#name: #RadioButton3 
				#model: #deviationChoice 
				#label: 'Different way' 
				#select: #newDeviation) #(LabelSpec 
				#layout: #(Point 38 169) 
				#name: #Label10 
				#label: '(other #step method, new random seed)' 
				#style: #small) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 334 46 537 124) 
				#name: #ViewHolder2 
				#flags: 0 
				#component: #deviation2image) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 398 104 421 162) 
				#name: #ViewHolder3 
				#flags: 0 
				#component: #flecheImage))))