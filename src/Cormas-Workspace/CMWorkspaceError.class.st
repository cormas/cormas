"
I am the error raised when a workspace cannot be used as the modeler asked: a folder that is not a workspace, a folder where Cormas cannot write, or no workspace chosen yet.

## Responsibility:

- I tell the modeler, in my message text, what is wrong and with which folder.
- I let the user interface catch workspace problems separately from other errors.
- I carry no state besides my message text.

## Collaborators:

- `CMWorkspace` signals me when a folder cannot be used as a workspace.

## Public API and Key Messages

- `signal:` with the text shown to the modeler.

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
