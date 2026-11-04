"
I am the command of the context menu of the space that removes a link from its model.

A link has no dead state, so it is removed rather than killed.

## Responsibility:

- Remove my owner from the model immediately.

## Collaborators:

- `CMLink`: my owner, which removes itself when deleted.
- `CMBlElement`: offers me in the menu of a link, and updates the view after I run.

## Public API and Key Messages

- `forOwner:` creates me for a link.
- `action` removes it.

```
(CMRemoveSpaceContextMenuCommand forOwner: aLink) action
```
"
Class {
	#name : 'CMRemoveSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMRemoveSpaceContextMenuCommand class >> order [

	^ 2
]

{ #category : 'action' }
CMRemoveSpaceContextMenuCommand >> action [

	owner delete
]

{ #category : 'accessing' }
CMRemoveSpaceContextMenuCommand >> icon [

	^ self iconNamed: #delete
]

{ #category : 'accessing' }
CMRemoveSpaceContextMenuCommand >> name [

	^ 'Remove'
]
