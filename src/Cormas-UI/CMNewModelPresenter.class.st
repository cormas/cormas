Class {
	#name : 'CMNewModelPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'workspace',
		'nameInput',
		'prefixInput',
		'descriptionInput',
		'preview',
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
	^ (self on: workspace) open
]

{ #category : 'initialization' }
CMNewModelPresenter >> connectPresenters [

	nameInput whenTextChangedDo: [ self nameChanged ].
	prefixInput whenTextChangedDo: [ self updatePreview ].
	descriptionInput whenTextChangedDo: [ self updatePreview ].
	createButton action: [ self create ].
	cancelButton action: [ self window close ]
]

{ #category : 'private' }
CMNewModelPresenter >> create [
	"Write the model into the workspace and install it, then close and tell who opened the dialog"

	| template |
	[
		template := self template.
		UIManager default
			informUser: 'Creating ' , template name , '…'
			during: [ workspace createModelFrom: template ] ]
		on: CMWorkspaceError
		do: [ :error | ^ UIManager default alert: error messageText ].
	self window close.
	createdBlock ifNotNil: [ createdBlock value: template baselineName ]
]

{ #category : 'layout' }
CMNewModelPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: 'Name of the model' expand: false;
		  add: nameInput expand: false;
		  add: 'Beginning of the class names' expand: false;
		  add: prefixInput expand: false;
		  add: 'Description' expand: false;
		  add: descriptionInput height: 90;
		  add: 'What Cormas will create' expand: false;
		  add: preview;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   addLast: cancelButton expand: false;
				   addLast: createButton expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : 'private' }
CMNewModelPresenter >> descriptionOf: aTemplate [

	^ String streamContents: [ :stream |
			  stream
				  nextPutAll: 'The folder Models/';
				  nextPutAll: aTemplate basename;
				  nextPutAll: ' in the workspace, with:';
				  cr;
				  nextPutAll: '- the baseline BaselineOf';
				  nextPutAll: aTemplate baselineName;
				  cr;
				  nextPutAll: '- the package ';
				  nextPutAll: aTemplate modelPackageName;
				  nextPutAll: ', with the classes ';
				  nextPutAll: aTemplate modelClassName;
				  nextPutAll: ' and ';
				  nextPutAll: aTemplate cellClassName;
				  cr;
				  nextPutAll: '- the package ';
				  nextPutAll: aTemplate testPackageName;
				  nextPutAll: ', with the class ';
				  nextPutAll: aTemplate testClassName;
				  cr;
				  cr;
				  nextPutAll:
					  'Cormas then installs the model in the image from this folder.' ]
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializePresenters [

	nameInput := self newTextInput placeholder: 'Forest fire'.
	prefixInput := self newTextInput placeholder: 'FF'.
	descriptionInput := self newText placeholder:
		                    'What the model is about, in one paragraph'.
	preview := self newText beNotEditable.
	createButton := self newButton
		                label: 'Create';
		                icon: (self iconNamed: #smallNew);
		                disable;
		                yourself.
	cancelButton := self newButton
		                label: 'Cancel';
		                yourself.
	suggestedPrefix := ''.
	self updatePreview
]

{ #category : 'layout' }
CMNewModelPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'New Cormas model';
		initialExtent: 600 @ 560
]

{ #category : 'private' }
CMNewModelPresenter >> nameChanged [
	"Follow the name with the prefix Cormas suggests, until the modeler types a prefix of their own"

	| newPrefix |
	newPrefix := [
	             (CMModelTemplate named: nameInput text trimBoth) prefix ]
		             on: CMWorkspaceError
		             do: [ '' ].
	prefixInput text trimBoth = suggestedPrefix ifTrue: [
			suggestedPrefix := newPrefix.
			prefixInput text: newPrefix ].
	suggestedPrefix := newPrefix.
	self updatePreview
]

{ #category : 'initialization' }
CMNewModelPresenter >> setModelBeforeInitialization: aWorkspace [

	workspace := aWorkspace
]

{ #category : 'private' }
CMNewModelPresenter >> template [
	"Return the template made from the fields. Raise a CMWorkspaceError when they cannot make a model"

	| template |
	template := CMModelTemplate named: nameInput text trimBoth.
	prefixInput text trimBoth ifNotEmpty: [ :prefix |
		template prefix: prefix ].
	template description: descriptionInput text asString trimBoth.
	(workspace folders anySatisfy: [ :each |
		 each hasBaselineNamed: template baselineName ]) ifTrue: [
			CMWorkspaceError signal: 'A model named ' , template baselineName
				, ' is already in the workspace: choose another name' ].
	^ template
]

{ #category : 'private' }
CMNewModelPresenter >> updatePreview [
	"Show what Cormas will create, or why it cannot, and allow creating only a model it can create"

	nameInput text trimBoth ifEmpty: [
			preview text: 'Type the name of the model, such as Forest fire.'.
			^ createButton disable ].
	[
		preview text: (self descriptionOf: self template).
		createButton enable ]
		on: CMWorkspaceError
		do: [ :error |
				preview text: error messageText.
				createButton disable ]
]

{ #category : 'api' }
CMNewModelPresenter >> whenCreatedDo: aBlock [
	"Evaluate aBlock with the baseline name of the model once it is created"

	createdBlock := aBlock
]
