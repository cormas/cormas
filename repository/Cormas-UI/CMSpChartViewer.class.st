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
	#name : #CMSpChartViewer,
	#superclass : #CMSpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'optionsPresenter',
		'roassalChartPresenter'
	],
	#category : #'Cormas-UI-Spec2-Probes'
}

{ #category : #specs }
CMSpChartViewer class >> defaultSpec [

	^ SpPanedLayout newLeftToRight
		add: #optionsPresenter;
		positionOfSlider: 25 percent;
		add: #roassalChartPresenter;
		yourself.



]

{ #category : #initialization }
CMSpChartViewer >> initializePresenters [

	optionsPresenter := CMSpChartOptionsPresenter owner: self on: self cormasModel.
	roassalChartPresenter := CMR3ChartPresenter owner: self on: self cormasModel.
	self roassalChartPresenter plotChart: self roassalChartPresenter currentCanvas. 
]

{ #category : #initialization }
CMSpChartViewer >> initializeWindow: aWindowPresenter [
	"override this to set window values before opening. 
	 You may want to add a menu, a toolbar or a statusbar"

	aWindowPresenter
		title: self title;
		initialExtent: 1000 @ 600;
		windowIcon: self windowIcon
]

{ #category : #accessing }
CMSpChartViewer >> optionsPresenter [

	^ optionsPresenter
]

{ #category : #accessing }
CMSpChartViewer >> optionsPresenter: anObject [

	optionsPresenter := anObject
]

{ #category : #accessing }
CMSpChartViewer >> roassalChartPresenter [

	^ roassalChartPresenter
]

{ #category : #accessing }
CMSpChartViewer >> roassalChartPresenter: anObject [

	roassalChartPresenter := anObject
]

{ #category : #initialization }
CMSpChartViewer >> title [

	^  self formattedWindowTitle: 'Probes'
]
