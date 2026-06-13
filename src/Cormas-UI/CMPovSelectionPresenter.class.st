Class {
	#name : 'CMPovSelectionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'povTree',
		'whenChangedBlock'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'examples' }
CMPovSelectionPresenter class >> example [
	<example>
	
	| app |
	app := CMSimulationApplication new.
	app cormasModel: CMMockModel new.
	(app newPresenter: self) open.
]

{ #category : 'accessing' }
CMPovSelectionPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMPovSelectionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: povTree;
		yourself
]

{ #category : 'initialization' }
CMPovSelectionPresenter >> initializePresenters [

	whenChangedBlock := [ "do nothing" ].
	povTree := self newTreeTable.
	
	povTree
		hideColumnHeaders;
		addColumn: (SpCompositeTableColumn new
			addColumn:
				(SpImageTableColumn
					evaluated: [ :each |
						each isClass
							ifTrue: [ self iconNamed: #class ]
							ifFalse: [ each key activePovSelector = each value
								ifTrue: [ self iconNamed: #smallOk ]
								ifFalse: [ self iconNamed: #bla ] ] ])
					beNotExpandable;
			addColumn:
				(SpStringTableColumn
					evaluated: [ :each |
						each isClass
							ifTrue: [ each name ]
							ifFalse: [ each value ] ]);
					yourself);
		children: [ :item |
			item isClass
				ifTrue: [ (item availablePov collect: [ :each | item -> each ]), item subclasses ] 
				ifFalse: [ OrderedCollection new ] ];
		whenSelectedItemChangedDo: [ :item |
			(item isNil or: [ item isClass ]) ifFalse: [ 
				item key activePovSelector: item value.
				item key allSubclasses do: [ :subclass | subclass activePovSelector: item value ].
				self showPovs.
				whenChangedBlock value ] ].
		
	self showPovs
	
]

{ #category : 'as yet unclassified' }
CMPovSelectionPresenter >> showPovs [

	| roots |
	
	roots := self cormasModel class allEntityClasses reject: [ :aClass |
		self cormasModel class allEntityClasses includes: aClass superclass ].

	povTree
		roots: (roots sorted: [ :a :b | a name < b name ])
]

{ #category : 'announcing' }
CMPovSelectionPresenter >> whenChangedDo: aBlock [

	whenChangedBlock := aBlock
]
