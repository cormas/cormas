"
I ask the modeler which workspace this image uses, the folder where Cormas keeps their models. I am opened when an interactive image starts without a workspace, and by Change working directory in the Cormas menu.

## Responsibility:

- I offer the default folder first: to use it when it is a workspace, otherwise to create it there. The other choices are to choose an existing workspace or to create a new one, in any folder.
- I explain why Cormas refuses a folder, such as one that is not a workspace or where it cannot write, and ask again until a folder is accepted or the modeler cancels.
- I make the chosen workspace the one of the image, and explain when that is refused because a model is not saved.

## Collaborators:

- `CMWorkspace` checks, opens and creates workspaces, and `CMWorkspace changeTo:` makes one current.
- `UIManager` shows my questions, the folder dialog and the alerts.

## Public API and Key Messages

- `CMWorkspaceChooser open` asks and makes the chosen workspace current.
- `choose` asks and returns the chosen workspace, or `nil` when the modeler cancels.

```smalltalk
CMWorkspaceChooser open
```

### Implementation Points

- Dialogs go through `ask:choosing:values:`, `chooseFolder:` and `alert:`, so that tests answer them with `CMWorkspaceChooserMock`.
"
Class {
	#name : 'CMWorkspaceChooser',
	#superclass : 'Object',
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMWorkspaceChooser class >> open [

	^ self new open
]

{ #category : 'dialogs' }
CMWorkspaceChooser >> alert: aString [

	self uiManager alert: aString
]

{ #category : 'dialogs' }
CMWorkspaceChooser >> ask: aQuestion choosing: labels values: values [
	"Return the value of the choice made, nil when cancelled"

	^ self uiManager
		  chooseFrom: labels
		  values: values
		  message: aQuestion
		  title: 'Cormas workspace'
]

{ #category : 'private' }
CMWorkspaceChooser >> askForWorkspace [
	"Offer the default folder first: to use it when it is a workspace, otherwise to create it there. The other choices are to choose an existing workspace or to create a new one, in any folder"

	| default useDefault |
	default := self defaultLocation.
	useDefault := (CMWorkspace isWorkspace: default)
		              ifTrue: [
		              'Use ' , default fullName
		              -> [ CMWorkspace at: default ] ]
		              ifFalse: [
		              'Create ' , default fullName
		              -> [ CMWorkspace createAt: default ] ].
	^ (self
		   ask: self question
		   choosing: {
				   useDefault key.
				   'Choose an existing workspace…'.
				   'Create a new workspace…' }
		   values: {
				   useDefault value.
				   [ self chooseExistingWorkspace ].
				   [ self createNewWorkspace ] }) ifNotNil: [ :action |
		  action value ]
]

{ #category : 'choosing' }
CMWorkspaceChooser >> choose [
	"Ask the modeler for the workspace of this image until Cormas accepts the folder they choose, explaining why a folder was refused. Return the workspace, or nil when they cancel"

	[
		[ ^ self askForWorkspace ]
			on: CMWorkspaceError
			do: [ :error | self alert: error messageText ] ] repeat
]

{ #category : 'private' }
CMWorkspaceChooser >> chooseExistingWorkspace [

	^ (self chooseFolder: 'Choose the folder of an existing workspace')
		  ifNotNil: [ :folder | CMWorkspace at: folder ]
]

{ #category : 'dialogs' }
CMWorkspaceChooser >> chooseFolder: aTitle [
	"Return the folder chosen, or nil when cancelled"

	^ self uiManager
		  chooseDirectory: aTitle
		  path: FileLocator home asFileReference
]

{ #category : 'private' }
CMWorkspaceChooser >> createNewWorkspace [

	^ (self chooseFolder: 'Choose a folder for the new workspace')
		  ifNotNil: [ :folder | CMWorkspace createAt: folder ]
]

{ #category : 'private' }
CMWorkspaceChooser >> defaultLocation [

	^ CMWorkspace defaultLocation asFileReference
]

{ #category : 'choosing' }
CMWorkspaceChooser >> open [
	"Choose a workspace and make it the one of this image"

	self choose ifNotNil: [ :workspace |
			[ CMWorkspace changeTo: workspace ]
				on: CMWorkspaceError
				do: [ :error | self alert: error messageText ] ]
]

{ #category : 'private' }
CMWorkspaceChooser >> question [

	^ 'Cormas keeps your models as folders in a workspace. Which workspace should this image use?'
]
