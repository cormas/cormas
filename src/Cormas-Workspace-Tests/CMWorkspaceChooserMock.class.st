"
I am a workspace chooser that gives prepared answers instead of opening dialogs, and remembers what was asked and shown, so that tests run without a user.

```smalltalk
(CMWorkspaceChooserMock new
	defaultLocation: FileSystem memory root / 'Cormas';
	answers: #( true ))
	choose
```

Each dialog takes the next answer: `true` or `false` for a question, a folder or `nil` for a folder dialog, `nil` meaning cancelled.
"
Class {
	#name : 'CMWorkspaceChooserMock',
	#superclass : 'CMWorkspaceChooser',
	#instVars : [
		'defaultLocation',
		'answers',
		'questions',
		'alerts'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'dialogs' }
CMWorkspaceChooserMock >> alert: aString [

	alerts add: aString
]

{ #category : 'accessing' }
CMWorkspaceChooserMock >> alerts [

	^ alerts
]

{ #category : 'accessing' }
CMWorkspaceChooserMock >> answers: aCollection [

	answers := aCollection asOrderedCollection.
	questions := OrderedCollection new.
	alerts := OrderedCollection new
]

{ #category : 'dialogs' }
CMWorkspaceChooserMock >> ask: aQuestion choosing: firstChoice or: secondChoice [

	questions add: {
			firstChoice.
			secondChoice }.
	^ answers removeFirst
]

{ #category : 'dialogs' }
CMWorkspaceChooserMock >> chooseFolder: aTitle [

	^ answers removeFirst
]

{ #category : 'accessing' }
CMWorkspaceChooserMock >> defaultLocation [

	^ defaultLocation
]

{ #category : 'accessing' }
CMWorkspaceChooserMock >> defaultLocation: aFileReference [

	defaultLocation := aFileReference
]

{ #category : 'accessing' }
CMWorkspaceChooserMock >> questions [

	^ questions
]
