Class {
	#name : #ChartsInterface,
	#superclass : #UIApplicationModel,
	#instVars : [
		'chartsView',
		'chartsList',
		'idList',
		'menuHolder',
		'levelClassName',
		'data',
		'cormasModel',
		'fromStep',
		'toStep',
		'fromSlider',
		'toSlider',
		'displayMarkers',
		'autoScale',
		'displayValues',
		'colorForGlobalProbes',
		'colorForLocalProbes',
		'cormasModel_data',
		'nbPts',
		'name',
		'simDescriptionText',
		'linkedSI',
		'startAt0'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'interface specs' }
ChartsInterface class >> barChart [
	"Tools.UIPainter new openOnClass: self andSelector: #barChart"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #charts 
				#defaultString: 'Charts - Histogram') 
			#min: #(Point 597 310) 
			#max: #(Point 1440 1068) 
			#bounds: #(Rectangle 640 531 1237 841) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 0 0.301508 -5 0 0 0.9866 0 0.870175) 
				#name: #charts 
				#model: #data 
				#chartType: #BG_BarChartView 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: '1' 
						#look: #(ChartElementLookSpec 
							#lineType: #solid)) #(ChartDataSetSpec 
						#aspect: #labels 
						#isData: false 
						#name: #(UserMessage 
							#key: #labels 
							#defaultString: 'Labels') 
						#isComputed: true) #(ChartDataSetSpec 
						#name: '2'))) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#restrictions: #(#auto #zero #div #log)) 
					#tickPosition: #tickOutside 
					#axisLine: true 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true) 
					#unit: '') 
				#legendPosition: 1) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0234506 0 0.171141 0 0.261307 0 0.52349) 
				#name: #chartsList 
				#model: #chartsList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(LayoutOrigin 16 0 0 0.0774194) 
				#name: #chartsNames 
				#label: 'Histograms'' names') #(LabelSpec 
				#layout: #(Point 58 204) 
				#name: #id 
				#label: 'Label') #(LabelSpec 
				#layout: #(Point 71 265) 
				#name: #idList 
				#label: 'Label'))))
]

