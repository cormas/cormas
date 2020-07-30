Class {
	#name : #MenuSpaceInterfaces,
	#superclass : #Object,
	#instVars : [
		'cheminMif',
		'listMifFiles',
		'listEntities',
		'processNeighbourhood',
		'envFilename',
		'attributesToBeSaved',
		'line',
		'column',
		'supervisor',
		'theOccupants',
		'occupantsList',
		'listASCFiles',
		'listAttributes',
		'attributesSavedASC',
		'xllcorner',
		'cellsize',
		'nodata',
		'yllcorner',
		'posnerror',
		'maxValue',
		'flagValue',
		'minY',
		'flagDefn',
		'fileFormat',
		'refSystem',
		'displayMin',
		'displayMax',
		'legendCats',
		'valueErrors',
		'unitDist',
		'valueUnits',
		'maxY',
		'fileTitle',
		'refUnits',
		'maxX',
		'minValue',
		'minX',
		'resolution',
		'attributesSavedRSTRDC',
		'attributeSavedMIFMID',
		'classMIFMID',
		'coordSys',
		'units',
		'entitiesList'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #resources }
MenuSpaceInterfaces class >> iconColumn [
	"UIMaskEditor new openOnClass: self andSelector: #iconColonne"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 10 @ 30
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0 127 128 0 0 255 192 0 0 127 128 0 0])
]

{ #category : #resources }
MenuSpaceInterfaces class >> iconLine [
	"UIMaskEditor new openOnClass: self andSelector: #iconneLigne"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 31 @ 10
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[0 0 2 36 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 127 255 191 254 0 0 2 36])
]

