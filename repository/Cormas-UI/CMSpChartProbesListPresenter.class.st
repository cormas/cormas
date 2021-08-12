Class {
	#name : #CMSpChartProbesListPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'probesListPresenter',
		'probesListLabel',
		'selectedProbes'
	],
	#category : #'Cormas-UI-Spec2-Probes'
}

{ #category : #specs }
CMSpChartProbesListPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		add: #probesListLabel height: self toolbarHeight;
		add: #probesListPresenter;
		yourself.



]

{ #category : #initialization }
CMSpChartProbesListPresenter >> colorOfProbe: aSymbol [

	^ (self cormasModelClass colorOfProbe: aSymbol) 
			ifNil: [ self iconNamed: #smallQuestion ]
			ifNotNil: [ : sourceCode | 
				(Morph new 
					extent: 15 @ 15;
					color: (self class compiler evaluate: sourceCode storeString)) asForm ]
]

{ #category : #initialization }
CMSpChartProbesListPresenter >> initializePresenters [

	probesListLabel := 'Probes' asPresenter. "self translator tProbesListNames."
	probesListPresenter := self newTable
		items: self cormasModelClass probes;
		addColumn: self probesCheckBoxesColumn;
		addColumn: self probesColorColumn;
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #asString);
		contextMenu: [ self menuForSelectedProbes ];
		yourself.
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> menuForSelectedProbes [
	" Answer a menu with options related with the selected probe "

	^ SpMenuPresenter new 
			addItem: [ :item | 
				item
					name: self translator tChangeColor;
					action: [ self openColorSelector] ];
			yourself
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> openColorSelector [

	(ColorSelectorDialogWindow new
			title: self translator tChooseColor;
			open;
			announcer) 
		when: ColorChanged 
		do: [ : ann | self updateProbeColor: ann newColor ].
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> probeNameForItemAt: probeReference [

	^ probeReference asString
]

{ #category : #initialization }
CMSpChartProbesListPresenter >> probesCheckBoxesColumn [

	^ (SpCheckBoxTableColumn title: '   ' evaluated: [ : probe | self selectedProbes includes: probe ])
			onActivation: [ : probe | self selectedProbes add: probe];
			onDeactivation: [ : probe | self selectedProbes remove: probe ];
			width: 20;
			yourself
]

{ #category : #initialization }
CMSpChartProbesListPresenter >> probesColorColumn [

	^ (SpImageTableColumn 
			title: 'Color' 
			evaluated: [ : aSymbol | self colorOfProbe: aSymbol ])
				width: 40;
				yourself
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

{ #category : #accessing }
CMSpChartProbesListPresenter >> selectedProbes [

	^ selectedProbes
		ifNil: [ selectedProbes := OrderedCollection new ]
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> selectedProbes: anObject [

	selectedProbes := anObject
]

{ #category : #callbacks }
CMSpChartProbesListPresenter >> updateProbeColor: aColor [
	" A new aColor was selected for the selected probe, update the receiver's model "

	self cormasModel 
		setColor: aColor 
		forProbe: self probesListPresenter selectedItem.
	self probesListPresenter refresh
]
