"
I am signaled when code of an installed example is about to be saved into its folder in `Examples`, which only Cormas changes. I answer whether to copy the example to `Models` and keep editing the copy.

## Responsibility:

- I carry the installed example whose code changed.
- I ask the modeler, when nobody handles me, whether to make their own copy in `Models`.
- When the modeler declines, I have the workspace refreshed once the current change is over, which brings the example back as it is in its folder.

## Collaborators:

- `CMWorkspace` signals me and copies the example when I answer `true`.
- `CMInstalledModel` is the example I carry.
- `UIManager` asks the modeler and runs the refresh later.

## Public API and Key Messages

- `CMExampleEdited signalFor: anInstalledModel` returns `true` to copy the example, `false` to keep it unchanged.
- `resume: aBoolean` gives the answer when handling me, as tests do instead of asking.

```smalltalk
[ CMWorkspace current saveClassNamed: 'FFModel' inPackageNamed: 'Firefighters-Model' ]
	on: CMExampleEdited
	do: [ :question | question resume: true ]
```

## Internal Representation

- `model` is the `CMInstalledModel` of the example.
"
Class {
	#name : 'CMExampleEdited',
	#superclass : 'Exception',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signaling' }
CMExampleEdited class >> signalFor: anInstalledModel [

	^ self new
		  model: anInstalledModel;
		  signal
]

{ #category : 'handling' }
CMExampleEdited >> defaultAction [
	"Ask the modeler. When they decline, refresh the workspace once the current change is over, rather than reloading code in the middle of a compilation or a refactoring"

	| copy |
	copy := self uiManager confirm: model baselineName
		        ,
		        ' is an example and cannot be changed. Make your own copy in Models?'.
	copy ifFalse: [
		self uiManager defer: [ CMWorkspace current refresh ] ].
	^ copy
]

{ #category : 'accessing' }
CMExampleEdited >> model [

	^ model
]

{ #category : 'accessing' }
CMExampleEdited >> model: anInstalledModel [

	model := anInstalledModel
]
