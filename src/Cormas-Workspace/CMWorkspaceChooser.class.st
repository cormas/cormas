"
I ask the modeler which workspace this image uses, the folder where Cormas keeps their models. I am opened when an interactive image starts without a workspace, and by Change working directory in the Cormas menu.

## Responsibility:

- I offer the default folder first: to use it when it is a workspace, otherwise to create it there; the other choice lets the modeler create or choose a workspace elsewhere.
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

- Dialogs go through `ask:choosing:or:`, `chooseFolder:` and `alert:`, so that tests answer them with `CMWorkspaceChooserMock`.
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
CMWorkspaceChooser >> ask: aQuestion choosing: firstChoice or: secondChoice [
	"Return true for the first choice, false for the second, nil when cancelled"

	^ self uiManager
		  confirm: aQuestion
		  trueChoice: firstChoice
		  falseChoice: secondChoice
		  cancelChoice: 'Cancel'
		  default: true
]

{ #category : 'private' }
CMWorkspaceChooser >> askForWorkspace [
	"Offer the default folder first: to use it when it is a workspace, otherwise to create it there"

	| default |
	default := self defaultLocation.
	^ (CMWorkspace isWorkspace: default)
		  ifTrue: [ self askToUse: default ]
		  ifFalse: [ self askToCreate: default ]
]

{ #category : 'private' }
CMWorkspaceChooser >> askToCreate: aDefaultFolder [

	| answer folder |
	answer := self
		          ask: self question
		          choosing: 'Create ' , aDefaultFolder fullName
		          or: 'Choose an existing workspace…'.
	answer ifNil: [ ^ nil ].
	answer ifTrue: [ ^ CMWorkspace createAt: aDefaultFolder ].
	folder := self chooseFolder:
		          'Choose the folder of an existing workspace'.
	^ folder ifNotNil: [ CMWorkspace at: folder ]
]

{ #category : 'private' }
CMWorkspaceChooser >> askToUse: aDefaultFolder [

	| answer folder |
	answer := self
		          ask: self question
		          choosing: 'Use ' , aDefaultFolder fullName
		          or: 'Create a new workspace…'.
	answer ifNil: [ ^ nil ].
	answer ifTrue: [ ^ CMWorkspace at: aDefaultFolder ].
	folder := self chooseFolder: 'Choose a folder for the new workspace'.
	^ folder ifNotNil: [ CMWorkspace createAt: folder ]
]

{ #category : 'choosing' }
CMWorkspaceChooser >> choose [
	"Ask the modeler for the workspace of this image until Cormas accepts the folder they choose, explaining why a folder was refused. Return the workspace, or nil when they cancel"

	[
		[ ^ self askForWorkspace ]
			on: CMWorkspaceError
			do: [ :error | self alert: error messageText ] ] repeat
]

{ #category : 'dialogs' }
CMWorkspaceChooser >> chooseFolder: aTitle [
	"Return the folder chosen, or nil when cancelled"

	^ self uiManager
		  chooseDirectory: aTitle
		  path: FileLocator home asFileReference
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
