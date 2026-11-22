"
I show, in a window of my own, the data recorded on one entity: a row for each recorded step, with its step and the value of each probe.

## Responsibility:

- I show the data of the entity, or say why it was not recorded.
- I save the data of the entity, or of all instances of its class, as CSV in the output folder of the model.
- I show the data again after each step of the simulation.

## Collaborators:

- `CMSimulation>>dataOf:` gives the data of the entity, and `CMSimulation>>writeCsvOfClass:on:` writes the data of its class.
- `CMDataTable>>writeCsvOn:` writes the data of the entity.
- `CMSpacePresenter` opens me from the context menu of the entity.

## Public API and Key Messages

- `entity:` shows the data of an entity; `showData` shows it again.
- `followSimulation` shows it again at the end of each step.
- `table` and `message` give access to my parts.

```smalltalk
| simulation application cow |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
application := CMSimulationApplication new.
application simulation: simulation.
application cormasModel: simulation cormasModel.
cow := (simulation cormasModel entitiesOfClass: CMMockCow) first.
(application newPresenter: CMEntityDataPresenter)
	entity: cow;
	open
```

## Internal Representation

- `entity`: the entity whose data I show.
- `refreshPending`: whether showing the data after a step is already waiting in the UI process.
"
Class {
	#name : 'CMEntityDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'entity',
		'table',
		'messageLabel',
		'saveButton',
		'saveClassButton',
		'refreshPending'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'initialization' }
CMEntityDataPresenter >> connectPresenters [

	saveButton action: [ self saveToCsv ].
	saveClassButton action: [ self saveClassToCsv ]
]

{ #category : 'accessing' }
CMEntityDataPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'initialization' }
CMEntityDataPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 3;
		  add: messageLabel expand: false;
		  add: table;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: saveButton;
				   add: saveClassButton;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : 'accessing' }
CMEntityDataPresenter >> entity: anEntity [
	"Show the data recorded on anEntity"

	entity := anEntity.
	saveClassButton label: 'Save all ' , entity class name , ' to CSV'.
	self showData
]

{ #category : 'updating' }
CMEntityDataPresenter >> followSimulation [
	"Show the data again at the end of each step of the simulation. The subscription is weak, so that the simulation does not keep me alive"

	self timeStepAnnouncer weak
		when: CMTimeStepEnded
		send: #timeStepEnded:
		to: self
]

{ #category : 'initialization' }
CMEntityDataPresenter >> initializePresenters [

	refreshPending := false.
	table := self newTable.
	messageLabel := self newLabel.
	saveButton := self newButton
		              label: 'Save to CSV';
		              icon: CMIcons csvIcon;
		              yourself.
	saveClassButton := self newButton
		                   icon: CMIcons csvIcon;
		                   yourself
]

{ #category : 'initialization' }
CMEntityDataPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Data of ' , entity printString;
		initialExtent: 600 @ 500;
		whenClosedDo: [ self stopFollowingSimulation ]
]

{ #category : 'accessing' }
CMEntityDataPresenter >> message [
	"Return why the data of the entity cannot be shown, or an empty string"

	^ messageLabel label
]

{ #category : 'actions' }
CMEntityDataPresenter >> saveClassToCsv [
	"Save the data of all instances of the class of the entity in the output folder of the model"

	CMExport
		of: self cormasModel class
		named: entity class name
		extension: 'csv'
		writing: [ :file |
				file writeStreamDo: [ :stream |
					self simulation writeCsvOfClass: entity class on: stream ] ]
]

{ #category : 'actions' }
CMEntityDataPresenter >> saveToCsv [
	"Save the data of the entity in the output folder of the model"

	CMExport
		of: self cormasModel class
		named: entity class name , '-' , entity id printString
		extension: 'csv'
		writing: [ :file |
				file writeStreamDo: [ :stream |
					(self simulation dataOf: entity) writeCsvOn: stream ] ]
]

{ #category : 'updating' }
CMEntityDataPresenter >> showData [
	"Show a row for each step recorded on the entity, or say why it was not recorded"

	| data |
	data := [ self simulation dataOf: entity ]
		        on: CMRecordingError
		        do: [ :error |
				        table
					        columns: #(  );
					        items: #(  ).
				        messageLabel label: error messageText.
				        ^ self ].
	messageLabel label: ''.
	table columns: #(  ).
	#( 'step' ) , data columnNames doWithIndex: [ :name :index |
			table addColumn:
				(SpStringTableColumn
					 title: name
					 evaluated: [ :row | row at: index ]) ].
	table items: data rows
]

{ #category : 'accessing' }
CMEntityDataPresenter >> simulation [

	^ self application simulation
]

{ #category : 'updating' }
CMEntityDataPresenter >> stopFollowingSimulation [

	self timeStepAnnouncer unsubscribe: self
]

{ #category : 'accessing' }
CMEntityDataPresenter >> table [

	^ table
]

{ #category : 'accessing' }
CMEntityDataPresenter >> timeStepAnnouncer [

	^ self simulation simulationContext timeStepAnnouncer
]

{ #category : 'updating' }
CMEntityDataPresenter >> timeStepEnded: aTimeStepEnded [
	"The simulation announces the end of a step in its own process: show the data in the UI process, once for all the steps that ended meanwhile"

	refreshPending ifTrue: [ ^ self ].
	refreshPending := true.
	self defer: [
			refreshPending := false.
			self showData ]
]
