"
I represent a Cormas workspace: the folder on the modeler's computer where their models live, one folder per model.

## Responsibility:

- I know my folder and the folders inside it: `Models`, `Examples`, `Catalog` and `Backups`.
- I create a new workspace, or open an existing one, and refuse a folder where Cormas cannot write, with a message naming the folder and the reason.
- I remember the workspace of the image, so the modeler chooses it once per image.
- I install and uninstall models, remember which folder each installed model comes from, and delete folders; I back up before removing any code.

## Collaborators:

- `CMModelFolder` describes each folder in `Models` and `Examples`.
- `Metacello` loads a model from the Tonel files of its folder.
- `FileReference` gives me my folder; I never assume it is on a particular disk, so tests use a memory file system.
- `CMWorkspaceError` is what I raise when a folder cannot be used.

## Public API and Key Messages

- `CMWorkspace createAt: aFileReference` creates a new workspace.
- `CMWorkspace at: aFileReference` opens an existing workspace.
- `CMWorkspace isWorkspace: aFileReference` tells whether a folder is a workspace: it is when it contains a `Models` folder.
- `CMWorkspace current` and `CMWorkspace current:` give and set the workspace of the image.
- `CMWorkspace defaultLocation` is the folder suggested to the modeler, `Cormas` in their home folder.
- `folders` returns a `CMModelFolder` for each folder in `Models` and `Examples`, whether it is a model or not.
- `backUp: aFolder` zips a folder, with everything in it, into `Backups` and returns the zip. Cormas calls it before destroying any code; restoring is unzipping into `Models`.
- `install: aModelFolder` loads a model from the files in its folder and remembers the folder. It refuses, leaving the image as it was, to replace any code already in the image.
- `uninstall: aBaselineName` backs up the code of a model as it is in the image, then removes it; the folder is left untouched.
- `delete: aModelFolder` backs up a folder, uninstalls its model if it is installed from there, then deletes it.
- `saveClassNamed: aClassName inPackageNamed: aPackageName` and `savePackageNamed: aPackageName` write what changed into the folder of the installed model the package belongs to; `installedModelNamed:` tells whether that model is saved.
- `folderOf: aClass` returns the folder of the installed model that a class belongs to; `CMModel>>folder` uses it.
- `isFound` tells whether my folder is still there, so that an unplugged drive is never taken for deleted models.

For example, the first time an image starts:

```smalltalk
| location |
location := CMWorkspace defaultLocation.
CMWorkspace current: ((CMWorkspace isWorkspace: location)
	ifTrue: [ CMWorkspace at: location ]
	ifFalse: [ CMWorkspace createAt: location ])
```

## Internal Representation

- `location` is the `FileReference` of my folder.
- `installed` maps the baseline name of each installed model to its `CMInstalledModel`.
- The class-side `current` is the workspace of the image, or `nil` until one is chosen.

### Implementation Points

