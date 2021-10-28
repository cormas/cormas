Class {
	#name : #CMSpControlsPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'initializeSimButton',
		'runStepButton',
		'runAllStepsButton',
		'stopButton'
	],
	#category : #'Cormas-UI-Spec2-Project'
}

{ #category : #specs }
CMSpControlsPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal 
		add: #initializeSimButton;
		add: #runStepButton;
		add: #runAllStepsButton;
		add: #stopButton;
		yourself
]

{ #category : #examples }
CMSpControlsPresenter class >> example [

	<example> 
	
	^ self new openWithSpec
]

{ #category : #initialization }
CMSpControlsPresenter >> initializePresenter [ 

	initializeSimButton := self newButton.
	initializeSimButton
		icon: (self iconNamed: #smallRemoteOpen);
		label: 'Initialize Simulation';
		help: 'Setup initialization parameters';
		action: [ UIManager default defer: [ self inform: 'Initialize' ] ];		
		color: Color gray
		yourself.
		
	runStepButton := self newButton.
	runStepButton
		icon: (self iconNamed: #runStepButton);
		label: 'Step';
		help: 'Run a simulation step';
		action: [ UIManager default defer: [ self inform: 'Step' ] ];
		color: Color gray;
		yourself.
		
	runAllStepsButton := self newButton.
	runAllStepsButton
		icon: (self iconNamed: #runAllStepButton);
		label: 'Run all';
		help: 'Run all simulation steps';
		action: [ UIManager default defer: [ self inform: 'All' ] ];
		color: Color gray;
		yourself.
		
	stopButton := self newButton.
	stopButton
		icon: (self iconNamed: #stopButton);
		label: 'Stop';
		help: 'Stop simulation';
		action: [ UIManager default defer: [ self inform: 'Stop' ] ];
		color: Color gray;
		yourself.
]

{ #category : #accessing }
CMSpControlsPresenter >> initializeSimButton [

	^ initializeSimButton
]

{ #category : #accessing }
CMSpControlsPresenter >> initializeSimButton: anObject [

	initializeSimButton := anObject
]

{ #category : #accessing }
CMSpControlsPresenter >> runAllStepsButton [

	^ runAllStepsButton
]

{ #category : #accessing }
CMSpControlsPresenter >> runAllStepsButton: anObject [

	runAllStepsButton := anObject
]

{ #category : #accessing }
CMSpControlsPresenter >> runStepButton [

	^ runStepButton
]

{ #category : #accessing }
CMSpControlsPresenter >> runStepButton: anObject [

	runStepButton := anObject
]

{ #category : #accessing }
CMSpControlsPresenter >> stopButton [

	^ stopButton
]

{ #category : #accessing }
CMSpControlsPresenter >> stopButton: anObject [

	stopButton := anObject
]
