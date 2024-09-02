Class {
	#name : 'CMModelDesignerNewClassPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'prefix',
		'cellClassRadioButton',
		'agentClassRadioButton',
		'otherClassRadioButton',
		'nameInput',
		'superclassDroplist',
		'createClassButton'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter class >> forModelClass: aClass prefix: aString translator: aTranslator [

	^ self on: { aClass . aString . aTranslator }
]

{ #category : 'initialization' }
CMModelDesignerNewClassPresenter >> connectPresenters [

	cellClassRadioButton whenChangedDo: [ self updateSuperclasses ].
	agentClassRadioButton whenChangedDo: [ self updateSuperclasses ].
	otherClassRadioButton whenChangedDo: [ self updateSuperclasses ].
	
	createClassButton action: [ self createClass ]
]

{ #category : 'installing' }
CMModelDesignerNewClassPresenter >> createClass [

	| className superclass |
	
	className := prefix, nameInput text.
	superclass := superclassDroplist selectedItem.
	
	(superclass << className asSymbol
		package: modelClass package) install.
		
	owner ifNotNil: [ owner owner updateNotebookPages ]
]

{ #category : 'layout' }
CMModelDesignerNewClassPresenter >> defaultLayout [

	| labelColumnWidth |
	labelColumnWidth := 85.

	^ SpBoxLayout newLeftToRight
		hAlignCenter;
		borderWidth: 30;
		add: (SpBoxLayout newTopToBottom
			spacing: 20;
			add: (SpBoxLayout newTopToBottom
				add: (SpBoxLayout newLeftToRight
					add: 'Type of class:' width: labelColumnWidth;
					add: cellClassRadioButton;
					yourself) expand: false;
				add: (SpBoxLayout newLeftToRight
					add: '' width: labelColumnWidth;
					add: agentClassRadioButton;
					yourself) expand: false;
				add: (SpBoxLayout newLeftToRight
					add: '' width: labelColumnWidth;
					add: otherClassRadioButton;
					yourself) expand: false;
				yourself) expand: false;
			add: (SpBoxLayout newTopToBottom
				spacing: 5;
				add: (SpBoxLayout newLeftToRight
					add: 'Name:' width: labelColumnWidth;
					add: nameInput;
					yourself) expand: false;
				add: (SpBoxLayout newLeftToRight
					add: 'Superclass:' width: labelColumnWidth;
					add: superclassDroplist;
					yourself) expand: false;
				yourself) height: 2 * self class buttonHeight + 5;
			add: createClassButton expand: false;
			yourself) width: 400;
		yourself
]

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter >> displaySuperclassesForAgentClass [

	| agentClasses |
	
	agentClasses := modelClass package classes asOrderedCollection
		select: [ :aClass | aClass isCormasAgentClass ].
		
	superclassDroplist display: [ :aClass |
		(agentClasses includes: aClass)
			ifTrue: [ aClass name withoutPrefix: prefix ]
			ifFalse: [ aClass name ] ].
				
	superclassDroplist items: ({ CMAgent }, agentClasses)
]

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter >> displaySuperclassesForCellClass [

	superclassDroplist items: { CMSpatialEntityElement . CMSpatialEntityCell }
]

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter >> displaySuperclassesForCustomClass [

	| customClasses |
	
	customClasses := modelClass package classes asOrderedCollection
		reject: [ :aClass |
			aClass isCormasModelClass
				or: [ aClass isCormasAgentClass
					or: [ aClass isCormasCellClass ] ] ].
			
	superclassDroplist display: [ :aClass |
		(customClasses includes: aClass)
			ifTrue: [ aClass name withoutPrefix: prefix ]
			ifFalse: [ aClass name ] ].
				
	superclassDroplist items: ({ Object }, customClasses)
]

{ #category : 'examples' }
CMModelDesignerNewClassPresenter >> example [

	<script: '(self forModelClass: CMMockModel prefix: ''CMMock'' translator: CMEnglishTranslator new) open'>
]

{ #category : 'initialization' }
CMModelDesignerNewClassPresenter >> initializePresenters [

	cellClassRadioButton := self newRadioButton
		label: 'Cell';
		yourself.
		
	agentClassRadioButton := self newRadioButton
		label: 'Agent';
		yourself.
		
	otherClassRadioButton := self newRadioButton
		label: 'Custom';
		yourself.
		
	cellClassRadioButton associatedRadioButtons: { agentClassRadioButton . otherClassRadioButton }.
	
	nameInput := self newTextInput
		placeholder: '(class name without prefix)';
		yourself.
	
	superclassDroplist := self newDropList.
	self updateSuperclasses.
		
	createClassButton := self newButton
		label: 'Create Class';
		icon: (self iconNamed: #smallAdd);
		yourself
]

{ #category : 'accessing - model' }
CMModelDesignerNewClassPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	prefix := aCollection second.
	translator := aCollection third
]

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter >> updateSuperclasses [

	cellClassRadioButton state
		ifTrue: [ ^ self displaySuperclassesForCellClass ].
	
	agentClassRadioButton state
		ifTrue: [ ^ self displaySuperclassesForAgentClass ].
	
	otherClassRadioButton state
		ifTrue: [ ^ self displaySuperclassesForCustomClass ].
		
	"This should be impossible"
	self error: 'No radio button was selected'.
]

{ #category : 'as yet unclassified' }
CMModelDesignerNewClassPresenter >> updateSuperclassesWith: aCollection [

	superclassDroplist items: aCollection
]
