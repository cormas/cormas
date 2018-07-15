"
GenericChange is the abstract of all delayed changes used in Cormas.

Instance Variables:
	parameter	<Object>	any parameter forthe notification
	symbol	<Symbol>	the notification symbol for the change


"
Class {
	#name : #GenericChange,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'parameter'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #'instance creation' }
GenericChange class >> newChange: aSymbol with: aParameter [
	"create a new instance for remembering the change information"
	
	^self new newChange: aSymbol with: aParameter
]

{ #category : #'instance creation' }
GenericChange class >> newChange: aSymbol with: aParameter from: anEntity [
	"create a new instance for remembering the change information"
	
	^self new newChange: aSymbol with: aParameter from: anEntity
]

{ #category : #dispatching }
GenericChange >> dispatchOn: anObject [
	
	self subclassResponsibility
]

{ #category : #'initialize-release' }
GenericChange >> newChange: aSymbol with: aParameter [
	
	symbol := aSymbol.
	parameter := aParameter
]

{ #category : #accessing }
GenericChange >> parameter [
	
	^parameter
]

{ #category : #accessing }
GenericChange >> symbol [
	
	^symbol
]
