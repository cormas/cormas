Class {
	#name : #CMSpRoassalChartPresenter,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'chartBuilder',
		'cormasModel',
		'probeNum',
		'plot'
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
	| xValue plot |

	plot := RSLinePlot new.
	xValue := {0} asOrderedCollection.
	plot 
		x: xValue
		y: { 0 };
		color:  Color blue trans.
	
	self chartBuilder: (self newChartBuilder: (1 -> 2)).
	self chartBuilder addPlot: plot.
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
CMSpRoassalChartPresenter >> addProbe: probeName ofClass: className [

	| cn pn xValues yValues |
	probeNum := probeNum + 1.
	cn := className asString.
	pn := probeName asString.
	
	plot := RSLinePlot new.
	xValues := 0 to: ((cormasModel data at: cn) at: pn) asOrderedCollection size - 1 by: 1.
	yValues := (xValues collect: [ : x | ((cormasModel data at: cn) at: pn) asOrderedCollection at: x + 1 ]).
	plot 
		x: xValues
		y: yValues;
		color:  Color blue trans.
	

"	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum))).
	self add: ds"
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> axisConfigurationX [
	
	| decos |
	
	decos := self chartBuilder decorations.
	^ decos detect: [ : d | d class = RSHorizontalTick ]
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> axisConfigurationY [
	
	| decos |
	
	decos := self chartBuilder decorations.
	^ decos detect: [ : d | d class = RSVerticalTick ]
]

{ #category : #roassal2 }
CMSpRoassalChartPresenter >> axisX [
	| s |
	s := super axisX.
"	axisConfigurationX noDecimal.
	axisConfigurationX numberOfLabels: ((cormasModel timeStep max: 2) min: 10)."
	^ s
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

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> newChartBuilder: ticksAssoc [

	| time |
	time := self cormasModel timeStep.
	^ RSChart new
		addDecoration: (RSChartTitleDecoration new title: 'hello'; fontSize: 20);
		addDecoration: (RSHorizontalTick new 
								integer;
								"numberOfTicks: ticksAssoc key;"
								yourself);
		addDecoration: (RSVerticalTick new 
								integer;
								numberOfTicks: ticksAssoc value;
								yourself);
		addDecoration: (RSXLabelDecoration new title: 'Time'; offset: 0 @ 10);
		addDecoration: (RSYLabelDecoration new title: 'Value'; offset: -20 @ 0);
		yourself.
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> plotChart: aCanvas [

	self chartBuilder container: aCanvas.
	self addControllers: aCanvas.
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> probeNum [

	^ probeNum
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> probeNum: anObject [

	probeNum := anObject
]

{ #category : #accessing }
CMSpRoassalChartPresenter >> refresh [
	"hard method rebuilding all datasets at each refresh."

	"super refresh."
	probeNum := 1.
	self cormasModelClass allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self addProbe: p ofClass: c name ] ].
	self cormasModelClass activeProbes
		do: [ :p | self addProbe: p ofClass: cormasModel class name ].
	
]

{ #category : #roassal2 }
CMSpRoassalChartPresenter >> refreshHack [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	cormasModel class allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self updateProbe: p ofClass: c name ] ].
	cormasModel class activeProbes
		do: [ :p | self updateProbe: p ofClass: cormasModel class name ].


	"axisConfigurationX numberOfLabels: (axisConfigurationX  numberOfLabels +1) ."

	"axisConfigurationX maxValue: axisConfigurationX maxValue + 1"
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

{ #category : #roassal2 }
CMSpRoassalChartPresenter >> timeChanged [

	self halt.
	(self window ifNil: [ false ] ifNotNil: [ :w | w isDisplayed ])
		ifFalse: [ self cormasModel removeDependent: self.
			^ self cormasModel: nil ].
	self view removeAllElements.
"	datasets := OrderedCollection new.
"	self refresh.
"	axisConfigurationX maxValue: axisConfigurationX maxValue + 1.
	axisConfigurationX numberOfLabels: ((axisConfigurationX maxValue max: 4) min: 10).
	axisConfigurationY numberOfTicks: 4.
	axisConfigurationY numberOfLabels: 4."
	self renderIn: self view.
	self view signalUpdate
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> timeChanged: aNewTimeStep [

	| newMaxX |
			
	newMaxX := (aNewTimeStep max: 1) min: 10.
	self canvas removeAllElements.
	self refresh.
	self chartBuilder maxValueX: newMaxX + 1.
	self chartBuilder: (self newChartBuilder: newMaxX -> 4).
	self chartBuilder addPlot: plot.
	self chartBuilder renderIn: self canvas.
	self canvas 
		zoomToFit;
		signalUpdate
]

{ #category : #roassal2 }
CMSpRoassalChartPresenter >> update: anAspectSymbol with: aParameter [
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."

	self halt.
	anAspectSymbol = #timeChanged
		ifTrue: [ ^ self timeChanged ].
		
	"	anAspectSymbol = #noticeChanges
		ifTrue: 
			[aParameter isEmpty ifTrue:[^self].
			aParameter do: [: aChange | self noticeChange: aChange ].
			^Cormas refresh: self]."

	super update: anAspectSymbol with: aParameter
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
