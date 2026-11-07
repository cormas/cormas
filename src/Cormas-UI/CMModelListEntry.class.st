"
I am one row of the model list: a folder of the workspace, a model of the catalog that is not downloaded yet, both when an example folder is listed in the catalog, or a model installed in the image whose folder is not in the workspace any more. I turn what the workspace knows into what the modeler reads: a name, a place, a state and a description.

## Responsibility:

- I know my folder, if any, and my catalog model, if any, and give the name, place (`Models`, `Examples`, `Online` or `Image`) and state of the row.
- I explain my state in words, such as why a model is not saved, that a folder is an old version, or that an example is pinned to a version.
- I tell which choices make sense, such as whether the modeler can choose among versions.

## Collaborators:

- `CMWorkspace` tells me whether my model is installed and gives the catalog.
- `CMModelFolder` is my folder: its baseline, README, versions and git state.
- `CMCatalog` gives the versions of my catalog model.
- `CMModelListPresenter` shows me and acts on me.

## Public API and Key Messages

- `CMModelListEntry entriesOf: aWorkspace` returns the sorted entries of a workspace: installed models first, including those whose folder is gone, then `Models`, `Examples` and the models available online.
- `name`, `place` and `state` fill the columns. The states are `Available`, `Not installed`, `Installed`, `Not saved`, `Copy` (the same model is installed from another folder) and `Not a model`.
- `description` returns the Microdown text shown next to the list.
- `hasVersions` tells whether **Versions…** is offered.

```smalltalk
(CMModelListEntry entriesOf: CMWorkspace current)
	collect: [ :each | each name -> each state ]
```

## Internal Representation

- `workspace` is the `CMWorkspace` the list shows.
- `folder` is a `CMModelFolder`, or nil for a model only available online.
- `catalogModel` is the dictionary of the model in the catalog, or nil when the catalog does not list it.
- `baseline` is read from my folder, or my catalog model, when I am created: a row keeps showing it until the list reads the workspace again, even when the folder changes in the meantime.
- `model` is the `CMInstalledModel` of a row whose folder is gone, or nil: such a row has no folder, but can still be uninstalled.
"
Class {
	#name : 'CMModelListEntry',
	#superclass : 'Object',
	#instVars : [
		'workspace',
		'folder',
		'catalogModel',
		'model',
		'baseline'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'instance creation' }
CMModelListEntry class >> baselineOf: aModelFolder [
	"Return the baseline of the folder, or nil when it is not a model or its cormas.json cannot be read"

	aModelFolder isModel ifFalse: [ ^ nil ].
	^ [ aModelFolder baselineName ]
		  on: CMWorkspaceError
		  do: [ nil ]
]

