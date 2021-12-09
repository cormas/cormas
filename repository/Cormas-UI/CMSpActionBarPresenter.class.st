Class {
	#name : #CMSpActionBarPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'actionBar',
		'text'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpActionBarPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom 
		add: #text;
		addLast: #actionBar expand: false fill: false padding: 0;
		yourself
]

{ #category : #initialization }
CMSpActionBarPresenter >> initializePresenters [
	
	actionBar := self newActionBar
		add: (self newButton
			label: 'Add'; 
			icon: (self iconNamed: #smallOk);
			help: 'Add.';
			action: [ UIManager default defer: [ self inform: 'Add' ] ];
			yourself);
		add: (self newButton
			label: 'Remove'; 
			icon: (self iconNamed: #smallCancel);
			help: 'Remove.';
			action: [ UIManager default defer: [ self inform: 'Remove' ] ];
			yourself);
		addLast: (self newButton
			label: 'Other'; 
			help: 'Other.';
			action: [ UIManager default defer: [ self inform: 'Other' ] ];
			yourself);
		yourself.

	text := self newText
]
