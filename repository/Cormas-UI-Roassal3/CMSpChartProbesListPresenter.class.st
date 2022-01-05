Class {
	#name : #CMSpChartProbesListPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'probesListPresenter',
		'probesListLabel',
		'selectedProbes'
	],
	#category : #'Cormas-UI-Roassal3-Chart'
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
	" Answer a <Morph> representing a color for aSymbol to display in the receiver's list of probes "

	^ (self cormasModelClass colorOfProbe: aSymbol) 
			ifNil: [ self iconNamed: #smallQuestion ]
			ifNotNil: [ : sourceCode | 
				(Morph new 
					extent: 15 @ 15;
					color: (self class compiler evaluate: sourceCode storeString)) asForm ]
]

{ #category : #initialization }
CMSpChartProbesListPresenter >> initializePresenters [
	" Private - Initially we display all available model probes (see #probes method). 
	If the color is not recognizable, then display a question mark "

	self selectedProbes addAll: self cormasModelClass probes.
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
			addItem: [ :item | 
				item
					name: 'Browse';
					action: [ 
						Smalltalk tools browser 
							openOnClass: self cormasModelClass 
							selector: self probesListPresenter selectedItem ] ];
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

	^ (SpCheckBoxTableColumn 
		title: '   ' 
		evaluated: [ : probe | self selectedProbes includes: probe ])
			onActivation: [ : probe | 
				self selectedProbes add: probe.
				self refreshProbesChart ];
			onDeactivation: [ : probe | 
				self selectedProbes remove: probe.
				self refreshProbesChart ];
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

{ #category : #initialization }
CMSpChartProbesListPresenter >> refreshProbesChart [
	" Private - User selected or deselected a probe. Regenerate the whole chart updated with selected probes "
	
	self owner refreshProbesChart
]

{ #category : #accessing }
CMSpChartProbesListPresenter >> selectedProbes [
	" Answer a <Collection> with the receiver's currently selected probes "

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
