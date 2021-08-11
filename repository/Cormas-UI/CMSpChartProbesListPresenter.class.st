Class {
	#name : #CMSpChartProbesListPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'probesListPresenter',
		'probesListLabel'
	],
	#category : #'Cormas-UI-Spec2-Probes'
}

{ #category : #specs }
CMSpChartProbesListPresenter class >> defaultSpec [

	^ SpPanedLayout newTopToBottom
		add: #probesListLabel;
		add: #probesListPresenter;
		yourself.



]

{ #category : #initialization }
CMSpChartProbesListPresenter >> initializePresenters [

	probesListLabel := self newLabel label: 'Probes names'. "self translator tProbesListNames."
	probesListPresenter := self newList
		items: self cormasModelClass probes;
		beMultipleSelection;
		display: [ : probeReference | self probeNameForItemAt: probeReference ];
		whenSelectionChangedDo: [ self refreshProbeNameSelection ];
		contextMenu: [ self menuForSelectedProbes ].
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> menuForSelectedProbes [


]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> probeNameForItemAt: probeReference [

	^ probeReference asString
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> probesListLabel [

	^ probesListLabel
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> probesListLabel: anObject [

	probesListLabel := anObject
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> probesListPresenter [

	^ probesListPresenter
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> probesListPresenter: anObject [

	probesListPresenter := anObject
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> refreshProbeNameSelection [


]
