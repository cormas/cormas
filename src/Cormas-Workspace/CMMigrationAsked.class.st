"
I am signaled when a change to an installed model is about to be saved, and the model was made with another major of Cormas. Saving would make it a model of this Cormas, which may no longer work in the Cormas it was made with, so the modeler decides. I answer whether to migrate the model.

## Responsibility:

- I carry the installed model and the version of Cormas it would be migrated to.
- I explain what saving changes, as my `messageText`.
- I ask the modeler, when nobody handles me, to migrate or not to save.
- When the modeler does not save, I have the workspace refreshed once the current change is over, which undoes the change: a model of another major cannot be changed.

## Collaborators:

- `CMWorkspace` signals me and backs up the model folder when I answer `true`.
- `CMInstalledModel` is the model I carry.
- `UIManager` asks the modeler and runs the refresh later.

## Public API and Key Messages

- `CMMigrationAsked signalFor: anInstalledModel to: aVersion` returns `true` to migrate, `false` not to save.
- `resume: aBoolean` gives the answer when handling me, as tests do instead of asking.

```smalltalk
[ CMWorkspace current saveClassNamed: 'FFModel' inPackageNamed: 'Firefighters-Model' ]
	on: CMMigrationAsked
	do: [ :question | question resume: true ]
```

## Internal Representation

- `model` is the `CMInstalledModel`.
- `version` is the `CMVersion` of this Cormas.
"
Class {
	#name : 'CMMigrationAsked',
	#superclass : 'Exception',
	#instVars : [
		'model',
		'version',
		'madeWith'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'signaling' }
CMMigrationAsked class >> signalFor: anInstalledModel madeWith: aMadeWithVersion to: aVersion [

	^ self new
		  setModel: anInstalledModel
		  madeWith: aMadeWithVersion
		  version: aVersion;
		  signal
]

{ #category : 'signaling' }
CMMigrationAsked >> defaultAction [
	"Ask the modeler. Closing the dialog does not save. When not saving, refresh the workspace once the current change is over, rather than reloading code in the middle of a compilation or a refactoring: this undoes the change, so the model stays as it is in its folder"

	| migrate |
	migrate := (self uiManager
		            confirm: self messageText
		            trueChoice: 'Migrate to ' , version majorMinorString
		            falseChoice: 'Don''t save') = true.
	migrate ifFalse: [
		self uiManager defer: [ CMWorkspace current refresh ] ].
	^ migrate
]

{ #category : 'accessing' }
CMMigrationAsked >> madeWith [

	^ madeWith
]

{ #category : 'signaling' }
CMMigrationAsked >> messageText [

	^ model baselineName , ' was made with Cormas '
	  , madeWith majorMinorString
	  , '. Saving this change makes it a Cormas '
	  , version majorMinorString
	  , ' model, which may no longer work in Cormas '
	  , madeWith majorMinorString
	  , '. Migrating first saves a copy of the '
	  , madeWith majorMinorString
	  , ' version in Backups. Not saving undoes the change: '
	  , model baselineName , ' stays a Cormas '
	  , madeWith majorMinorString
	  , ' model, which cannot be changed in this Cormas.'
]

{ #category : 'accessing' }
CMMigrationAsked >> model [

	^ model
]

{ #category : 'accessing' }
CMMigrationAsked >> setModel: anInstalledModel madeWith: aMadeWithVersion version: aVersion [

	model := anInstalledModel.
	madeWith := aMadeWithVersion.
	version := aVersion
]

{ #category : 'accessing' }
CMMigrationAsked >> version [

	^ version
]
