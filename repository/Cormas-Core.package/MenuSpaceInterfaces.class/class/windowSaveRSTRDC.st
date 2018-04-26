interface specs
windowSaveRSTRDC
	"UIPainter new openOnClass: self andSelector: #windowSaveRSTRDC"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Save to RST-RDC Format' 
			#min: #(Point 371 558) 
			#max: #(Point 371 558) 
			#bounds: #(Rectangle 528 93 899 651)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 9 31 359 164) 
				#name: #List1 
				#model: #attributesSavedRSTRDC 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 110 4) 
				#name: #Label1 
				#label: 'Attributes to be saved') #(LabelSpec 
				#layout: #(Point 6 178) 
				#name: #Label2 
				#label: 'File format') #(InputFieldSpec 
				#layout: #(Rectangle 75 207 175 230) 
				#name: #InputField2 
				#model: #fileTitle) #(LabelSpec 
				#layout: #(Point 6 202) 
				#name: #Label3 
				#label: 'File title') #(InputFieldSpec 
				#layout: #(Rectangle 73 243 173 266) 
				#name: #InputField5 
				#model: #refSystem) #(LabelSpec 
				#layout: #(Point 4 238) 
				#name: #Label8 
				#label: 'Ref. System') #(MenuButtonSpec 
				#layout: #(Rectangle 73 275 173 298) 
				#name: #MenuButton3 
				#model: #refUnits 
				#label: 'm') #(LabelSpec 
				#layout: #(Point 4 270) 
				#name: #Label9 
				#label: 'Ref. units') #(InputFieldSpec 
				#layout: #(Rectangle 73 307 173 330) 
				#name: #InputField6 
				#model: #unitDist 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 4 310) 
				#name: #Label10 
				#label: 'Unit dist.') #(InputFieldSpec 
				#layout: #(Rectangle 73 339 173 362) 
				#name: #InputField7 
				#model: #minX 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 4 366) 
				#name: #Label11 
				#label: 'Max X.') #(InputFieldSpec 
				#layout: #(Rectangle 73 371 173 394) 
				#name: #InputField8 
				#model: #maxX 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 4 334) 
				#name: #Label12 
				#label: 'Min. X') #(InputFieldSpec 
				#layout: #(Rectangle 73 403 173 426) 
				#name: #InputField9 
				#model: #minY 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 10 434) 
				#name: #Label13 
				#label: 'Max. Y') #(InputFieldSpec 
				#layout: #(Rectangle 75 437 175 460) 
				#name: #InputField10 
				#model: #maxY 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 4 406) 
				#name: #Label14 
				#label: 'Min. Y') #(InputFieldSpec 
				#layout: #(Rectangle 250 176 350 199) 
				#name: #InputField12 
				#model: #resolution 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 190 169) 
				#name: #Label16 
				#label: 'Resolution') #(LabelSpec 
				#layout: #(Point 190 203) 
				#name: #Label17 
				#label: 'Min. Value') #(LabelSpec 
				#layout: #(Point 190 235) 
				#name: #Label18 
				#label: 'Max. Value') #(InputFieldSpec 
				#layout: #(Rectangle 250 275 350 298) 
				#name: #InputField13 
				#model: #displayMin 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 190 267) 
				#name: #Label19 
				#label: 'Display min.') #(InputFieldSpec 
				#layout: #(Rectangle 250 308 350 331) 
				#name: #InputField14 
				#model: #displayMax 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 190 303) 
				#name: #Label20 
				#label: 'Display Max.') #(LabelSpec 
				#layout: #(Point 190 337) 
				#name: #Label21 
				#label: 'Value Units') #(MenuButtonSpec 
				#layout: #(Rectangle 250 374 350 397) 
				#name: #MenuButton6 
				#model: #valueErrors 
				#label: 'unknown') #(LabelSpec 
				#layout: #(Point 190 367) 
				#name: #Label22 
				#label: 'Value errors') #(LabelSpec 
				#layout: #(Point 190 401) 
				#name: #Label23 
				#label: 'Flag value') #(LabelSpec 
				#layout: #(Point 190 463) 
				#name: #Label24 
				#label: 'Legend cats') #(InputFieldSpec 
				#layout: #(Rectangle 250 473 350 496) 
				#name: #InputField18 
				#model: #legendCats 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 190 433) 
				#name: #Label25 
				#label: 'Flag def''n') #(LabelSpec 
				#layout: #(Point 8 468) 
				#name: #Label15 
				#label: 'Pos''n error') #(MenuButtonSpec 
				#layout: #(Rectangle 77 469 177 492) 
				#name: #MenuButton7 
				#model: #posnerror 
				#label: 'unknown') #(InputFieldSpec 
				#layout: #(Rectangle 250 209 350 232) 
				#name: #InputField11 
				#model: #minValue 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(Rectangle 250 242 350 265) 
				#name: #InputField21 
				#model: #maxValue 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(MenuButtonSpec 
				#layout: #(Rectangle 250 341 350 364) 
				#name: #MenuButton4 
				#model: #valueUnits 
				#label: 'unknown') #(MenuButtonSpec 
				#layout: #(Rectangle 250 407 350 430) 
				#name: #MenuButton5 
				#model: #flagValue 
				#label: 'none') #(MenuButtonSpec 
				#layout: #(Rectangle 250 440 350 463) 
				#name: #MenuButton8 
				#model: #flagDefn 
				#label: 'none') #(ActionButtonSpec 
				#layout: #(Rectangle 109 519 190 542) 
				#name: #ActionButton1 
				#model: #validateSaveToRSTRDC 
				#label: 'Ok' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 207 519 288 543) 
				#name: #ActionButton2 
				#model: #cancelSaveToRSTRDC 
				#label: 'Cancel' 
				#defaultable: true) #(MenuButtonSpec 
				#layout: #(Rectangle 76 173 176 196) 
				#name: #MenuButton9 
				#model: #fileFormat 
				#label: 'IDRISI Raster A.1'))))