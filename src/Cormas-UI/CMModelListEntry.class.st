"
placeholder
"
Class {
	#name : 'CMModelListEntry',
	#superclass : 'Object',
	#instVars : [
		'workspace',
		'folder',
		'catalogModel'
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
	"Return an entry for each folder of the workspace, and for each model of the catalog that is in no folder: installed models first, then the folders of Models, the examples and the models available online"

	| catalogModels entries |
	catalogModels := aWorkspace catalog models.
	entries := aWorkspace folders collect: [ :each |
			           | baseline |
			           baseline := self baselineOf: each.
			           self
				           in: aWorkspace
				           folder: each
				           catalogModel: (catalogModels
						            detect: [ :model |
						            (model at: 'baseline') = baseline ]
						            ifNone: [ nil ]) ].
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

{ #category : 'accessing' }
CMModelListEntry >> baseline [

	^ folder
		  ifNil: [ catalogModel at: 'baseline' ]
		  ifNotNil: [ self class baselineOf: folder ]
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
	baseline := self baseline.
	(folder notNil and: [
		 baseline notNil and: [ workspace isInstalled: baseline ] ])
		ifFalse: [ ^ nil ].
	^ (workspace installedModelNamed: baseline) folder = folder location
		  ifTrue: [ workspace installedModelNamed: baseline ]
		  ifFalse: [ nil ]
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
CMModelListEntry >> place [

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

	workspace := aWorkspace.
	folder := aModelFolder.
	catalogModel := aDictionary
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

	| model |
	folder ifNil: [ ^ 'Available' ].
	self baseline ifNil: [ ^ 'Not a model' ].
	model := self installedModel.
	model ifNotNil: [
			^ model isSaved
				  ifTrue: [ 'Installed' ]
				  ifFalse: [ 'Not saved' ] ].
	^ (workspace isInstalled: self baseline)
		  ifTrue: [ 'Copy' ]
		  ifFalse: [ 'Not installed' ]
]

{ #category : 'private' }
CMModelListEntry >> stateExplanation [

	| state version |
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
