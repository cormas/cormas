Extension { #name : 'CMModel' }

{ #category : '*Cormas-Workspace' }
CMModel class >> folder [
	"Return the folder of my model in the workspace, where its data, screenshots and outputs are, such as self folder / 'data' / 'map.csv'"

	^ CMWorkspace current folderOf: self
]

{ #category : '*Cormas-Workspace' }
CMModel >> folder [
	"Return the folder of my model in the workspace, where its data, screenshots and outputs are, such as self folder / 'data' / 'map.csv'"

	^ self class folder
]

{ #category : '*Cormas-Workspace' }
CMModel class >> modelName [
	"Return the name of my model: the name of the baseline it was installed with from the workspace, or my own name when it was not"

	^ CMWorkspace current
		  ifNil: [ self name ]
		  ifNotNil: [ :workspace | workspace nameOfModelClass: self ]
]

{ #category : '*Cormas-Workspace' }
CMModel class >> newOutputFileNamed: aName extension: anExtension [
	"Return a file of the output folder of my model that does not exist yet, named after aName and the time, such as 'data 2026-11-07 14-05-09.csv': exporting twice never replaces a file. Raise a CMWorkspaceError when my model is not installed from the workspace"

	| output |
	output := self folder / 'output'.
	CMWorkspaceError
		whileWritingIn: output
		do: [ output ensureCreateDirectory ].
	^ CMWorkspace current
		  newFileNamed: aName
		  extension: anExtension
		  in: output
]
