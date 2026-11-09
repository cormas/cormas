"
I test `CMNewModelPresenter`, the dialog that creates a new model in the workspace.

## Responsibility:

- Check that the dialog shows the name and the prefix as typed, without rewriting them.
- Check that it says under each field what Cormas will create, or why it cannot.
- Check that **Create model** is enabled only for a model that can be created.

## Collaborators:

- `CMNewModelPresenter`: the dialog under test, never opened.
- `CMWorkspace`: a workspace in a memory file system, so that nothing is written to disk.

## Public API and Key Messages

- `setUp` makes a dialog on an empty workspace.

```
CMNewModelPresenterTest buildSuite run
```
"
Class {
	#name : 'CMNewModelPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'dialog'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMNewModelPresenterTest >> setUp [

	super setUp.
	dialog := CMNewModelPresenter on:
		          (CMWorkspace createAt: FileSystem memory root / 'Cormas')
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testCorrectedNameClearsTheError [

	dialog nameInput text: 'Forest fire'.
	dialog nameInput text: 'ForestFire'.
	self assert: dialog nameError label isEmpty.
	self assert: dialog createButton isEnabled
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testCreateIsDisabledUntilANameIsTyped [

	self deny: dialog createButton isEnabled
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testNameWithASpaceIsRefusedAsTyped [

	dialog nameInput text: 'Forest fire'.
	self assert: dialog nameInput text equals: 'Forest fire'.
	self deny: dialog createButton isEnabled.
	self
		assert: dialog nameError label
		equals: 'Use only letters and digits, starting with a letter'
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testPrefixFollowsTheNameUntilItIsEdited [

	dialog nameInput text: 'ForestFire'.
	self assert: dialog prefixInput text equals: 'FF'.
	dialog prefixInput text: 'FOR'.
	dialog nameInput text: 'Woodland'.
	self assert: dialog prefixInput text equals: 'FOR'
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testPrefixOfClassesInTheImageIsRefused [

	dialog nameInput text: 'Woodland'.
	dialog prefixInput text: 'CM'.
	self deny: dialog createButton isEnabled.
	self assert: (dialog prefixError label includesSubstring: 'CMModel')
]

{ #category : 'tests' }
CMNewModelPresenterTest >> testValidNameShowsTheClasses [

	dialog nameInput text: 'ForestFire'.
	self assert: dialog createButton isEnabled.
	self assert: dialog nameError label isEmpty.
	self assert: (dialog classesLine label includesSubstring: 'FFModel')
]
