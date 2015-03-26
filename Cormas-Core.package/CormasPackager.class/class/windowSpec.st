interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication true) 
			#label: #windowTitle 
			#bounds: #(Rectangle 960 525 1587 880)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -250 1 -50 1 -15 1 -15 1) 
				#name: #buttonLaunchPackaging 
				#model: #launchPackaging 
				#label: #launchPackagingLabel 
				#defaultable: true) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Point 24 24) 
				#name: #labelDescription 
				#label: #description 
				#hasCharacterOrientedLabel: false) #(InputFieldSpec 
				#layout: #(LayoutFrame 35 0 -98 1 -90 1 -75 1) 
				#name: #inputTargetPath 
				#model: #targetFileVM 
				#isReadOnly: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -80 1 -98 1 -15 1 -75 1) 
				#name: #btnChooseTargetPath 
				#model: #chooseTargetFile 
				#label: 'Choose' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame -80 1 13 0 -15 1 36 0) 
				#name: #btnRefresh 
				#model: #refresh 
				#label: 'Refresh' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutOrigin 24 0 -130 1) 
				#name: #Label1 
				#label: 'Target executable :'))))