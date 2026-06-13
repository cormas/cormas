Class {
	#name : 'CMModelDesignerMethodsPresenter',
	#superclass : 'CMModelDesignerListPresenter',
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerMethodsPresenter class >> example [
	<example>
	
	(self withTitle: 'Custom methods')
		items: CMMockModel methods;
		open
]

{ #category : 'as yet unclassified' }
CMModelDesignerMethodsPresenter class >> withTitle: aString [
	
	^ self on: aString
]

{ #category : 'as yet unclassified' }
CMModelDesignerMethodsPresenter >> contextMenuButtons [

	^ { removeButton }
]

{ #category : 'examples' }
CMModelDesignerMethodsPresenter >> example [

	<script: 'self example'>
]

{ #category : 'initialization' }
CMModelDesignerMethodsPresenter >> initializeList [

	^ self newList
		display: [ :method | method selector asString ];
		yourself
]

{ #category : 'as yet unclassified' }
CMModelDesignerMethodsPresenter >> sortedItems: aCollection [

	^ aCollection sorted: [ :a :b | a selector < b selector ]
]

{ #category : 'initialization' }
CMModelDesignerMethodsPresenter >> toolbarButtons [

	^ { addButton . removeButton }
]
