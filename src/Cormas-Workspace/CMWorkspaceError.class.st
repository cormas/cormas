"
I am the error raised when a workspace cannot be used as the modeler asked: a folder that is not a workspace, a folder where Cormas cannot write, or no workspace chosen yet.

## Responsibility:

- I tell the modeler, in my message text, what is wrong and with which folder.
- I let the user interface catch workspace problems separately from other errors.
- I carry no state besides my message text.

## Collaborators:

- `CMWorkspace` signals me when a folder cannot be used as a workspace or a model cannot be installed.
- `CMInstalledModel` signals me when a package cannot be saved.

## Public API and Key Messages

- `signal:` with the text shown to the modeler.
- `whileWritingIn: aFileReference do: aBlock` turns a file system failure into a `CMWorkspaceError` naming the folder and the reason.

```smalltalk
[ CMWorkspace at: FileLocator home / 'NotAWorkspace' ]
	on: CMWorkspaceError
	do: [ :error | error messageText ]
```
"
Class {
	#name : 'CMWorkspaceError',
	#superclass : 'Error',
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signalling' }
CMWorkspaceError class >> whileWritingIn: aFileReference do: aBlock [
	"Evaluate aBlock, turning a file system failure into a CMWorkspaceError that names the folder and the reason"

	^ aBlock
		  on: FileSystemError , FileException , PrimitiveFailed
		  do: [ :error |
				  self signal:
					  'Cormas cannot write in ' , aFileReference fullName , ' ('
					  , error messageText , ')' ]
]
