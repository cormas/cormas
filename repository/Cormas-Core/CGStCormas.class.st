"
Code generator for CORMAS 

"
Class {
	#name : #CGStCormas,
	#superclass : #CGStTemplate,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
CGStCormas class >> for: aCMProjectModel [
	" Answer a new instance of the recever "
	
	^ self new 
		cormasModel: aCMProjectModel;
		yourself
]

{ #category : #'code-generation' }
CGStCormas >> addNewClassType: aType inheritingFrom: aSuperclass name: aName initProtocol: createInit stepProtocol: createStep [
	| newClass selectionInList selector newList |
	self generateClass: aName superclass: aSuperclass.
	newClass := self targetClass.
	selector := (aType asLowercase , 'Classes') asSymbol.
	(self cormasModelClass perform: selector) add: newClass.
	(newClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [ self cormasModelClass cellClass: newClass ].
	selectionInList := self
		perform: ('list' , aType , 'Entities') asSymbol.	"selectionInList list add: aName asSymbol."
	newList := self getSortedListEntityClassType: aType.
	selectionInList list: newList.
	selectionInList
		selection:
			(newList
				detect: [ :s | (Cormas dropBlanksFromString: s) = aName ]
				ifNone: [nil]).
	self createModelAccessors: newClass.
	self createProtocol: #control forClass: newClass.
	createInit
		ifTrue: [ self createInit: newClass ].
	createStep
		ifTrue: [ self createStep: newClass ].	"self modifyEntityClassType: aType."
	^ newClass
]

{ #category : #'mustache-templates' }
CGStCormas >> buildContext [
	" Private - Build Mustache context "

	^ Dictionary new
		at: 'povAttribute' put: self buildPovAttribute;
		yourself.
]

{ #category : #accessing }
CGStCormas >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CGStCormas >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #accessing }
CGStCormas >> cormasModelClass [

	^ self cormasModel cormasModelClass

	
]

{ #category : #'mustache-templates' }
CGStCormas >> createPovOnAttribute [
	" Generate code String for #initializeWidgets "

	^ (MustacheTemplate on: self templateForPovOnAttribute) value: self buildContext.
]

{ #category : #'code-generation' }
CGStCormas >> generateMethodHeader [
	" Add the selector and comments if configured "
	
	self resetCodeStream.	
	self buildMethodHeader.


]

{ #category : #'code-templates' }
CGStCormas >> templateForInit [

	^ 'init
	" To be completed "
	
'
]

{ #category : #'code-templates' }
CGStCormas >> templateForInitAgents [

	^ 'initAgents
	" To be completed "
	
'
]

{ #category : #'code-templates' }
CGStCormas >> templateForPovOnAttribute [

	^ 'pov
	" To be completed "
	
'
]

{ #category : #'mustache-templates' }
CGStCormas >> templateForPovOnAttribute: attribute [

	^ 'pov' , attribute capitalized ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word {1} "
	self {1} isString ifTrue:[ ^ self {1} asSymbol ].
	self {1}	isLiteral ifTrue:[ ^ (''{1}'' , self {1} printString) asSymbol ].
	^ self {1}' format: { attribute }
]

{ #category : #'code-templates' }
CGStCormas >> templateForStep [

	^ 'step: anObject
	" To be completed "
	
'
]
