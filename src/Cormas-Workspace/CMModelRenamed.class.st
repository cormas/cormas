"
I am signaled when the modeler renamed the baseline of an installed model of `Models`, or the package of the baseline, from a Pharo tool. Renaming the baseline is renaming the model, so I ask whether to rename the whole model.

## Responsibility:

- I carry the installed model and the new name the modeler gave its baseline.
- I ask the modeler, when nobody handles me, whether to rename the model, explaining what is renamed.

## Collaborators:

- `CMWorkspace` undoes the rename made in the tool, signals me, and renames the model when I answer `true`.
- `UIManager` asks the modeler.

## Public API and Key Messages

- `CMModelRenamed signalFor: anInstalledModel to: aNewName` returns `true` to rename the model, `false` to keep its name.
- `resume: aBoolean` gives the answer when handling me, as tests do instead of asking.

```smalltalk
[ CMWorkspace current renameBaselineOf: model to: 'BaselineOfWoodland' undoing: [  ] ]
	on: CMModelRenamed
	do: [ :question | question resume: true ]
```

## Internal Representation

- `model` is the `CMInstalledModel` whose baseline was renamed.
- `newName` is the new name of the model, without `BaselineOf`.
"
Class {
	#name : 'CMModelRenamed',
	#superclass : 'Exception',
	#instVars : [
		'model',
		'newName'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signaling' }
CMModelRenamed class >> signalFor: anInstalledModel to: aNewName [
	^ self new
		  model: anInstalledModel;
		  newName: aNewName;
		  signal
]

{ #category : 'handling' }
CMModelRenamed >> defaultAction [
	"Ask the modeler"

	^ (self uiManager
		   confirm: self explanation
		   trueChoice: 'Rename the model'
		   falseChoice: 'Cancel') = true
]

{ #category : 'private' }
CMModelRenamed >> explanation [
	^ 'Rename the model ' , model baselineName , ' to ' , newName , '?

The baseline gives the model its name: renaming BaselineOf' , model baselineName
	  , ' renames the model. Its baseline and the package of the baseline, its cormas.json, and its folder when it has the name of the model, are all renamed to ' , newName
	  , '. The other packages and classes keep their names.

Cancel keeps the name ' , model baselineName , '.'
]

{ #category : 'accessing' }
CMModelRenamed >> model [
	^ model
]

{ #category : 'accessing' }
CMModelRenamed >> model: anInstalledModel [
	model := anInstalledModel
]

{ #category : 'accessing' }
CMModelRenamed >> newName [
	^ newName
]

{ #category : 'accessing' }
CMModelRenamed >> newName: aString [
	newName := aString
]
