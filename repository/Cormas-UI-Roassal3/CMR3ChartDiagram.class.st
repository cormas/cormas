Class {
	#name : #CMR3ChartDiagram,
	#superclass : #CMSpRoassalPresenter,
	#instVars : [
		'chartBuilder',
		'probeNum',
		'probeLines',
		'title',
		'titleSize',
		'numberOfHorizontalTicks',
		'numberOfVerticalTicks',
		'xAxisLabelOffset',
		'yAxisLabelOffset',
		'newMaxX'
	],
	#category : #'Cormas-UI-Roassal3-Chart'
}

{ #category : #'instance creation' }
CMR3ChartDiagram class >> owner: anOwningPresenter on: aDomainObject [

	^ self basicNew
		owner: anOwningPresenter;
		setModelBeforeInitialization: aDomainObject;
		initialize;
		yourself
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> addAZeroDataSet [
	| xValue initialPlot |

	initialPlot := RSLinePlot new.
	xValue := {0} asOrderedCollection.
	initialPlot 
		x: xValue
		y: { 0 };
		color: Color blue trans.
	
	self chartBuilder 
		maxValueX: self newMaxX;
		addPlot: initialPlot;
		renderIn: self canvas.
]

{ #category : #accessing }
CMR3ChartDiagram >> addControllers: aCanvas [

	aCanvas
		addInteraction: RSCanvasController new";
		addInteraction: RSZoomToFitCanvasInteraction new;
		addInteraction: RSZoomableCanvasInteraction new;
		addInteraction: RSKeyNavigationCanvasInteraction new.
	aCanvas when: RSExtentChangedEvent do: [ 
		aCanvas camera zoomToFit: aCanvas extent.
		aCanvas signalUpdate ]."
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> addProbe: probeName ofClass: className color: aColor [
	" Private - Create a new line for the argument probeName with aColor. Obtain its y value from the cormas model "

	| linePlot xValues yValues probeValues |

	self flag: #todo. 
		" Why do we need the className ? "
		" Do we need to count probeNum ? "
		" How to connect lines with points as in R2 connectColor: ? "
	probeNum := probeNum + 1.
	linePlot := RSLinePlot new.
	probeValues := cormasModel probeAt: probeName.
	xValues := 0 to: probeValues size - 1.
	yValues := xValues collect: [ : x | self probeYValuesAt: x in: probeValues ].
	linePlot 
		x: xValues
		y: yValues;
		color: aColor.
	self probeLines add: linePlot.

]

{ #category : #public }
CMR3ChartDiagram >> addProbes [
	"hard method rebuilding all datasets at each refresh."

	| probesToDisplay |
	probeNum := 1.
	probesToDisplay := self cormasModelClass activeProbes asOrderedCollection.
	(self owner selectedProbes hasEqualElements: probesToDisplay)
		ifFalse: [ probesToDisplay addAll: (self owner selectedProbes difference: probesToDisplay) ].
	probesToDisplay do: [ : ap | 
		self 
			addProbe: ap
			ofClass: self cormasModelClass
			color: (self cormasModel colorOfProbe: ap) ]


]

{ #category : #accessing }
CMR3ChartDiagram >> chartBuilder [

	^ chartBuilder
		ifNil: [ chartBuilder := self newChartBuilder ]
]

{ #category : #accessing }
CMR3ChartDiagram >> chartBuilder: anObject [

	chartBuilder := anObject
]

{ #category : #accessing }
CMR3ChartDiagram >> cormasModelClass [ 

	^ self cormasModel class
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultNumberOfVerticalTicks [
	
	^ 2
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultTitle [
	" Private - Answer a <String> with the receiver's default title to appear inside the canvas "
	
	^ 'Probes for ' , self cormasModelClass name
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultTitleSize [
	" Private - Answer a <Number> with the receiver's default title size to appear inside the canvas "
	
	^ 15
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultXAxisLabelOffset [
	" Answer a <Point> representing the receiver's default X axis offset "
	
	^ 0 @ 5
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultYAxisLabelOffset [
	" Answer a <Point> representing the receiver's default Y axis offset "
	
	^ self minYValue @ self maxYValue
]

{ #category : #defaults }
CMR3ChartDiagram >> maxYValue [

	^ self scaleToMinMax
		ifTrue: [ self owner maxYValue ]
		ifFalse: [ self cormasModel perform: self cormasModelClass probes anyOne ]

]

{ #category : #defaults }
CMR3ChartDiagram >> minYValue [

	^ self owner minYValue
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> newBasicChartBuilder [
	" Private - Answer a new <RSChart> with the basic decorations and settings "
	
	^ RSChart new
		addDecoration: self newHorizontalTick;
		addDecoration: self newVerticalTick;
		addDecoration: (RSXLabelDecoration new title: 'Time'; offset: 0 @ self newMaxX);
		addDecoration: (RSYLabelDecoration new title: 'Value'; offset: 0 @ self maxYValue);
		minValueY: self minYValue;
		maxValueY: self maxYValue;
		yourself.
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> newChartBuilder [
	" Private - Answer a new <RSChart> with ticksAssoc as the number of X ticks"
	| newChart |
	
	newChart := self newBasicChartBuilder.
	CMApplicationPreferences settingShowProbesTitle
		ifTrue: [ newChart addDecoration: (RSChartTitleDecoration new title: self title; fontSize: self titleSize) ].
	^ newChart.
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> newHorizontalTick [
	" Answer a new <RSHorizontalTick> with default or applied settings "

	| hTick |
	
	hTick := RSHorizontalTick new 
			integer;
			yourself.
	CMApplicationPreferences settingFixedHorizontalTick
		ifTrue: [ hTick numberOfTicks: self numberOfHorizontalTicks ].
	^ hTick
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> newMaxX [

	^ newMaxX 
		ifNil: [ newMaxX := 10 ]
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> newVerticalTick [
	" Answer a new <RSVerticalTick> with default or applied settings "

	| verticalTick |
	
	verticalTick := RSVerticalTick new 
		doNotUseNiceLabel;
		yourself.
	verticalTick numberOfTicks: (CMApplicationPreferences settingFixedVerticalTick
		ifTrue: [  2 ]
		ifFalse: [ self numberOfVerticalTicks ]).
	^ verticalTick
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> numberOfHorizontalTicks [

	^ numberOfHorizontalTicks
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> numberOfHorizontalTicks: anObject [

	numberOfHorizontalTicks := anObject
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> numberOfVerticalTicks [

	^ numberOfVerticalTicks
		ifNil: [ numberOfVerticalTicks := self defaultNumberOfVerticalTicks ]
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> numberOfVerticalTicks: anObject [

	numberOfVerticalTicks := anObject
]

{ #category : #accessing }
CMR3ChartDiagram >> plotChart: aCanvas [

	self chartBuilder container: aCanvas.
	self addControllers: aCanvas.
]

{ #category : #accessing }
CMR3ChartDiagram >> probeLines [

	^ probeLines
		ifNil: [ probeLines := OrderedCollection new ]
]

{ #category : #accessing }
CMR3ChartDiagram >> probeLines: aCollection [

	probeLines := aCollection
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> probeYValuesAt: x in: probeValues [

"	| yValue |
	yValue := (probeValues at: x + 1) asFloat.
	^ yValue / (self maxYValue + yValue)"
	^ probeValues at: x + 1
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> scaleToMinMax [
	" Answer <true> if the receiver option to scale to entered min and max values is checked "
	
	^ self owner scaleToMinMax
]

{ #category : #initialization }
CMR3ChartDiagram >> setModelBeforeInitialization: aDomainObject [
	" Private - See superimplementor's comment "
	
	cormasModel := aDomainObject.
	self projectAnnouncer
		when: CMTimeChangedAnnouncement
		do: [ : ann | ann timeStep = 0 ifFalse: [ self timeChanged: ann timeStep ] ];

		when: CMSimInitializationAnnouncement 
		do: [ self timeChanged: 0 ].
	self addAZeroDataSet
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> timeChanged: aNewTimeStep [

	| probesToDisplay |

	"newMaxX := (aNewTimeStep max: 1) min: 10."
	newMaxX := aNewTimeStep.
	self canvas removeAllElements.
	self chartBuilder maxValueX: newMaxX + 1.	
	probesToDisplay := self cormasModelClass activeProbes asOrderedCollection.
	(self owner selectedProbes hasEqualElements: probesToDisplay)
		ifFalse: [ probesToDisplay addAll: (self owner selectedProbes difference: probesToDisplay) ].
	self halt.
	self probeLines: (probesToDisplay collect: [ : probeName | 
		| linePlot xValues yValues probeValues |
		linePlot := RSLinePlot new.
		probeValues := cormasModel probeAt: probeName.
		xValues := (0 to: probeValues size - 1) asArray.
		yValues := xValues collect: [ : x | probeValues at: x + 1 ].
		linePlot 
			x: xValues
			y: yValues;
			color: (self cormasModel colorOfProbe: probeName);
			yourself ]).
	self "selected"probeLines do: [ : probeLine | self chartBuilder addPlot: probeLine ].
	self chartBuilder plots
		ifNotEmpty: [ 
			self chartBuilder renderIn: self canvas.
			self canvas 
				"zoomToFit;"
				signalUpdate ]
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> title [
	" Answer a <String> with the receiver's title shown inside the canvas "
	
	^ title
		ifNil: [ title := self defaultTitle ]
]

{ #category : #accessing }
CMR3ChartDiagram >> title: aString [

	title := aString
]

{ #category : #accessing }
CMR3ChartDiagram >> titleSize [

	^ titleSize
		ifNil: [ titleSize := self defaultTitleSize ]
]

{ #category : #accessing }
CMR3ChartDiagram >> titleSize: anObject [

	titleSize := anObject
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> xAxisLabelOffset [

	^ xAxisLabelOffset
		ifNil: [ xAxisLabelOffset := self defaultXAxisLabelOffset ]
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> yAxisLabelOffset [
	" Answer a <Point> used to determine the minimum and maximum offsets of the Y axis "

	^ yAxisLabelOffset := self scaleToMinMax
		ifTrue: [ self minYValue @ self maxYValue ]
		ifFalse: [  self defaultYAxisLabelOffset ]
]
