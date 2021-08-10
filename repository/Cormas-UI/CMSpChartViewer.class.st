Class {
	#name : #CMSpChartViewer,
	#superclass : #CMSpPresenter,
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

	optionsPresenter := self newList.
	roassalChartPresenter := CMSpRoassalChartPresenter owner: self on: self cormasModel.
	self roassalChartPresenter plotChart: self roassalChartPresenter currentCanvas. 
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
