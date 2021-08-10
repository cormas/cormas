Class {
	#name : #CMSpRoassalChartPresenter,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'chartBuilder',
		'cormasModel',
		'probeNum',
		'probeLines'
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

	| linePlot xValues yValues probeValues |
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
	

"	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum))).
	self add: ds"
]

{ #category : #'accessing - chart' }
CMSpRoassalChartPresenter >> addProbeLine: linePlot [

	self probeLines add: linePlot
	

"	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum))).
	self add: ds"
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
		maxValueY: 1;
		addDecoration: (RSChartTitleDecoration new title: 'Probes for ' , self cormasModelClass name; fontSize: 20);
		addDecoration: (RSHorizontalTick new 
								integer;
								"numberOfTicks: ticksAssoc key;"
								yourself);
		addDecoration: (RSVerticalTick new 
								doNotUseNiceLabel;
								numberOfTicks: 2;
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

{ #category : #accessing }
CMSpRoassalChartPresenter >> refresh [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
"	self cormasModelClass allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self addProbe: p ofClass: c name ] ]."
	self cormasModelClass activeProbesWithColors 
		associationsDo: [ : probeAssoc | 
			self 
				addProbe: probeAssoc key 
				ofClass: self cormasModelClass name 
				color: probeAssoc value ].
	
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
