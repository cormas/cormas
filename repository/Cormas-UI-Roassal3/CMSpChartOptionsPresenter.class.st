"
Chart options are presenter along the probes chart visualization to setup dynamically multiple settings related with:

- Probes to be displayed
- Maximum and minimum amount of ticks
- Scaling
- etc.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	probesListPresenter:		<Object>
	probesMinMaxOptionsPresenter:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpChartOptionsPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'probesListPresenter',
		'probesMinMaxOptionsPresenter'
	],
	#category : #'Cormas-UI-Roassal3-Chart'
}

{ #category : #specs }
CMSpChartOptionsPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		"add: #menuToolbar height: self toolbarHeight;"
		add: #probesMinMaxOptionsPresenter expand: false fill: true padding: 5;
		add: #probesListPresenter;
		yourself.



]

{ #category : #accessing }
CMSpChartOptionsPresenter >> fixMaxCheckPresenter [

	^ self probesMinMaxOptionsPresenter fixMaxCheckPresenter
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> fixMinCheckPresenter [

	^ self probesMinMaxOptionsPresenter fixMinCheckPresenter
]

{ #category : #helpers }
CMSpChartOptionsPresenter >> fixedMaxYValue [ 
	" Answer a <Number> entered for the maximum Y value in the chart "

	^ self probesMinMaxOptionsPresenter fixedMaxYValue
]

{ #category : #helpers }
CMSpChartOptionsPresenter >> fixedMinYValue [ 
	" Answer a <Number> entered for the minimum Y value in the chart "

	^ self probesMinMaxOptionsPresenter fixedMinYValue
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> hasFixedMax [
	" Answer <true> if the receiver's check for fixing the max value was checked "

	^ self fixMaxCheckPresenter state
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> hasFixedMin [

	^ self fixMinCheckPresenter state
]

{ #category : #initialization }
CMSpChartOptionsPresenter >> initializePresenters [

	probesListPresenter := CMSpChartProbesListPresenter owner: self on: self cormasModel.
	probesMinMaxOptionsPresenter := CMSpChartProbesMinMaxPresenter owner: self on: self cormasModel.
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> probesListPresenter [

	^ probesListPresenter
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> probesListPresenter: anObject [

	probesListPresenter := anObject
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> probesMinMaxOptionsPresenter [

	^ probesMinMaxOptionsPresenter
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> probesMinMaxOptionsPresenter: anObject [

	probesMinMaxOptionsPresenter := anObject
]

{ #category : #callbacks }
CMSpChartOptionsPresenter >> refreshProbesChart [
	" Private - See comment in #refreshProbesChart "

	self roassalChartPresenter updateProbes
]

{ #category : #helpers }
CMSpChartOptionsPresenter >> roassalChartPresenter [

	^ self owner roassalChartPresenter
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> scaleToMinMax [
	" Answer <true> if the receiver option to scale to entered min and max values is checked "

	^ self probesMinMaxOptionsPresenter scaleToMinMax
]

{ #category : #accessing }
CMSpChartOptionsPresenter >> selectedProbes [
	" Answer a <Collection> with the receiver's currently selected probes "

	^ self probesListPresenter selectedProbes
]
