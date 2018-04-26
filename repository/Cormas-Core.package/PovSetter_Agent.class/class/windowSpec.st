interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #observationOfEntity 
				#defaultString: 'Observation of Entity') 
			#min: #(Point 637 406) 
			#max: #(Point 414 423) 
			#bounds: #(Rectangle 746 158 1383 564) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle -3 -5 638 408) 
				#name: #fond 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4091 6142 8191) 
					#setBackgroundColor: #(ColorValue 3810 5717 7621)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 7 176 275 371) 
				#name: #Region2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 424 10 631 160) 
				#name: #Region6 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 7 12 383 161) 
				#name: #Region5 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 5 3 385 163) 
				#name: #GroupBox3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: ' PoV definition ')) #(RegionSpec 
				#layout: #(Rectangle 422 172 630 370) 
				#name: #Region3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(LabelSpec 
				#layout: #(Point 239 17) 
				#label: #(UserMessage 
					#key: #associatedSymbols 
					#defaultString: 'Associated Symbols') 
				#style: #pixelDefault) #(SequenceViewSpec 
				#layout: #(Rectangle 221 36 378 155) 
				#name: #pov 
				#model: #listSymbols 
				#menu: #menuSymbolePDV 
				#multipleSelections: false) #(SliderSpec 
				#layout: #(Rectangle 77 283 177 301) 
				#name: #greenSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(SliderSpec 
				#layout: #(Rectangle 77 310 177 328) 
				#name: #blueSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(LabelSpec 
				#layout: #(Point 13 255) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #red 
					#defaultString: 'Red')) #(LabelSpec 
				#layout: #(Point 13 282) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 4986 0) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #green 
					#defaultString: 'Green')) #(LabelSpec 
				#layout: #(Point 13 308) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 0 4986) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #blue 
					#defaultString: 'Blue')) #(SliderSpec 
				#layout: #(Rectangle 77 344 177 360) 
				#name: #brightnessSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(GroupBoxSpec 
				#layout: #(Rectangle 6 167 277 373) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #color 
					#defaultString: ' Set the Color ')) #(ActionButtonSpec 
				#layout: #(Rectangle 107 375 212 402) 
				#name: #boutonAppliquer 
				#flags: 40 
				#model: #validate 
				#label: #(UserMessage 
					#key: #apply 
					#defaultString: 'Apply') 
				#isDefault: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 10 36 205 154) 
				#name: #listMethods 
				#model: #listMethods 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPov) 
				#menu: #menuPDV 
				#multipleSelections: false) #(LabelSpec 
				#layout: #(Point 13 17) 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Methodes returning a Symbol') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 179 254 215 276) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#tabable: true 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 178.5 281 217.0 303) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 179 308 215 331) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 179 341 217 361) 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 13 340) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #brightness 
					#defaultString: 'Brightness')) #(SequenceViewSpec 
				#layout: #(Rectangle 430 36 624 152) 
				#name: #List1 
				#model: #listInfo 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyInfo) 
				#menu: #menuInfo 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 537 224 580 264) 
				#name: #openImageEditorButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openBitmapImageEditor 
				#helpText: #(UserMessage 
					#key: #OpenBitmapImageEditor 
					#defaultString: 'Open a Bitmap image editor') 
				#label: #bitmapIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 422 164 632 372) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #createimage 
					#defaultString: ' Create the Image ')) #(LabelSpec 
				#layout: #(Point 460 282) 
				#name: #Label2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#label: #(UserMessage 
					#key: #size1 
					#defaultString: 'Relative size')) #(LabelSpec 
				#layout: #(Point 462 301) 
				#name: #Label3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#label: #(UserMessage 
					#key: #size2 
					#defaultString: 'of the entity:')) #(SliderSpec 
				#layout: #(Rectangle 443 274 461 365) 
				#name: #tailleSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #tailleSlider 
				#orientation: #vertical 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(InputFieldSpec 
				#layout: #(Rectangle 478 325 505 340) 
				#name: #pourcentTailleIndicateur 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #tailleSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0%') #(RegionSpec 
				#layout: #(Rectangle 308 296 391 379) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 422 3 632 162) 
				#name: #GroupBox2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #informationToBeDisplay 
					#defaultString: ' Information to be displayed ')) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 538 183 581 223) 
				#name: #openVectorEditorButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openVectorImageEditor 
				#helpText: #(UserMessage 
					#key: #OpenaVectorialimageeditor 
					#defaultString: 'Open a Vectorial image editor') 
				#label: #vectorIcon 
				#hasCharacterOrientedLabel: false 
				#isDefault: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 472 194) 
				#name: #Label5 
				#label: #(UserMessage 
					#key: #vectorial 
					#defaultString: 'Vectorial:')) #(LabelSpec 
				#layout: #(Point 481 229) 
				#name: #Label6 
				#label: 'Bitmap:') #(LabelSpec 
				#layout: #(Point 451 17) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningString 
					#defaultString: 'Methodes returning a String') 
				#style: #pixelDefault) #(RadioButtonSpec 
				#layout: #(Point 301 183) 
				#name: #RadioButton6 
				#model: #occupantPosition 
				#helpText: 'Put the entity image randomly on its cell' 
				#label: #(UserMessage 
					#key: #randomly 
					#defaultString: 'randomly') 
				#select: #random) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 322 0 295 0 2 84) 
				#name: #Divider3 
				#orientation: #vertical) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 375 0 295 0 2 84) 
				#name: #Divider4 
				#orientation: #vertical) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 307 0 310 0 84 4) 
				#name: #Divider1) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 307 0 364 0 85 4) 
				#name: #Divider2) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 580 224 623 264) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openBitmapLibrary 
				#label: #libraryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 282 167 411 278) 
				#name: #GroupBox4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 3072 3072 8191)) 
				#label: #(UserMessage 
					#key: #createimage 
					#defaultString: ' Position on the cell ')) #(SubCanvasSpec 
				#layout: #(Rectangle 12 190 275 240) 
				#flags: 0 
				#majorKey: PovSetter 
				#minorKey: #palette) #(SliderSpec 
				#layout: #(Rectangle 77 255 177 273) 
				#name: #redSlider 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(RadioButtonSpec 
				#layout: #(Point 328 213) 
				#name: #RadioButton2 
				#model: #occupantPosition 
				#select: #topLeft) #(RadioButtonSpec 
				#layout: #(Point 328 229) 
				#name: #RadioButton7 
				#model: #occupantPosition 
				#select: #leftCenter) #(RadioButtonSpec 
				#layout: #(Point 328 245) 
				#name: #RadioButton4 
				#model: #occupantPosition 
				#select: #bottomLeft) #(RadioButtonSpec 
				#layout: #(Point 343 245) 
				#name: #RadioButton8 
				#model: #occupantPosition 
				#select: #bottomCenter) #(RadioButtonSpec 
				#layout: #(Point 343 229) 
				#name: #RadioButton1 
				#model: #occupantPosition 
				#select: #center) #(RadioButtonSpec 
				#layout: #(Point 343 213) 
				#name: #RadioButton10 
				#model: #occupantPosition 
				#select: #topCenter) #(RadioButtonSpec 
				#layout: #(Point 358 213) 
				#name: #RadioButton5 
				#model: #occupantPosition 
				#select: #topRight) #(RadioButtonSpec 
				#layout: #(Point 358 229) 
				#name: #RadioButton9 
				#model: #occupantPosition 
				#select: #rightCenter) #(RadioButtonSpec 
				#layout: #(Point 358 245) 
				#name: #RadioButton3 
				#model: #occupantPosition 
				#select: #bottomRight) #(RadioButtonSpec 
				#layout: #(Point 314 200) 
				#name: #RadioButton11 
				#model: #occupantPosition 
				#select: #border_topLeft) #(RadioButtonSpec 
				#layout: #(Point 314 229) 
				#name: #RadioButton12 
				#model: #occupantPosition 
				#select: #border_leftCenter) #(RadioButtonSpec 
				#layout: #(Point 314 258) 
				#name: #RadioButton13 
				#model: #occupantPosition 
				#select: #border_bottomLeft) #(RadioButtonSpec 
				#layout: #(Point 372 258) 
				#name: #RadioButton14 
				#model: #occupantPosition 
				#select: #border_bottomRight) #(RadioButtonSpec 
				#layout: #(Point 372 229) 
				#name: #RadioButton15 
				#model: #occupantPosition 
				#select: #border_rightCenter) #(RadioButtonSpec 
				#layout: #(Point 372 200) 
				#name: #RadioButton16 
				#model: #occupantPosition 
				#select: #border_topRight) #(RadioButtonSpec 
				#layout: #(Point 343 200) 
				#name: #RadioButton17 
				#model: #occupantPosition 
				#select: #border_topCenter) #(RadioButtonSpec 
				#layout: #(Point 343 258) 
				#name: #RadioButton18 
				#model: #occupantPosition 
				#select: #border_bottomCenter) #(CheckBoxSpec 
				#layout: #(Point 541 285) 
				#name: #isDistortable 
				#model: #isDistortable 
				#label: 'is distortable') #(LabelSpec 
				#layout: #(Point 540 304) 
				#name: #Label4 
				#label: '(adapt to cell shape)' 
				#style: #pixelSmall) #(RegionSpec 
				#layout: #(Rectangle 320 208 378 267) 
				#name: #virtualCell 
				#lineWidth: 1) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin 284 0 273 0 130 130) 
				#name: #ViewHolder2 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #imageOS) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Rectangle 579 183 622 223) 
				#name: #ActionButton2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openVectorialLibrary 
				#label: 'Lib' 
				#style: #large 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(RegionSpec 
					#layout: #(Rectangle 0 0 108 101) 
					#name: #Region4 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 4915 4915 4915) 
						#setBackgroundColor: #(ColorValue 7700 7700 7700))) #(CompositeSpecCollection 
					#collection: #(#(ActionButtonSpec 
						#layout: #(Rectangle 54 53 96 75) 
						#name: #ActionButton3 
						#model: #shrunkeBitmap 
						#label: '/ 2' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 0 54) 
						#name: #Label9 
						#label: 'shrunke') #(ActionButtonSpec 
						#layout: #(Rectangle 54 27 96 49) 
						#name: #ActionButton5 
						#model: #resetBitmapSize 
						#label: '100%' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 13 28) 
						#name: #Label10 
						#label: 'reset') #(ActionButtonSpec 
						#layout: #(Rectangle 54 0 96 22) 
						#name: #ActionButton4 
						#model: #magnifyBitmap 
						#label: 'x 2' 
						#defaultable: true) #(LabelSpec 
						#layout: #(Point 0 1) 
						#name: #Label8 
						#label: 'magnify')) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 8 20 104 95) 
						#name: #Composite1))) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 426 267 534 368) 
					#name: #CacheBitmap)))))