{ #category : 'instance creation' }
CMModelListEntry class >> entriesOf: aWorkspace [
	"Return an entry for each folder of the workspace, for each installed model whose folder is not there any more, and for each model of the catalog that is in no folder: installed models first, then the folders of Models, the examples and the models available online"

	| catalogModels folders entries |
	catalogModels := aWorkspace catalog models.
	folders := aWorkspace folders.
	entries := folders collect: [ :each |
			           | baseline |
			           baseline := self baselineOf: each.
			           self
				           in: aWorkspace
				           folder: each
				           catalogModel: (catalogModels
						            detect: [ :model |
						            (model at: 'baseline') = baseline ]
						            ifNone: [ nil ]) ].
	aWorkspace installedModels do: [ :model |
			(folders anySatisfy: [ :each | each location = model folder ])
				ifFalse: [
						entries := entries copyWith:
							           (self in: aWorkspace installedModel: model) ] ].
	catalogModels do: [ :model |
			(entries anySatisfy: [ :each | each name = (model at: 'baseline') ])
				ifFalse: [
						entries := entries copyWith:
							           (self in: aWorkspace folder: nil catalogModel: model) ] ].
	^ entries asSortedCollection: [ :a :b | a sortKey <= b sortKey ]
]

{ #category : 'instance creation' }
CMModelListEntry class >> in: aWorkspace folder: aModelFolder catalogModel: aDictionary [

	^ self new
		  setWorkspace: aWorkspace
		  folder: aModelFolder
		  catalogModel: aDictionary
]

{ #category : 'instance creation' }
CMModelListEntry class >> in: aWorkspace installedModel: anInstalledModel [
	"Return an entry for a model installed from a folder that is not in the workspace any more"

	^ self new setWorkspace: aWorkspace installedModel: anInstalledModel
]

{ #category : 'accessing' }
CMModelListEntry >> baseline [

	model ifNotNil: [ ^ model baselineName ].
	^ baseline
]

{ #category : 'accessing' }
CMModelListEntry >> catalogModel [

	^ catalogModel
]

{ #category : 'private' }
CMModelListEntry >> chosenVersionExplanation [
	"Return what to know about the version chosen for my example, or an empty string when it follows the version this Cormas recommends"

	| chosen recommended |
	chosen := folder chosenVersion ifNil: [ ^ '' ].
	recommended := catalogModel ifNotNil: [
		               (workspace catalog offeredVersionOf: catalogModel)
			               at: 'ref' ].
	^ 'Version ' , chosen , (recommended
		   ifNil: [ '' ]
		   ifNotNil: [ ' (recommended: ' , recommended , ')' ])
	  ,
	  '. Updating examples does not change it: to follow updates again, choose the recommended version in Versions… '
]

{ #category : 'accessing' }
CMModelListEntry >> description [
	"Return the Microdown text shown for me: the README of my folder, or the summary of the catalog, followed by what the modeler should know about my state"

	^ String streamContents: [ :stream |
			  self writeTextOn: stream.
			  self writeStateOn: stream ]
]

{ #category : 'accessing' }
CMModelListEntry >> folder [

	^ folder
]

{ #category : 'testing' }
CMModelListEntry >> hasVersions [
	"Return whether the modeler can choose among versions of my model: an example whose catalog line offers several versions to this Cormas, or a model of Models that is an old version or has tags"

	(folder isNil or: [ self baseline isNil ]) ifTrue: [ ^ false ].
	folder isExample ifTrue: [
			^ catalogModel notNil and: [
				  (workspace catalog versionsOf: catalogModel) size > 1 ] ].
	^ folder isOldVersion or: [ folder tags notEmpty ]
]

{ #category : 'accessing' }
CMModelListEntry >> installedModel [
	"Return the installed model that comes from my folder, or nil"

	| baseline |
	model ifNotNil: [ ^ model ].
	baseline := self baseline.
	(folder notNil and: [
		 baseline notNil and: [ workspace isInstalled: baseline ] ])
		ifFalse: [ ^ nil ].
	^ (workspace installedModelNamed: baseline) folder = folder location
		  ifTrue: [ workspace installedModelNamed: baseline ]
		  ifFalse: [ nil ]
]

{ #category : 'testing' }
CMModelListEntry >> isGone [
	"Return whether my folder was deleted or moved outside Cormas since I was listed"

	^ folder notNil and: [ folder location exists not ]
]

{ #category : 'private' }
CMModelListEntry >> missingFolderExplanation [
	"Explain a model that is in the image while the folder it was installed from is not in the workspace any more"

	| others |
	others := self otherFolders.
	others ifNotEmpty: [
			^ 'This model is in the image, but its folder '
			  , model folder fullName
			  ,
			  ' is not in the workspace any more, and the workspace holds it in several folders: '
			  ,
			  (', ' join: (others collect: [ :each | each location basename ]))
			  ,
			  '. Move or delete all but one of them, then press Reload from folder: Cormas uses the one left, after backing up the code in the image.' ].
	^ 'This model is in the image, but its folder '
	  , model folder fullName
	  ,
	  ' is not in the workspace any more. Restore folder writes its code, as it is in the image, into a new folder of Models; the README, data and outputs of the lost folder do not come back. Or uninstall the model: its code is backed up first.'
]

{ #category : 'accessing' }
CMModelListEntry >> modelClasses [
	"Return the concrete model classes of my installed model"

	^ (self installedModel loadedPackages flatCollect: [ :each |
			   each definedClasses select: [ :class |
				   (class inheritsFrom: CMModel) and: [ class isAbstract not ] ] ])
		  asArray
]

{ #category : 'accessing' }
CMModelListEntry >> name [

	self baseline ifNil: [ ^ folder name ].
	^ (folder notNil and: [ folder isOldVersion ])
		  ifTrue: [ self baseline , ' ' , folder chosenVersion ]
		  ifFalse: [ self baseline ]
]

{ #category : 'accessing' }
CMModelListEntry >> orphanPackageNames [
	"Return the names of the loaded packages named like the packages of my installed model but outside its baseline, whose changes are saved nowhere"

	| model |
	model := self installedModel ifNil: [ ^ #(  ) ].
	^ (workspace orphanPackages keys select: [ :each |
		   (workspace orphanPackages at: each) == model ])
		  asSortedCollection asArray
]

{ #category : 'accessing' }
CMModelListEntry >> otherFolders [
	"Return the folders of the workspace that hold the model whose folder is gone, sorted by name. Cormas follows a single one by itself, so there are none, or several"

	model ifNil: [ ^ #(  ) ].
	^ ((workspace folders select: [ :each |
		    each hasBaselineNamed: model baselineName ])
		   asSortedCollection: [ :a :b |
		   a location basename <= b location basename ]) asArray
]

{ #category : 'accessing' }
CMModelListEntry >> place [

	model ifNotNil: [ ^ 'Image' ].
	folder ifNil: [ ^ 'Online' ].
	^ folder isExample
		  ifTrue: [ 'Examples' ]
		  ifFalse: [ 'Models' ]
]

{ #category : 'accessing' }
CMModelListEntry >> screenshotFile [
	"Return the screenshot of the folder, or the one of the catalog, or nil"

	folder ifNotNil: [
			(folder location / 'screenshot.png') isFile ifTrue: [
				^ folder location / 'screenshot.png' ] ].
	catalogModel ifNil: [ ^ nil ].
	^ (workspace catalog screenshotOf: catalogModel) isFile
		  ifTrue: [ workspace catalog screenshotOf: catalogModel ]
		  ifFalse: [ nil ]
]

{ #category : 'initialization' }
CMModelListEntry >> setWorkspace: aWorkspace folder: aModelFolder catalogModel: aDictionary [
	"Read the baseline of the folder once: the list shows what it read until it reads the workspace again, even when the folder changes in the meantime"

	workspace := aWorkspace.
	folder := aModelFolder.
	catalogModel := aDictionary.
	baseline := aModelFolder
		            ifNil: [ aDictionary at: 'baseline' ]
		            ifNotNil: [ self class baselineOf: aModelFolder ]
]

{ #category : 'private' }
CMModelListEntry >> setWorkspace: aWorkspace installedModel: anInstalledModel [

	workspace := aWorkspace.
	model := anInstalledModel
]

{ #category : 'accessing' }
CMModelListEntry >> sortKey [
	"Installed models first, then the folders of Models, the examples, and the models available online"

	| rank |
	rank := self installedModel
		        ifNotNil: [ 1 ]
		        ifNil: [
		        #( 'Models' 'Examples' 'Online' ) indexOf: self place ].
	^ rank printString , self name asLowercase
]

{ #category : 'accessing' }
CMModelListEntry >> state [

	| installedModel |
	model ifNil: [
			folder ifNil: [ ^ 'Available' ].
			self baseline ifNil: [ ^ 'Not a model' ] ].
	installedModel := self installedModel.
	installedModel ifNotNil: [
			^ installedModel isSaved
				  ifTrue: [ 'Installed' ]
				  ifFalse: [ 'Not saved' ] ].
	^ (workspace isInstalled: self baseline)
		  ifTrue: [ 'Copy' ]
		  ifFalse: [ 'Not installed' ]
]

{ #category : 'private' }
CMModelListEntry >> stateExplanation [

	| state version |
	model ifNotNil: [ ^ self missingFolderExplanation ].
	folder ifNil: [
			version := workspace catalog offeredVersionOf: catalogModel.
			^ 'Available online: ' , (version at: 'ref') , ' of '
			  , (version at: 'url')
			  , '. Download it into Examples to install it.' ].
	self baseline ifNil: [
			folder isModel ifTrue: [ ^ 'Its cormas.json cannot be read.' ].
			^ folder hasModelOneLevelDown
				  ifTrue: [
					  'This folder contains a model one level down: move that folder directly into Models.' ]
				  ifFalse: [ 'This folder is not a model: it has no cormas.json.' ] ].
	state := self state.
	state = 'Not saved' ifTrue: [
			^ 'Not saved: ' , self installedModel problem
			  ,
			  '. Reload it from its folder; the code in the image is backed up first.' ].
	folder isOldVersion ifTrue: [
			^ 'This is ' , self baseline , ' as it was released in '
			  , folder chosenVersion
			  ,
			  ', in its own folder: your working folder is not touched. An old version cannot be changed. To go back to your working version, choose it in Versions…' ].
	state = 'Copy' ifTrue: [
			^ 'The same model is installed from '
			  , (workspace installedModelNamed: self baseline) folder fullName
			  , '. Only one of them can be installed at a time.'
			  , (self hasVersions
					   ifTrue: [ ' Choose which one in Versions…' ]
					   ifFalse: [ '' ]) ].
	folder isExample ifTrue: [
			^ self chosenVersionExplanation
			  ,
			  'This is an example. Changing its code offers to copy it to Models.' ].
	^ nil
]

{ #category : 'private' }
CMModelListEntry >> summary [

	catalogModel ifNotNil: [ ^ catalogModel at: 'summary' ].
	folder ifNil: [ ^ nil ].
	^ [ folder summary ]
		  on: CMWorkspaceError
		  do: [ nil ]
]

{ #category : 'accessing' }
CMModelListEntry >> workspace [

	^ workspace
]

{ #category : 'private' }
CMModelListEntry >> writeStateOn: aStream [

	self stateExplanation ifNotNil: [ :explanation |
			aStream
				cr;
				cr;
				nextPutAll: '> ';
				nextPutAll: explanation ].
	self orphanPackageNames ifNotEmpty: [ :names |
			aStream
				cr;
				cr;
				nextPutAll: '> Not part of this model, so never saved: ';
				nextPutAll: (', ' join: names);
				nextPutAll: '. Add them to the model to save them in its folder.' ]
]

{ #category : 'private' }
CMModelListEntry >> writeTextOn: aStream [

	(folder notNil and: [ (folder location / 'README.md') isFile ])
		ifTrue: [
		^ aStream nextPutAll: (folder location / 'README.md') contents ].
	aStream
		nextPutAll: '# ';
		nextPutAll: self name;
		cr;
		cr.
	self summary ifNotNil: [ :summary | aStream nextPutAll: summary ]
]
