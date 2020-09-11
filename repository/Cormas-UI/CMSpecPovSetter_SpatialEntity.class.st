Class {
	#name : #'CMSpecPovSetter_SpatialEntity',
	#superclass : #CMSpecPovSetter,
	#category : 'Cormas-UI-PoV'
}

{ #category : #'interface specs' }
CMSpecPovSetter_SpatialEntity class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #observationOfEntity 
				#defaultString: 'Observation of Entity') 
			#min: #(Point 672 423) 
			#max: #(Point 414 423) 
			#bounds: #(Rectangle 720 450 1357 855) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 4053 6482 4053)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle -1 0 637 407) 
				#name: #fond 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4357 6339 2374)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 7 180 276 371) 
				#name: #Region3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 6 13 383 161) 
				#name: #Region4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(RegionSpec 
				#layout: #(Rectangle 426 13 632 162) 
				#name: #Region5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 5 5 385 165) 
				#name: #GroupBox3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 0 4274 0)) 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: ' PoV definition ')) #(LabelSpec 
				#layout: #(Point 241 19) 
				#label: #(UserMessage 
					#key: #associatedSymbols 
					#defaultString: 'Associated Symbols') 
				#style: #pixelDefault) #(SequenceViewSpec 
				#layout: #(Rectangle 221 38 378 157) 
				#name: #pov 
				#model: #listSymbols 
				#menu: #menuSymbolePDV 
				#multipleSelections: false) #(ActionButtonSpec 
				#layout: #(Rectangle 300 346 405 373) 
				#name: #boutonAppliquer 
				#flags: 40 
				#model: #validate 
				#label: #(UserMessage 
					#key: #apply 
					#defaultString: 'Apply') 
				#isDefault: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 10 38 205 156) 
				#name: #listMethods 
				#model: #listMethods 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPov) 
				#menu: #menuPDV 
				#multipleSelections: false) #(LabelSpec 
				#layout: #(Point 9 19) 
				#label: #(UserMessage 
					#key: #methodesreturningPoV 
					#defaultString: 'Methodes returning a Color or a Symbol') 
				#style: #pixelDefault) #(SequenceViewSpec 
				#layout: #(Rectangle 432 38 626 154) 
				#name: #List1 
				#model: #listInfo 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyInfo) 
				#menu: #menuInfo 
				#useModifierKeys: true 
				#selectionType: #highlight) #(RegionSpec 
				#layout: #(Rectangle 312 226 395 309) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin 310 0 223 0 87 87) 
				#name: #imageOS 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 5734 5734 5734) 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #imageOS) #(GroupBoxSpec 
				#layout: #(Rectangle 424 5 634 164) 
				#name: #GroupBox2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 0 4274 0)) 
				#label: #(UserMessage 
					#key: #informationToBeDisplay 
					#defaultString: ' Information to be displayed ')) #(LabelSpec 
				#layout: #(Point 445 19) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningString 
					#defaultString: 'Methodes returning a String') 
				#style: #pixelDefault) #(SliderSpec 
				#layout: #(Rectangle 77 286 177 304) 
				#name: #Slider1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(SliderSpec 
				#layout: #(Rectangle 77 259 177 277) 
				#name: #Slider2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(SliderSpec 
				#layout: #(Rectangle 77 313 177 331) 
				#name: #Slider3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(LabelSpec 
				#layout: #(Point 13 259) 
				#name: #Label2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #red 
					#defaultString: 'Red')) #(LabelSpec 
				#layout: #(Point 13 286) 
				#name: #Label3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 4986 0) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #green 
					#defaultString: 'Green')) #(LabelSpec 
				#layout: #(Point 13 312) 
				#name: #Label4 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 0 4986) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #blue 
					#defaultString: 'Blue')) #(SliderSpec 
				#layout: #(Rectangle 77 348 177 364) 
				#name: #Slider4 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553) 
					#setSelectionBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#orientation: #horizontal 
				#start: 0 
				#stop: 1 
				#step: 0.01) #(GroupBoxSpec 
				#layout: #(Rectangle 6 171 277 373) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue 0 4274 0)) 
				#label: #(UserMessage 
					#key: #color 
					#defaultString: ' Set the Color ')) #(SubCanvasSpec 
				#layout: #(Rectangle 9 192 272 242) 
				#name: #Subcanvas1 
				#flags: 0 
				#majorKey: PovSetter 
				#minorKey: #palette) #(InputFieldSpec 
				#layout: #(Rectangle 181 257 215 280) 
				#name: #InputField1 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #redSlider 
				#tabable: true 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 180.5 283 219.0 307) 
				#name: #InputField2 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #greenSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 181 310 217 334) 
				#name: #InputField3 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #blueSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(InputFieldSpec 
				#layout: #(Rectangle 181 344 223 364) 
				#name: #InputField4 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #brightnessSlider 
				#style: #pixelDefault 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 13 344) 
				#name: #Label5 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#label: #(UserMessage 
					#key: #brightness 
					#defaultString: 'Brightness')))))
]

{ #category : #changed }
CMSpecPovSetter_SpatialEntity >> colorChanged [
	
	| color w |
	color := super colorChanged.
	w := (self builder componentAt: #imageOS) widget.
	w bounds asFiller displayOn: (w graphicsContext paint: color)
]

{ #category : #changed }
CMSpecPovSetter_SpatialEntity >> listSymbolsChanged [
	
	couleur := super listSymbolsChanged.
	couleur ifNil: [^self]	"	w := (self builder componentAt: #imageOS) widget.
	(imageOS model)
		wp: w bounds asFiller;
		color: couleur.
	imageOS displayOn: w graphicsContext"
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_SpatialEntity >> removeClassMethodForSymbol: aSymbol [
	
	selectedClass class
		removeSelector: ('SpatialEntityPOV_' , aSymbol) asSymbol
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_SpatialEntity >> savePOVsymbol: aSymbol [
	
	self saveSpatialEntityPOVcolor: couleur intoClass: selectedClass symbol:
			aSymbol
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_SpatialEntity >> saveSpatialEntityPOVcolor: color intoClass: aClass symbol: aSymbol [
	
	| selector |
	selector := 'SpatialEntityPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Spatial entity pov symbol in the following order:\(color red) (color green) (color blue)"\^Array with: '
				, color red printString , ' with: ' , color green printString ,
					' with: ' , color blue printString) withCRs
		classified: 'pov symbols'
		notifying: nil
]

{ #category : #action }
CMSpecPovSetter_SpatialEntity >> validate [
	
	| selectedSymbol |
	listSymbols selection
		ifNil:
			[^Dialog
				warn:
					(UserMessage defaultString: 'Select a pov symbol' key: #selectPovMethod)
						asString]
		ifNotNil: [:aSelec | selectedSymbol := aSelec asSymbol].
	selectedClass colorsDict at: selectedSymbol put: couleur.	"on met √† jour le dico 'colorsDict' de la classe de l'entite"
	self savePOVsymbol: selectedSymbol.	"on sauvegarde au niveau de la casse de l''entit√©"	""	"ask the currently dispayed figures that correspond this povResult to update color"
	self cormas currentSimulation
		ifNotNil:
			[:sim | 
			(sim allTheEntities: selectedClass)
				do:
					[:entity | 
					sim
						registerEntityChange: #povSymbolChanged
						with: selectedSymbol
						from: (EntityReference on: entity)]].
	(self builder componentAt: #boutonAppliquer) disable
]