- A model is always loaded from its files with `tonel://`, even when its folder is a git repository: Iceberg would load the last commit instead of what is in the folder.
- A failed installation removes every package that appeared during it.
"
Class {
	#name : 'CMWorkspace',
	#superclass : 'Object',
	#instVars : [
		'location',
		'installed'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMWorkspace class >> at: aFileReference [
	"Return the existing workspace in a folder. Raise a CMWorkspaceError if the folder is not a workspace or if Cormas cannot write there"

	(self isWorkspace: aFileReference) ifFalse: [
			CMWorkspaceError signal: aFileReference fullName
				, ' is not a workspace (it has no Models folder)' ].
	^ (self new setLocation: aFileReference)
		  checkWritable;
		  yourself
]

{ #category : 'instance creation' }
CMWorkspace class >> createAt: aFileReference [
	"Create a new workspace in a folder that is not a workspace yet, and return it. Raise a CMWorkspaceError if the folder is already a workspace or if Cormas cannot write there"

	(self isWorkspace: aFileReference) ifTrue: [
			CMWorkspaceError signal:
				aFileReference fullName , ' is already a workspace' ].
	^ (self new setLocation: aFileReference)
		  createFolders;
		  checkWritable;
		  yourself
]

{ #category : 'accessing' }
CMWorkspace class >> current [
	"Return the workspace of this image. Raise a CMWorkspaceError if none was chosen yet"

	^ current ifNil: [
		  CMWorkspaceError signal: 'No workspace was chosen for this image' ]
]

{ #category : 'accessing' }
CMWorkspace class >> current: aWorkspace [

	current := aWorkspace
]

{ #category : 'accessing' }
CMWorkspace class >> defaultLocation [
	"Return the folder suggested to the modeler when an image has no workspace yet"

	^ FileLocator home asFileReference / 'Cormas'
]

{ #category : 'testing' }
CMWorkspace class >> isWorkspace: aFileReference [
	"A folder is a workspace if and only if it contains a Models folder"

	^ (aFileReference / 'Models') isDirectory
]

{ #category : 'backups' }
CMWorkspace >> backUp: aFolder [
	"Zip aFolder, with everything in it, into my Backups folder and return the zip. Unzipping it into Models restores the folder. A backup never replaces another one. Cormas backs up code before destroying it, so when this raises an error, nothing must be destroyed"

	| zip |
	CMWorkspaceError whileWritingIn: self backupsFolder do: [
			self backupsFolder ensureCreateDirectory.
			zip := self newBackupFor: aFolder basename.
			ZipArchive new
				addTree: aFolder
				relativeTo: aFolder parent
				match: [ :each | true ];
				writeToFile: zip ].
	^ zip
]

{ #category : 'backups' }
CMWorkspace >> backUpCodeOf: aBaselineName [
	"Back up the code of an installed model as it is in the image, in the layout of a model folder, so that unzipping and installing the backup restores it. Return the zip"

	| folder src |
	folder := FileSystem memory
	          / (aBaselineName , ' (code in the image)').
	src := folder / 'src'.
	src ensureCreateDirectory.
	folder / 'cormas.json' writeStreamDo: [ :stream |
			stream nextPutAll:
				(STONJSON toString: (Dictionary with: 'baseline' -> aBaselineName)) ].
	src / '.properties' writeStreamDo: [ :stream |
		stream nextPutAll: '{ #format : #tonel }' ].
	(self installedModelNamed: aBaselineName) writePackagesTo: src.
	^ self backUp: folder
]

{ #category : 'accessing' }
CMWorkspace >> backupsFolder [

	^ location / 'Backups'
]

{ #category : 'accessing' }
CMWorkspace >> catalogFolder [

	^ location / 'Catalog'
]

{ #category : 'private' }
CMWorkspace >> checkNothingIsReplacedBy: anInstalledModel in: packageNames [
	"Raise a CMWorkspaceError if loading the model would replace a package in packageNames or a model installed from the workspace"

	anInstalledModel packageNames
		detect: [ :each | packageNames includes: each ]
		ifFound: [ :each |
				CMWorkspaceError signal: each , ' is already in this image, so '
					, anInstalledModel baselineName , ' cannot be installed' ].
	anInstalledModel dependencyNames
		detect: [ :each | installed includesKey: each ]
		ifFound: [ :each |
				CMWorkspaceError signal:
					anInstalledModel baselineName , ' needs ' , each
					,
					', which is installed from the workspace. Models that depend on other models are not supported yet' ]
]

{ #category : 'private' }
CMWorkspace >> checkWritable [
	"Create and delete a file, so that a folder where Cormas cannot write is refused when it is chosen rather than when the first model is saved"

	| probe |
	probe := location / '.cormas-write-check'.
	CMWorkspaceError whileWritingIn: location do: [
			probe writeStreamDo: [ :stream | stream nextPutAll: 'Cormas' ].
			probe delete ]
]

{ #category : 'private' }
CMWorkspace >> createFolders [

	CMWorkspaceError
		whileWritingIn: location
		do: [ self modelsFolder ensureCreateDirectory ]
]

{ #category : 'installing' }
CMWorkspace >> delete: aModelFolder [
	"Back up a folder of the workspace, then delete it. When this image installed a model from that folder, uninstall it first"

	self backUp: aModelFolder location.
	installed
		detect: [ :each | each folder = aModelFolder location ]
		ifFound: [ :model | self uninstall: model baselineName ].
	CMWorkspaceError
		whileWritingIn: aModelFolder location
		do: [ aModelFolder location deleteAll ]
]

{ #category : 'private' }
CMWorkspace >> exampleDirectories [
	"Examples is only created when the first example is downloaded"

	^ self examplesFolder exists
		  ifTrue: [ self examplesFolder directories ]
		  ifFalse: [ #(  ) ]
]

{ #category : 'accessing' }
CMWorkspace >> examplesFolder [

	^ location / 'Examples'
]

{ #category : 'installing' }
CMWorkspace >> folderOf: aClass [
	"Return the folder of the installed model that the package of aClass belongs to"

	^ (installed
		   detect: [ :each | each ownsPackageNamed: aClass package name ]
		   ifNone: [
				   CMWorkspaceError signal:
					   aClass name
					   , ' is not part of a model installed from the workspace' ])
		  folder
]

{ #category : 'accessing' }
CMWorkspace >> folders [
	"Return a CMModelFolder for each folder directly in Models and Examples, models or not, so that the modeler sees every folder and why it is not a model. Hidden folders are left out"

	^ (self modelsFolder directories , self exampleDirectories reject: [
		   :each | each basename beginsWith: '.' ]) collect: [ :each |
		  CMModelFolder in: self at: each ]
]

{ #category : 'initialization' }
CMWorkspace >> initialize [

	super initialize.
	installed := Dictionary new
]

{ #category : 'installing' }
CMWorkspace >> install: aModelFolder [
	"Load the model in aModelFolder into the image, from the files in its folder, and remember that folder. Raise a CMWorkspaceError when the model cannot be installed, leaving the image as it was: an installation never replaces code that is already in the image"

	| model packagesBefore |
	aModelFolder isModel ifFalse: [
			CMWorkspaceError signal: aModelFolder location fullName
				, ' is not a model (it has no cormas.json)' ].
	model := CMInstalledModel
		         baselineName: aModelFolder baselineName
		         folder: aModelFolder location.
	installed at: model baselineName ifPresent: [ :other |
			CMWorkspaceError signal:
				model baselineName , ' is already installed from '
				, other folder fullName ].
	packagesBefore := self packageOrganizer packageNames asSet.
	(packagesBefore includes: model baselinePackageName) ifTrue: [
			CMWorkspaceError signal: model baselinePackageName
				,
				' is already in this image, but not installed from the workspace' ].
	[
		(self metacelloFor: aModelFolder) get.
		self checkNothingIsReplacedBy: model in: packagesBefore.
		(self metacelloFor: aModelFolder) load ]
		on: Error
		do: [ :error |
				self removePackagesNotIn: packagesBefore.
				Metacello new
					baseline: model baselineName;
					unregister.
				(error isKindOf: CMWorkspaceError) ifTrue: [ error pass ].
				CMWorkspaceError signal:
					model baselineName , ' could not be installed: '
					, error messageText ].
	model recordFiles.
	installed at: model baselineName put: model
]

{ #category : 'installing' }
CMWorkspace >> installedModelNamed: aBaselineName [

	^ installed
		  at: aBaselineName
		  ifAbsent: [
		  CMWorkspaceError signal: aBaselineName , ' is not installed' ]
]

{ #category : 'testing' }
CMWorkspace >> isFound [
	"Answer whether my folder is still a workspace. When it is not (a drive unplugged, a network share down), Cormas must change nothing rather than conclude that models were deleted"

	^ self class isWorkspace: location
]

{ #category : 'installing' }
CMWorkspace >> isInstalled: aBaselineName [

	^ installed includesKey: aBaselineName
]

{ #category : 'accessing' }
CMWorkspace >> location [

	^ location
]

{ #category : 'private' }
CMWorkspace >> metacelloFor: aModelFolder [
	"Always load from the files, never through Iceberg, which loads the last commit rather than what is in the folder"

	^ Metacello new
		  baseline: aModelFolder baselineName;
		  repository: 'tonel://' , (aModelFolder location / 'src') fullName;
		  yourself
]

{ #category : 'accessing' }
CMWorkspace >> modelsFolder [

	^ location / 'Models'
]

{ #category : 'private' }
CMWorkspace >> newBackupFor: aName [
	"Return a file in Backups that does not exist yet, named after aName and the time, such as 'Forest 2026-11-06 14-05-09.zip', then 'Forest 2026-11-06 14-05-09 2.zip' within the same second"

	| now stem candidate index |
	now := DateAndTime now.
	stem := aName , ' ' , now asDate yyyymmdd , ' '
	        , (now asTime print24 copyReplaceAll: ':' with: '-').
	candidate := self backupsFolder / (stem , '.zip').
	index := 1.
	[ candidate exists ] whileTrue: [
			index := index + 1.
			candidate := self backupsFolder
			             / (stem , ' ' , index printString , '.zip') ].
	^ candidate
]

{ #category : 'private' }
CMWorkspace >> removePackagesNotIn: packageNames [

	(self packageOrganizer packages reject: [ :each |
		 packageNames includes: each name ]) do: [ :each |
		each removeFromSystem ]
]

{ #category : 'saving' }
CMWorkspace >> saveClassNamed: aClassName inPackageNamed: aPackageName [
	"Write what a package defines on a class, as it is in the image, into the folder of the installed model the package belongs to. A package of no installed model is not saved anywhere"

	installed
		detect: [ :each | each ownsPackageNamed: aPackageName ]
		ifFound: [ :model |
			model saveClassNamed: aClassName inPackageNamed: aPackageName ]
]

{ #category : 'saving' }
CMWorkspace >> savePackageNamed: aPackageName [
	"Write a package, as it is in the image, into the folder of the installed model it belongs to. A package of no installed model is not saved anywhere"

	installed
		detect: [ :each | each ownsPackageNamed: aPackageName ]
		ifFound: [ :model | model savePackageNamed: aPackageName ]
]

{ #category : 'initialization' }
CMWorkspace >> setLocation: aFileReference [

	location := aFileReference
]

{ #category : 'installing' }
CMWorkspace >> uninstall: aBaselineName [
	"Remove the code of an installed model from the image and forget its folder, which is left untouched. The code in the image is backed up first, so nothing is lost even if it differs from the folder or the folder is gone"

	| model |
	model := self installedModelNamed: aBaselineName.
	self backUpCodeOf: aBaselineName.
	model loadedPackages do: [ :each | each removeFromSystem ].
	Metacello new
		baseline: aBaselineName;
		unregister.
	installed removeKey: aBaselineName
]
