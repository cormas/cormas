Class {
	#name : #CMSpRoassalChartPresenter,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'chartBuilder',
		'cormasModel',
		'probeNum',
		'probeLines',
		'title',
		'titleSize',
		'numberOfHorizontalTicks',
		'numberOfVerticalTicks',
		'xAxisLabelOffset'
	],
	#category : #'Cormas-UI-Spec2-Probes'
}

{ #category : #'instance creation' }
CMSpRoassalChartPresenter class >> owner: anOwningPresenter on: aDomainObject [

	^ self basicNew
		owner: anOwningPresenter;
		setModelBeforeInitialization: aDomainObject;
		initialize;
		yourself
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> addAZeroDataSet [
	| xValue initialPlot |

	initialPlot := RSLinePlot new.
	xValue := {0} asOrderedCollection.
	initialPlot 
		x: xValue
		y: { 0 };
		color:  Color blue trans.
	
	self chartBuilder: (self newChartBuilder: (1 -> 1)).
	self chartBuilder addPlot: initialPlot.
	self chartBuilder renderIn: self canvas.
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> addControllers: aCanvas [

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
CMSpRoassalChartPresenter >> addProbe: probeName ofClass: className color: aColor [
	" Private - Create a new line for the argument probeName with aColor. Obtain its y value from the cormas model "

	| linePlot xValues yValues probeValues |

	self flag: #todo. 
		" Why do we need the className ? "
		" Do we need to count probeNum ? "
		" How to connect lines with points as in R2 connectColor: ? "
	probeNum := probeNum + 1.
	linePlot := RSLinePlot new.
	probeValues := cormasModel probeAt: probeName.
	xValues := 0 to: probeValues size - 1 by: 1.
	yValues := xValues collect: [ : x | probeValues at: x + 1 ].
	linePlot 
		x: xValues
		y: yValues;
		color: aColor.
	self addProbeLine: linePlot.

]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> addProbeLine: linePlot [
	" Add linePlot <RSLinePlot> to the receiver's probes to be displayed "

	self probeLines add: linePlot

]

{ #category : #accessing }
CMSpRoassalChartPresenter >> chartBuilder [

	^ chartBuilder
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> chartBuilder: anObject [

	chartBuilder := anObject
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> cormasModelClass [ 

	^ self cormasModel class
]

{ #category : #defaults }
CMSpRoassalChartPresenter >> defaultNumberOfVerticalTicks [
	
	^ 2
]

{ #category : #defaults }
CMSpRoassalChartPresenter >> defaultTitle [
	" Private - Answer a <String> with the receiver's default title to appear inside the canvas "
	
	^ 'Probes for ' , self cormasModelClass name
]

{ #category : #defaults }
CMSpRoassalChartPresenter >> defaultTitleSize [
	" Private - Answer a <Number> with the receiver's default title size to appear inside the canvas "
	
	^ 15
]

{ #category : #defaults }
CMSpRoassalChartPresenter >> defaultXAxisLabelOffset [
	" Answer a <Point> representing the receiver's X axis offset "
	
	^ 0 @ 5
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> newBasicChartBuilder [
	" Private - Answer a new <RSChart> with the basic decorations and settings "
	
	^ RSChart new
		maxValueY: 1;
		addDecoration: self newHorizontalTick;
		addDecoration: self newVerticalTick;
		addDecoration: (RSXLabelDecoration new title: 'Time'; offset: self xAxisLabelOffset);
		addDecoration: (RSYLabelDecoration new title: 'Value'; offset: -20 @ 0);
		yourself.
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> newChartBuilder: ticksAssoc [
	" Private - Answer a new <RSChart> with ticksAssoc as the number of X ticks"
	| newChart |
	
	newChart := self newBasicChartBuilder.
	CMApplicationPreferences settingShowProbesTitle
		ifTrue: [ newChart addDecoration: (RSChartTitleDecoration new title: self title; fontSize: self titleSize) ].
	^ newChart.
]

{ #category : #'accessing - ticks' }
CMSpRoassalChartPresenter >> newHorizontalTick [
	" Answer a new <RSHorizontalTick> with default or applied settings "

	| hTick |
	
	hTick := RSHorizontalTick new 
			integer;
			yourself.
	CMApplicationPreferences settingFixedHorizontalTick
		ifTrue: [ hTick numberOfTicks: self numberOfHorizontalTicks ].
	^ hTick
]

{ #category : #'accessing - ticks' }
CMSpRoassalChartPresenter >> newVerticalTick [
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
CMSpRoassalChartPresenter >> numberOfHorizontalTicks [

	^ numberOfHorizontalTicks
]

{ #category : #'accessing - ticks' }
CMSpRoassalChartPresenter >> numberOfHorizontalTicks: anObject [

	numberOfHorizontalTicks := anObject
]

{ #category : #'accessing - ticks' }
CMSpRoassalChartPresenter >> numberOfVerticalTicks [

	^ numberOfVerticalTicks
		ifNil: [ numberOfVerticalTicks := self defaultNumberOfVerticalTicks ]
]

{ #category : #'accessing - ticks' }
CMSpRoassalChartPresenter >> numberOfVerticalTicks: anObject [

	numberOfVerticalTicks := anObject
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> plotChart: aCanvas [

	self chartBuilder container: aCanvas.
	self addControllers: aCanvas.
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> probeLines [

	^ probeLines
		ifNil: [ probeLines := OrderedCollection new ]
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> probeNum [

	^ probeNum
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> probeNum: anObject [

	probeNum := anObject
]

{ #category : #public }
CMSpRoassalChartPresenter >> refresh [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	self cormasModelClass activeProbes do: [ : ap | 
		self 
			addProbe: ap
			ofClass: self cormasModelClass
			color: (self cormasModel colorOfProbe: ap) ]


]

{ #category : #initialization }
CMSpRoassalChartPresenter >> setModelBeforeInitialization: aDomainObject [

	cormasModel := aDomainObject.
	self cormasModel announcer
		when: CMProbesDataUpdatedAnnouncement
		do: [ :aAnnounce | aAnnounce timeStep = 0 ifFalse: [ self timeChanged: aAnnounce timeStep ] ];

		when: CMSimInitializationAnnouncement 
		do: [ self timeChanged: 0 ].
	self addAZeroDataSet
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> timeChanged: aNewTimeStep [

	| newMaxX |
		
	newMaxX := (aNewTimeStep max: 1) min: 10.
	self canvas removeAllElements.
	self refresh.
	self chartBuilder maxValueX: newMaxX + 1.
	self chartBuilder: (self newChartBuilder: newMaxX -> 1).
	self "selected"probeLines do: [ : probeLine | self chartBuilder addPlot: probeLine ].
	self chartBuilder renderIn: self canvas.
	self canvas 
		zoomToFit;
		signalUpdate
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> title [
	" Answer a <String> with the receiver's title shown inside the canvas "
	
	^ title
		ifNil: [ title := self defaultTitle ]
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> title: aString [

	title := aString
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> titleSize [

	^ titleSize
		ifNil: [ titleSize := self defaultTitleSize ]
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> titleSize: anObject [

	titleSize := anObject
]

{ #category : #roassal2 }
CMSpRoassalChartPresenter >> updateProbe: probeName ofClass: className [
	| ds yValues xValues cn pn |
	self halt. "this method does not work"
	cn := className asString.
	pn := probeName asString.
	yValues := [ :y | ((cormasModel data at: cn) at: pn) asOrderedCollection at: y + 1 ].
	xValues := 0 to: ((cormasModel data at: cn) at: pn) asOrderedCollection size - 1 by: 1.


	"	ds dotShape circle color: Color blue trans."
	ds := self datasets first.
	ds addPoint: xValues last.
	ds maxX: ds maxX + 1.
	xValues setFrom: 0 to: xValues last + 1 by: 1.
	"self halt."
	ds y: yValues.
	ds x: #yourself
	"	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum)))"

	"self add: ds"
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> xAxisLabelOffset [

	^ xAxisLabelOffset
		ifNil: [ xAxisLabelOffset := self defaultXAxisLabelOffset ]
]
