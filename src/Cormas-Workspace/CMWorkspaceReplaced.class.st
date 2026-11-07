"
I am announced by a `CMWorkspace` when another workspace becomes the workspace of the image, as Change working directory does. Tools that show the previous workspace listen to me to show the new one instead.

## Responsibility:

- I tell listeners which workspace replaces the one that announces me.

## Collaborators:

- `CMWorkspace class>>changeTo:` announces me through the `announcer` of the previous workspace.

## Public API and Key Messages

- `CMWorkspaceReplaced by: aWorkspace` creates me.
- `workspace` returns the new workspace of the image.

```smalltalk
CMWorkspace current announcer
	when: CMWorkspaceReplaced
	do: [ :announcement | announcement workspace inspect ]
	for: self
```

## Internal Representation

- `workspace` is the `CMWorkspace` that replaces the previous one.
"
Class {
	#name : 'CMWorkspaceReplaced',
	#superclass : 'Announcement',
	#instVars : [
		'workspace'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMWorkspaceReplaced class >> by: aWorkspace [

	^ self new setWorkspace: aWorkspace
]

{ #category : 'accessing' }
CMWorkspaceReplaced >> setWorkspace: aWorkspace [

	workspace := aWorkspace
]

{ #category : 'accessing' }
CMWorkspaceReplaced >> workspace [

	^ workspace
]
