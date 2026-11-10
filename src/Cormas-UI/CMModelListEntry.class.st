"
I am one row of the model list: a folder of the workspace, a model of the catalog that is not downloaded yet, both when an example folder is listed in the catalog, or a model installed in the image whose folder is not in the workspace any more. I turn what the workspace knows into what the modeler reads: a name, a version, a state with its dot, a summary and what Cormas has to say about the model.

## Responsibility:

- I know my folder, if any, and my catalog model, if any, and give the name, version and state of the row, and whether it belongs with the examples.
- I explain my state in words, such as why a model is not saved, that a folder is an old version, or that an example is pinned to a version.
- I tell which choices make sense, such as whether the modeler can choose among versions, and in which order rows are listed.

## Collaborators:

- `CMWorkspace` tells me whether my model is installed and gives the catalog.
- `CMModelFolder` is my folder: its baseline, summary, versions and git state.
- `CMCatalog` gives the versions of my catalog model.
- `CMModelListPresenter`, `CMModelTablePresenter` and `CMModelPreviewPresenter` show me, and `CMModelAction` acts on me.

## Public API and Key Messages

- `CMModelListEntry entriesOf: aWorkspace` returns the sorted entries of a workspace: models whose code is not saved first, then installed models, then the others by name, and folders that are not models last.
- `isExample` tells in which list I am.
- `title`, `version`, `state` and `stateIcon` fill the columns. The states are `Online`, `Downloaded`, `Not installed`, `Installed`, `Not saved`, `Folder missing`, `Copy` (the same model is installed from another folder) and `Not a model`.
- `summary`, `madeWith` and `note` fill the preview: `note` is what Cormas says, never what the authors of the model say.
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

