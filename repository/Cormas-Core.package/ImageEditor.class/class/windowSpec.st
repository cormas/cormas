interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ImageEditor 
				#defaultString: 'Image Editor' 
				#catalogID: #UIPainter) 
			#min: #(Point 395 244) 
			#max: #(Point 1152 864) 
			#bounds: #(Rectangle 777 287 1212 686) 
			#flags: 4 
			#menu: #maskEditorMenu) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 43 0 61 0 0 0.204598 101 0) 
				#name: #readButton 
				#model: #grab 
				#tabable: false 
				#helpText: 'Select a part of the screen' 
				#label: #photoIcon 
				#hasCharacterOrientedLabel: false 
				#isDefault: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.749425 0 0 0 1.0 32 0) 
				#name: #installButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#model: #install 
				#tabable: false 
				#label: #(UserMessage 
					#key: #InstallDot 
					#defaultString: 'Install')) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.503448 0 0 0 0.751724 32 0) 
				#name: #loadButton 
				#model: #load 
				#tabable: false 
				#label: #(UserMessage 
					#key: #LoadDot 
					#defaultString: 'Load...' 
					#catalogID: #UIPainter)) #(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -44 1 -204 1 -24 1) 
				#name: #redButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red) 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #doRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -44 1 -164 1 -24 1) 
				#name: #yellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #doYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -44 1 -124 1 -24 1) 
				#name: #greenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #green) 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #doGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -44 1 -84 1 -24 1) 
				#name: #cyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #cyan) 
					#setSelectionBackgroundColor: #(ColorValue #cyan)) 
				#model: #doCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -44 1 -44 1 -24 1) 
				#name: #blueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #blue) 
					#setSelectionBackgroundColor: #(ColorValue #blue)) 
				#model: #doBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -44 1 -4 1 -24 1) 
				#name: #magentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #magenta) 
					#setSelectionBackgroundColor: #(ColorValue #magenta)) 
				#model: #doMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -44 1 -244 1 -24 1) 
				#name: #greyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #lightGray) 
					#setSelectionBackgroundColor: #(ColorValue #lightGray)) 
				#model: #doGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -24 1 -4 1 -4 1) 
				#name: #darkMagentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkMagenta) 
					#setSelectionBackgroundColor: #(ColorValue #darkMagenta)) 
				#model: #doDarkMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -24 1 -204 1 -4 1) 
				#name: #darkRedButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkRed) 
					#setSelectionBackgroundColor: #(ColorValue #darkRed)) 
				#model: #doDarkRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -24 1 -164 1 -4 1) 
				#name: #darkYellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #olive) 
					#setSelectionBackgroundColor: #(ColorValue #olive)) 
				#model: #doDarkYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -24 1 -124 1 -4 1) 
				#name: #darkGreenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkGreen) 
					#setSelectionBackgroundColor: #(ColorValue #darkGreen)) 
				#model: #doDarkGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -24 1 -84 1 -4 1) 
				#name: #darkCyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkCyan) 
					#setSelectionBackgroundColor: #(ColorValue #darkCyan)) 
				#model: #doDarkCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -24 1 -44 1 -4 1) 
				#name: #darkBlueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #navy) 
					#setSelectionBackgroundColor: #(ColorValue #navy)) 
				#model: #doDarkBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -24 1 -244 1 -4 1) 
				#name: #darkGreyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #gray) 
					#setSelectionBackgroundColor: #(ColorValue #gray)) 
				#model: #doDarkGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -44 1 -284 1 -24 1) 
				#name: #whiteButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #doWhite 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -24 1 -284 1 -4 1) 
				#name: #blackButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #black)) 
				#model: #doBlack 
				#tabable: false) #(InputFieldSpec 
				#layout: #(LayoutFrame 4 0 -44 1 -324 1 -4 1) 
				#name: #currentColorID 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black)) 
				#model: #doTheCurrentColor 
				#tabable: false 
				#isReadOnly: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 3 0 -72 1 55 0 -48 1) 
				#model: #fillCurrentColor 
				#label: #fillRectangleImage 
				#hasCharacterOrientedLabel: false) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame 61 0 -72 1 113 0 -48 1) 
				#model: #toCurrentColor 
				#label: #changeColorImage 
				#hasCharacterOrientedLabel: false) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame -8 0.333333 40 0 -8 1 -48 1) 
				#name: #magnifiedBitView 
				#flags: 11 
				#component: #magnifiedBitView) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin 32 0 119 0 69 69) 
				#name: #directBitView 
				#component: #directBitView) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 0.25 32 0) 
				#name: #readButton 
				#model: #read 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Read 
					#defaultString: 'Read' 
					#catalogID: #UIPainter) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.25 0 0 0 0.5 32 0) 
				#name: #applyButton 
				#model: #apply 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Apply 
					#defaultString: 'Apply' 
					#catalogID: #UIPainter) 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 43 40) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #Capture 
					#defaultString: 'Capture')))))