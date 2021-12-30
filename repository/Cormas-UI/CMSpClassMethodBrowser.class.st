Class {
	#name : #CMSpClassMethodBrowser,
	#superclass : #CMModelSpPresenter,
	#instVars : [
		'protocolListPresenter',
		'methodListPresenter',
		'textPresenter',
		'selectedClass'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #specs }
CMSpClassMethodBrowser class >> defaultSpec [
	^ SpPanedLayout newTopToBottom
		add:
			(SpPanedLayout newLeftToRight
				add: #protocolListPresenter;
				add: #methodListPresenter;
				yourself);
		add: #textPresenter;
		yourself
]

{ #category : #actions }
CMSpClassMethodBrowser >> beSelected [

]

{ #category : #initialization }
CMSpClassMethodBrowser >> connectPresenters [

	self protocols: self selectedClass protocols.

	protocolListPresenter
		transmitTo: methodListPresenter
		transform: [ : protocol | self methodsInProtocol: protocol ]
		postTransmission: [ :destination | destination selectIndex: 1 ].
		
	methodListPresenter
		transmitTo: textPresenter
		transform: [ :method | method ifNil: [ '' ] ifNotNil: #sourceCode ]
		postTransmission: [ :destination :origin :transmited | 
			transmited ifNotNil: [ destination beForMethod: transmited ] ]
]

{ #category : #accessing }
CMSpClassMethodBrowser >> entitiesPresenter [

	^ self owner entitiesPresenter
]

{ #category : #initialization }
CMSpClassMethodBrowser >> initializePresenters [

	protocolListPresenter := self newList headerTitle: 'Protocols'; yourself.
	methodListPresenter := self newList headerTitle: 'Methods'; yourself.
	textPresenter := self newCode.
	textPresenter whenSubmitDo: [ :text | methodListPresenter selectedItem inspect ].
	methodListPresenter display: #selector.
	self focusOrder
		add: protocolListPresenter;
		add: methodListPresenter;
		add: textPresenter
]

{ #category : #initialization }
CMSpClassMethodBrowser >> methodsInProtocol: protocol [
	" Answer a <Collection> of <CompiledMethod> to be displayed in the receiver "

	^ protocol 
		ifNil: [ #() ] 
		ifNotNil: [ self selectedClass methodsInProtocol: protocol ]
]

{ #category : #accessing }
CMSpClassMethodBrowser >> protocols: aList [

	protocolListPresenter
		items: aList;
		selectIndex: 1
]

{ #category : #accessing }
CMSpClassMethodBrowser >> selectedClass [
	" Answer a <Class> representing the current user selected class "
	
	^ selectedClass
]

{ #category : #initialization }
CMSpClassMethodBrowser >> setModelBeforeInitialization: aClass [

	selectedClass := aClass
]