{ #category : #resources }
ChartsInterface class >> menuChartsLevel [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuChartsLevel"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #levels 
			#defaultString: 'Level') 
		#nameKey: #level 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #global 
				#defaultString: 'Global') 
			#nameKey: #global 
			#value: #setGlobalChartsList) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #local 
				#defaultString: 'Local') 
			#nameKey: #local 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: ' ')) #(1) nil))) #(2) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #save 
			#defaultString: 'Save') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'duplicate this windows' 
			#value: #duplicate) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #asciiFile 
				#defaultString: 'Ascii file') 
			#value: #saveInAscii) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #excelFile 
				#defaultString: 'Excel file') 
			#value: #saveInExcel)) #(3) nil)) #(MenuItem 
		#rawLabel: 'Option' 
		#nameKey: #Option 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'display sim. information' 
			#value: #displaySimInformation) #(MenuItem 
			#rawLabel: 'displayMarkers' 
			#nameKey: #displayMarkers 
			#value: #displayMarkersOption 
			#indication: true 
			#indicationSelector: #displayMarkers 
			#helpText: 'display point markers on the curves') #(MenuItem 
			#rawLabel: 'change line color...' 
			#value: #changeProbeColor) #(MenuItem 
			#rawLabel: 'scale to min and max' 
			#nameKey: #autoScale 
			#value: #autoScaleOption 
			#indication: true 
			#indicationSelector: #autoScale 
			#helpText: 'adapt the Y axis at the minimum value') #(MenuItem 
			#rawLabel: 'display legend' 
			#nameKey: #displayLegend 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'top_right' 
				#nameKey: #top_right 
				#value: #displayLegendOption_top_right 
				#indication: true) #(MenuItem 
				#rawLabel: 'top_left' 
				#nameKey: #top_left 
				#value: #displayLegendOption_top_left) #(MenuItem 
				#rawLabel: 'bottom_right' 
				#nameKey: #bottom_right 
				#value: #displayLegendOption_bottom_right) #(MenuItem 
				#rawLabel: 'bottom_left' 
				#nameKey: #bottom_left 
				#value: #displayLegendOption_bottom_left) #(MenuItem 
				#rawLabel: 'hide' 
				#nameKey: #hide 
				#value: #displayLegendOption_hide)) #(4 1) nil)) #(MenuItem 
			#rawLabel: 'display values' 
			#nameKey: #displayValues 
			#value: #displayValuesOption 
			#indication: false) #(MenuItem 
			#rawLabel: 'start from step 0' 
			#nameKey: #startAt0 
			#value: #startAt0Option 
			#indication: true)) #(7) nil))) #(3) nil) decodeAsLiteralArray
]

{ #category : #resources }
ChartsInterface class >> menuProbe [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuProbe"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #levels 
			#defaultString: 'changeColor') 
		#value: #changeProbeColor 
		#helpText: 'click to change probe color')) #(1) nil) decodeAsLiteralArray
]

{ #category : #'interface specs' }
ChartsInterface class >> windDuplicate [
	"Tools.UIPainter new openOnClass: self andSelector: #windDuplicate"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #charts 
				#defaultString: 'Charts') 
			#min: #(Point 59 31) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1317 760) 
			#flags: 4 
			#menu: #menuHolder 
			#colors: #(LookPreferences 
				#setForegroundColor: nil 
				#setBackgroundColor: #(ColorValue 6553 6553 6553) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutFrame -33 0.25 2 0 -2 1 -39 1) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white))) #(ChartViewSpec 
				#layout: #(LayoutFrame -30 0.25 2 0 -2 1 -39 1) 
				#name: #charts 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700) 
					#setSelectionBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #data 
				#chartType: #BG_LineChartView 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: '1' 
						#look: #(ChartElementLookSpec 
							#markerType: #circle 
							#lineType: #solid)) #(ChartDataSetSpec 
						#aspect: #labels 
						#isData: false 
						#name: #(UserMessage 
							#key: #labels 
							#defaultString: 'Labels') 
						#isComputed: true) #(ChartDataSetSpec 
						#name: '2'))) 
				#options: #(LineChartOptionsSpec 
					#showMarker: true 
					#showLine: true 
					#dataLocation: #none) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#restrictions: #(#auto #zero #div #log)) 
					#tickPosition: #tickOutside 
					#axisLine: true 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true) 
					#unit: '' 
					#tickPosition: #hideTick 
					#borderLine: false) 
				#legendPosition: 3) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0100503 0 0.0986395 -35 0.25 0 0.608844) 
				#name: #chartsList 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #chartsList 
				#helpText: '' 
				#menu: #menuProbe 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(SequenceViewSpec 
				#layout: #(LayoutFrame 6 0 0 0.690476 70 0 -2 1) 
				#name: #idList 
				#model: #idList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.622449) 
				#name: #id 
				#label: 'id') #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.0136054) 
				#name: #chartsNames 
				#label: #(UserMessage 
					#key: #chartsNames 
					#defaultString: 'Charts names')) #(ResizingSplitterSpec 
				#layout: #(LayoutFrame -35 0.25 -2 0 -30 0.25 0 1) 
				#name: #ResizingSplitter1 
				#flags: 8 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#horizontal: false 
				#minAboveSize: 0 
				#minBelowSize: 0 
				#aboveWidgets: 'chartsList' 
				#belowWidgets: 'charts Region1 fromSlider toSlider ') #(ActionButtonSpec 
				#layout: #(LayoutFrame -113 1 -23 1 -53 1 0 1.0) 
				#name: #DefaultRange 
				#model: #defaultRange 
				#label: 'Default' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutFrame -91 1 -57 1 -16 1 -38 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #timeSteps 
					#defaultString: 'Time steps') 
				#style: #small) #(ActionButtonSpec 
				#layout: #(LayoutFrame -172 1 -23 1 -116 1 0 1.0) 
				#name: #Zoom 
				#model: #zoom 
				#label: 'Zoom' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutOrigin -352 1 -24 1) 
				#name: #from 
				#label: 'From:') #(LabelSpec 
				#layout: #(LayoutOrigin -259 1 -24 1) 
				#name: #to 
				#label: 'To:') #(InputFieldSpec 
				#layout: #(LayoutFrame -310 1 -23 1 -271 1 0 1.0) 
				#name: #fromStep 
				#model: #fromStep 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(LayoutFrame -229 1 -23 1 -186 1 0 1.0) 
				#name: #toStep 
				#model: #toStep 
				#type: #number 
				#formatString: '0') #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -39 1 -2 1 -30 1) 
				#name: #toSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #toSlider 
				#helpText: 'set the Stop step of the zoom' 
				#orientation: #horizontal) #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -30 1 -2 1 -22 1) 
				#name: #fromSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #fromSlider 
				#helpText: 'set the Start step of the zoom' 
				#orientation: #horizontal) #(ActionButtonSpec 
				#layout: #(LayoutFrame -440 1 -21 1 -390 1 0 0.993197) 
				#name: #duplicateButton 
				#model: #duplicate 
				#label: 'duplicate' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame -469 1 -23 1 -313 1 0 0.993197) 
				#name: #name 
				#isOpaque: true 
				#model: #name 
				#tabable: false 
				#isReadOnly: true))))
]

{ #category : #'interface specs' }
ChartsInterface class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #charts 
				#defaultString: 'Charts') 
			#min: #(Point 59 31) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 719 449 1316 759) 
			#flags: 4 
			#menu: #menuHolder 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutFrame -33 0.25 2 0 -2 1 -39 1) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white))) #(ChartViewSpec 
				#layout: #(LayoutFrame -30 0.25 2 0 -2 1 -39 1) 
				#name: #charts 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700) 
					#setSelectionBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #data 
				#chartType: #BG_LineChartView 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: '1' 
						#look: #(ChartElementLookSpec 
							#markerType: #circle 
							#lineType: #solid)) #(ChartDataSetSpec 
						#aspect: #labels 
						#isData: false 
						#name: #(UserMessage 
							#key: #labels 
							#defaultString: 'Labels') 
						#isComputed: true) #(ChartDataSetSpec 
						#name: '2'))) 
				#options: #(LineChartOptionsSpec 
					#showMarker: true 
					#showLine: true 
					#dataLocation: #none) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#restrictions: #(#auto #zero #div #log)) 
					#tickPosition: #tickOutside 
					#axisLine: true 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true) 
					#unit: '' 
					#tickPosition: #hideTick 
					#borderLine: false) 
				#legendPosition: 3) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0100503 0 0.0986395 -35 0.25 0 0.608844) 
				#name: #chartsList 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #chartsList 
				#helpText: '' 
				#menu: #menuProbe 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(SequenceViewSpec 
				#layout: #(LayoutFrame 6 0 0 0.690476 70 0 -2 1) 
				#name: #idList 
				#model: #idList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.622449) 
				#name: #id 
				#label: 'id') #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.0136054) 
				#name: #chartsNames 
				#label: #(UserMessage 
					#key: #chartsNames 
					#defaultString: 'Charts names')) #(ResizingSplitterSpec 
				#layout: #(LayoutFrame -35 0.25 -2 0 -30 0.25 0 1) 
				#name: #ResizingSplitter1 
				#flags: 8 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#horizontal: false 
				#minAboveSize: 0 
				#minBelowSize: 0 
				#aboveWidgets: 'chartsList' 
				#belowWidgets: 'charts Region1 fromSlider toSlider ') #(ActionButtonSpec 
				#layout: #(LayoutFrame -113 1 -23 1 -53 1 0 1.0) 
				#name: #DefaultRange 
				#model: #defaultRange 
				#label: 'Default' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutFrame -91 1 -57 1 -16 1 -38 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #timeSteps 
					#defaultString: 'Time steps') 
				#style: #small) #(ActionButtonSpec 
				#layout: #(LayoutFrame -172 1 -23 1 -116 1 0 1.0) 
				#name: #Zoom 
				#model: #zoom 
				#label: 'Zoom' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutOrigin -352 1 -24 1) 
				#name: #from 
				#label: 'From:') #(LabelSpec 
				#layout: #(LayoutOrigin -259 1 -24 1) 
				#name: #to 
				#label: 'To:') #(InputFieldSpec 
				#layout: #(LayoutFrame -310 1 -23 1 -271 1 0 1.0) 
				#name: #fromStep 
				#model: #fromStep 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(LayoutFrame -229 1 -23 1 -186 1 0 1.0) 
				#name: #toStep 
				#model: #toStep 
				#type: #number 
				#formatString: '0') #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -39 1 -2 1 -30 1) 
				#name: #toSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #toSlider 
				#helpText: 'set the Stop step of the zoom' 
				#orientation: #horizontal) #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -30 1 -2 1 -22 1) 
				#name: #fromSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #fromSlider 
				#helpText: 'set the Start step of the zoom' 
				#orientation: #horizontal) #(ActionButtonSpec 
				#layout: #(LayoutFrame -430 1 -21 1 -370 1 0 1) 
				#name: #duplicateButton 
				#model: #duplicate 
				#label: 'Duplicate' 
				#defaultable: true))))
]

{ #category : #menus }
ChartsInterface >> autoScale [
	
	^autoScale ifNil: [autoScale := false]
]

{ #category : #menus }
ChartsInterface >> autoScale: aBool [
	
	autoScale := aBool.
	aBool
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #autoScale)
				beOff.
			chartsView grid y autoScale.
			chartsView grid y scale zero: 0]
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #autoScale)
				beOn.
			chartsView grid y manualScale].
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> autoScaleOption [
	
	self autoScale: self autoScale not
]

{ #category : #aspects }
ChartsInterface >> betweenLabels [
	
	self nbPts <= 10 ifTrue: [^1].
	self nbPts <= 50 ifTrue: [^5].
	self nbPts <= 100 ifTrue: [^10].
	self nbPts <= 500 ifTrue: [^25].
	^50
]

{ #category : #menus }
ChartsInterface >> changeProbeColor [
	
	| dialog isGlobal targetClass |
	isGlobal := self levelClassName = cormasModel class name.
	dialog := MultiColorChooser new.
	isGlobal
		ifTrue: [dialog setElementColorDictionary: self colorForGlobalProbes]
		ifFalse: [dialog setElementColorDictionary: self colorForLocalProbes].
	self chartsList selections isEmpty
		ifFalse:
			[dialog listElements selection: self chartsList selections first].
	dialog open.
	self updateChartsDisplay.
	isGlobal
		ifTrue:
			[self colorForGlobalProbes
				keysAndValuesDo: [:k :v | cormasModel setColor: v forProbe: k]]
		ifFalse:
			[self colorForLocalProbes
				keysAndValuesDo:
					[:k :v | 
					targetClass := levelClassName class.
					targetClass setColor: v forProbe: k]]
]

{ #category : #aspects }
ChartsInterface >> chartsList [
	
	chartsList isNil ifTrue: [^chartsList := MultiSelectionInList new].
	^chartsList
]

{ #category : #aspects }
ChartsInterface >> chartsList: aMultiSelectionInList [
	
	chartsList := aMultiSelectionInList
]

{ #category : #accessing }
ChartsInterface >> colorForGlobalProbes [
	
	^colorForGlobalProbes
		ifNil:
			[colorForGlobalProbes := Dictionary new.
			self initColorForGlobalProbes]
]

{ #category : #accessing }
ChartsInterface >> colorForGlobalProbes: anObject [
	
	colorForGlobalProbes := anObject
]

{ #category : #accessing }
ChartsInterface >> colorForLocalProbes [
	
	^colorForLocalProbes
		ifNil:
			[colorForLocalProbes := Dictionary new.
			self initColorForLocalProbes]
]

{ #category : #accessing }
ChartsInterface >> cormasModel_data [
	
	^cormasModel_data ifNil: [cormasModel data]
]

{ #category : #accessing }
ChartsInterface >> cormasModel_data: aDictionary [
	
	cormasModel_data := aDictionary
]

{ #category : #aspects }
ChartsInterface >> data [
	
	data isNil ifTrue: [^data := List new asValue].
	^data
]

{ #category : #aspects }
ChartsInterface >> data: aValueHolder [
	
	data := aValueHolder
]

{ #category : #accessing }
ChartsInterface >> dataAsDictionary [
	"return a dictionary of the data: probe name as key and values"
	
	self levelClassName = cormasModel class name
		ifFalse: [^self localDataAsDictionary]
		ifTrue: [^self globalDataAsDictionary]
]

{ #category : #accessing }
ChartsInterface >> defaultRange [
	
	self fromStep
		value:
			(self startAt0
				ifTrue: [0]
				ifFalse: [1]).
	self toStep value: self nbPts - 1.
	self zoom
]

{ #category : #menus }
ChartsInterface >> displayLegendOption_bottom_left [
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 13.
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayLegendOption_bottom_right [
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 14.
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayLegendOption_hide [
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	chartsView legendLocation: 0.
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayLegendOption_top_left [
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 1.
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayLegendOption_top_right [
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 3.
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayMarkers [
	
	^displayMarkers ifNil: [displayMarkers := false]
]

{ #category : #menus }
ChartsInterface >> displayMarkers: aBool [
	
	displayMarkers := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayMarkers) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayMarkers) beOff].
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayMarkersOption [
	
	self displayMarkers: self displayMarkers not
]

{ #category : #menus }
ChartsInterface >> displaySimInformation [
	
	cormasModel_data isNil
		ifTrue:
			[cormasModel displaySimInformation.
			cormasModel getSimDescriptionText]
		ifFalse:
			[ComposedTextView
				open: self simDescriptionText asValue
				label: '* About Current Simulation * '
				icon: (Icon constantNamed: #workspace)
				extent: 400 @ 200]	"display information on the current simulation"
]

{ #category : #menus }
ChartsInterface >> displayValues [
	
	^displayValues ifNil: [displayValues := false]
]

{ #category : #menus }
ChartsInterface >> displayValues: aBool [
	
	displayValues := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayValues) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayValues) beOff].
	self updateChartsDisplay
]

{ #category : #menus }
ChartsInterface >> displayValuesOption [
	
	self displayValues: self displayValues not
]

{ #category : #duplicate }
ChartsInterface >> duplicate [
	"open a copy of this interface"
	
	| newInterface aName |
	newInterface := self class new.	"cormasModel cormas displayChartsWin add: newInterface."
	newInterface initialize: cormasModel.
	newInterface cormasModel_data: self cormasModel_data copy.
	newInterface nbPts: self nbPts.
	newInterface name value = ''
		ifTrue: [aName := 'Sim' , cormasModel simNumero printString]
		ifFalse: [aName := newInterface name value].
	aName := Dialog
		request: 'Choose a name for the duplicated windows?'
		initialAnswer: aName
		onCancel: [^nil].
	newInterface name value: aName.
	newInterface openInterface: #windDuplicate.
	self simDescriptionText isNil
		ifTrue:
			[newInterface setSimDescriptionText: cormasModel getSimDescriptionText]
		ifFalse: [newInterface simDescriptionText: self simDescriptionText].
	newInterface levelClassName: self levelClassName.
	newInterface chartsList selectionIndexes: self chartsList selectionIndexes.
	newInterface updateChartsDisplay
]

{ #category : #aspects }
ChartsInterface >> fromSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^fromSlider isNil
		ifTrue: [fromSlider := 0 asValue]
		ifFalse: [fromSlider]
]

{ #category : #aspects }
ChartsInterface >> fromStep [
	
	fromStep isNil ifTrue: [^fromStep := 0 asValue].
	fromStep value < 0 ifTrue: [^fromStep value: 0].
	fromStep value > (self nbPts - 2)
		ifTrue: [^fromStep value: (self nbPts - 2 max: 0)].
	^fromStep
]

{ #category : #save }
ChartsInterface >> getTimeSteps [
	"return a collection of number corresponding to the time steps, fromStep - toStep.
ex: ('time' 0 1 2 3 4 5 6)"
	
	| coll |
	coll := OrderedCollection new.
	self fromStep value
		to: self toStep value
		do: [:i | coll add: i].
	^coll
]

{ #category : #accessing }
ChartsInterface >> globalDataAsDictionary [
	"return a dictionary of the data: probe name as key and values"
	
	| noms valeurs coll dico |
	dico := Dictionary new.
	noms := chartsList selections.
	valeurs := data value.
	1
		to: noms size
		do:
			[:i | 
			coll := OrderedCollection new.
			valeurs do: [:aList | coll add: (aList at: i)].
			dico
				at: (noms at: i)
				put: coll].
	^dico
]

{ #category : #histogram }
ChartsInterface >> histogramsList [
	
	
]

{ #category : #aspects }
ChartsInterface >> idList [
	
	idList isNil ifTrue: [^idList := MultiSelectionInList new].
	^idList
]

{ #category : #'initialize-release' }
ChartsInterface >> initColorForGlobalProbes [
	
	| probe color |
	1
		to: chartsList list size
		do:
			[:index | 
			probe := chartsList list at: index.
			self colorForGlobalProbes
				at: probe
				ifAbsentPut:
					[color := cormasModel colorOfProbe: probe.
					color
						ifNil:
							[color := CMEntity
								colorWithout: #white
								OfNumber: 23 + index	"start with red (24)"].
					color]].
	^colorForGlobalProbes
]

{ #category : #'initialize-release' }
ChartsInterface >> initColorForLocalProbes [
	
	| probe color targetClass |
	1
		to: chartsList list size
		do:
			[:index | 
			probe := chartsList list at: index.
			colorForLocalProbes
				at: probe
				ifAbsentPut:
					[targetClass := levelClassName class.
					color := targetClass colorOfProbe: probe.
					color
						ifNil:
							[color := CMEntity
								colorWithout: #white
								OfNumber: 23 + index	"start with red (24)"].
					color]].
	^colorForLocalProbes
]

{ #category : #menus }
ChartsInterface >> initMenu [
	
	| listEntities menuDyn menuEntities |
	cormasModel globalCharts isEmpty
		ifTrue:
			[((self menuHolder value atNameKey: #level) submenu atNameKey: #global)
				disable]
		ifFalse:
			[((self menuHolder value atNameKey: #level) submenu atNameKey: #global)
				enable.
			self setGlobalChartsList].
	listEntities := OrderedCollection new.
	cormasModel allEntityClasses
		do:
			[:cl | 
			(cormasModel localChartsForEntity: cl name) isEmpty
				ifFalse: [listEntities add: cl name]].
	menuDyn := (self menuHolder value atNameKey: #level) submenu atNameKey:
			#local.
	menuEntities := RTMenu new.
	1
		to: listEntities size
		do:
			[:i | 
			| entity | 
			entity := listEntities at: i.
			menuEntities
				addItemLabel: entity asString
				value: [self setLocalChartsListFor: entity]].
	listEntities isEmpty
		ifFalse:
			[menuDyn
				enable;
				submenu: menuEntities.
			cormasModel globalCharts isEmpty
				ifTrue: [self setLocalChartsListFor: listEntities first]]
		ifTrue: [menuDyn disable]
]

{ #category : #'initialize-release' }
ChartsInterface >> initialize: model [
	
	super initialize.
	cormasModel := model.
	self menuHolder: self class menuChartsLevel asValue.
	self chartsList selectionIndexHolder onChangeSend: #updateChartsDisplay
		to: self.
	self idList selectionIndexHolder onChangeSend: #updateLocalChartsDisplay
		to: self.
	fromSlider := RangeAdaptor
		on: self fromStep
		start: 0
		stop: model class timeStep
		grid: 1.
	toSlider := RangeAdaptor
		on: self toStep
		start: 0
		stop: model class timeStep
		grid: -1
]

{ #category : #'initialize-release' }
ChartsInterface >> initializeSlidersFrom: start to: stop [
	
	toSlider
		rangeStart: start;
		rangeStop: stop.
	fromSlider
		rangeStart: start;
		rangeStop: stop.
	self toStep value: stop.
	self fromStep value: start
]

{ #category : #aspects }
ChartsInterface >> labels [
	
	| indice |
	^(PluggableAdaptor new)
		getBlock:
				[:m | 
				indice := self data value indexOf: m.
				indice \\ self betweenLabels = 0
					ifTrue: [indice printString]
					ifFalse: ['']]
			putBlock: [:b :v | ]
			updateBlock: [:b :a :p | false];
		yourself
]

{ #category : #accessing }
ChartsInterface >> levelClassName [
	
	^levelClassName
]

{ #category : #accessing }
ChartsInterface >> levelClassName: aClass [
	
	levelClassName := aClass
]

{ #category : #accessing }
ChartsInterface >> linkedSI [
	
	^linkedSI
]

{ #category : #accessing }
ChartsInterface >> linkedSI: anObject [
	
	linkedSI := anObject
]

{ #category : #accessing }
ChartsInterface >> localDataAsDictionary [
	"return a dictionary of the data: probe name as key and a sub dictionary where the key is the ID of the entity and coll is a collection of values"
	
	| dico noms lesIDs valeurs coll nomsEtIDs subdico timeValues colls |
	dico := Dictionary new.
	noms := chartsList selections.
	lesIDs := idList selections.
	valeurs := data value.
	nomsEtIDs := OrderedCollection new.
	lesIDs
		do: [:id | noms do: [:aNom | nomsEtIDs add: (Array with: aNom with: id)]].
	valeurs := data value.
	timeValues := OrderedCollection new.
	1
		to: nomsEtIDs size
		do:
			[:i | 
			coll := OrderedCollection new.
			coll add: (nomsEtIDs at: i) first.
			coll add: (nomsEtIDs at: i) last.
			valeurs do: [:aList | coll add: (aList at: i)].
			timeValues add: coll].
	noms
		do:
			[:aNom | 
			subdico := Dictionary new.
			dico at: aNom put: subdico.
			colls := timeValues select: [:col | col first = aNom].
			colls
				do:
					[:aColl | 
					| ident |
					ident := aColl at: 2.
					aColl removeFirst.
					aColl removeFirst.
					subdico at: ident put: aColl]].
	^dico
]

{ #category : #private }
ChartsInterface >> majIdList [
	
	idList
		list:
			((self cormasModel_data at: self levelClassName)
				at:
					(self cormasModel_data at: self levelClassName) keys asOrderedCollection
						first) keys asList
]

{ #category : #accessing }
ChartsInterface >> menuHolder [
	
	^menuHolder
]

{ #category : #accessing }
ChartsInterface >> menuHolder: t1 [
	
	menuHolder := t1.
	^self
]

{ #category : #aspects }
ChartsInterface >> name [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^name isNil
		ifTrue: [name := String new asValue]
		ifFalse: [name]
]

{ #category : #accessing }
ChartsInterface >> nbPts [
	
	^nbPts ifNil: [cormasModel timeStep + 1]
]

{ #category : #accessing }
ChartsInterface >> nbPts: anInteger [
	
	nbPts := anInteger
]

{ #category : #'interface opening' }
ChartsInterface >> openHistogramWindow [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point to an incorrect position in 
	the file. The file may have been modified after this method was updated."
	
	(self cormasModel_data includesKey: #Histogram)
		ifTrue:
			[self openInterface: #barChart	"	self setLocalChartsListFor: t1.
			self chartsList selections: (cormasModel class environment at: t1) probes asList.
			self idList selections: t2 asList"].
	^self
]

{ #category : #'interface opening' }
ChartsInterface >> openOnEntity: entityName numbers: ids [
	
	(self cormasModel_data includesKey: entityName)
		ifTrue:
			[self open.
			self setLocalChartsListFor: entityName.
			self chartsList
				selections: entityName class probes asList.
			self idList selections: ids asList]
]

{ #category : #'interface opening' }
ChartsInterface >> postBuildWith: anUIBuilder [
	
	chartsView := (anUIBuilder componentAt: #charts) widget.
	(anUIBuilder componentAt: #chartsNames) beInvisible.
	(anUIBuilder componentAt: #chartsList) beInvisible.
	(anUIBuilder componentAt: #id) beInvisible.
	(anUIBuilder componentAt: #idList) beInvisible.
	self initMenu.
	chartsView grid y manualScale
]

{ #category : #private }
ChartsInterface >> refreshAfterStep [
	"self fromStep value: (self startAt0 ifTrue:[ 0] ifFalse:[1])."
	
	self toStep value: self nbPts - 1.
	self zoom
]

{ #category : #'binary storage' }
ChartsInterface >> representBinaryOn: bos [
	
	self halt
]

{ #category : #'interface opening' }
ChartsInterface >> requestForWindowClose [
	
	cormasModel cormas isNil
		ifFalse:
			[cormasModel cormas displayChartsWin
				remove: self
				ifAbsent: [nil]].
	cormasModel := nil.
	^super requestForWindowClose
]

{ #category : #save }
ChartsInterface >> saveInAscii [
	
	self levelClassName = cormasModel class name
		ifFalse:
			[DataSaver_Asci
				saveLocalData: self localDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
		ifTrue:
			[DataSaver_Asci
				saveGlobalData: self globalDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
]

{ #category : #save }
ChartsInterface >> saveInExcel [
	
	self levelClassName = cormasModel class name
		ifTrue:
			[DataSaver_Excel
				saveGlobalData: self globalDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
		ifFalse:
			[DataSaver_Excel
				saveLocalData: self localDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
]

{ #category : #private }
ChartsInterface >> setDataSerie: index chart: aProbe id: id lineStyle: aSymbol color: aColor label: aName [
	"index = <int> aProbe = <Symbol> id = <int> lineStyle: <Symbol>  aColor = <aColorValue> aName = <String>"
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dataSet := ((self cormasModel_data at: self levelClassName) at: aProbe)
		at: id.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	^Array with: newDescriptor with: dataSet
]

{ #category : #display }
ChartsInterface >> setDataSerie: index chart: aProbe id: id lineStyle: aSymbol label: aName foregroundColor: fgColor backgroundColor: bgColor markerType: markerSymbol [
	"index = <int> aProbe = <Symbol> id = <int> lineStyle: <Symbol>  aColor = <aColorValue> aName = <String>"
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		markerType: markerSymbol;
		backgroundColor: bgColor;
		foregroundColor: fgColor;
		name: aName.
	dataSet := (self cormasModel_data at: self levelClassName) at: aProbe.
	dataSet isEmpty
		ifTrue: [dataSet := OrderedCollection new]
		ifFalse: [dataSet := (dataSet at: id) copy].	"dataSet := (((cormasModel data at: self levelClassName) at: aProbe) at: id) copy."
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet
]

{ #category : #private }
ChartsInterface >> setDataSerie: index chart: aChartName lineStyle: aSymbol label: aName color: aColor [
	
	| newDescriptor dataSet |
	newDescriptor := BG_ChartDataSetDescription new.
	newDescriptor
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dataSet := (self cormasModel_data at: self levelClassName) at: aChartName.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	^Array with: newDescriptor with: dataSet
]

{ #category : #display }
ChartsInterface >> setDataSerie: index chart: aChartName lineStyle: aSymbol label: aName foregroundColor: fgColor backgroundColor: bgColor markerType: markerSymbol [
	
	| newDescriptor dataSet |
	newDescriptor := BG_ChartDataSetDescription new.
	newDescriptor
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		markerType: markerSymbol;
		backgroundColor: bgColor;
		foregroundColor: fgColor;
		name: aName.
	dataSet := ((self cormasModel_data at: self levelClassName) at: aChartName)
		copy.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet
]

{ #category : #zoom }
ChartsInterface >> setDataSerieZoom: index chart: aChartName id: x lineStyle: aSymbol color: aColor label: aName [
	
	| newDescriptor dataSet dico |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dico := (self cormasModel_data at: self levelClassName) at: aChartName.
	dataSet := (dico
		at: x
		ifAbsent: [OrderedCollection new]) copy.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet
]

{ #category : #zoom }
ChartsInterface >> setDataSerieZoom: index chart: aChartName lineStyle: aSymbol label: aName [
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		name: aName.
	dataSet := ((self cormasModel_data at: self levelClassName) at: aChartName)
		copy.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet
]

{ #category : #menus }
ChartsInterface >> setGlobalChartsList [
	
	self levelClassName: cormasModel class name.
	self chartsList list: cormasModel globalCharts asSortedCollection asList.
	(self builder componentAt: #chartsNames) beVisible.
	(self builder componentAt: #chartsList) beVisible.
	(self builder componentAt: #id) beInvisible.
	(self builder componentAt: #idList) beInvisible.
	self builder window
		label: 'Charts - Global Level' , '     ' , self name value
]

{ #category : #histogram }
ChartsInterface >> setHistogramDataSerie: t1 chart: t2 lineStyle: t3 label: t4 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point to an incorrect position in 
	the file. The file may have been modified after this method was updated."
	
	| xAxe classes indiData yAxe temp |
	xAxe := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: t1);
		lineType: t3;
		name: t4.
	classes := ((self cormasModel_data at: #Histogram) at: t2) first.
	indiData := ((self cormasModel_data at: #Histogram) at: t2) last.
	yAxe := OrderedCollection new.
	classes
		do:
			[:v | 
			temp := indiData select: [:i | i < v].
			yAxe add: temp size.
			indiData removeAll: temp].
	yAxe add: indiData size.
	^Array with: xAxe with: yAxe
]

{ #category : #menus }
ChartsInterface >> setLocalChartsListFor: entity [
	
	| chartsToBeDisplayed |
	self levelClassName: entity.
	chartsToBeDisplayed := (self linkedSI isNil
		or: [self linkedSI siConfig isNil])
		ifTrue: [(self cormasModel_data at: entity) keys]
		ifFalse:
			[self linkedSI siConfig
				probeMethodsFor: entity class].
	self chartsList list: chartsToBeDisplayed asSortedCollection asList.
	self majIdList.
	(self builder componentAt: #chartsNames) beVisible.
	(self builder componentAt: #chartsList) beVisible.
	(self builder componentAt: #id) beVisible.
	(self builder componentAt: #idList) beVisible.
	self builder window
		label:
			'Charts - ' , self levelClassName asString , '     ' , self name value
]

{ #category : #duplicate }
ChartsInterface >> setSimDescriptionText: basicText [
	
	| txt |
	txt := basicText.
	txt := txt , 'Simul. name: ' , (String with: Character tab)
		, (self name value asText emphasizeAllWith: #italic) withCRs asText.
	self simDescriptionText: txt
]

{ #category : #display }
ChartsInterface >> setYScaleMin: min max: max [
	"scale the Y axis between min and max. If autoscale (menu Option) is true, uses the default autoscale with 0 as minimum value, otherwise use the min value of the data as min"
	
	self autoScale
		ifFalse: [chartsView grid y scale autoMin: min max: max]
		ifTrue:
			[| aMin aMax |
			aMin := min floor.
			aMax := max ceiling.
			aMin = aMax ifTrue: [aMax := aMax + 10].
			chartsView grid y scale zero: aMin.
			(aMax - aMin) abs <= 1
				ifTrue:
					[| diff |
					diff := (max - min) / 3.
					chartsView grid y scale
						sourceMin: min - diff
						max: max + diff.
					chartsView grid y scale step: ((diff * 100) rounded / 100) asFloat]
				ifFalse:
					[chartsView grid y scale
						sourceMin: aMin
						max: aMax + 1.	"- ((aMax - aMin)/50)"
					chartsView grid y scale step: ((aMax - aMin) / 10) rounded]]
]

{ #category : #accessing }
ChartsInterface >> simDescriptionText [
	
	^simDescriptionText
]

{ #category : #accessing }
ChartsInterface >> simDescriptionText: anObject [
	
	simDescriptionText := anObject
]

{ #category : #menus }
ChartsInterface >> startAt0 [
	
	^startAt0 ifNil: [startAt0 := true]
]

{ #category : #menus }
ChartsInterface >> startAt0: aBool [
	
	startAt0 := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #startAt0)
				beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #startAt0)
				beOff].
	self defaultRange
]

{ #category : #menus }
ChartsInterface >> startAt0Option [
	
	self startAt0: self startAt0 not
]

{ #category : #aspects }
ChartsInterface >> toSlider [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^toSlider isNil
		ifTrue: [toSlider := 0 asValue]
		ifFalse: [toSlider]
]

{ #category : #aspects }
ChartsInterface >> toStep [
	
	toStep isNil ifTrue: [^toStep := cormasModel timeStep asValue].
	toStep value > (self nbPts - 1) ifTrue: [^toStep value: self nbPts - 1].
	^toStep
]

{ #category : #display }
ChartsInterface >> updateChartsDisplay [
	
	| fromMem toMem |
	fromMem := self fromStep value.
	toMem := self toStep value.
	self
		initializeSlidersFrom: 0
		to: self nbPts - 1.
	self levelClassName = cormasModel class name
		ifTrue: [self updateGlobalChartsDisplay]
		ifFalse: [self updateLocalChartsDisplay].
	self fromStep value: fromMem.
	self toStep value: toMem.
	self zoom
]

{ #category : #display }
ChartsInterface >> updateGlobalChartsDisplay [
	
	| collecDataSeries newDescriptors res min max markers probe |
	chartsList selections isEmpty ifTrue: [^self data value: List new].
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) first].
	max := min.
	markers := #(#circle #triangle #square #triangle2 #diamond).
	newDescriptors := OrderedCollection new.
	1
		to: chartsList selections size
		do:
			[:index | 
			probe := chartsList selections at: index.
			res := self
				setDataSerie: index
				chart: probe
				lineStyle: #solid
				label: probe asString
				foregroundColor:
					(self colorForGlobalProbes
						at: probe
						ifAbsent: [nil])
				backgroundColor: ColorValue red
				markerType:
					(markers
						at:
							(Cormas
								number: index
								onCycle: markers size)).	"(CormasNS.Kernel.Entity darkColorOfNumber: index * 3)"
			newDescriptors add: res first.
			res last
				with: collecDataSeries
				do:
					[:x :set | 
					set add: x.
					x < min ifTrue: [min := x].
					x > max ifTrue: [max := x]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self displayValues
		ifTrue: [chartsView dataInside]
		ifFalse: [chartsView hideData].	"chartsView dataStyle textStyle scalingFactor: 1."
	self displayMarkers
		ifTrue: [chartsView showMarker]
		ifFalse: [chartsView hideMarker].
	self data value: collecDataSeries asList
]

{ #category : #zoom }
ChartsInterface >> updateGlobalChartsDisplayZoom [
	
	| collecDataSeries newDescriptors res min max |
	chartsList selections isEmpty ifTrue: [^self data value: List new].
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) first].
	max := min.
	newDescriptors := OrderedCollection new.
	1
		to: chartsList selections size
		do:
			[:index | 
			res := self
				setDataSerieZoom: index
				chart: (chartsList selections at: index)
				lineStyle: #solid
				label: (chartsList selections at: index) asString.
			newDescriptors add: res first.
			res last
				with: collecDataSeries
				do:
					[:x :set | 
					set add: x.
					x < min ifTrue: [min := x].
					x > max ifTrue: [max := x]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self data value: collecDataSeries asList
]

{ #category : #display }
ChartsInterface >> updateGlobalChartsDisplay_old [
	
	| collecDataSeries newDescriptors res min max markers |
	chartsList selections isEmpty ifTrue: [^self data value: List new].
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) first].
	max := min.
	markers := #(#circle #triangle #square #triangle2 #diamond).
	newDescriptors := OrderedCollection new.
	1
		to: chartsList selections size
		do:
			[:index | 
			res := self
				setDataSerie: index
				chart: (chartsList selections at: index)
				lineStyle: #solid
				label: (chartsList selections at: index) asString
				foregroundColor: ColorValue yellow
				backgroundColor: ColorValue red
				markerType:
					(markers
						at:
							(Cormas
								number: index
								onCycle: markers size)).	"(CormasNS.Kernel.Entity colorWithout: #white OfNumber: 23 + index)"	"start with red (24)"	"(CormasNS.Kernel.Entity darkColorOfNumber: index * 3)"
			newDescriptors add: res first.
			res last
				with: collecDataSeries
				do:
					[:x :set | 
					set add: x.
					x < min ifTrue: [min := x].
					x > max ifTrue: [max := x]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self displayValues
		ifTrue: [chartsView dataInside]
		ifFalse: [chartsView hideData].	"chartsView dataStyle textStyle scalingFactor: 1."
	self displayMarkers
		ifTrue: [chartsView showMarker]
		ifFalse: [chartsView hideMarker].
	self data value: collecDataSeries asList
]

{ #category : #histogram }
ChartsInterface >> updateHistogramChartsDisplay [
	
	| t1 t4 t5 t2 t3 |
	chartsList selections isEmpty
		ifTrue: [self data value: List new]
		ifFalse:
			[t1 := OrderedCollection new.
			t4 := 1.
			t5 := ((self cormasModel_data at: #Histogram)
				at: (chartsList selections at: 1)) first size + 1.
			[t4 <= t5]
				whileTrue:
					[t1 add: List new.
					t4 := t4 + 1].
			t2 := OrderedCollection new.
			t3 := self
				setHistogramDataSerie: 1
				chart: (chartsList selections at: 1)
				lineStyle: #solid
				label: (chartsList selections at: 1) asString.
			t2 add: t3 first.
			t3 last
				with: t1
				do: [:t8 :t9 | t9 add: t8].
			self halt.
			chartsView descriptors: t2 asArray.
			self data value: t3 asList].
	^self
]

{ #category : #display }
ChartsInterface >> updateLocalChartsDisplay [
	
	| collecDataSeries newDescriptors styles res min max markers probe |
	(chartsList selections isNil
		or:
			[chartsList selections isEmpty
				or: [idList selections isNil or: [idList selections isEmpty]]])
		ifTrue: [^self data value: List new].
	styles := #(#solid #dotted #dashed #broken #dotted2 #dashed2 #broken2).
	markers := #(#circle #triangle #square #triangle2 #diamond).
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[(((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) at: idList selections first) first].
	max := min.
	newDescriptors := OrderedCollection new.
	1
		to: idList selections size
		do:
			[:id | 
			1
				to: chartsList selections size
				do:
					[:j | 
					probe := chartsList selections at: j.
					res := self
						setDataSerie: (id - 1) * chartsList selections size + j
						chart: (chartsList selections at: j)
						id: (idList selections at: id)
						lineStyle:
							(styles
								at:
									(Cormas
										number: id
										onCycle: styles size))
						label:
							(chartsList selections size = 1
								ifTrue: [(idList selections at: id) printString]
								ifFalse:
									[(idList selections at: id) printString , ':'
										, (chartsList selections at: j) asString])
						foregroundColor:
							(self colorForLocalProbes
								at: probe
								ifAbsent: [nil])
						backgroundColor: (CMEntity darkColorOfNumber: id + j)
						markerType:
							(markers
								at:
									(Cormas
										number: j
										onCycle: markers size)).	"CormasNS.Kernel.Entity colorWithout: #white OfNumber: 23 + id"
					newDescriptors add: res first.
					res last
						with: collecDataSeries
						do:
							[:x :set | 
							set add: x.
							x < min ifTrue: [min := x].
							x > max ifTrue: [max := x]]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self displayValues
		ifTrue: [chartsView dataInside]
		ifFalse: [chartsView hideData].
	self displayMarkers
		ifTrue: [chartsView showMarker]
		ifFalse: [chartsView hideMarker].
	self data value: collecDataSeries asList
]

{ #category : #zoom }
ChartsInterface >> updateLocalChartsDisplayZoom [
	
	| collecDataSeries newDescriptors styles res min max |
	(chartsList selections isNil
		or:
			[chartsList selections isEmpty
				or: [idList selections isNil or: [idList selections isEmpty]]])
		ifTrue: [^self data value: List new].
	styles := #(#solid #dotted #dashed #broken #dotted2 #dashed2 #broken2).
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[(((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) at: idList selections first) first].
	max := min.
	newDescriptors := OrderedCollection new.
	1
		to: idList selections size
		do:
			[:id | 
			1
				to: chartsList selections size
				do:
					[:j | 
					res := self
						setDataSerieZoom: (id - 1) * chartsList selections size + j
						chart: (chartsList selections at: j)
						id: (idList selections at: id)
						lineStyle: (styles at: (j min: styles size))
						color:
							(CMEntity
								colorWithout: #white
								OfNumber: 23 + id)
						label:
							(chartsList selections size = 1
								ifTrue: [(idList selections at: id) printString]
								ifFalse:
									[(idList selections at: id) printString , ':'
										, (chartsList selections at: j) asString]).
					newDescriptors add: res first.
					res last
						with: collecDataSeries
						do:
							[:x :set | 
							set add: x.
							x < min ifTrue: [min := x].
							x > max ifTrue: [max := x]]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self data value: collecDataSeries asList
]

{ #category : #display }
ChartsInterface >> zoom [
	
	self toStep value < self fromStep value
		ifTrue: [self toStep value: self nbPts - 1].
	self
		initializeSlidersFrom: self fromStep value
		to: self toStep value.
	self levelClassName = cormasModel class name
		ifTrue: [self updateGlobalChartsDisplay]
		ifFalse: [self updateLocalChartsDisplay]	"ifTrue: [self updateGlobalChartsDisplayZoom]
		ifFalse: [self updateLocalChartsDisplayZoom]."
]
