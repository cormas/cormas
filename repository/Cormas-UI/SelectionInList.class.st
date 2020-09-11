Class {
	#name : #SelectionInList,
	#superclass : #Object,
	#category : 'Cormas-UI-VW-Compatibility'
}

{ #category : #'instance creation' }
SelectionInList class >> with: aCollection [

	^ TickDialogWindow
		itemsList: aCollection 
		itemsHeaderName: String empty 
		title: 'CORMAS'
]

{ #category : #accessing }
SelectionInList >> selectionIndexHolder [
]

{ #category : #'initialize - release' }
SelectionInList >> with: aCollection [

	self selectionList: (TickDialogWindow
		itemsList: aCollection 
		itemsHeaderName: String empty 
		title: 'CORMAS')
]
