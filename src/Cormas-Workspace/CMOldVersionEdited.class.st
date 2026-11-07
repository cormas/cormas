"
I am signaled when a change to an installed old version of a model is about to be saved. An old version is a folder of `Models` that Cormas cloned at a tag of the modeler's repository, such as `Forest v1.0.0`: it must stay exactly as it was released, so its changes are never saved into it.

## Responsibility:

- I carry the installed old version whose code changed.
- I ask the modeler, when nobody handles me: go back to the working version, make a new model from the old version, which a second question explains before making it, or stay on the old version.
- Otherwise I have the change undone once the current change is over: going back installs the working version in place of the old one and shows what was being changed in the browser where it was changed; staying refreshes the workspace.

## Collaborators:

- `CMWorkspace` signals me before saving, and copies the old version into a new model when I answer `true`.
- `UIManager` asks the modeler and runs the undo later.

## Public API and Key Messages

- `CMOldVersionEdited signalFor: anInstalledModel` returns `true` to make a new model, `false` to save nothing.
- `resume: aBoolean` gives the answer when handling me, as tests do instead of asking.

```smalltalk
[ CMWorkspace current saveClassNamed: 'FFModel' inPackageNamed: 'Firefighters-Model' ]
	on: CMOldVersionEdited
	do: [ :question | question resume: false ]
```

## Internal Representation

- `model` is the `CMInstalledModel` of the old version.
- `change` is the code change announcement, set by `CMWorkspace` when it is known.
"
Class {
	#name : 'CMOldVersionEdited',
	#superclass : 'Exception',
	#instVars : [
		'model',
		'change'
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
CMOldVersionEdited >> browseChangeIn: aBrowser [
	"Show the method or class that was being changed, as it is now in the image: in aBrowser, which showed it, or in a new browser when aBrowser is nil"

	| behavior selector target |
	change ifNil: [ ^ self ].
	behavior := Smalltalk globals
		            at: change classAffected instanceSide name
		            ifAbsent: [ ^ self ].
	change classAffected isClassSide ifTrue: [
		behavior := behavior class ].
	selector := (change isKindOf: MethodAnnouncement)
		            ifTrue: [ change method selector ]
		            ifFalse: [ nil ].
	target := (selector notNil and: [
		           behavior includesSelector: selector ])
		          ifTrue: [ behavior >> selector ]
		          ifFalse: [ nil ].
	aBrowser ifNil: [ ^ (target ifNil: [ behavior ]) browse ].
	target
		ifNil: [ aBrowser selectClass: behavior ]
		ifNotNil: [ aBrowser selectMethod: target ]
]

{ #category : 'accessing' }
CMOldVersionEdited >> browserShowingChange [
	"Return the frontmost System Browser that shows the class being changed, or nil when none does"

	| windows |
	change ifNil: [ ^ nil ].
	windows := self currentWorld submorphs.
	^ (Smalltalk tools browser allInstances select: [ :each |
			   (windows includes: each containingWindow) and: [
				   each isClassSelected: change classAffected instanceSide ] ])
		  detectMin: [ :each | windows indexOf: each containingWindow ]
]

{ #category : 'accessing' }
CMOldVersionEdited >> change: aCodeChangeAnnouncement [

	change := aCodeChangeAnnouncement
]

{ #category : 'accessing' }
CMOldVersionEdited >> defaultAction [
	"Ask the modeler. When they make a new model, answer true. Otherwise, once the current change is over rather than in the middle of a compilation or a refactoring, undo the change: by installing the working version in place of the old one and showing what was being changed in the browser where it was changed, or by refreshing the workspace to stay on the old version"

	| folder version goBack browser |
	folder := CMModelFolder in: CMWorkspace current at: model folder.
	version := folder chosenVersion.
	browser := self browserShowingChange.
	[
		goBack := self uiManager
			          confirm: (self explanationOf: version)
			          trueChoice:
			          'Go back to my working version of ' , model baselineName
			          falseChoice: 'Make a new model from ' , version , '…'
			          cancelChoice: 'Stay on ' , version , ' (read-only)'
			          default: true.
		goBack = false and: [
				(self uiManager
					 confirm: (self newModelExplanationOf: version)
					 trueChoice: 'Make the new model'
					 falseChoice: 'Cancel') = true ifTrue: [ ^ true ].
				true ] ] whileTrue.
	self uiManager defer: [
			(goBack = true and: [ folder workingFolder notNil ])
				ifTrue: [
						CMWorkspace current switchTo: folder workingFolder.
						self browseChangeIn: browser ]
				ifFalse: [ CMWorkspace current refresh ] ].
	^ false
]

{ #category : 'accessing' }
CMOldVersionEdited >> explanationOf: aTag [

	^ model baselineName , ' ' , aTag
	  , ' is an old version and cannot be changed.' , String cr
	  , String cr , 'You are looking at ' , model baselineName
	  , ' as it was released in ' , aTag
	  ,
	  '. A released version must stay exactly as it was, so that anyone who uses it gets the same model.'
	  , String cr , String cr
	  ,
	  'You probably want to go back to your working version. The change you just made is not kept, because it was made in '
	  , aTag , '.'
]

{ #category : 'accessing' }
CMOldVersionEdited >> messageText [

	^ model folder basename , ' is an old version and cannot be changed'
]

{ #category : 'accessing' }
CMOldVersionEdited >> model [

	^ model
]

{ #category : 'accessing' }
CMOldVersionEdited >> model: anInstalledModel [

	model := anInstalledModel
]

{ #category : 'accessing' }
CMOldVersionEdited >> newModelExplanationOf: aTag [

	^ 'This makes a new model. It starts from ' , model baselineName
	  , ' ' , aTag
	  ,
	  ' and keeps the change you just made, but it is not a version of '
	  , model baselineName , ': it is separate from '
	  , model baselineName , ' and its history.' , String cr , String cr
	  , 'It goes in Models/' , model folder basename
	  ,
	  ' copy, without git. To keep it and share it, give it its own repository.'
	  , String cr , String cr , 'It keeps the name ' , model baselineName
	  , ', so only one of the two can be installed at a time.'
]
