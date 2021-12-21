Class {
	#name : #CMClassTreeSpPresenter,
	#superclass : #CMModelSpPresenter,
	#instVars : [
		'titlePresenter',
		'classTreePresenter',
		'roots',
		'titleList'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #specs }
CMClassTreeSpPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom 
		add: #titlePresenter height: self labelHeight;
		add: #classTreePresenter;
		yourself
]

{ #category : #initialization }
CMClassTreeSpPresenter >> classTreeContextMenu: tree [

	^ [ 
		SpMenuPresenter new 
			addGroup: [ :group | 
				group 
					addItem: [ : item | item name: 'Browse'; action: [ tree selectedItem browse ] ];
	            addItem: [ :item | item name: 'Create subclass'; action: [ self newSubclassAction: tree ] ] ] 
		]
]

{ #category : #accessing }
CMClassTreeSpPresenter >> classTreePresenter [

	^ classTreePresenter
]

{ #category : #accessing }
CMClassTreeSpPresenter >> classTreePresenter: anObject [

	^ classTreePresenter := anObject
]

{ #category : #initialization }
CMClassTreeSpPresenter >> initializeClassTree [

	(classTreePresenter := self newTree)
		roots: self roots;
		beResizable;
		children: #subclasses;
		displayIcon: #systemIcon;
		display: [ :aClass | aClass name ];
		expandRoots;
		whenSelectionChangedDo: [ : sel | sel halt ];
		contextMenu: (self classTreeContextMenu: classTreePresenter).
]

{ #category : #initialization }
CMClassTreeSpPresenter >> initializePresenters [ 

	titlePresenter := self newLabel label: self titleList.
	self initializeClassTree.
	

]

{ #category : #callbacks }
CMClassTreeSpPresenter >> newSubclassAction: tree [

	| refactoring |

	refactoring := RBAddClassRefactoring
		addClass: (UIManager default request: 'Enter the new Class name')
				superclass: tree selectedItem
				subclasses: #()
				category: tree selectedItem category.
	refactoring execute.
	tree 
		roots: self roots;
		expandPath: tree selection selectedPath;
		refresh
]

{ #category : #accessing }
CMClassTreeSpPresenter >> roots [

	^ roots
]

{ #category : #accessing }
CMClassTreeSpPresenter >> roots: anObject [

	roots := anObject
]

{ #category : #callbacks }
CMClassTreeSpPresenter >> setModelBeforeInitialization: anAssociation [

	self titleList: anAssociation key.
	self roots: anAssociation value.
]

{ #category : #accessing }
CMClassTreeSpPresenter >> titleList [

	^ titleList
]

{ #category : #accessing }
CMClassTreeSpPresenter >> titleList: anObject [

	titleList := anObject
]

{ #category : #accessing }
CMClassTreeSpPresenter >> titlePresenter [

	^ titlePresenter
]

{ #category : #accessing }
CMClassTreeSpPresenter >> titlePresenter: anObject [

	titlePresenter := anObject
]