{ #category : #'instance creation' }
MenuSpaceInterfaces class >> new: uneListe [
	
	^super new initOccupants: uneListe
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowASC [
	"UIPainter new openOnClass: self andSelector: #windowASC"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ascWindow 
				#defaultString: 'Load ASC files') 
			#min: #(Point 517 174) 
			#max: #(Point 517 174) 
			#bounds: #(Rectangle 507 384 1024 558) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 310 25) 
				#label: #(UserMessage 
					#key: #filename 
					#defaultString: 'File')) #(ActionButtonSpec 
				#layout: #(Rectangle 260 148 335 178) 
				#model: #validateWindowASC 
				#label: 'OK' 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 226 52 465 126) 
				#model: #listASCFiles 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(ActionButtonSpec 
				#layout: #(Rectangle 351 146 432 177) 
				#model: #cancelWindowASC 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Annuler') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 7 54) 
				#name: #Label1 
				#label: 'First of all, prepare the topology of your grid'))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowEntitiesHere [
	"Tools.UIPainter new openOnClass: self andSelector: #windowEntitiesHere"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #occupants 
				#defaultString: 'Entities here') 
			#min: #(Point 232 89) 
			#max: #(Point 327 104) 
			#bounds: #(Rectangle 1600 600 1832 689) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0301724 0 0.0674157 0 0.965517 0 0.955056) 
				#model: #entitiesList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#focusInSelector: #displayCharts 
					#doubleClickSelector: #inspect) 
				#multipleSelections: false 
				#selectionType: #highlight))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowGridSize [
	"UIPainter new openOnClass: self andSelector: #windowGridSize"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #gridsize 
				#defaultString: 'Dimension grille') 
			#min: #(#Point 200 147) 
			#max: #(#Point 200 147) 
			#bounds: #(#Rectangle 219 243 419 390) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#LabelSpec 
				#layout: #(#Point 127 22) 
				#label: #(#UserMessage 
					#key: #lineTab 
					#defaultString: 'Ligne')) #(#LabelSpec 
				#layout: #(#Point 128 54) 
				#label: #(#UserMessage 
					#key: #column 
					#defaultString: 'Colonnes')) #(#LabelSpec 
				#layout: #(#Point 24 22) 
				#label: #iconLine 
				#hasCharacterOrientedLabel: false) #(#LabelSpec 
				#layout: #(#Point 32 46) 
				#label: #iconColumn 
				#hasCharacterOrientedLabel: false) #(#InputFieldSpec 
				#layout: #(#Rectangle 80 14 117 44) 
				#model: #line 
				#type: #number 
				#formatString: '0') #(#InputFieldSpec 
				#layout: #(#Rectangle 79 52 117 86) 
				#model: #column 
				#type: #number 
				#formatString: '0') #(#ActionButtonSpec 
				#layout: #(#Rectangle 31 106 161 131) 
				#model: #validateWindowGridSize 
				#label: #(#UserMessage 
					#key: #valide 
					#defaultString: 'Valider') 
				#isDefault: true 
				#defaultable: true))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowOccupants [
	"UIPainter new openOnClass: self andSelector: #windowOccupants"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #occupants 
				#defaultString: 'occupants') 
			#min: #(#Point 232 89) 
			#max: #(#Point 327 104) 
			#bounds: #(#Rectangle 85 210 317 299) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#SequenceViewSpec 
				#layout: #(#LayoutFrame 0 0.0301724 0 0.0674157 0 0.965517 0 0.955056) 
				#model: #occupantsList 
				#callbacksSpec: #(#UIEventCallbackSubSpec #focusInSelector: #displayCharts #doubleClickSelector: #inspect) 
				#multipleSelections: false 
				#selectionType: #highlight))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowSaveASC [
	"UIPainter new openOnClass: self andSelector: #windowSaveASC"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Save to ASC' 
			#min: #(Point 266 339) 
			#max: #(Point 266 339) 
			#bounds: #(Rectangle 512 384 778 723)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 41 41 231 142) 
				#name: #List1 
				#model: #attributesSavedASC 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 34 8) 
				#name: #Label1 
				#label: 'Attributes to be saved') #(ActionButtonSpec 
				#layout: #(Rectangle 123 313 204 336) 
				#name: #ActionButton1 
				#model: #cancelSaveToASC 
				#label: 'Cancel' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 29 312 110 335) 
				#name: #ActionButton2 
				#model: #validateSaveToASC 
				#label: 'Ok' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 132 161 232 184) 
				#name: #InputField1 
				#model: #xllcorner 
				#helpText: '' 
				#alignment: #right 
				#type: #number) #(InputFieldSpec 
				#layout: #(Rectangle 132 202 232 225) 
				#name: #InputField2 
				#model: #yllcorner 
				#alignment: #right 
				#type: #number) #(InputFieldSpec 
				#layout: #(Rectangle 132 239 232 262) 
				#name: #InputField3 
				#model: #cellsize 
				#alignment: #right 
				#type: #number) #(LabelSpec 
				#layout: #(Point 56 161) 
				#name: #Label2 
				#label: 'xllcorner') #(LabelSpec 
				#layout: #(Point 56 202) 
				#name: #Label3 
				#label: 'yllcorner') #(LabelSpec 
				#layout: #(Point 56 239) 
				#name: #Label4 
				#label: 'Cell size') #(LabelSpec 
				#layout: #(Point 56 276) 
				#name: #Label5 
				#label: 'No data') #(InputFieldSpec 
				#layout: #(Rectangle 132 276 232 299) 
				#name: #InputField4 
				#model: #nodata 
				#alignment: #right 
				#type: #number))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowSaveEnv [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSaveEnv"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #saveEnvironment 
				#defaultString: 'Save the Environment') 
			#min: #(Point 224 166) 
			#max: #(Point 224 166) 
			#bounds: #(Rectangle 1475 591 1699 757) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 30 34 203 122) 
				#model: #attributesToBeSaved 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(ActionButtonSpec 
				#layout: #(Rectangle 42 133 102 159) 
				#model: #accept 
				#label: #(UserMessage 
					#key: #ok 
					#defaultString: 'Ok') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 34 12) 
				#label: #(UserMessage 
					#key: #attributesToBeSaved 
					#defaultString: 'Attributes to be saved')) #(ActionButtonSpec 
				#layout: #(Rectangle 118 133 178 159) 
				#model: #cancel 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Cancel') 
				#defaultable: true))))
]

{ #category : #'interface specs' }
MenuSpaceInterfaces class >> windowSaveRSTRDC [
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
]

{ #category : #aspects }
MenuSpaceInterfaces >> attributeSavedMIFMID [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributeSavedMIFMID isNil
		ifTrue: [attributeSavedMIFMID := MultiSelectionInList new]
		ifFalse: [attributeSavedMIFMID]
]

{ #category : #aspects }
MenuSpaceInterfaces >> attributesSavedASC [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributesSavedASC
]

{ #category : #aspects }
MenuSpaceInterfaces >> attributesSavedRSTRDC [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributesSavedRSTRDC isNil
		ifTrue: [attributesSavedRSTRDC := SelectionInList new]
		ifFalse: [attributesSavedRSTRDC]
]

{ #category : #aspects }
MenuSpaceInterfaces >> attributesToBeSaved [
	
	^attributesToBeSaved
]

{ #category : #actions }
MenuSpaceInterfaces >> browseFile [
	"This stub method was generated by UIDefiner"
	
	^self
]

{ #category : #actions }
MenuSpaceInterfaces >> cancelSaveToASC [
	"This stub method was generated by UIDefiner"
	
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> cancelSaveToMIFMID [
	"This stub method was generated by UIDefiner"
	
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> cancelSaveToRSTRDC [
	"This stub method was generated by UIDefiner"
	
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> cancelWindowASC [
	"This stub method was generated by UIDefiner"
	
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> cancelWindowMifMid [
	
	self closeRequest
]

{ #category : #aspects }
MenuSpaceInterfaces >> cellsize [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cellsize isNil
		ifTrue: [cellsize := self supervisor spaceModel cellSize asValue]
		ifFalse: [cellsize]
]

{ #category : #aspects }
MenuSpaceInterfaces >> cheminMif [
	"This method was generated by UIDefiner.  Any edits made here

	may be lost whenever methods are automatically defined.  The

	initialization provided below may have been preempted by an

	initialize method."
	
	^cheminMif isNil
		ifTrue: [cheminMif := String new asValue]
		ifFalse: [cheminMif]
]

{ #category : #accessing }
MenuSpaceInterfaces >> classMIFMID [
	
	^classMIFMID
]

{ #category : #accessing }
MenuSpaceInterfaces >> classMIFMID: x [
	
	classMIFMID := x
]

{ #category : #aspects }
MenuSpaceInterfaces >> column [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^column isNil
		ifTrue: [column := 0 asValue]
		ifFalse: [column]
]

{ #category : #aspects }
MenuSpaceInterfaces >> coordSys [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^coordSys isNil
		ifTrue: [coordSys := ValueHolder with: 'NonEarth']
		ifFalse: [coordSys]
]

{ #category : #actions }
MenuSpaceInterfaces >> displayCharts [
	| item class id agent |
	item := self occupantsList selection.
	item notNil
		ifTrue: [ class := (item tokensBasedOn: Character space) first asSymbol.
			id := (item tokensBasedOn: $#) last asNumber.
			agent := theOccupants
				detect: [ :a | a class name = class and: [ a id = id ] ] ]
]

{ #category : #aspects }
MenuSpaceInterfaces >> displayMax [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^displayMax isNil
		ifTrue: [displayMax := 0 asValue]
		ifFalse: [displayMax]
]

{ #category : #aspects }
MenuSpaceInterfaces >> displayMin [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^displayMin isNil
		ifTrue: [displayMin := 0 asValue]
		ifFalse: [displayMin]
]

{ #category : #aspects }
MenuSpaceInterfaces >> entitiesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entitiesList isNil
		ifTrue: [entitiesList := SelectionInList new]
		ifFalse: [entitiesList]
]

{ #category : #aspects }
MenuSpaceInterfaces >> envFilename [
	"This method was generated by UIDefiner.  Any edits made here

	may be lost whenever methods are automatically defined.  The


	initialization provided below may have been preempted by an

	initialize method."
	
	^envFilename isNil
		ifTrue: [envFilename := String new asValue]
		ifFalse: [envFilename]
]

{ #category : #aspects }
MenuSpaceInterfaces >> fileFormat [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^fileFormat isNil
		ifTrue: [fileFormat := ValueHolder with: 'IDRISI Raster A.1']
		ifFalse: [fileFormat]
]

{ #category : #aspects }
MenuSpaceInterfaces >> fileTitle [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^fileTitle isNil
		ifTrue: [fileTitle := String new asValue]
		ifFalse: [fileTitle]
]

{ #category : #aspects }
MenuSpaceInterfaces >> flagDefn [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^flagDefn isNil
		ifTrue: [flagDefn := ValueHolder with: 'none']
		ifFalse: [flagDefn]
]

{ #category : #aspects }
MenuSpaceInterfaces >> flagValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^flagValue isNil
		ifTrue: [flagValue := ValueHolder with: 'none']
		ifFalse: [flagValue]
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initASCParametres: model [
	
	| liste |
	liste := Filename
		filesMatching:
			((Cormas mapsPath: model name) construct: '*.asc') asString.
	liste := liste collect: [:f | (Filename splitPath: f) at: 2].
	self listASCFiles list: liste asList
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initGridSizeLine: l column: c [
	
	line := l asValue.
	column := c asValue
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initOccupants: unDicoOccupants [
	
	| labelsList |
	theOccupants := OrderedCollection new.
	labelsList := OrderedCollection new.
	unDicoOccupants values do: [:l | theOccupants addAll: l].
	theOccupants
		do: [:a | labelsList add: a class name , ' #' , a id printString].
	self occupantsList list: labelsList
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initSaveASC: model [
	
	| liste |
	liste := List new.
	liste addAllFirst: model cellClass instVarNames.
	(model cellClass inheritsFrom: CMSpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	attributesSavedASC := MultiSelectionInList new list: liste.
	attributesSavedASC selectAll
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initSaveEnv: model [
	
	| liste |
	liste := List new.
	liste addAllFirst: model cellClass instVarNames.
	(model cellClass inheritsFrom: CMSpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	attributesToBeSaved := MultiSelectionInList new list: liste.
	attributesToBeSaved selectAll.
	self envFilename value: 'filename.env'
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initSaveMIFMID: class [
	
	| liste |
	classMIFMID := class.
	liste := List new.
	liste addAllFirst: class instVarNames.
	liste addFirst: 'id'.
	(class inheritsFrom: CMSpatialEntityCell) ifTrue: [liste addFirst: 'state'].
	attributeSavedMIFMID := MultiSelectionInList new list: liste
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initSaveRSTRDC: model [
	
	| liste |
	liste := List new.
	liste addAllFirst: model cormasModelClass cellClass instVarNames.
	(model cormasModelClass cellClass inheritsFrom: CMSpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	line := model line asValue.
	column := model column asValue.
	attributesSavedRSTRDC := MultiSelectionInList new list: liste.
	attributesSavedRSTRDC selectAll
]

{ #category : #'initialize-release' }
MenuSpaceInterfaces >> initSigParametres: model [
	
	| liste |
	liste := Filename
		filesMatching:
			((Cormas mapsPath: model name) construct: '*.mif') asString.
	liste := liste collect: [:f | (Filename splitPath: f) at: 2].
	self listMifFiles list: liste.
	self listMifFiles list isEmpty
		ifFalse: [self listMifFiles selection: self listMifFiles list first].
	self listEntities list: model spatialClasses asList.
	self listEntities list isEmpty
		ifFalse: [self listEntities selection: self listEntities list first].
	self processNeighbourhood value: false
]

{ #category : #actions }
MenuSpaceInterfaces >> inspect [
	
	| item class id |
	item := self occupantsList selection.
	item notNil
		ifTrue:
			[class := (item tokensBasedOn: Character space) first asSymbol.
			id := (item tokensBasedOn: $#) last asNumber.
			(theOccupants detect: [:a | a class name = class and: [a id = id]])
				inspect]
]

{ #category : #aspects }
MenuSpaceInterfaces >> legendCats [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^legendCats isNil
		ifTrue: [legendCats := 0 asValue]
		ifFalse: [legendCats]
]

{ #category : #aspects }
MenuSpaceInterfaces >> line [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^line isNil
		ifTrue: [line := 0 asValue]
		ifFalse: [line]
]

{ #category : #aspects }
MenuSpaceInterfaces >> listASCFiles [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listASCFiles isNil
		ifTrue: [listASCFiles := MultiSelectionInList new]
		ifFalse: [listASCFiles]
]

{ #category : #aspects }
MenuSpaceInterfaces >> listASCFiles: x [
	
	listASCFiles := x
]

{ #category : #aspects }
MenuSpaceInterfaces >> listAttributes [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listAttributes isNil
		ifTrue: [listAttributes := SelectionInList new]
		ifFalse: [listAttributes]
]

{ #category : #aspects }
MenuSpaceInterfaces >> listEntities [
	"This method was generated by UIDefiner.  Any edits made here

	may be lost whenever methods are automatically defined.  The

	initialization provided below may have been preempted by an

	initialize method."
	
	^listEntities isNil
		ifTrue: [listEntities := SelectionInList new]
		ifFalse: [listEntities]
]

{ #category : #aspects }
MenuSpaceInterfaces >> listMifFiles [
	"This method was generated by UIDefiner.  Any edits made here

	may be lost whenever methods are automatically defined.  The

	initialization provided below may have been preempted by an

	initialize method."
	
	^listMifFiles isNil
		ifTrue: [listMifFiles := SelectionInList new]
		ifFalse: [listMifFiles]
]

{ #category : #aspects }
MenuSpaceInterfaces >> maxValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^maxValue isNil
		ifTrue: [maxValue := 0 asValue]
		ifFalse: [maxValue]
]

{ #category : #aspects }
MenuSpaceInterfaces >> maxX [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^maxX isNil
		ifTrue:
			[maxX := (self supervisor spaceModel xll
				+ (self supervisor spaceModel cellSize * column value)) asValue]
		ifFalse: [maxX]
]

{ #category : #aspects }
MenuSpaceInterfaces >> maxY [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^maxY isNil
		ifTrue:
			[maxY := (self supervisor model yll
				+ (self supervisor model cellSize * line value)) asValue]
		ifFalse: [maxY]
]

{ #category : #aspects }
MenuSpaceInterfaces >> minValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^minValue isNil
		ifTrue: [minValue := 0 asValue]
		ifFalse: [minValue]
]

{ #category : #aspects }
MenuSpaceInterfaces >> minX [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^minX isNil
		ifTrue: [minX := self supervisor spaceModel xll asValue]
		ifFalse: [minX]
]

{ #category : #aspects }
MenuSpaceInterfaces >> minY [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^minY isNil
		ifTrue: [minY := self supervisor model yll asValue]
		ifFalse: [minY]
]

{ #category : #aspects }
MenuSpaceInterfaces >> nodata [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nodata isNil
		ifTrue: [nodata := 0 asValue]
		ifFalse: [nodata]
]

{ #category : #aspects }
MenuSpaceInterfaces >> occupantsList [
	
	^occupantsList isNil
		ifTrue: [occupantsList := SelectionInList new]
		ifFalse: [occupantsList]
]

{ #category : #actions }
MenuSpaceInterfaces >> openDialog: uneBoite with: sup [
	
	| bdr win origin |
	self supervisor: sup.
	bdr := self allButOpenInterface: uneBoite.
	win := bdr window.
	origin := sup builder window globalOrigin.
	win openIn: (origin extent: win minimumSize)
]

{ #category : #aspects }
MenuSpaceInterfaces >> posnerror [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^posnerror isNil
		ifTrue: [posnerror := ValueHolder with: 'unknown']
		ifFalse: [posnerror]
]

{ #category : #aspects }
MenuSpaceInterfaces >> processNeighbourhood [
	"This method was generated by UIDefiner.  Any edits made here

	may be lost whenever methods are automatically defined.  The

	initialization provided below may have been preempted by an

	initialize method."
	
	^processNeighbourhood isNil
		ifTrue: [processNeighbourhood := false asValue]
		ifFalse: [processNeighbourhood]
]

{ #category : #aspects }
MenuSpaceInterfaces >> refSystem [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^refSystem isNil
		ifTrue: [refSystem := String new asValue]
		ifFalse: [refSystem]
]

{ #category : #aspects }
MenuSpaceInterfaces >> refUnits [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^refUnits isNil
		ifTrue: [refUnits := ValueHolder with: 'm']
		ifFalse: [refUnits]
]

{ #category : #actions }
MenuSpaceInterfaces >> requestForWindowClose [
	
	self supervisor: nil.
	^true
]

{ #category : #aspects }
MenuSpaceInterfaces >> resolution [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^resolution isNil
		ifTrue: [resolution := self supervisor model cellSize asValue]
		ifFalse: [resolution]
]

{ #category : #accessing }
MenuSpaceInterfaces >> supervisor [
	
	^supervisor
]

{ #category : #accessing }
MenuSpaceInterfaces >> supervisor: anObject [
	
	supervisor := anObject
]

{ #category : #aspects }
MenuSpaceInterfaces >> unitDist [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^unitDist isNil
		ifTrue: [unitDist := 1 asValue]
		ifFalse: [unitDist]
]

{ #category : #aspects }
MenuSpaceInterfaces >> units [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^units isNil
		ifTrue: [units := ValueHolder with: '"m"']
		ifFalse: [units]
]

{ #category : #actions }
MenuSpaceInterfaces >> validateSaveToASC [
	"This stub method was generated by UIDefiner"
	
	| l spMod att |
	l := List new.
	l add: xllcorner value printString.
	l add: yllcorner value printString.
	l add: cellsize value printString.
	l add: nodata value printString.
	spMod := self supervisor spaceModel.
	att := attributesSavedASC selections.
	self dependents first close.
	spMod saveAttributesASC: att fileParameters: l
]

{ #category : #actions }
MenuSpaceInterfaces >> validateSaveToRSTRDC [
	"This stub method was generated by UIDefiner"
	
	| l |
	l := List new.
	l add: fileFormat value.
	l add: fileTitle value printString.
	l add: refSystem value printString.
	l add: refUnits value.
	l add: unitDist value printString.
	l add: minX value printString.
	l add: maxX value printString.
	l add: minY value printString.
	l add: maxY value printString.
	l add: posnerror value.
	l add: resolution value printString.
	l add: minValue value printString.
	l add: maxValue value printString.
	l add: displayMin value printString.
	l add: displayMax value printString.
	l add: valueUnits value.
	l add: valueErrors value.
	l add: flagValue value.
	l add: flagDefn value.
	l add: legendCats value printString.
	self supervisor model saveAttributesRSTRDC: attributesSavedRSTRDC
		fileParameters: l.
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> validateWindowASC [
	"This stub method was generated by UIDefiner"
	
	listASCFiles selections
		do: [:f | self supervisor spaceModel getDataFromASCFile: f].	"	self supervisor spaceModel createImages."
	self closeRequest
]

{ #category : #actions }
MenuSpaceInterfaces >> validateWindowGridSize [
	
	self supervisor spaceModel resetSpatialEntities.
	self supervisor spaceModel
		line: self line value
		column: self column value.
	self supervisor spaceModel isIrregular
		ifTrue: [self supervisor spaceModel gridCellShape: #squared].
	self supervisor spaceModel createCells.	"self supervisor view createImages."
	self closeRequest
]

{ #category : #aspects }
MenuSpaceInterfaces >> valueErrors [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^valueErrors isNil
		ifTrue: [valueErrors := ValueHolder with: 'unknown']
		ifFalse: [valueErrors]
]

{ #category : #aspects }
MenuSpaceInterfaces >> valueUnits [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^valueUnits isNil
		ifTrue: [valueUnits := ValueHolder with: 'unknown']
		ifFalse: [valueUnits]
]

{ #category : #aspects }
MenuSpaceInterfaces >> xllcorner [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^xllcorner isNil
		ifTrue: [xllcorner := self supervisor spaceModel xll asValue]
		ifFalse: [xllcorner]
]

{ #category : #aspects }
MenuSpaceInterfaces >> yllcorner [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^yllcorner isNil
		ifTrue: [yllcorner := self supervisor spaceModel yll asValue]
		ifFalse: [yllcorner]
]
