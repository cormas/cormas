"
I am the dialog that creates a new model in the workspace. The modeler gives a name, a summary and a class prefix, and the model is written into a new folder of `Models`, then installed from there.

## Responsibility:

- I keep the name and the prefix exactly as typed, say in red next to a field why it cannot make a model, and list the classes Cormas will create.
- I suggest a prefix that follows the name, until the modeler types a prefix of their own.
- I create the model through the workspace, allowing it only when it can be created, and tell whoever opened me which model was created.

## Collaborators:

- `CMModelTemplate` checks the name and the prefix and knows the classes to create.
- `CMWorkspace` checks that the name and the classes are free, writes the model folder and installs it.
- `CMModelListPresenter` opens me and selects the new model.

## Public API and Key Messages

- `CMNewModelPresenter open` opens me as a modal dialog on the workspace of the image, asking for one first if needed.
- `CMNewModelPresenter on: aWorkspace` creates me on a workspace.
- `whenCreatedDo: aBlock` evaluates aBlock with the baseline name of the created model.

```smalltalk
(CMNewModelPresenter on: CMWorkspace current)
	whenCreatedDo: [ :baselineName | Transcript show: baselineName; cr ];
	openModal
```

## Internal Representation

- `workspace` is the `CMWorkspace` the model is created in.
- `nameError` and `prefixError`, next to the labels of the name and the prefix, say in red why they cannot make a model, and are empty otherwise.
- `classesLine`, under the prefix, lists the classes Cormas will create.
- `suggestedPrefix` is the last prefix I suggested, to know whether the modeler changed it.
- `createdBlock` is evaluated once the model is created.
"
Class {
	#name : 'CMNewModelPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'workspace',
		'nameInput',
		'nameError',
		'summaryInput',
		'prefixInput',
		'prefixError',
		'classesLine',
		'createButton',
		'cancelButton',
		'suggestedPrefix',
		'createdBlock'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'opening' }
CMNewModelPresenter class >> open [
	"Open the dialog on the workspace of the image, asking the modeler to choose one first if needed"

	| workspace |
	workspace := CMWorkspace currentIfNone: [
			             CMWorkspaceChooser open.
			             CMWorkspace currentIfNone: [ ^ nil ] ].
	^ (self on: workspace) openModal
]

{ #category : 'accessing' }
CMNewModelPresenter >> classesLine [

	^ classesLine
]

{ #category : 'initialization' }
CMNewModelPresenter >> connectPresenters [

	nameInput whenTextChangedDo: [ self nameChanged ].
	prefixInput whenTextChangedDo: [ self updateLines ].
	createButton action: [ self create ].
	cancelButton action: [ self window close ]
]

{ #category : 'actions' }
CMNewModelPresenter >> create [
	"Write the model into the workspace and install it, then close and tell who opened the dialog"

	| template |
	[
		template := self template.
		UIManager default
			informUser: 'Creating ' , template baselineName , '…'
			during: [ workspace createModelFrom: template ] ]
		on: CMWorkspaceError
		do: [ :error | ^ UIManager default alert: error messageText ].
	self window close.
	createdBlock ifNotNil: [ createdBlock value: template baselineName ]
]

{ #category : 'accessing' }
CMNewModelPresenter >> createButton [

	^ createButton
]

{ #category : 'layout' }
CMNewModelPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 4;
		  add: (self label: 'Name' withError: nameError) expand: false;
		  add: nameInput expand: false;
		  add: 'Summary' expand: false;
		  add: summaryInput;
		  add: (self label: 'Class prefix' withError: prefixError)
		  expand: false;
		  add: prefixInput expand: false;
		  add: classesLine expand: false;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 8;
				   addLast: cancelButton expand: false;
				   addLast: createButton expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : 'private' }
CMNewModelPresenter >> error: anErrorLabel of: aBlock [
	"Evaluate aBlock, showing in anErrorLabel why it raised a CMWorkspaceError. Return whether it did"

	^ [
		  aBlock value.
		  false ]
		  on: CMWorkspaceError
		  do: [ :error |
				  anErrorLabel label: error messageText.
				  true ]
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializeDialogWindow: aDialogWindowPresenter [
	"Add no Ok and Cancel buttons: the dialog has its own"

	
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializePresenters [

	nameInput := self newTextInput placeholder: 'ForestFire'.
	nameError := self newLabel addStyle: 'headerError'.
	summaryInput := self newText placeholder:
		                'What the model is about, in a few lines'.
	prefixInput := self newTextInput placeholder: 'FF'.
	prefixError := self newLabel addStyle: 'headerError'.
	classesLine := self newLabel.
	createButton := self newButton
		                label: 'Create model';
		                icon: (self iconNamed: #smallNew);
		                addStyle: 'large';
		                yourself.
	cancelButton := self newButton
		                label: 'Cancel';
		                yourself.
	suggestedPrefix := ''.
	self updateLines
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'New model';
		initialExtent: 620 @ 400
]

{ #category : 'layout' }
CMNewModelPresenter >> label: aString withError: anErrorLabel [

	^ SpBoxLayout newLeftToRight
		  spacing: 10;
		  add: aString expand: false;
		  add: (SpBoxLayout newLeftToRight
				   hAlignEnd;
				   add: anErrorLabel expand: false;
				   yourself);
		  yourself
]

{ #category : 'updating' }
CMNewModelPresenter >> nameChanged [
	"Follow the name with the prefix Cormas suggests, until the modeler types a prefix of their own"

	| newPrefix |
	newPrefix := [ (CMModelTemplate named: nameInput text) prefix ]
		             on: CMWorkspaceError
		             do: [ '' ].
	prefixInput text = suggestedPrefix ifTrue: [
			suggestedPrefix := newPrefix.
			prefixInput text: newPrefix ].
	suggestedPrefix := newPrefix.
	self updateLines
]

{ #category : 'accessing' }
CMNewModelPresenter >> nameError [

	^ nameError
]

{ #category : 'accessing' }
CMNewModelPresenter >> nameInput [

	^ nameInput
]

{ #category : 'accessing' }
CMNewModelPresenter >> prefixError [

	^ prefixError
]

{ #category : 'accessing' }
CMNewModelPresenter >> prefixInput [

	^ prefixInput
]

{ #category : 'initialization' }
CMNewModelPresenter >> setModelBeforeInitialization: aWorkspace [

	workspace := aWorkspace
]

{ #category : 'actions' }
CMNewModelPresenter >> template [
	"Return the template made from the fields. Raise a CMWorkspaceError when they cannot make a model"

	^ (CMModelTemplate named: nameInput text)
		  prefix: prefixInput text;
		  description: summaryInput text asString trimBoth;
		  yourself
]

{ #category : 'updating' }
CMNewModelPresenter >> updateLines [
	"Say next to each field why it cannot make a model, list the classes Cormas will create, and allow creating only a model it can create"

	| template |
	createButton disable.
	nameError label: ''.
	prefixError label: ''.
	classesLine label: ''.
	nameInput text ifEmpty: [ ^ self ].
	(self error: nameError of: [
			 template := CMModelTemplate named: nameInput text.
			 workspace checkNameIsFree: template baselineName ]) ifTrue: [
		^ self ].
	(self error: prefixError of: [
			 template prefix: prefixInput text.
			 workspace checkClassesAreFreeFor: template ]) ifTrue: [ ^ self ].
	classesLine label:
		'Classes ' , (', ' join: template classNames allButFirst).
	createButton enable
]

{ #category : 'api' }
CMNewModelPresenter >> whenCreatedDo: aBlock [
	"Evaluate aBlock with the baseline name of the model once it is created"

	createdBlock := aBlock
]
