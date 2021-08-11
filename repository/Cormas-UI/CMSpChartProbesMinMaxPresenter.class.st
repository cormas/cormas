Class {
	#name : #CMSpChartProbesMinMaxPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'fixMinCheckPresenter',
		'fixMaxCheckPresenter',
		'scalePresenter'
	],
	#category : #'Cormas-UI-Spec2-Probes'
}

{ #category : #specs }
CMSpChartProbesMinMaxPresenter class >> defaultSpec [ 

	^ SpBoxLayout newVertical 
		add: #scalePresenter;
		add: #fixMinCheckPresenter;
		add: #fixMaxCheckPresenter;
		yourself
]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> fixMaxCheckPresenter [

	^ fixMaxCheckPresenter
]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> fixMaxCheckPresenter: anObject [

	fixMaxCheckPresenter := anObject
]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> fixMinCheckPresenter [

	^ fixMinCheckPresenter
]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> fixMinCheckPresenter: anObject [

	fixMinCheckPresenter := anObject
]

{ #category : #initialization }
CMSpChartProbesMinMaxPresenter >> initializePresenter [ 

	fixMinCheckPresenter := self newCheckBox label: 'Fix min to'; yourself.
	fixMaxCheckPresenter := self newCheckBox label: 'Fix max to'; yourself.
	scalePresenter := self newCheckBox label: 'Scale to min max'; yourself.

]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> scalePresenter [

	^ scalePresenter
]

{ #category : #accessing }
CMSpChartProbesMinMaxPresenter >> scalePresenter: anObject [

	scalePresenter := anObject
]
