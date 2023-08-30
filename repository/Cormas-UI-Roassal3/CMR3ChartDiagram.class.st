Class {
	#name : #CMR3ChartDiagram,
	#superclass : #CMSpRoassalPresenter,
	#instVars : [
		'chartBuilder',
		'probeLines',
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
		initialize;
		setModel: aDomainObject;
		yourself
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> addAZeroDataSet [
	" Private - The receiver was opened but there is no simulation data yet. Add an initial line plot "

	| xValue initialPlot |

	initialPlot := RSLinePlot new.
	xValue := {0} asOrderedCollection.
	initialPlot 
		x: xValue
		y: { 0 };
		color: Color blue.
	
	chartBuilder 
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
CMR3ChartDiagram >> addDataSet [
	" Private - The receiver was opened but the model already has simulation data. Replicate into the diagram "

	chartBuilder maxValueX: self cormasModel timeStep.
	self updateYAxis.

	self updateProbes.
]

{ #category : #accessing }
CMR3ChartDiagram >> chartBuilder [

	^ chartBuilder
]

{ #category : #accessing }
CMR3ChartDiagram >> chartBuilder: anObject [

	chartBuilder := anObject
]

{ #category : #private }
CMR3ChartDiagram >> configureCanvas: canvas [
	canvas shapes first borderColor: Color black.
	canvas shapes 
		reject: [ :each | each class = RSPolyline or: [ each class = RSBox ] ]"there are plots"
		thenDo: [ :each | each color: Color black ].
	"we need css"

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
CMR3ChartDiagram >> defaultXAxisLabelOffset [
	" Answer a <Point> representing the receiver's default X axis offset "
	
	^ 0 @ 5
]

{ #category : #defaults }
CMR3ChartDiagram >> defaultYAxisLabelOffset [
	" Answer a <Point> representing the receiver's default Y axis offset "
	
	^ self minYValue @ self maxYValue
]

{ #category : #private }
CMR3ChartDiagram >> detectMaxProbeValue [
	" Private - Select and answer a <Number> with the maximum between all receiver's model selected probes "

	^ (self selectedProbes 
		collect: [ : p | (self cormasModel probeAt: p) max ]) max

]

{ #category : #initialization }
CMR3ChartDiagram >> initialize [
	super initialize.
	chartBuilder := self newChartBuilder.
]

{ #category : #defaults }
CMR3ChartDiagram >> maxYValue [
	" Private - Answer a <Number> of the maximum value for the Y axis in the receiver "

	self flag: #toReviewIfTrue.
	^ self scaleToMinMax
		ifTrue: [ self owner maxYValue ]
		ifFalse: [ self detectMaxProbeValue ]

]

{ #category : #defaults }
CMR3ChartDiagram >> minYValue [

	^ self owner minYValue
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> newChartBuilder [
	" Private - Answer a new <RSChart> with ticksAssoc as the number of X ticks"
	^ RSChart new
		extent: 400@300;
		padding: 5;
		addDecoration: self newHorizontalTick;
		addDecoration: self newVerticalTick;
		addDecoration: (RSXLabelDecoration new
			in: [ :label | label baseShape color: Color black ];
			title: 'Time'; 
			fontSize: 12);
		minValueY: self minYValue;
		maxValueY: self maxYValue;
		yourself.
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> newHorizontalTick [
	" Answer a new <RSHorizontalTick> with default or applied settings "

	^ RSHorizontalTick new 
			fontSize: 10;
			numberOfTicks: 10;
			yourself.
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> newMaxX [

	^ newMaxX 
		ifNil: [ newMaxX := 10 ]
]

{ #category : #'accessing - ticks' }
CMR3ChartDiagram >> newVerticalTick [
	" Answer a new <RSVerticalTick> with default or applied settings "

	^ RSVerticalTick new 
		numberOfTicks: 10;
		fontSize: 10;
		yourself.
]

{ #category : #accessing }
CMR3ChartDiagram >> optionsPresenter [

	^ self owner optionsPresenter.
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

{ #category : #rendering }
CMR3ChartDiagram >> renderIn: canvas [
	| group interaction |
	chartBuilder := self newChartBuilder.
	
	self probeLines do: [ :linePlot | chartBuilder addPlot: linePlot ].
	group := RSGroup new.
	chartBuilder plots 
		ifNotEmpty: [ chartBuilder renderIn: group. ].
	
	canvas addAll: group.
	self configureCanvas: canvas.
	
	interaction := RSCanvasController new.
	interaction noLegend.
	canvas addInteraction: interaction.
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> scaleToMinMax [
	" Answer <true> if the receiver option to scale to entered min and max values is checked "
	
	^ self owner scaleToMinMax
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> selectedProbes [
	" Answer a <Collection> with the receiver's model selected probes "

	^ self owner selectedProbes
]

{ #category : #'accessing - model' }
CMR3ChartDiagram >> setModel: aDomainObject [
	" Private - See superimplementor's comment "
	
	cormasModel := aDomainObject.

	self projectAnnouncer
		when: CMTimeChangedAnnouncement
		do: [ : ann | ann timeStep = 0 ifFalse: [ self timeChanged: ann timeStep ] ];

		when: CMSimulationInitializationAnnouncement 
		do: [ self timeChanged: 0 ].
		
	self cormasModel hasData
		ifFalse: [ self addAZeroDataSet ]
		ifTrue: [ self addDataSet ]
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> timeChanged: aNewTimeStep [

	newMaxX := aNewTimeStep.
	chartBuilder maxValueX: newMaxX + 1.
	self updateYAxis.
	self updateProbes.
	
	self refresh.
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> updateProbes [

	| probesToDisplay |
	"probesToDisplay := self cormasModelClass activeProbes asOrderedCollection.
	(self owner selectedProbes hasEqualElements: probesToDisplay)
		ifFalse: [ probesToDisplay addAll: (self selectedProbes difference: probesToDisplay) ]."

	probesToDisplay := self selectedProbes.
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
		
	self probeLines do: [ : probeLine | self chartBuilder addPlot: probeLine ].
	self chartBuilder plots
		ifNotEmpty: [ 
			self chartBuilder renderIn: self canvas.
			self canvas 
				"zoomToFit;"
				signalUpdate ]
]

{ #category : #'accessing - chart' }
CMR3ChartDiagram >> updateYAxis [
	" Private - Dinamically detect the model's maximum probe (between all currently selected) and use a multiplier to draw Y axis free space above "

	self optionsPresenter hasFixedMax
		ifFalse: [ 
			| maxProbeValue digitCount  roundToMaxVal |
			maxProbeValue := self detectMaxProbeValue.
			roundToMaxVal := (digitCount := maxProbeValue asInteger decimalDigitLength) >= 2
				ifTrue: [ 10 raisedTo: digitCount ]
				ifFalse: [ 10 ].
			self chartBuilder maxValueY: roundToMaxVal ]
		ifTrue: [ 
			self chartBuilder maxValueY: self optionsPresenter fixedMaxYValue ].
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
