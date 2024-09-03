Class {
	#name : 'CMModelDesignerProbesPresenter',
	#superclass : 'CMModelDesignerListPresenter',
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerProbesPresenter class >> example [
	<example>
	
	(self withTranslator: CMEnglishTranslator new)
		items: CMMockModel availableProbes;
		open.
]

{ #category : 'as yet unclassified' }
CMModelDesignerProbesPresenter class >> withTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'as yet unclassified' }
CMModelDesignerProbesPresenter >> contextMenuButtons [

	^ { removeButton }
]

{ #category : 'examples' }
CMModelDesignerProbesPresenter >> example [

	<script: 'self example'>
]

{ #category : 'initialization' }
CMModelDesignerProbesPresenter >> initializeList [

	^ self newTable
		hideColumnHeaders;
		addColumn: ((SpImageTableColumn evaluated: [ :probe | 
			| form |
			form := Form extent: 16 @ 16 depth: 32.
			form getCanvas fillColor: probe color.
			form ])
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn evaluated: [ :probe | probe name ]);
		yourself
]

{ #category : 'accessing - model' }
CMModelDesignerProbesPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator.
	title := translator tProbes
]

{ #category : 'as yet unclassified' }
CMModelDesignerProbesPresenter >> sortedItems: aCollection [

	^ aCollection sorted: [ :a :b | a name < b name ]
]

{ #category : 'initialization' }
CMModelDesignerProbesPresenter >> toolbarButtons [

	^ { addButton . removeButton }
]
