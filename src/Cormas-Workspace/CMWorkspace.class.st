"
I represent a Cormas workspace: the folder on the modeler's computer where their models live, one folder per model.

## Responsibility:

- I know my folder and the folders inside it: `Models`, `Examples`, `Catalog` and `Backups`.
- I create a new workspace, or open an existing one, and refuse a folder where Cormas cannot write, with a message naming the folder and the reason.
- I remember the workspace of the image, so the modeler chooses it once per image.
- I install models from their folders and remember which folder each installed model comes from.

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
- `installed` maps the baseline name of each installed model to its folder.
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
	self writeAt: self backupsFolder doing: [
			self backupsFolder ensureCreateDirectory.
			zip := self newBackupFor: aFolder basename.
			ZipArchive new
				addTree: aFolder
				relativeTo: aFolder parent
				match: [ :each | true ];
				writeToFile: zip ].
	^ zip
]

{ #category : 'accessing' }
CMWorkspace >> backupsFolder [

	^ location / 'Backups'
]

{ #category : 'private' }
CMWorkspace >> baselineClassOf: aBaselineName [

	^ self class environment at: ('BaselineOf' , aBaselineName) asSymbol
]

{ #category : 'accessing' }
CMWorkspace >> catalogFolder [

	^ location / 'Catalog'
]

{ #category : 'private' }
CMWorkspace >> checkNothingIsReplacedBy: aBaselineName in: packageNames [
	"Raise a CMWorkspaceError if loading the baseline would replace a package in packageNames or a model installed from the workspace"

	(self packageNamesOf: aBaselineName)
		detect: [ :each | packageNames includes: each ]
		ifFound: [ :each |
				CMWorkspaceError signal:
					each , ' is already in this image, so ' , aBaselineName
					, ' cannot be installed' ].
	((self baselineClassOf: aBaselineName) project version projects
		 collect: [ :each | each name ])
		detect: [ :each | installed includesKey: each ]
		ifFound: [ :each |
				CMWorkspaceError signal: aBaselineName , ' needs ' , each
					,
					', which is installed from the workspace. Models that depend on other models are not supported yet' ]
]

{ #category : 'private' }
CMWorkspace >> checkWritable [
	"Create and delete a file, so that a folder where Cormas cannot write is refused when it is chosen rather than when the first model is saved"

	| probe |
	probe := location / '.cormas-write-check'.
	self writeAt: location doing: [
			probe writeStreamDo: [ :stream | stream nextPutAll: 'Cormas' ].
			probe delete ]
]

{ #category : 'private' }
CMWorkspace >> createFolders [

	self
		writeAt: location
		doing: [ self modelsFolder ensureCreateDirectory ]
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
	"Return the folder of the installed model whose baseline declares the package of aClass"

	installed keysAndValuesDo: [ :baselineName :folder |
			((self packageNamesOf: baselineName) includes: aClass package name)
				ifTrue: [ ^ folder ] ].
	^ CMWorkspaceError signal:
		  aClass name
		  , ' is not part of a model installed from the workspace'
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

	| baselineName packagesBefore |
	aModelFolder isModel ifFalse: [
			CMWorkspaceError signal: aModelFolder location fullName
				, ' is not a model (it has no cormas.json)' ].
	baselineName := aModelFolder baselineName.
	installed at: baselineName ifPresent: [ :folder |
			CMWorkspaceError signal:
				baselineName , ' is already installed from ' , folder fullName ].
	packagesBefore := self packageOrganizer packageNames asSet.
	(packagesBefore includes: 'BaselineOf' , baselineName) ifTrue: [
			CMWorkspaceError signal: 'BaselineOf' , baselineName
				,
				' is already in this image, but not installed from the workspace' ].
	[
		(self metacelloFor: aModelFolder) get.
		self checkNothingIsReplacedBy: baselineName in: packagesBefore.
		(self metacelloFor: aModelFolder) load ]
		on: Error
		do: [ :error |
				self removePackagesNotIn: packagesBefore.
				Metacello new
					baseline: baselineName;
					unregister.
				(error isKindOf: CMWorkspaceError) ifTrue: [ error pass ].
				CMWorkspaceError signal:
					baselineName , ' could not be installed: ' , error messageText ].
	installed at: baselineName put: aModelFolder location
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
CMWorkspace >> packageNamesOf: aBaselineName [
	"Return the names of the packages that the baseline declares, in all its groups. They are the packages of the model"

	^ (self baselineClassOf: aBaselineName) project version packages
		  collect: [ :each | each name ]
]

{ #category : 'private' }
CMWorkspace >> removePackagesNotIn: packageNames [

	(self packageOrganizer packages reject: [ :each |
		 packageNames includes: each name ]) do: [ :each |
		each removeFromSystem ]
]

{ #category : 'initialization' }
CMWorkspace >> setLocation: aFileReference [

	location := aFileReference
]

{ #category : 'private' }
CMWorkspace >> writeAt: aFileReference doing: aBlock [
	"Evaluate aBlock, turning a file system failure into a CMWorkspaceError that names the folder and the reason"

	aBlock
		on: FileSystemError , PrimitiveFailed
		do: [ :error |
				CMWorkspaceError signal:
					'Cormas cannot write in ' , aFileReference fullName , ' ('
					, error messageText , ')' ]
]
