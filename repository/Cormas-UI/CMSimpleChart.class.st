Class {
	#name : #CMSimpleChart,
	#superclass : #RTGrapher,
	#instVars : [
		'cormasModel',
		'probeNum',
		'window'
	],
	#category : #'Cormas-UI-charts'
}

{ #category : #deprecated }
CMSimpleChart class >> newAndRegisterOn: aCMCormasModel [
	"createASimpleChartOnACormasModel"

	| newBe |
	newBe := self new.
	newBe cormasModel: aCMCormasModel.
	aCMCormasModel addDependent:newBe.
	^ newBe
]

{ #category : #deprecated }
CMSimpleChart class >> newOn: aCMCormasModel [
	"createASimpleChartOnACormasModel"

	| newBe |
	newBe := self basicNew.
	newBe cormasModel: aCMCormasModel.
	newBe initialize.
	^ newBe
]

{ #category : #'instance creation' }
CMSimpleChart class >> openOn: aCMCormasModel [
	"create and open a simpleChart on a cormasModel"

	| newBe |
	newBe := self basicNew.
	newBe cormasModel: aCMCormasModel.
	newBe initializeAndSubscribe.
	newBe openWithToolbar.
	^ newBe
]

{ #category : #initialization }
CMSimpleChart >> addAZeroDataSet [
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
CMSimpleChart >> addProbe: probeName ofClass: className [
	| ds yValues xValues cn pn |
	probeNum := probeNum + 1.
	cn := className asString.
	pn := probeName asString.
	yValues := [ :x | ((cormasModel data at: cn) at: pn) asOrderedCollection at: x + 1 ].
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
CMSimpleChart >> axisX [
	| s |
	s := super axisX.
	axisConfigurationX noDecimal.
	axisConfigurationX numberOfLabels: ((cormasModel timeStep max: 2) min: 10).
	^ s
]

{ #category : #accessing }
CMSimpleChart >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CMSimpleChart >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #initialization }
CMSimpleChart >> initialize [

	super initialize.
	self addAZeroDataSet
]

{ #category : #initialization }
CMSimpleChart >> initializeAndSubscribe [

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
CMSimpleChart >> openWithToolbar [
	| t |
	self window: super openWithToolbar.
	self window 
		model: self;
		title: 'CORMAS - Probes'.
	axisConfigurationX noDecimal.
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
CMSimpleChart >> refresh [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	cormasModel class allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self addProbe: p ofClass: c name ] ].
	cormasModel class activeProbes
		do: [ :p | self addProbe: p ofClass: cormasModel class name ].
	
]

{ #category : #deprecated }
CMSimpleChart >> refreshHack [
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	cormasModel class allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self updateProbe: p ofClass: c name ] ].
	cormasModel class activeProbes
		do: [ :p | self updateProbe: p ofClass: cormasModel class name ].


	"axisConfigurationX numberOfLabels: (axisConfigurationX  numberOfLabels +1) ."

	axisConfigurationX maxValue: axisConfigurationX maxValue + 1
]

{ #category : #deprecated }
CMSimpleChart >> timeChanged [
	(self window ifNil: [ false ] ifNotNil: [ :w | w isDisplayed ])
		ifFalse: [ self cormasModel removeDependent: self.
			^ self cormasModel: nil ].
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX maxValue: axisConfigurationX maxValue + 1.
	axisConfigurationX numberOfLabels: ((axisConfigurationX maxValue max: 4) min: 10).
	axisConfigurationY numberOfTicks: 4.
	axisConfigurationY numberOfLabels: 4.
	self renderIn: self view.
	self view signalUpdate
]

{ #category : #refreshing }
CMSimpleChart >> timeChanged: aNewTimeStep [
	
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

{ #category : #deprecated }
CMSimpleChart >> timeChangedOLD [
	"	self addProbe: #alive ofClass: CMConwayModel."

	"self datasets removeLast."

	"	self datasets first elements last copy.
"

	self view removeAllElements.

	"self removeAllElements."
	self refreshHack.
	"a priori ca ne met pas les elements ds la vue"
	"	self view add.. to be continued
"
	self renderInHack.
	self view signalUpdate
	"RTElement on:6
"
]

{ #category : #'opening-closing' }
CMSimpleChart >> unregisterFromAllAnnouncements [

self cormasModel announcer unsubscribe: self 
]

{ #category : #deprecated }
CMSimpleChart >> update: anAspectSymbol with: aParameter [
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."

	anAspectSymbol = #timeChanged
		ifTrue: [ ^ self timeChanged ].
		
	"	anAspectSymbol = #noticeChanges
		ifTrue: 
			[aParameter isEmpty ifTrue:[^self].
			aParameter do: [: aChange | self noticeChange: aChange ].
			^Cormas refresh: self]."

	super update: anAspectSymbol with: aParameter
]

{ #category : #deprecated }
CMSimpleChart >> updateProbe: probeName ofClass: className [
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

{ #category : #accessing }
CMSimpleChart >> window [
	^ window
]

{ #category : #accessing }
CMSimpleChart >> window: anObject [
	window := anObject
]