{ #category : 'icons' }
CMModelListEntry class >> dotColored: aColor filled: aBoolean [
	"Return a small round icon, filled or as a ring"

	| form canvas |
	form := Form extent: 14 @ 14 depth: 32.
	canvas := form getCanvas.
	aBoolean
		ifTrue: [ canvas fillOval: (2 @ 2 extent: 10 @ 10) color: aColor ]
		ifFalse: [
				canvas
					fillOval: (2 @ 2 extent: 10 @ 10)
					color: Color transparent
					borderWidth: 2
					borderColor: aColor ].
	^ form
]

{ #category : 'instance creation' }
CMModelListEntry class >> entriesOf: aWorkspace [
	"Return an entry for each folder of the workspace, for each installed model whose folder is not there any more, and for each model of the catalog that is in no folder, in the order of their sort keys"

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
CMModelListEntry >> infoLine [
	"Return the line shown under the name of my model: its version, the Cormas it was made with and the note of Cormas, leaving out what is not known"

	| parts |
	parts := OrderedCollection new.
	self version ifNotEmpty: [ :version | parts add: version ].
	self madeWith ifNotNil: [ :version |
		parts add: 'Made with Cormas ' , version ].
	self note ifNotNil: [ :note | parts add: note ].
	^ ' · ' join: parts
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
CMModelListEntry >> isAtRisk [
	"Return whether code in the image is not saved in a folder"

	^ #( 'Not saved' 'Folder missing' ) includes: self state
]

{ #category : 'testing' }
CMModelListEntry >> isDimmed [
	"Return whether my row is shown dimmed, because nothing can be done with my model but look at its folder"

	^ #( 'Copy' 'Not a model' ) includes: self state
]

{ #category : 'testing' }
CMModelListEntry >> isExample [
	"Return whether I am listed with the examples: a folder of Examples, or a model of the catalog that is in no folder"

	model ifNotNil: [ ^ false ].
	^ folder isNil or: [ folder isExample ]
]

{ #category : 'testing' }
CMModelListEntry >> isGone [
	"Return whether my folder was deleted or moved outside Cormas since I was listed"

	^ folder notNil and: [ folder location exists not ]
]

{ #category : 'testing' }
CMModelListEntry >> isLoaded [
	"Return whether the code of my model is in the image, so that it can be simulated"

	^ #( 'Installed' 'Not saved' 'Folder missing' ) includes: self state
]

{ #category : 'accessing' }
CMModelListEntry >> madeWith [
	"Return the Cormas line and minor my model was made with, such as 1.0, or nil when it is not known"

	(folder isNil or: [ self baseline isNil ]) ifTrue: [ ^ nil ].
	^ [
	  folder madeWith ifNotNil: [ :version | version majorMinorString ] ]
		  on: CMWorkspaceError
		  do: [ nil ]
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
CMModelListEntry >> note [
	"Return the one short line Cormas has to say about my model, such as that it is read-only or not saved, or nil when there is nothing worth saying"

	| state |
	model ifNotNil: [
			^ self otherFolders
				  ifEmpty: [ 'Its folder ' , model folder basename , ' is gone' ]
				  ifNotEmpty: [ :others |
						  'In several folders: '
						  ,
						  (', ' join:
							   (others collect: [ :each | each location basename ]))
						  , '. Keep only one' ] ].
	folder ifNil: [ ^ nil ].
	self baseline ifNil: [
			folder isModel ifTrue: [ ^ 'Its cormas.json cannot be read' ].
			^ folder hasModelOneLevelDown
				  ifTrue: [ 'The model is one level down: move it into Models' ]
				  ifFalse: [ 'Not a model: no cormas.json' ] ].
	state := self state.
	state = 'Not saved' ifTrue: [
		^ 'Not saved: ' , self installedModel problem ].
	state = 'Copy' ifTrue: [
			^ 'Same model as the one installed from '
			  , (workspace installedModelNamed: self baseline) folder basename ].
	self orphanPackageNames ifNotEmpty: [ :names |
		^ 'Not saved: ' , (', ' join: names) , ' is not part of the model' ].
	folder isOldVersion ifTrue: [ ^ 'Old version: read-only' ].
	folder isExample ifTrue: [
			^ folder chosenVersion
				  ifNil: [ 'Example: read-only' ]
				  ifNotNil: [ :version |
				  'Example: read-only, kept at ' , version , ' by Update' ] ].
	^ nil
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
	"Models whose code is not saved first, then installed models, then the others by name, and folders that are not models last"

	| rank |
	rank := self isAtRisk
		        ifTrue: [ 1 ]
		        ifFalse: [
				        self isLoaded
					        ifTrue: [ 2 ]
					        ifFalse: [ self baseline ifNil: [ 4 ] ifNotNil: [ 3 ] ] ].
	^ rank printString , self name asLowercase
]

{ #category : 'accessing' }
CMModelListEntry >> state [

	| installedModel |
	model ifNotNil: [ ^ 'Folder missing' ].
	folder ifNil: [ ^ 'Online' ].
	self baseline ifNil: [ ^ 'Not a model' ].
	installedModel := self installedModel.
	installedModel ifNotNil: [
			^ installedModel isSaved
				  ifTrue: [ 'Installed' ]
				  ifFalse: [ 'Not saved' ] ].
	(workspace isInstalled: self baseline) ifTrue: [ ^ 'Copy' ].
	^ folder isExample
		  ifTrue: [ 'Downloaded' ]
		  ifFalse: [ 'Not installed' ]
]

{ #category : 'accessing' }
CMModelListEntry >> stateIcon [
	"Return a dot whose colour says my state: green when loaded and saved, red when code is at risk, yellow when the folder is not a model, and a grey ring otherwise"

	| state |
	state := self state.
	self isAtRisk ifTrue: [
		^ self class dotColored: Color red filled: true ].
	state = 'Installed' ifTrue: [
		^ self class dotColored: (Color r: 0.2 g: 0.7 b: 0.3) filled: true ].
	state = 'Not a model' ifTrue: [
		^ self class dotColored: (Color r: 0.95 g: 0.75 b: 0.1) filled: true ].
	^ self class dotColored: Color gray filled: false
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
CMModelListEntry >> title [
	"Return the name of my model, without its version"

	^ self baseline ifNil: [ folder name ]
]

{ #category : 'accessing' }
CMModelListEntry >> version [
	"Return the version of my model: the version of an example, pinned or not, an old version of a model, working for the folder of a model under git, or an empty string"

	| chosen |
	folder ifNil: [
			^ catalogModel
				  ifNil: [ '' ]
				  ifNotNil: [
				  (workspace catalog offeredVersionOf: catalogModel) at: 'ref' ] ].
	self baseline ifNil: [ ^ '' ].
	chosen := folder chosenVersion.
	folder isExample ifTrue: [
			chosen ifNotNil: [ ^ chosen , ' (pinned)' ].
			^ catalogModel
				  ifNil: [ '' ]
				  ifNotNil: [
				  (workspace catalog offeredVersionOf: catalogModel) at: 'ref' ] ].
	folder isOldVersion ifTrue: [ ^ chosen ].
	^ folder isGitRepository
		  ifTrue: [ 'working' ]
		  ifFalse: [ '' ]
]

{ #category : 'accessing' }
CMModelListEntry >> workspace [

	^ workspace
]
