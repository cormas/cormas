Class {
	#name : #CMDropListWithPlaceholderPresenter,
	#superclass : #SpDropListPresenter,
	#category : 'Cormas-UI'
}

{ #category : #testing }
CMDropListWithPlaceholderPresenter >> hasPlaceholder [

	self items ifEmpty: [ ^ false ].
	^ self items first class name = self placeholderClassName 
]

{ #category : #testing }
CMDropListWithPlaceholderPresenter >> isPlaceholderSelected [

	^ self selectedItem class name = self placeholderClassName
]

{ #category : #api }
CMDropListWithPlaceholderPresenter >> items: aCollection [

	self hasPlaceholder
		ifTrue: [ super items: (aCollection copyWithFirst: self items first) ]
		ifFalse: [ super items: aCollection ].
		
	self items ifNotEmpty: [
		self selectItem: self items first ]
]

{ #category : #api }
CMDropListWithPlaceholderPresenter >> placeholder: aString respondingTo: aSelector [

	| placeholderClass argument |
	
	placeholderClass := (Object << self placeholderClassName asSymbol) build.
	
	argument := (aSelector asString endsWith: ':')
		ifTrue: [ ' anArgument' ]
		ifFalse: [ '' ].

	placeholderClass
		addSelector: aSelector
		withMethod: (placeholderClass compiler
			compile: (aSelector asString, argument, ' ^ ''-- ', aString, ' --''')).

	super items: (self items copyWithFirst: placeholderClass new).
]

{ #category : #'as yet unclassified' }
CMDropListWithPlaceholderPresenter >> placeholderClassName [

	^ 'PlaceholderClass'
]
