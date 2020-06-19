Class {
	#name : #CMEntityInspector,
	#superclass : #Object,
	#instVars : [
		'object',
		'entityIdField',
		'attribute_List',
		'selectedRow',
		'performBar',
		'linkedSI',
		'option',
		'showInstance',
		'instanceColor',
		'previousWidth',
		'ratioColumns',
		'previousRatioColumns'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #resources }
CMEntityInspector class >> arrowNext [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #arrowNext"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 17 @ 15
				depth: 6
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7644 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7612 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7291 7291 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7452 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7259 7259 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7323 7323 7355)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7387 7387 7387)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7709 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7452 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7259 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7612 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7516 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7259 7291 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7773 7805)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@#T5NCTBMSTBMPD$@"P8MPP@@@@%MST&ICT%G@@@D#T5@ST5A@@@@B8UK!X/MR8@@@@@L2<WE28D@@@@MST"MST5MQ4@@@@@G#T5MPP@@@@5MST5MRLJMPL@@@@@J#T5A@@@@CT5D3XTD3T5MPP@@@@@FSTD@@@@G@4@@@@@@@@@@@@@@@@@CPP@@@@I@@@@@@@@@@@@@@@@@@@@A@@@@CP''@@@@@@@@@@@@@@@@@B\D@@@@GA05B3T5MST5J@@@@@@(G@P@@@@PDR,,J1@\J1<@@@@@A10,A@@@@A0[GA0\GA0R@@@@@CH+F10D@@@@BB\[I2\''I0@@@@@2G@L''I0P@@@@DA@PDC"\''A@@@AA0OI3@DA@@@@@PDA@PDA@PDA@PDA@PDA@PD@@@@'))
]

{ #category : #resources }
CMEntityInspector class >> arrowPrevious [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #arrowPrevious"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 17 @ 15
				depth: 6
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7484 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7452 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7259 7291 7323)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7195 7227 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7773 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7644 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7387 7420 7420)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7355 7323 7387)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7227 7227 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7773 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7805 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7612 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7516 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7516 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7805 7805)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7741)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 7644 7644)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7677 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7612 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7580 7580 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7516 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7516 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7773 7741 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7741 7773 7773)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7709 7709 7709)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7580 7612)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7612 7612 7580)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7548 7548 7548)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7484 7484 7516)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7452 7420 7452)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7452 7452)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'L#H]C08^L!82GA82C3H2DCH@@@@PC#HOC 8L@@@SDA@2C#HOL @@@CT4MSP(C@@@@@@(MCP2JSH2@@@@DSH2L 0@@@@@D3HRL#H2L#H@@@@CA@HL@@@@@@XQL#HR@#HB@ @@@B,"N0@@@@@FL"0+L",2IB,2@@@@E3L@@@@@@@@@@@@@@@@@L1\@@@@W@@@@@@@@@@@@@@@@@@@@E0@@@B@K@@@@@@@@@@@@@@@@@C,T@@@@E1\:@@@@@C(2L L2L#H2E1\@@@@-M3\[@@@@@A(8M24WK!\-K @@@AXWE2<M@@@@@A$WE1XGE0 W@@@@A ,FE1\M@@@@@@\HB0 FA0X@@@@0B3@%L@ M@@@<L@,0LS@&I @@@@,KB0,KB0,WHP$KB0$KB0(K@@@@'))
]

