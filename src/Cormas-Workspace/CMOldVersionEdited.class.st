"
I am signaled when a change to an installed old version of a model is about to be saved. An old version is a folder of `Models` that Cormas cloned at a tag of the modeler's repository, such as `Forest v1.0.0`: it must stay exactly as it was released, so its changes are never saved.

## Responsibility:

- I carry the installed old version whose code changed.
- I tell the modeler, when nobody handles me, that the change is undone.
- I have the workspace refreshed once the current change is over, which brings the old version back as it is in its folder.

## Collaborators:

- `CMInstalledModel` signals me through `CMWorkspace` before saving, and stops saving.
- `UIManager` tells the modeler and runs the refresh later.

## Public API and Key Messages

- `CMOldVersionEdited signalFor: anInstalledModel` returns `false`: the change is not saved.

```smalltalk
[ CMWorkspace current saveClassNamed: 'FFModel' inPackageNamed: 'Firefighters-Model' ]
	on: CMOldVersionEdited
	do: [ :notice | notice resume: false ]
```

## Internal Representation

- `model` is the `CMInstalledModel` of the old version.
"
Class {
	#name : 'CMOldVersionEdited',
	#superclass : 'Exception',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signaling' }
CMOldVersionEdited class >> signalFor: anInstalledModel [

	^ self new
		  model: anInstalledModel;
		  signal
]

{ #category : 'accessing' }
CMOldVersionEdited >> defaultAction [
	"Tell the modeler, then refresh the workspace once the current change is over, rather than reloading code in the middle of a compilation or a refactoring: this undoes the change"

	self uiManager defer: [
			self uiManager inform: self messageText.
			CMWorkspace current refresh ].
	^ false
]

{ #category : 'accessing' }
CMOldVersionEdited >> messageText [

	^ model folder basename
	  ,
	  ' is an old version and cannot be changed: the change is undone. To change the model, go back to your working version in Versions…'
]

{ #category : 'accessing' }
CMOldVersionEdited >> model [

	^ model
]

{ #category : 'accessing' }
CMOldVersionEdited >> model: anInstalledModel [

	model := anInstalledModel
]
