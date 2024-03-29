"
This is the main Probes window, which contains:

- A presenter with settings for visualization of probes
- The Roassal 3 presenter with the canvas.


Internal Representation and Key Implementation Points.

    Instance Variables
	optionsPresenter:		<Object>
	roassalChartPresenter:		<Object>


    Implementation Points
"
Class {
	#name : #CMR3ChartPresenter,
	#superclass : #CMSpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'optionsPresenter',
		'roassalChartPresenter'
	],
	#category : #'Cormas-UI-Roassal3-Chart'
}

{ #category : #specs }
CMR3ChartPresenter class >> defaultSpec [

	^ SpPanedLayout newLeftToRight
		add: #optionsPresenter;
		positionOfSlider: 25 percent;
		add: #roassalChartPresenter;
		yourself.



]

{ #category : #initialization }
CMR3ChartPresenter >> initializePresenters [
	" Private - Setup the options and chart presenters. If there's already data in the receiver's model, then update it otherwise use an empty chart "

	optionsPresenter := CMSpChartOptionsPresenter owner: self on: self cormasModel.
	roassalChartPresenter := CMR3ChartDiagram owner: self on: self cormasModel.
	self roassalChartPresenter plotChart: self roassalChartPresenter currentCanvas.

]

{ #category : #initialization }
CMR3ChartPresenter >> initializeWindow: aWindowPresenter [
	"override this to set window values before opening. 
	 You may want to add a menu, a toolbar or a statusbar"

	aWindowPresenter
		title: self title;
		initialExtent: 1000 @ 600;
		windowIcon: self windowIcon;
		whenWillCloseDo: [ :  w | 
			'Chart Presenter: Unsubscribing chart before deleting presenter...' traceCr.
			self roassalChartPresenter ifNotNil: [ : chartPresenter | 
				self projectManager announcer unsubscribe: chartPresenter ].
			self release.
			self defer: [ 3 timesRepeat: [ Smalltalk garbageCollect ] ] ]
]

{ #category : #initialization }
CMR3ChartPresenter >> maxYValue [ 
	" Answer a <Number> entered for the minimum Y value in the chart "
	
	^ self optionsPresenter maxYValue
]

{ #category : #initialization }
CMR3ChartPresenter >> minYValue [ 
	" Answer a <Number> entered for the minimum Y value in the chart "
	
	^ self optionsPresenter fixedMinYValue
]

{ #category : #accessing }
CMR3ChartPresenter >> optionsPresenter [

	^ optionsPresenter
]

{ #category : #accessing }
CMR3ChartPresenter >> optionsPresenter: anObject [

	optionsPresenter := anObject
]

{ #category : #initialization }
CMR3ChartPresenter >> release [

	super release.
	optionsPresenter := nil.
	roassalChartPresenter := nil.
]

{ #category : #accessing }
CMR3ChartPresenter >> roassalChartPresenter [

	^ roassalChartPresenter
]

{ #category : #accessing }
CMR3ChartPresenter >> roassalChartPresenter: anObject [

	roassalChartPresenter := anObject
]

{ #category : #accessing }
CMR3ChartPresenter >> scaleToMinMax [
	" Answer <true> if the receiver option to scale to entered min and max values is checked "

	^ self optionsPresenter scaleToMinMax.
]

{ #category : #accessing }
CMR3ChartPresenter >> selectedProbes [
	" Answer a <Collection> with the receiver's currently selected probes "

	^ self optionsPresenter selectedProbes
]

{ #category : #initialization }
CMR3ChartPresenter >> title [

	^  self formattedWindowTitle: 'Probes'
]