{ #category : #resources }
CMEntityInspector class >> iconPrototypeSpec [
	"Answer a prototype of an action button. This spec is copied 
	modified and populated on the palette's window."
	
	^#(#ActionButtonSpec 
		#layout: #(#LayoutFrame 5 0 8 0 35 0 38 0) 
		#flags: 0 
		#name: #specIcon 
		#tabable: false 
		#hasCharacterOrientedLabel: false)
]

{ #category : #'view creation' }
CMEntityInspector class >> inspect: anEntityReference spaceInterface: aSI [
	"(self hasOneInstanceToBeTheOnlyOneFor: aSI)
	ifTrue:[(self theOnlyOneInstanceFor: aSI) goToEntity: anEntityReference]
	ifFalse:[self new openOn: anEntityReference spaceInterface: aSI]
"
	
	self new openOn: anEntityReference spaceInterface: aSI
]

{ #category : #'view creation' }
CMEntityInspector class >> openOn: anEntity spaceInterface: aSI [
	
	self new openOn: anEntity spaceInterface: aSI
]

{ #category : #resources }
CMEntityInspector class >> optionMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #optionMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Inspect &Entity..' 
		#nameKey: #changeEntity 
		#value: #changeEntity) #(MenuItem 
		#rawLabel: 'Inspect instance &id..' 
		#nameKey: #goToId 
		#value: #goToId) #(MenuItem 
		#rawLabel: '&Show inspected instance' 
		#nameKey: #show 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: '&No' 
			#nameKey: #showNo 
			#value: #showNo 
			#indication: true) #(MenuItem 
			#rawLabel: 'With &selection marks' 
			#nameKey: #showSelection 
			#value: #showSelection) #(MenuItem 
			#rawLabel: 'With specific &color' 
			#nameKey: #showColor 
			#value: #showColor 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'Define color' 
				#nameKey: #chooseColor 
				#value: #chooseColor)) #(1) nil))) #(3) nil)) #(MenuItem 
		#rawLabel: 'Be the &only entity inspector' 
		#nameKey: #onlyInspector 
		#value: #onlyInspector)) #(4) nil) decodeAsLiteralArray
]

{ #category : #'interface specs' }
CMEntityInspector class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #UnlabeledCanvas 
				#defaultString: 'Unlabeled Canvas' 
				#catalogID: #labels) 
			#min: #(Point 208 100) 
			#max: #(Point 597 768) 
			#bounds: #(Rectangle 800 450 1112 675) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showHorizontalLines true #allowColumnResizing true #showVerticalLines true #allowColumnReordering false #rowSize 20) 
				#layout: #(LayoutFrame 0 0 20 0 0 1 -20 1) 
				#name: #Dataset1 
				#flags: 12 
				#model: #attribute_List 
				#tabable: false 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #disable true #labelFromApplication false #allowResizing true #allowSorting false) 
					#model: #'selectedRow name' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow value' 
					#label: 'Value' 
					#labelIsImage: false 
					#width: 60 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: ''))) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 0 0 30 20) 
				#name: #previous 
				#model: #previous 
				#label: #arrowPrevious 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 80 0 110 20) 
				#name: #next 
				#model: #next 
				#label: #arrowNext 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 150 0 0 0 0 1 20 0) 
				#name: #option 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #option 
				#tabable: false 
				#helpText: 'Right clic for options' 
				#menu: #optionMenu 
				#alignment: #center 
				#isReadOnly: true 
				#type: #string) #(InputFieldSpec 
				#layout: #(Rectangle 30 0 80 20) 
				#name: #entityIdField 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #entityIdField 
				#tabable: false 
				#alignment: #center 
				#isReadOnly: true 
				#type: #number) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame -30 1 29 0 0 1 734 0) 
				#name: #iconView 
				#flags: 0 
				#component: #iconView) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 0 1 0 1) 
					#name: #performBar 
					#model: #performBar 
					#helpText: 'write in code to be executed by the instance, then press Enter' 
					#type: #text) #(InputFieldSpec 
					#layout: #(LayoutFrame -10 1 2 0 0 1 18 0) 
					#name: #activate 
					#flags: 0 
					#callbacksSpec: #(UIEventCallbackSubSpec 
						#requestFocusInSelector: #executePerformBar) 
					#tabable: true 
					#isReadOnly: false)) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutFrame 0 0 -20 1 0 1 0 1) 
					#name: #Composite1)))))
]

{ #category : #'private-buttons list' }
CMEntityInspector >> adaptButton: newButtonSpec toRepresent: attributeItem [
	"Given aSpec and a prototype spec create a new spec for a 
	button containing proper label and model. Add 
	visual to the dictionary in builder."
	
	| sName iconName index |
	sName := attributeItem name.
	iconName := (sName , 'Icon') asSymbol.
	index := self attribute_List list indexOf: attributeItem.
	newButtonSpec model: ('attButton' , index printString) asSymbol.
	builder
		visualAt: iconName
		put: attributeItem buttonImage.
	newButtonSpec label: iconName	"	builder aspectAt: sName put: (self adaptorFor: aSpec value fullName)"
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton1 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton10 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton11 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton12 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton13 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton14 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton15 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton16 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton17 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton18 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton19 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton2 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton20 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton21 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton22 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton23 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton24 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton25 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton26 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton27 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton28 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton29 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton3 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton30 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton31 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton4 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton5 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton6 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton7 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton8 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #'private-attButons' }
CMEntityInspector >> attButton9 [
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)
]

{ #category : #aspects }
CMEntityInspector >> attribute_List [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attribute_List isNil
		ifTrue:
			[attribute_List := SelectionInListSortAware new.
			attribute_List selectionIndexHolder
				compute: [:v | self selectedRow value: attribute_List selection].
			attribute_List]
		ifFalse: [attribute_List]
]

{ #category : #'upper class surdefinition' }
CMEntityInspector >> basicPrintStringFor: anObject [
	"Answer a the name of the entity instance"
	
	^self entityClass name asString , ' n¬∞ ' , self entityId printString
]

{ #category : #'private-buttons list' }
CMEntityInspector >> buildButtonColumn: aBuilder [
	"Add icons if the iconic palette is in use"
	
	| composite prototypeSpec |
	composite := aBuilder componentAt: #iconView.
	composite isNil ifTrue: [^self].
	composite := composite widget.
	aBuilder newComposite: composite.
	prototypeSpec := self class interfaceSpecFor: #iconPrototypeSpec.
	self populateSpec: prototypeSpec.
	aBuilder endComposite
]

{ #category : #actions }
CMEntityInspector >> changeEntity [
	
	| eNames choice |
	eNames := ((self linkedSI drawing components
		select: [:fig | fig class ~= TrackFigure])
		collect: [:f | f model entity class name]) asSet asSortedCollection.
	choice := Dialog choose: 'Select an entity' fromList: eNames values:
			eNames lines: 8 cancel: nil.
	choice ifNotNil: [self goToEntityType: choice]
]

{ #category : #'upper class surdefinition' }
CMEntityInspector >> changeRequest [
	
	^true
]

{ #category : #actions }
CMEntityInspector >> chooseColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self instanceColor: color.
	self updateInstanceShow
]

{ #category : #'private-resize dataset' }
CMEntityInspector >> columnsRatioChange [
	"A method to resize the columns when size of the window changed"
	
	| aDatasetobject totWidth |
	self ratioColumns value < self minRatioColumn
		ifTrue: [^self ratioColumns value: self minRatioColumn].
	self ratioColumns value > self maxRatioColumn
		ifTrue: [^self ratioColumns value: self maxRatioColumn].
	((self wrapperAt: #Dataset1) isNil not
		and:
			[(self ratioColumns value - self previousRatioColumns) abs
				/ self previousRatioColumns > 0.03])
		ifTrue:
			[aDatasetobject := self widgetAt: #Dataset1.
			aDatasetobject dropEdit.	"update width "
			totWidth := (aDatasetobject columnDescriptors at: 1) width
				+ (aDatasetobject columnDescriptors at: 2) width.
			(aDatasetobject columnDescriptors at: 1)
				width: (totWidth * self ratioColumns value) asFloat asInteger.
			(aDatasetobject columnDescriptors at: 2)
				width: totWidth - (aDatasetobject columnDescriptors at: 1) width.	"refresh display"
			aDatasetobject computeStarts.
			aDatasetobject invalidateRectangle: aDatasetobject bounds.	"update previousRatioColumns:"
			self previousRatioColumns: self ratioColumns value]
]

{ #category : #accessing }
CMEntityInspector >> cormas [
	
	^Cormas current
]

{ #category : #methods }
CMEntityInspector >> entitiesCollec [
	
	^self linkedSI cormasModel allTheEntities: self entityClass
]

{ #category : #accessing }
CMEntityInspector >> entity [
	
	^object entity
]

{ #category : #accessing }
CMEntityInspector >> entityClass [
	
	^object entityClass
]

{ #category : #accessing }
CMEntityInspector >> entityId [
	
	^object entityId
]

{ #category : #aspects }
CMEntityInspector >> entityIdField [
	
	^entityIdField isNil
		ifTrue: [entityIdField := 0 asValue]
		ifFalse: [entityIdField]
]

{ #category : #'doIt/accept/explain' }
CMEntityInspector >> evaluateText: aText from: aController ifFail: failBlock [
	"The user wishes to evaluate expressions in the value part of an inspector.
	Do so in the context of the inspector's variables.  Evaluate failBlock
	if the evaluation does not work."
	
	^Cursor execute
		showWhile:
			[self doItReceiver entity class evaluatorClass new
				evaluate: aText
				in: nil
				allowReceiver: true
				receiver: self doItReceiver entity
				environment: self doItReceiver entity class environment
				notifying: aController
				ifFail: failBlock]
]

{ #category : #actions }
CMEntityInspector >> executePerformBar [
	
	self
		evaluateText: self performBar value
		from: nil
		ifFail: [^false].
	self updateValues.
	^true
]

{ #category : #actions }
CMEntityInspector >> goToEntity: anEntityReference [
	
	self goToEntityType: anEntityReference entityClass name.
	self goToId: anEntityReference entityId
]

{ #category : #actions }
CMEntityInspector >> goToEntityType: aClassName [
	
	aClassName = self entityClass name ifTrue: [^nil].
	self resetInstanceShow.
	object := EntityReference
		on:
			(self linkedSI cormasModel
				allTheEntities: aClassName class)
				first.
	self updateValues.
	self updateInstanceShow
]

{ #category : #actions }
CMEntityInspector >> goToId [
	
	| nb |
	nb := Cormas current request: 'Enter id'.
	(nb isEmpty not and: [(nb contains: [:char | char isDigit not]) not])
		ifTrue:
			[nb := nb asNumber.
			self goToId: nb]
]

{ #category : #actions }
CMEntityInspector >> goToId: nb [
	
	object := EntityReference
		on:
			(self entitiesCollec
				detect: [:e | e id = nb]
				ifNone:
					[^self cormas
						warn: 'no <1s> id=<2p> exists'
						with: object class name
						with: nb]).
	self resetInstanceShow.
	self updateValues.
	self updateInstanceShow
]

{ #category : #'private-buttons list' }
CMEntityInspector >> iconView [
	"Return a visual component able to house palette's icons."
	
	^CompositePart new
]

{ #category : #accessing }
CMEntityInspector >> instanceColor [
	
	^instanceColor
]

{ #category : #accessing }
CMEntityInspector >> instanceColor: anObject [
	
	instanceColor := anObject
]

{ #category : #actions }
CMEntityInspector >> isOnlyInspector [
	
	^((self builder menuAt: #optionMenu) atNameKey: #onlyInspector) isOn
]

{ #category : #accessing }
CMEntityInspector >> linkedSI [
	
	^linkedSI
]

{ #category : #accessing }
CMEntityInspector >> linkedSI: aSpaceInterface [
	
	aSpaceInterface == linkedSI ifTrue: [^self].
	aSpaceInterface ifNotNil: [aSpaceInterface removeDependent: self].
	linkedSI := aSpaceInterface.
	aSpaceInterface ifNotNil: [aSpaceInterface addDependent: self]
]

{ #category : #methods }
CMEntityInspector >> listOfAttributes [
	
	| collec |
	self linkedSI siConfig
		ifNil:
			[collec := SortedCollection new.
			self entityClass superClassesInSameEnvironmentUntilEntity
				do: [:c | collec addAll: c instVarNames].
			collec := collec asOrderedCollection.
			self entityClass isAgentCommClass
				ifTrue:
					[collec addFirst: 'mailBox'.
					collec addFirst: 'acquaintances'].
			self entityClass isCellularAutomatonClass
				ifTrue: [collec addFirst: 'state'].
			self entityClass isSituatedClass ifTrue: [collec addFirst: 'patch'].
			self entityClass isArcClass ifTrue: [collec addFirst: 'stopNode'].
			self entityClass isArcClass ifTrue: [collec addFirst: 'startNode'].
			self entityClass isNodeClass ifTrue: [collec addFirst: 'arcs'].
			^collec]
		ifNotNil: [:siConfig | ^siConfig attributesFor: self entityClass]
]

{ #category : #'private-resize dataset' }
CMEntityInspector >> maxRatioColumn [
	
	| aDatasetobject |
	aDatasetobject := self widgetAt: #Dataset1.
	^1
		-
			(45
				/
					((aDatasetobject columnDescriptors at: 1) width
						+ (aDatasetobject columnDescriptors at: 2) width))
]

{ #category : #'private-resize dataset' }
CMEntityInspector >> minRatioColumn [
	
	| aDatasetobject |
	aDatasetobject := self widgetAt: #Dataset1.
	^130
		/
			((aDatasetobject columnDescriptors at: 1) width
				+ (aDatasetobject columnDescriptors at: 2) width)
]

{ #category : #actions }
CMEntityInspector >> next [
	
	| collec i |
	self resetInstanceShow.
	collec := self sortedEntitiesCollec.
	i := collec indexOf: self entity.
	i = collec size
		ifTrue: [object := EntityReference on: collec first]
		ifFalse: [object := EntityReference on: (collec at: i + 1)].
	self updateValues.
	self updateInstanceShow
]

{ #category : #'access classes' }
CMEntityInspector >> objectClassAndItsUserDefinedSuperClasses [
	
	| collec |
	collec := self entityClass superClassesUntil: CMEntity.
	CMAbstractModel allEntityClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: CMEntity.
	^collec
]

{ #category : #actions }
CMEntityInspector >> onlyInspector [
	
	| item |
	item := (self builder menuAt: #optionMenu) atNameKey: #onlyInspector.
	item isOn
		ifTrue: [item beOff]
		ifFalse: [item beOn].
	item isOn
		ifTrue:
			[self linkedSI openedEntityInspectors_IsTheOnlyOne key
				do: [:ei | ei ~= self ifTrue: [ei closeRequest]]]
]

{ #category : #'initialize-release' }
CMEntityInspector >> openOn: anObject spaceInterface: aSI [
	
	| win minS maxS |
	history := nil.
	anObject = object
		ifTrue: [self update]
		ifFalse: [object := anObject].
	self linkedSI: aSI.
	self resetFields.
	win := (self allButOpenInterface: #windowSpec) window.
	self option value: 'Options..'.
	self showInstance: #no.
	minS := win minimumSize.
	maxS := win maximumSize.
	self updateValues.
	win minimumSize: minS.
	win maximumSize: maxS.
	win
		openWithExtent:
			win minimumSize x
				@
					(win minimumSize y + (((self attribute_List list size min: 20) - 1.8) * 20))
]

{ #category : #aspects }
CMEntityInspector >> option [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^option isNil
		ifTrue: [option := String new asValue]
		ifFalse: [option]
]

{ #category : #aspects }
CMEntityInspector >> performBar [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^performBar isNil
		ifTrue: [performBar := nil asValue]
		ifFalse: [performBar]
]

{ #category : #'private-buttons list' }
CMEntityInspector >> performButtonFor: att_Item [
	
	att_Item isCollection
		ifTrue: [^(self entity perform: att_Item name asSymbol) inspect].
	att_Item isNumber
		ifTrue:
			[^HistogramsInterface
				openOnEntity: self entityClass
				attribute: att_Item name
				model: self linkedSI cormasModel].
	att_Item isBoolean
		ifTrue:
			[^HistogramsInterface
				openOnEntity: self entityClass
				nonNumericAttribute: att_Item name
				model: self linkedSI cormasModel].
	att_Item isAssociation
		ifTrue:
			[^CMEntityInspector
				inspect:
					(EntityReference on: (self entity perform: att_Item name asSymbol))
				spaceInterface: self linkedSI].	"cas o√π la valeur de l'attribut est du texte ou du symbole"
	^HistogramsInterface
		openOnEntity: self entityClass
		nonNumericAttribute: att_Item name
		model: self linkedSI cormasModel
]

{ #category : #'private-buttons list' }
CMEntityInspector >> populateSpec: prototypeSpec [
	"Replicate a prototype spec by creating clones and changing the layout.
	Also send adaptButton:toRepresent: message to chage button's properties.
	The layout algorithm is 'numberOfColumns' icons in a row in the window."
	
	| width height maximumColumns iconPosition currentColumn firstX rows finalExtent |
	width := 6.
	height := 20.
	maximumColumns := 1.
	iconPosition := 0 @ 0.
	firstX := iconPosition x.
	currentColumn := 0.
	self attribute_List list
		do:
			[:att_Item | 
			| newButtonSpec |
			newButtonSpec := prototypeSpec copy.
			newButtonSpec layout: prototypeSpec layout copy.
			(newButtonSpec layout)
				leftOffset: newButtonSpec layout leftOffset + iconPosition x;
				rightOffset: newButtonSpec layout rightOffset + iconPosition x;
				topOffset: newButtonSpec layout topOffset + iconPosition y;
				bottomOffset: newButtonSpec layout bottomOffset + iconPosition y.
			self adaptButton: newButtonSpec toRepresent: att_Item.
			builder add: newButtonSpec.
			currentColumn := currentColumn + 1.
			(currentColumn \\ maximumColumns) isZero
				ifTrue:
					[iconPosition := iconPosition + (0 @ height).
					iconPosition x: firstX]
				ifFalse: [iconPosition := iconPosition + (width @ 0)]].
	rows := (currentColumn - 1) // maximumColumns.
	finalExtent := 0 @ (rows * height).
	finalExtent := builder window minimumSize + finalExtent.
	(builder window)
		changeExtent: finalExtent;
		minimumSize: finalExtent;
		maximumSize: finalExtent
]

{ #category : #'private-resize dataset' }
CMEntityInspector >> postBuildWith: aBuilder [
	
	aBuilder window whenAny: #(#bounds) send: #windowHasResized to: self.	"self ratioColumns onChangeSend: #columnsRatioChange to: self."
	^nil
]

{ #category : #'upper class surdefinition' }
CMEntityInspector >> postBuildWithORIGINAL: aBuilder [
	
	^nil
]

{ #category : #methods }
CMEntityInspector >> prepareTable [
	
	| collecAtt aList |
	collecAtt := self listOfAttributes.
	aList := List new.
	collecAtt
		do:
			[:att | 
			aList
				add:
					(EntityInspector_AttributeItem
						for: self entity
						name: att)].
	self attribute_List list: aList
]

{ #category : #actions }
CMEntityInspector >> previous [
	
	| collec i |
	self resetInstanceShow.
	collec := self sortedEntitiesCollec.
	i := collec indexOf: self entity.
	i = 1
		ifTrue: [object := EntityReference on: collec last]
		ifFalse: [object := EntityReference on: (collec at: i - 1)].
	self updateValues.
	self updateInstanceShow
]

{ #category : #accessing }
CMEntityInspector >> previousRatioColumns [
	
	^previousRatioColumns
		ifNil: [previousRatioColumns := self ratioColumns value]
]

{ #category : #accessing }
CMEntityInspector >> previousRatioColumns: anObject [
	
	previousRatioColumns := anObject
]

{ #category : #accessing }
CMEntityInspector >> previousWidth [
	
	^previousWidth ifNil: [previousWidth := builder window width]
]

{ #category : #accessing }
CMEntityInspector >> previousWidth: anObject [
	
	previousWidth := anObject
]

{ #category : #aspects }
CMEntityInspector >> ratioColumns [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^ratioColumns isNil
		ifTrue: [ratioColumns := 0 asValue]
		ifFalse: [ratioColumns]
]

{ #category : #methods }
CMEntityInspector >> removeColor [
	
	| aFig |
	aFig := self linkedSI drawing components
		detect: [:fig | fig model entityReference = object]
		ifNone: [nil].
	aFig
		ifNotNil:
			[(self entityClass inheritsFrom: CMSpatialEntity)
				ifTrue: [aFig fillColor: aFig model color]
				ifFalse:
					[aFig class ~= BitmapFigure
						ifTrue:
							[aFig fillColor: aFig model color	"(object povAt: aFig pov) color"]]]
]

{ #category : #'interface closing' }
CMEntityInspector >> requestForWindowClose [
	
	self showNo.
	linkedSI removeDependent: self.
	^super requestForWindowClose
]

{ #category : #methods }
CMEntityInspector >> resetInstanceShow [
	
	self showInstance = #selection ifTrue: [linkedSI drawing clearSelections].
	self showInstance = #color ifTrue: [self removeColor]
]

{ #category : #aspects }
CMEntityInspector >> selectedRow [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^selectedRow isNil
		ifTrue: [selectedRow := nil asValue]
		ifFalse: [selectedRow]
]

{ #category : #actions }
CMEntityInspector >> showColor [
	
	self showInstance ~= #color
		ifTrue:
			[self showInstance = #selection ifTrue: [linkedSI drawing clearSelections].
			self showInstance: #color.
			self updateMenu.
			self updateInstanceShow]
]

{ #category : #accessing }
CMEntityInspector >> showInstance [
	
	^showInstance
]

{ #category : #accessing }
CMEntityInspector >> showInstance: anObject [
	
	showInstance := anObject
]

{ #category : #actions }
CMEntityInspector >> showNo [
	
	self showInstance ~= #no
		ifTrue:
			[self resetInstanceShow.
			self showInstance: #no.
			self updateMenu.
			self updateInstanceShow]
]

{ #category : #actions }
CMEntityInspector >> showSelection [
	
	self showInstance ~= #selection
		ifTrue:
			[self showInstance = #color ifTrue: [self removeColor].
			self showInstance: #selection.
			self updateMenu.
			self updateInstanceShow]
]

{ #category : #methods }
CMEntityInspector >> sortedEntitiesCollec [
	
	Dev todo:
			'method a revoir pour ledistribu√© car requiere enormement d''appels au serveur'.
	^self entitiesCollec sorted: [:x :y | x id < y id]
]

{ #category : #updating }
CMEntityInspector >> update: aSymbol with: aValue from: aSender [
	
	self builder window isOpen ifFalse: [^nil].
	aSender == self linkedSI
		ifTrue:
			[aSymbol == #timeChanged ifTrue: [^self prepareTable].
			aSymbol == #windowClosed ifTrue: [^self closeRequest].
			aSymbol = #openedEntityInspectors_IsTheOnlyOne
				ifTrue:
					[aValue key add: self.
					self isOnlyInspector ifTrue: [aValue value: true]].
			^aValue].
	^super update: aSymbol with: aValue from: aSender
]

{ #category : #methods }
CMEntityInspector >> updateInstanceShow [
	
	| aFig |
	self showInstance = #selection
		ifTrue:
			[aFig := self linkedSI drawing components
				detect: [:fig | fig model entityReference = object]
				ifNone: [self halt].
			linkedSI drawing selection: aFig].
	self showInstance = #color
		ifTrue:
			[aFig := self linkedSI drawing components
				detect: [:fig | fig model entityReference = object]
				ifNone: [nil].
			aFig
				ifNotNil:
					[self instanceColor ifNil: [self chooseColor].
					aFig fillColor: self instanceColor.
					aFig invalidate]]
]

{ #category : #methods }
CMEntityInspector >> updateMenu [
	
	| menuShow |
	menuShow := ((self builder menuAt: #optionMenu) atNameKey: #show) submenu.
	self showInstance = #selection
		ifTrue:
			[(menuShow atNameKey: #showNo) beOff.
			(menuShow atNameKey: #showColor) beOff.
			(menuShow atNameKey: #showSelection) beOn].
	self showInstance = #no
		ifTrue:
			[(menuShow atNameKey: #showNo) beOn.
			(menuShow atNameKey: #showColor) beOff.
			(menuShow atNameKey: #showSelection) beOff].
	self showInstance = #color
		ifTrue:
			[(menuShow atNameKey: #showNo) beOff.
			(menuShow atNameKey: #showColor) beOn.
			(menuShow atNameKey: #showSelection) beOff]
]

{ #category : #methods }
CMEntityInspector >> updateValues [
	
	self prepareTable.
	self entityIdField value: self entityId.
	self resetLabel.
	self buildButtonColumn: builder
]

{ #category : #'private-resize dataset' }
CMEntityInspector >> windowHasResized [
	"A method to resize the columns when size of the window changed"
	
	| aDatasetobject columnWidth ratio |
	((self wrapperAt: #Dataset1) isNil not
		and:
			[(builder window width - self previousWidth) abs / self previousWidth >
					0.03])
		ifTrue:
			[aDatasetobject := self widgetAt: #Dataset1.
			aDatasetobject dropEdit.	"width change ratio ; 20 pixels being the width of the icon colum area on the right side of the window"
			ratio := (builder window width - 20) / (self previousWidth - 20).	"for each colum calculates its width relatively to its previous width and assign the new value
	Before that we check if the new width is not elow the minimum width, if yes we perform another resizing algo"
			((aDatasetobject columnDescriptors at: 1) width * ratio) asFloat
				asInteger < 130
				ifTrue:
					[(aDatasetobject columnDescriptors at: 1) width: 130.
					(aDatasetobject columnDescriptors at: 2)
						width: builder window width - 20 - 130]
				ifFalse:
					[((aDatasetobject columnDescriptors at: 2) width * ratio) asFloat asInteger
						< 45
						ifTrue:
							[(aDatasetobject columnDescriptors at: 2) width: 45.
							(aDatasetobject columnDescriptors at: 1)
								width: builder window width - 20 - 45]
						ifFalse:
							[1
								to: aDatasetobject numberOfColumns
								do:
									[:i | 
									columnWidth := ((aDatasetobject columnDescriptors at: i) width * ratio)
										asFloat asInteger.
									(aDatasetobject columnDescriptors at: i) width: columnWidth]]].	"refresh display"
			aDatasetobject computeStarts.
			aDatasetobject invalidateRectangle: aDatasetobject bounds.	"refresh ratioCoumn value"
			self ratioColumns
				value:
					((aDatasetobject columnDescriptors at: 1) width
						/
							((aDatasetobject columnDescriptors at: 1) width
								+ (aDatasetobject columnDescriptors at: 2) width)) asFloat + 0.01.	"update previousWidth"
			self previousWidth: builder window width]
]
