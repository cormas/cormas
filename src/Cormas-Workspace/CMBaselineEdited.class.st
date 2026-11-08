"
I am signaled when the baseline of an installed model, which Cormas manages, was changed by the modeler and is about to be saved. I answer whether the modeler manages the baseline from now on.

## Responsibility:

- I carry the installed model whose baseline changed.
- I ask the modeler, when nobody handles me, whether to manage the baseline themselves, explaining what that means.
- When the modeler declines, I have the workspace refreshed once the current change is over, which brings the baseline back as it is in its folder.

## Collaborators:

- `CMWorkspace` signals me, and marks the baseline as managed by the modeler when I answer `true`.
- `CMInstalledModel` is the model I carry.
- `UIManager` asks the modeler and runs the refresh later.

## Public API and Key Messages

- `CMBaselineEdited signalFor: anInstalledModel` returns `true` when the modeler manages the baseline from now on, `false` to undo the change.
- `resume: aBoolean` gives the answer when handling me, as tests do instead of asking.

```smalltalk
[ BaselineOfForest compile: 'foo ^ 1' classified: 'x' ]
	on: CMBaselineEdited
	do: [ :question | question resume: true ]
```

## Internal Representation

- `model` is the `CMInstalledModel` whose baseline changed.
"
Class {
	#name : 'CMBaselineEdited',
	#superclass : 'Exception',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signaling' }
CMBaselineEdited class >> signalFor: anInstalledModel [
	^ self new
		  model: anInstalledModel;
		  signal
]

{ #category : 'handling' }
CMBaselineEdited >> defaultAction [
	"Ask the modeler. When they keep Cormas managing the baseline, refresh the workspace once the current change is over, which undoes the change, rather than reloading code in the middle of a compilation or a refactoring"

	| manage |
	manage := self uiManager
		          confirm: self explanation
		          trueChoice: 'Manage it myself'
		          falseChoice: 'Cancel'.
	manage = true ifFalse: [
		self uiManager defer: [ CMWorkspace current refresh ] ].
	^ manage = true
]

{ #category : 'private' }
CMBaselineEdited >> explanation [
	^ 'Do you want to manage the baseline of ' , model baselineName , ' yourself?

The baseline is the class that tells Pharo how to load your model. Until now, Cormas has kept it up to date for you: when you add, rename or remove a package of ' , model baselineName , ', Cormas updates the baseline.

If you change it yourself, Cormas will stop updating it, and you will need to update it whenever you add, rename or remove a package. This is useful for advanced setups, such as depending on other projects or defining groups of packages.'
]

{ #category : 'accessing' }
CMBaselineEdited >> model [
	^ model
]

{ #category : 'accessing' }
CMBaselineEdited >> model: anInstalledModel [
	model := anInstalledModel
]
