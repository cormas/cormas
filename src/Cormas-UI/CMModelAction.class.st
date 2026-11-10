"
I am one action that the model list offers on a model, such as Simulate, Install or Delete…, shown as a button in its preview.

## Responsibility:

- I know my label and my icon.
- I know to which entries of the model list I apply, depending on their state.
- I run on an entry, through the model list that does the work.

## Collaborators:

- `CMModelListEntry`: the model I apply to, whose state I read.
- `CMModelListPresenter`: runs me, and holds the code of most actions, such as `install:` or `delete:`.
- `CMModelPreviewPresenter`: shows me as a button.

## Public API and Key Messages

- `CMModelAction mainFor: anEntry`, `secondaryFor: anEntry` and `fixesFor: anEntry` return the actions that apply to an entry, in the order the preview shows them.
- `mainSelectors`, `secondarySelectors` and `fixSelectors`, on the class side, set that order: to change the order of the buttons, change these arrays.
- `label`, `icon`, `appliesTo: anEntry`, `runOn: anEntry in: aModelList`.

```smalltalk
(CMModelAction mainFor: anEntry) collect: [ :each | each label ]
""#('Simulate')""
```

## Internal Representation

- `label` is the text of the button, `icon` its Form, or nil.
- `condition` is a block that takes an entry and returns whether I apply to it.
- `block` is a block that takes the model list and the entry, and does the action.
"
Class {
	#name : 'CMModelAction',
	#superclass : 'Object',
	#instVars : [
		'label',
		'icon',
		'condition',
		'block'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'private' }
CMModelAction class >> actions: selectors for: anEntry [

	^ (selectors collect: [ :each | self perform: each ]) select: [ :each |
		  each appliesTo: anEntry ]
]

