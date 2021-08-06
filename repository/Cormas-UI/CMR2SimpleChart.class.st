Class {
	#name : #CMR2SimpleChart,
	#superclass : #RTGrapher,
	#instVars : [
		'cormasModel',
		'probeNum',
		'window'
	],
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #'instance creation' }
CMR2SimpleChart class >> openOn: aCMCormasModel [
	"create and open a simpleChart on a cormasModel"

	| newBe |
	newBe := self basicNew.
	newBe cormasModel: aCMCormasModel.
	newBe initializeAndSubscribe.
	newBe openWithToolbar.
	^ newBe
]

{ #category : #initialization }
CMR2SimpleChart >> addAZeroDataSet [
	| yValues xValues ds |
	yValues := [ 0 ].
	xValues := {0} asOrderedCollection.
	ds := RTData new.
	ds dotShape circle color: Color blue trans.
	ds points: xValues.
	ds y: yValues.
	ds x: #yourself.
	ds connectColor: Color blue.
	self add: ds
]

{ #category : #adding }
CMR2SimpleChart >> addProbe: probeName ofClass: className [
	| ds yValues xValues cn pn |
	probeNum := probeNum + 1.
	cn := className asString.
	pn := probeName asString.

	yValues := [ :x | 	self halt. ((cormasModel data at: cn) at: pn) asOrderedCollection at: x + 1 ].
	xValues := 0 to: ((cormasModel data at: cn) at: pn) asOrderedCollection size - 1 by: 1.
	ds := RTData new.
	"ds noDot."
	ds dotShape circle color: Color blue trans.
	ds points: xValues.
	ds y: yValues.
	ds x: #yourself.
	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum))).
	self add: ds
]

{ #category : #'public - axis' }
CMR2SimpleChart >> axisX [
	| s |
	s := super axisX.
	axisConfigurationX noDecimal.
	axisConfigurationX numberOfLabels: ((cormasModel timeStep max: 2) min: 10).
	^ s
]

{ #category : #accessing }
CMR2SimpleChart >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CMR2SimpleChart >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #initialization }
CMR2SimpleChart >> initialize [

	super initialize.
	self addAZeroDataSet
]

{ #category : #initialization }
CMR2SimpleChart >> initializeAndSubscribe [

	super initialize.
	self cormasModel announcer
		when: CMProbesDataUpdatedAnnouncement
			do: [ :aAnnounce | 
			aAnnounce timeStep = 0
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		when: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].
	self addAZeroDataSet
]

{ #category : #'opening-closing' }
CMR2SimpleChart >> openWithToolbar [
	| t |
	self window: super openWithToolbar.
	self window 
		model: self;
		title: 'CORMAS - Probes'.
	axisConfigurationX noDecimal.
	axisConfigurationY noDecimal.
	t := cormasModel timeStep.
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX
		maxValue: t;
		numberOfLabels: ((t max: 1) min: 10);
		numberOfTicks: ((t max: 1) min: 10).
	axisConfigurationY
		numberOfTicks: 4;
		numberOfLabels: 4.
	self renderIn: self view.
	^ self window
]

{ #category : #refreshing }
CMR2SimpleChart >> refresh [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	cormasModel class allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self addProbe: p ofClass: c name ] ].
	cormasModel class activeProbes
		do: [ :p | self addProbe: p ofClass: cormasModel class name ].
	
]

{ #category : #refreshing }
CMR2SimpleChart >> timeChanged: aNewTimeStep [
	
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX
		maxValue: aNewTimeStep;
		numberOfLabels: ((aNewTimeStep max: 1) min: 10);
		numberOfTicks: ((aNewTimeStep max: 1) min: 10).
	axisConfigurationY
		numberOfTicks: 4;
		numberOfLabels: 4.
	self renderIn: self view.
	self view signalUpdate
]

{ #category : #'opening-closing' }
CMR2SimpleChart >> unregisterFromAllAnnouncements [

self cormasModel announcer unsubscribe: self 
]

{ #category : #accessing }
CMR2SimpleChart >> window [
	^ window
]

{ #category : #accessing }
CMR2SimpleChart >> window: anObject [
	window := anObject
]
