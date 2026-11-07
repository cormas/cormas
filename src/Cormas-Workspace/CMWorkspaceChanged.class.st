"
I am announced by a `CMWorkspace` when its installed models change: a model is installed, uninstalled or reloaded, moves to another folder, or stops being saved. Tools that show the workspace, such as the model list, listen to me to stay up to date, whoever made the change.

## Responsibility:

- I tell listeners that what the workspace shows has changed.
- I carry nothing: listeners ask the workspace what is new.

## Collaborators:

- `CMWorkspace` announces me through its `announcer`.

## Public API and Key Messages

```smalltalk
CMWorkspace current announcer
	when: CMWorkspaceChanged
	do: [ :announcement | Transcript show: 'The workspace changed'; cr ]
	for: self
```
"
Class {
	#name : 'CMWorkspaceChanged',
	#superclass : 'Announcement',
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}
