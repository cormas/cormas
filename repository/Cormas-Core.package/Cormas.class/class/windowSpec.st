interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #specifiedPosition #openType #advanced) 
			#label: 'CORMAS' 
			#min: #(Point 406 80) 
			#max: #(Point 406 208) 
			#bounds: #(Rectangle 720 450 1126 530) 
			#flags: 4 
			#menu: #menuHolder 
			#colors: #(LookPreferences 
				#setForegroundColor: nil 
				#setBackgroundColor: #(ColorValue #white) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#label: 'ModelName:') #(LabelSpec 
				#layout: #(Point 10 28) 
				#name: #Label2 
				#label: 'Version : ' 
				#style: #small) #(InputFieldSpec 
				#layout: #(Rectangle 80 4 235 25) 
				#flags: 0 
				#model: #modelNameField 
				#tabable: false 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 80 27 235 49) 
				#flags: 0 
				#model: #versionField 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true) #(SubCanvasSpec 
				#layout: #(Rectangle -2 59 407 168) 
				#name: #subcanvasSim 
				#flags: 24 
				#majorKey: Cormas 
				#minorKey: #simulationWindow 
				#clientKey: #subcanvasSim) #(InputFieldSpec 
				#layout: #(Rectangle 237 0.5 403 25.0) 
				#name: #simNameInputField 
				#flags: 0 
				#model: #simName 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 237 28 403 49) 
				#name: #simNumInputField 
				#flags: 0 
				#model: #simNum 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true))))