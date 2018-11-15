Class {
	#name : #MyFirstWindow,
	#superclass : #ComposableModel,
	#instVars : [
		'labelGreeting',
		'textName',
		'buttonGreet'
	],
	#category : #'My-Spec-Tutorial'
}

{ #category : #specs }
MyFirstWindow class >> defaultSpec [
	"comment stating purpose of message"

	^ SpecColumnLayout new
		add: #labelGreeting;
                        add: #textName;
                        add: #buttonGreet;
		yourself
]

{ #category : #accessing }
MyFirstWindow >> buttonGreet [
	^ buttonGreet
]

{ #category : #accessing }
MyFirstWindow >> buttonGreet: anObject [
	buttonGreet := anObject
]

{ #category : #initialization }
MyFirstWindow >> initializePresenter [
	textName whenTextChanged: [
		buttonGreet enable ].
	buttonGreet action: [
		labelGreeting label: 'Hello, ', textName text, '!'.
		buttonGreet disable ].
]

{ #category : #initialization }
MyFirstWindow >> initializeWidgets [
	self
		instantiateModels: #(labelGreeting LabelModel textName TextInputFieldModel buttonGreet ButtonModel).
	labelGreeting label: ''.
	textName autoAccept: true.
	buttonGreet
		label: 'Greet Me!';
		disable
]

{ #category : #accessing }
MyFirstWindow >> labelGreeting [
	^ labelGreeting
]

{ #category : #accessing }
MyFirstWindow >> labelGreeting: anObject [
	labelGreeting := anObject
]

{ #category : #accessing }
MyFirstWindow >> textName [
	^ textName
]

{ #category : #accessing }
MyFirstWindow >> textName: anObject [
	textName := anObject
]