{ #category : 'actions' }
CMModelAction class >> addPackageNamed: aPackageName [

	^ self
		  label: 'Add ' , aPackageName
		  icon: (self iconNamed: #add)
		  if: [ :entry | true ]
		  do: [ :list :entry |
		  entry installedModel addPackageNamed: aPackageName ]
]

{ #category : 'actions' }
CMModelAction class >> analyseSensitivity [

	^ self
		  label: 'Sensitivity analysis'
		  icon: CMIcons chartIcon
		  if: [ :entry | #( 'Installed' 'Not saved' ) includes: entry state ]
		  do: [ :list :entry | list analyseSensitivityOf: entry ]
]

{ #category : 'actions' }
CMModelAction class >> browse [

	^ self
		  label: 'Browse code'
		  icon: (self iconNamed: #glamorousBrowse)
		  if: [ :entry | entry isLoaded ]
		  do: [ :list :entry | (list modelClassOf: entry) browse ]
]

{ #category : 'actions' }
CMModelAction class >> delete [

	^ self
		  label: 'Delete…'
		  icon: (self iconNamed: #delete)
		  if: [ :entry | entry folder notNil ]
		  do: [ :list :entry | list delete: entry ]
]

{ #category : 'actions' }
CMModelAction class >> download [

	^ self
		  label: 'Download'
		  icon: (self iconNamed: #down)
		  if: [ :entry | entry state = 'Online' ]
		  do: [ :list :entry | list download: entry andInstall: false ]
]

{ #category : 'actions' }
CMModelAction class >> downloadAndInstall [

	^ self
		  label: 'Download and install'
		  icon: (self iconNamed: #smallLoadProject)
		  if: [ :entry | entry state = 'Online' ]
		  do: [ :list :entry | list download: entry andInstall: true ]
]

{ #category : 'actions' }
CMModelAction class >> export [

	^ self
		  label: 'Export…'
		  icon: (self iconNamed: #smallExport)
		  if: [ :entry |
				  entry folder notNil and: [
					  entry baseline notNil and: [ entry isExample not ] ] ]
		  do: [ :list :entry | list export: entry ]
]

{ #category : 'order' }
CMModelAction class >> fixSelectors [
	"The buttons that fix a problem of the model, shown before the secondary ones, in this order. The packages to add to the model come after them"

	^ #( reloadFromFolder restoreFolder removeFromImage )
]

{ #category : 'accessing' }
CMModelAction class >> fixesFor: anEntry [

	^ (self actions: self fixSelectors for: anEntry)
	  , (anEntry orphanPackageNames collect: [ :each |
			   self addPackageNamed: each ]) asArray
]

{ #category : 'actions' }
CMModelAction class >> install [

	^ self
		  label: 'Install'
		  icon: (self iconNamed: #smallLoadProject)
		  if: [ :entry |
		  #( 'Not installed' 'Downloaded' ) includes: entry state ]
		  do: [ :list :entry | list install: entry ]
]

{ #category : 'instance creation' }
CMModelAction class >> label: aString icon: aForm if: aConditionBlock do: anActionBlock [

	^ self new
		  setLabel: aString
		  icon: aForm
		  condition: aConditionBlock
		  block: anActionBlock
]

{ #category : 'accessing' }
CMModelAction class >> mainFor: anEntry [

	^ self actions: self mainSelectors for: anEntry
]

{ #category : 'order' }
CMModelAction class >> mainSelectors [
	"The large buttons of the preview, in the order they are shown"

	^ #( simulate install download downloadAndInstall )
]

{ #category : 'actions' }
CMModelAction class >> openFolder [

	^ self
		  label: 'Open folder'
		  icon: (self iconNamed: #open)
		  if: [ :entry | entry folder notNil ]
		  do: [ :list :entry | entry folder location openInOSFileBrowser ]
]

{ #category : 'actions' }
CMModelAction class >> reloadFromFolder [

	^ self
		  label: 'Reload from folder'
		  icon: (self iconNamed: #refresh)
		  if: [ :entry |
				  entry state = 'Not saved' or: [
					  entry state = 'Folder missing' and: [
						  entry otherFolders notEmpty ] ] ]
		  do: [ :list :entry | list reloadFromFolders ]
]

{ #category : 'actions' }
CMModelAction class >> removeFromImage [

	^ self
		  label: 'Remove from image'
		  icon: (self iconNamed: #undo)
		  if: [ :entry | entry state = 'Folder missing' ]
		  do: [ :list :entry | list uninstall: entry ]
]

{ #category : 'actions' }
CMModelAction class >> rename [
	"Only a model of Models that is installed and saved can be renamed: examples and old versions cannot be changed"

	^ self
		  label: 'Rename…'
		  icon: (self iconNamed: #edit)
		  if: [ :entry |
				  entry state = 'Installed' and: [
					  entry folder isExample not and: [
						  entry folder isOldVersion not ] ] ]
		  do: [ :list :entry | list rename: entry ]
]

{ #category : 'actions' }
CMModelAction class >> restoreFolder [

	^ self
		  label: 'Restore folder'
		  icon: (self iconNamed: #smallSave)
		  if: [ :entry |
			  entry state = 'Folder missing' and: [ entry otherFolders isEmpty ] ]
		  do: [ :list :entry | list restoreFolderOf: entry ]
]

{ #category : 'accessing' }
CMModelAction class >> secondaryFor: anEntry [

	^ self actions: self secondarySelectors for: anEntry
]

{ #category : 'order' }
CMModelAction class >> secondarySelectors [
	"The buttons under the main ones, in the order they are shown"

	^ #( analyseSensitivity browse versions rename export openFolder
	     uninstall delete )
]

{ #category : 'actions' }
CMModelAction class >> simulate [

	^ self
		  label: 'Simulate'
		  icon: CMIcons runIcon
		  if: [ :entry | entry isLoaded ]
		  do: [ :list :entry | list simulate: entry ]
]

{ #category : 'actions' }
CMModelAction class >> uninstall [

	^ self
		  label: 'Uninstall…'
		  icon: (self iconNamed: #undo)
		  if: [ :entry |
			  entry installedModel notNil and: [
				  entry state ~= 'Folder missing' ] ]
		  do: [ :list :entry | list uninstall: entry ]
]

{ #category : 'actions' }
CMModelAction class >> versions [

	^ self
		  label: 'Versions…'
		  icon: (self iconNamed: #history)
		  if: [ :entry | entry hasVersions ]
		  do: [ :list :entry | list chooseVersionOf: entry ]
]

{ #category : 'testing' }
CMModelAction >> appliesTo: anEntry [

	^ condition value: anEntry
]

{ #category : 'accessing' }
CMModelAction >> icon [

	^ icon
]

{ #category : 'accessing' }
CMModelAction >> label [

	^ label
]

{ #category : 'running' }
CMModelAction >> runOn: anEntry in: aModelList [

	^ block value: aModelList value: anEntry
]

{ #category : 'initialization' }
CMModelAction >> setLabel: aString icon: aForm condition: aConditionBlock block: anActionBlock [

	label := aString.
	icon := aForm.
	condition := aConditionBlock.
	block := anActionBlock
]
