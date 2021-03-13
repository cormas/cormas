Class {
	#name : #PovSetter,
	#superclass : #Object,
	#instVars : [
		'cormas',
		'greenSlider',
		'redSlider',
		'blueSlider',
		'redHolder',
		'blueHolder',
		'greenHolder',
		'brightnessHolder',
		'brightnessSlider',
		'couleur',
		'imageOS',
		'listMethods',
		'listSymbols',
		'selectedClass',
		'listInfo'
	],
	#classInstVars : [
		'standardCellBounds'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #colors }
PovSetter class >> colorChooser [
	"open a Color chooser.
test it :    PovSetter colorChooser  "
	
	| dialog |
	dialog := ColorSelectionDialog new.
	dialog selection.
	dialog open.
	dialog accept value ifFalse: [^nil].
	^dialog selection
]

{ #category : #'instance creation' }
PovSetter class >> newOnClass: aClass [
	
	| inst |
	inst := self new.
	inst setModelClass: aClass.
	^inst
]

{ #category : #'interface specs' }
PovSetter class >> palette [
	"Tools.UIPainter new openOnClass: self andSelector: #palette"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Image Editor' 
			#min: #(Point 354 50) 
			#max: #(Point 454 50) 
			#bounds: #(Rectangle 1007 216 1361 266) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(LayoutFrame -259 1 -48 1 -236 1 -27 1) 
				#name: #whiteButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #doWhite 
				#tabable: false) #(RegionSpec 
				#layout: #(Rectangle 94 3 117 24) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6553 6553 6553)) 
				#lineWidth: 1) #(ActionButtonSpec 
				#layout: #(LayoutFrame -259 1 -24 1 -236 1 -4 1) 
				#name: #blackButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #black)) 
				#model: #doBlack 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -226 1 -46 1 -203 1 -26 1) 
				#name: #greyButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #lightGray) 
					#setSelectionBackgroundColor: #(ColorValue #lightGray)) 
				#model: #doGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -226 1 -24 1 -203 1 -4 1) 
				#name: #darkGreyButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #gray) 
					#setSelectionBackgroundColor: #(ColorValue #gray)) 
				#model: #doDarkGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -193 1 -46 1 -170 1 -26 1) 
				#name: #redButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red) 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #doRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -193 1 -24 1 -170 1 -4 1) 
				#name: #darkRedButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkRed) 
					#setSelectionBackgroundColor: #(ColorValue #darkRed)) 
				#model: #doDarkRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -160 1 -46 1 -137 1 -27 1) 
				#name: #yellowButton 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #doYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -160 1 -24 1 -137 1 -4 1) 
				#name: #darkYellowButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #olive) 
					#setSelectionBackgroundColor: #(ColorValue #olive)) 
				#model: #doDarkYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -127 1 -46 1 -104 1 -26 1) 
				#name: #greenButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #green) 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #doGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -127 1 -24 1 -104 1 -4 1) 
				#name: #darkGreenButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkGreen) 
					#setSelectionBackgroundColor: #(ColorValue #darkGreen)) 
				#model: #doDarkGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -94 1 -46 1 -71 1 -26 1) 
				#name: #cyanButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #cyan) 
					#setSelectionBackgroundColor: #(ColorValue #cyan)) 
				#model: #doCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -94 1 -24 1 -71 1 -4 1) 
				#name: #darkCyanButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkCyan) 
					#setSelectionBackgroundColor: #(ColorValue #darkCyan)) 
				#model: #doDarkCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -61 1 -46 1 -38 1 -26 1) 
				#name: #blueButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #blue) 
					#setSelectionBackgroundColor: #(ColorValue #blue)) 
				#model: #doBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -61 1 -24 1 -38 1 -4 1) 
				#name: #darkBlueButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #navy) 
					#setSelectionBackgroundColor: #(ColorValue #navy)) 
				#model: #doDarkBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -28 1 -46 1 -5 1 -26 1) 
				#name: #magentaButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #magenta) 
					#setSelectionBackgroundColor: #(ColorValue #magenta)) 
				#model: #doMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -28 1 -24 1 -5 1 -4 1) 
				#name: #darkMagentaButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkMagenta) 
					#setSelectionBackgroundColor: #(ColorValue #darkMagenta)) 
				#model: #doDarkMagenta 
				#tabable: false))))
]

{ #category : #'interface specs' }
PovSetter class >> palette2 [
	"Tools.UIPainter new openOnClass: self andSelector: #palette2"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #ColorTool 
				#defaultString: 'Color Tool' 
				#catalogID: #UIPainter) 
			#min: #(Point 243 236) 
			#max: #(Point 360 292) 
			#bounds: #(Rectangle 747 508 1106 777)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 5 129) 
				#label: #(UserMessage 
					#key: #V 
					#defaultString: 'V' 
					#catalogID: #UIPainter)) #(LabelSpec 
				#layout: #(Point 4 171) 
				#name: #hueLabel 
				#label: #(UserMessage 
					#key: #H 
					#defaultString: 'H' 
					#catalogID: #UIPainter)) #(CompositeSpecCollection 
				#collection: #() 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutFrame 32 0 6 0 -6 1 125 0) 
					#name: #colorSpace 
					#flags: 8 
					#isOpaque: true)) #(LabelSpec 
				#layout: #(Point 4 151) 
				#name: #saturationLabel 
				#label: #(UserMessage 
					#key: #S 
					#defaultString: 'S' 
					#catalogID: #UIPainter)) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.374332 0 0.8 0.5 0) 
				#name: #backgroundChipLabel 
				#label: #(UserMessage 
					#key: #Backgrnd 
					#defaultString: 'Backgrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.62 0 0.73 0.5 0) 
				#name: #selectionForegroundChipLabelTop 
				#label: #(UserMessage 
					#key: #Selection 
					#defaultString: 'Selection' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.62 0 0.8 0.5 0) 
				#name: #selectionForegroundChipLabel 
				#label: #(UserMessage 
					#key: #Foregrnd 
					#defaultString: 'Foregrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.87 0 0.73 0.5 0) 
				#name: #selectionBackgroundChipLabelTop 
				#label: #(UserMessage 
					#key: #Selection 
					#defaultString: 'Selection' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.87 0 0.8 0.5 0) 
				#name: #selectionBackgroundChipLabel 
				#label: #(UserMessage 
					#key: #Backgrnd 
					#defaultString: 'Backgrnd' 
					#catalogID: #UIPainter) 
				#style: #small) #(LabelSpec 
				#layout: #(AlignmentOrigin 0 0.12 0 0.8 0.5 0) 
				#name: #foregroundChipLabel 
				#label: #(UserMessage 
					#key: #Foregrnd 
					#defaultString: 'Foregrnd' 
					#catalogID: #UIPainter) 
				#style: #small))))
]

{ #category : #'interface specs' }
PovSetter class >> palette3 [
	"Tools.UIPainter new openOnClass: self andSelector: #palette"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Image Editor' 
			#min: #(Point 332 50) 
			#max: #(Point 332 50) 
			#bounds: #(Rectangle 512 384 844 434) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
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
				#tabable: false))))
]

{ #category : #accessing }
PovSetter class >> standardCellBounds [
	
	^Rectangle
		origin: 0 @ 0
		extent: 51 @ 51
]

{ #category : #action }
PovSetter >> addInfo [
	"adding a new POV method"
	
	| aName |
	aName := (Dialog
		request: self infoName
		initialAnswer: 'info_'
		onCancel: [^self]) asSymbol.
	self modifyInfo: aName.
	self listInfo list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listInfo selectionIndex: 1
]

{ #category : #action }
PovSetter >> addPov [
	"adding a new POV method"
	
	| aName |
	aName := (Dialog
		request: self povName
		initialAnswer: ''
		onCancel: [^self]) asSymbol.
	self modifyPov: aName.
	self listMethods list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listMethods selectionIndex: 1
]

{ #category : #action }
PovSetter >> addSymbolPov [
	
	| aString |
	selectedClass isNil ifTrue: [^nil].
	aString := Cormas current
		request:
			(UserMessage defaultString: 'Enter a new symbol' key: #enterNewSymbol)
				asString.
	aString = '' ifTrue: [^nil].
	[aString first = $#]
		whileTrue:
			[aString := Cormas removeFirstCharacterOfString: aString.
			aString = '' ifTrue: [^nil]].
	^self addSymbolPov: aString
]

{ #category : #action }
PovSetter >> addSymbolPov: aString [
	
	| aList |
	(self listSymbols list includes: aString)
		ifTrue:
			[^Cormas current
				warn:
					(UserMessage defaultString: 'This symbol already exists !!!' key:
							#alreadyExistingSymbol) asString].
	aList := listSymbols list copy.
	aList add: aString.
	aList sort.
	self listSymbols setList: aList selecting: aString.
	selectedClass colorsDict
		at: aString asSymbol
		put: selectedClass defaultColor.
	^aString
]

{ #category : #aspects }
PovSetter >> blueSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^blueSlider isNil
		ifTrue: [blueSlider := 0 asValue]
		ifFalse: [blueSlider]
]

{ #category : #aspects }
PovSetter >> brightnessSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^brightnessSlider isNil
		ifTrue: [brightnessSlider := 0 asValue]
		ifFalse: [brightnessSlider]
]

{ #category : #action }
PovSetter >> close [
	
	self closeRequest
]

{ #category : #changed }
PovSetter >> colorChanged [
	
	| color |
	self builder isNil ifTrue: [^self].
	listSymbols selection isNil
		ifTrue:
			[^self cormas
				warn:
					(UserMessage defaultString: 'Select a symbol !!!' key: #selectSymbol)
						asString].
	color := ColorValue
		red: redHolder value
		green: greenHolder value
		blue: blueHolder value.
	color := ColorValue
		hue: color hue
		saturation: color saturation
		brightness: brightnessHolder value.
	(self builder componentAt: #boutonAppliquer) enable.
	couleur := color.
	^color
]

{ #category : #accessing }
PovSetter >> cormas [
	
	^cormas
]

{ #category : #accessing }
PovSetter >> cormas: anObject [
	
	cormas := anObject
]

{ #category : #action }
PovSetter >> createPovOnAttribute: att [
	
	selectedClass
		compile:
			('pov' , (Cormas upperCaseFirstChar: att) ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word '
				, att ,
					'"
	self ' , att , ' isString ifTrue:[^self ' , att ,
					' asSymbol].
	self ' , att , ' isLiteral ifTrue:[^ (''' , att , ''' , self ' , att ,
					' printString) asSymbol].
	^self ' , att , '') withCRs
		classified: '* pov'
		notifying: nil
]

{ #category : #colors }
PovSetter >> defaultColor [
	
	^ColorValue blue
]

{ #category : #colors }
PovSetter >> doBlack [
	"Met a jour la valeur des sliders rouge, vert et bleu et de ce fait la couleur de l'image imageOS.
hm99"
	
	redSlider value: 1.0.
	greenSlider value: 1.0.
	blueSlider value: 1.0.
	brightnessSlider value: 0
]

{ #category : #colors }
PovSetter >> doBlue [
	
	redSlider value: 0.
	greenSlider value: 0.
	blueSlider value: 1.0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doCyan [
	
	redSlider value: 0.
	greenSlider value: 1.0.
	blueSlider value: 1.0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doDarkBlue [
	
	redSlider value: 0.
	greenSlider value: 0.
	blueSlider value: 1.0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doDarkCyan [
	
	redSlider value: 0.
	greenSlider value: 1.0.
	blueSlider value: 1.0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doDarkGreen [
	
	redSlider value: 0.
	greenSlider value: 1.0.
	blueSlider value: 0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doDarkGrey [
	
	redSlider value: 0.5.
	greenSlider value: 0.5.
	blueSlider value: 0.5.
	brightnessSlider value: 0.40
]

{ #category : #colors }
PovSetter >> doDarkMagenta [
	
	redSlider value: 1.0.
	greenSlider value: 0.
	blueSlider value: 1.0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doDarkRed [
	
	redSlider value: 1.0.
	greenSlider value: 0.
	blueSlider value: 0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doDarkYellow [
	
	redSlider value: 1.0.
	greenSlider value: 1.0.
	blueSlider value: 0.0.
	brightnessSlider value: 0.67
]

{ #category : #colors }
PovSetter >> doGreen [
	
	redSlider value: 0.
	greenSlider value: 1.0.
	blueSlider value: 0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doGrey [
	
	redSlider value: 0.5.
	greenSlider value: 0.5.
	blueSlider value: 0.5.
	brightnessSlider value: 0.68
]

{ #category : #colors }
PovSetter >> doMagenta [
	
	redSlider value: 1.0.
	greenSlider value: 0.
	blueSlider value: 1.0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doRed [
	
	redSlider value: 1.0.
	greenSlider value: 0.
	blueSlider value: 0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doWhite [
	
	redSlider value: 0.
	greenSlider value: 0.
	blueSlider value: 0.
	brightnessSlider value: 1
]

{ #category : #colors }
PovSetter >> doYellow [
	
	redSlider value: 1.0.
	greenSlider value: 1.0.
	blueSlider value: 0.0.
	brightnessSlider value: 1
]

{ #category : #action }
PovSetter >> editMethod: aSelector fromClass: aClass [
	
	| browser |
	browser := RefactoringBrowser open.
	browser navigator selectClass: aClass.
	browser navigator beHierarchy.
	browser navigator setSelector: aSelector
]

{ #category : #aspects }
PovSetter >> greenSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^greenSlider isNil
		ifTrue: [greenSlider := 0 asValue]
		ifFalse: [greenSlider]
]

{ #category : #'initialize-release' }
PovSetter >> imageOS [
	
	^imageOS
		ifNil:
			[imageOS := EntityPOVView new
				model:
					(VectorialElementaryPOV
						new:
							(Rectangle
								origin: 0 @ 0
								extent: 87 @ 87) asPolyline)]
]

{ #category : #'user messages' }
PovSetter >> infoName [
	
	^UserMessage defaultString: ' info name : ' key: #infoName
]

{ #category : #util }
PovSetter >> inheritedMethodsFrom: aClass category: aCat [
	"Retourne la liste des methodes des superclasses de aClass en s'arr√™tant √† Entity
	On rajoute povID et povClassName"
	
	| aList tmp classes |
	aList := OrderedCollection new.
	classes := aClass allSuperclasses copy.
	classes removeAll: Entity allSuperclasses.
	classes
		do:
			[:uneClasse | 
			tmp := uneClasse organization listAtCategoryNamed: aCat.	"specific case of Entity and #pov"	"no need anymore since the generic category has been renamed '* pov'"	"(uneClasse = Entity and: [aCat = #pov]) 
				ifTrue:[tmp := (Entity organization listAtCategoryNamed: aCat) select: [:sel | sel = #povId | (sel = #povClassName)]]."
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList
]

{ #category : #'initialize-release' }
PovSetter >> initialize [
	
	| ctr |
	super initialize.
	ctr := ControllerWithMenu new.
	ctr menuHolder: (self menuFor: #menuImage) asValue.
	ctr performer: self.
	(self componentFor: #imageOS) controller: ctr.
	redHolder := 0 asValue.
	greenHolder := 0 asValue.
	blueHolder := 0 asValue.
	brightnessHolder := 1 asValue.
	redHolder onChangeSend: #colorChanged to: self.
	greenHolder onChangeSend: #colorChanged to: self.
	blueHolder onChangeSend: #colorChanged to: self.
	brightnessHolder onChangeSend: #colorChanged to: self.
	redSlider := RangeAdaptor on: redHolder start: 0 stop: 1 grid: 0.01.
	greenSlider := RangeAdaptor on: greenHolder start: 0 stop: 1 grid: 0.01.
	blueSlider := RangeAdaptor on: blueHolder start: 0 stop: 1 grid: 0.01.
	brightnessSlider := RangeAdaptor on: brightnessHolder start: 0 stop: 1
		grid: 0.01
]

{ #category : #aspects }
PovSetter >> listInfo [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listInfo isNil
		ifTrue: [listInfo := SelectionInList new]
		ifFalse: [listInfo]
]

{ #category : #aspects }
PovSetter >> listMethods [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listMethods isNil
		ifTrue: [listMethods := SelectionInList new]
		ifFalse: [listMethods]
]

{ #category : #changed }
PovSetter >> listMethodsChanged [
	"propagate the change to cormas"
	
	cormas listMethodsChanged	"cormas spaceInterfaces 
		do: [:sp | sp spaceModel ifNotNil: [sp initMenuPov]]"
]

{ #category : #aspects }
PovSetter >> listSymbols [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listSymbols isNil
		ifTrue: [listSymbols := SelectionInList new]
		ifFalse: [listSymbols]
]

{ #category : #changed }
PovSetter >> listSymbolsChanged [
	
	| aPov |
	self listSymbols selection ifNil: [^nil].
	aPov := self listSymbols selection asSymbol.
	(self selectedClass colorAtPov: aPov)
		ifNil:
			[self selectedClass colorsDict
				at: aPov
				put: selectedClass defaultColor].
	couleur := self selectedClass colorAtPov: aPov.
	self updateSlidersFromColor: couleur.
	^couleur
]

{ #category : #action }
PovSetter >> modifyInfo [
	
	| aSelector aClass |
	selectedClass = nil ifTrue: [^nil].
	(self listInfo selection isNil or: [self listInfo selection = '----'])
		ifTrue: [^nil].
	aSelector := (self removeBrackets: self listInfo selection) asSymbol.
	aClass := selectedClass whichClassIncludesSelector: aSelector.
	self editMethod: aSelector fromClass: aClass
]

{ #category : #action }
PovSetter >> modifyInfo: infoName [
	
	selectedClass
		compile:
			(infoName asString ,
					'\"return a String "\ ^self id printString\" ^ self class name asString "')
				withCRs
		classified: 'info'
		notifying: nil.
	self editMethod: infoName fromClass: selectedClass	"selectedClass infoDict at: infoName put: OrderedCollection new"
]

{ #category : #action }
PovSetter >> modifyPov [
	
	| aSelector aClass |
	selectedClass = nil ifTrue: [^nil].
	(self listMethods selection isNil
		or: [self listMethods selection = '----']) ifTrue: [^nil].
	aSelector := (self removeBrackets: self listMethods selection) asSymbol.
	aClass := selectedClass whichClassIncludesSelector: aSelector.
	self editMethod: aSelector fromClass: aClass
]

{ #category : #action }
PovSetter >> modifyPov: povName [
	
	selectedClass
		compile:
			(povName asString ,
					'\"return a symbol or a ColorValue"\^#aSymbol\"^ColorValue white"')
				withCRs
		classified: 'pov'
		notifying: nil.
	self editMethod: povName fromClass: selectedClass
]

{ #category : #'user messages' }
PovSetter >> noSelectedEntity [
	
	^UserMessage defaultString: 'Select an entity first !!! ' key:
			#noSelectedEntity
]

{ #category : #'initialize-release' }
PovSetter >> postBuildWith: aBuilder [
	
	EntityPOV rMax: (imageOS bounds width min: imageOS bounds height)
]

{ #category : #'user messages' }
PovSetter >> povName [
	
	^UserMessage defaultString: ' pov name : ' key: #povName
]

{ #category : #aspects }
PovSetter >> redSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^redSlider isNil
		ifTrue: [redSlider := 0 asValue]
		ifFalse: [redSlider]
]

{ #category : #util }
PovSetter >> removeBrackets: aNom [
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	index = 0 ifTrue: [^aNom].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #action }
PovSetter >> removeInfo [
	
	| unSymb |
	self listInfo selection notNil
		ifTrue:
			[(self cormas
				confirm:
					(UserMessage defaultString: 'Delete the method ' key: #removeMethod)
						asString , ' ' , self listInfo selection , ' ?')
				ifTrue:
					[unSymb := (self removeBrackets: listInfo selection) asSymbol.
					selectedClass removeSelector: unSymb.
					self listInfo list remove: listInfo selection.
					self listInfo selectionIndex: 0]]
]

{ #category : #util }
PovSetter >> removeParentheses: aNom [
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	index = 0 ifTrue: [^aNom].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #action }
PovSetter >> removePov [
	
	| unSymb |
	self listMethods selection notNil
		ifTrue:
			[(self cormas
				confirm:
					(UserMessage defaultString: 'Delete the method ' key: #removeMethod)
						asString , self listMethods selection , ' ?')
				ifTrue:
					[unSymb := (self removeBrackets: listMethods selection) asSymbol.
					selectedClass removeSelector: unSymb.
					self listMethods list remove: listMethods selection.
					self listMethods selectionIndex: 0]]
]

{ #category : #action }
PovSetter >> removeSymbolPov [
	
	| selectedSymbol |
	self listSymbols selection isNil
		ifFalse:
			[(self cormas
				confirm:
					(UserMessage defaultString: 'Remove this symbol ?' key:
							#confirmRemoveSymbol) asString)
				ifTrue:
					[selectedSymbol := self listSymbols selection.
					self removeClassMethodForSymbol: selectedSymbol.
					selectedClass colorsDict
						removeKey: selectedSymbol asSymbol
						ifAbsent: [nil].	"selectedClass povDict removeKey: selectedSymbol ifAbsent: [nil].  uniquement pour les agents"
					self removeSymbolPov: selectedSymbol.
					^selectedSymbol]]
]

{ #category : #action }
PovSetter >> removeSymbolPov: aString [
	
	| aList i |
	i := listSymbols list indexOf: aString.
	aList := listSymbols list copy.
	aList remove: aString.
	self listSymbols
		setList: aList
		selecting: (aList at: (i min: aList size))
]

{ #category : #accessing }
PovSetter >> selectedClass [
	
	^selectedClass
]

{ #category : #accessing }
PovSetter >> selectedMethod [
	
	^self listMethods selection
]

{ #category : #'initialize-release' }
PovSetter >> setListInfo [
	
	| liste tmp |
	liste := List new.
	liste
		addAll: (self inheritedMethodsFrom: selectedClass category: #'* info').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'* info')
		asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #info).	"to ensure compatibility for models implemented with previous Cormas versions"
	1
		to: tmp size
		do:
			[:i | 
			tmp
				at: i
				put: (tmp at: i) asString , ' (' , selectedClass name asString , ')'].
	liste addAllFirst: tmp.
	self listInfo list: liste.
	liste isEmpty ifFalse: [listInfo selection: listInfo list first]	"listMethods selectionIndexHolder onChangeSend: #listMethodsChanged to: self."
]

{ #category : #'initialize-release' }
PovSetter >> setListMethods [
	
	| liste tmp |
	liste := List new.
	liste
		addAll: (self inheritedMethodsFrom: selectedClass category: #'* pov').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'* pov')
		asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #pov).	"to ensure compatibility for models implemented with previous Cormas versions"
	1
		to: tmp size
		do:
			[:i | 
			tmp
				at: i
				put: (tmp at: i) asString , ' (' , selectedClass name asString , ')'].
	liste addAllFirst: tmp.
	self listMethods list: liste.
	liste isEmpty ifFalse: [listMethods selection: listMethods list first].
	listMethods selectionIndexHolder onChangeSend: #listMethodsChanged to:
			self
]

{ #category : #'initialize-release' }
PovSetter >> setListSymbols [
	
	| liste |
	listSymbols selectionIndexHolder onChangeSend: #listSymbolsChanged to:
			self.
	liste := List new.
	liste
		addAll: (selectedClass colorsDict keys collect: [:pov | pov asString]).
	(liste includes: selectedClass name asString)
		ifFalse: [liste addFirst: selectedClass name asString].
	self listSymbols list: liste sort.
	liste isEmpty ifFalse: [listSymbols selection: listSymbols list first]
]

{ #category : #'initialize-release' }
PovSetter >> setModelClass: aClass [
	
	selectedClass := aClass.
	self setListMethods.
	self setListSymbols.
	self setListInfo
]

{ #category : #changed }
PovSetter >> updateSlidersFromColor: aCol [
	
	aCol ifNil: [^nil].
	self blueSlider value: aCol blue.
	self greenSlider value: aCol green.
	self redSlider value: aCol red.
	self brightnessSlider value: aCol brightness
]

{ #category : #action }
PovSetter >> validate [
	
	self subclassResponsibility
]
