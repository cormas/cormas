"
I represent a Cormas workspace: the folder on the modeler's computer where their models live, one folder per model.

## Responsibility:

- I know my folder and the folders inside it: `Models`, `Examples`, `Catalog` and `Backups`.
- I create a new workspace, or open an existing one, and refuse a folder where Cormas cannot write, with a message naming the folder and the reason.
- I remember the workspace of the image, so the modeler chooses it once per image.

## Collaborators:

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
- The class-side `current` is the workspace of the image, or `nil` until one is chosen.
"
Class {
	#name : 'CMWorkspace',
	#superclass : 'Object',
	#instVars : [
		'location'
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

{ #category : 'accessing' }
CMWorkspace >> catalogFolder [

	^ location / 'Catalog'
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

{ #category : 'accessing' }
CMWorkspace >> folders [
	"Return a CMModelFolder for each folder directly in Models and Examples, models or not, so that the modeler sees every folder and why it is not a model. Hidden folders are left out"

	^ (self modelsFolder directories , self exampleDirectories reject: [
		   :each | each basename beginsWith: '.' ]) collect: [ :each |
		  CMModelFolder in: self at: each ]
]

{ #category : 'testing' }
CMWorkspace >> isFound [
	"Answer whether my folder is still a workspace. When it is not (a drive unplugged, a network share down), Cormas must change nothing rather than conclude that models were deleted"

	^ self class isWorkspace: location
]

{ #category : 'accessing' }
CMWorkspace >> location [

	^ location
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
