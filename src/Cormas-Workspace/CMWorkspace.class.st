"
I represent a Cormas workspace: the folder on the modeler's computer where their models live, one folder per model.

## Responsibility:

- I know my folder and the folders inside it: `Models`, `Examples`, `Catalog` and `Backups`.
- I create a new workspace, or open an existing one, and refuse a folder where Cormas cannot write, with a message naming the folder and the reason.
- I remember the workspace of the image, so the modeler chooses it once per image.
- I save every code change of the image into the folder of the installed model it belongs to, while I am the current workspace.
- I bring installed models up to date with their folders when the image starts and when asked: I follow a folder that was renamed or moved, and reload what changed outside Cormas after backing up the code in the image.
- I register the folder of an installed model with Iceberg when it is a git repository, so that git users can commit from the image, and I refresh a model after an Iceberg operation changed its folder.
- I download examples from the library into `Examples`, and update them to its latest version, backing up the files someone edited by hand.
- I create new models: a `CMModelTemplate` writes their folder in `Models`, and they are installed from it.
- I export a model folder as a zip, and install a model from a zip into a new folder of `Models`.
- I install and uninstall models, remember which folder each installed model comes from, and delete folders; I back up before removing any code.

## Collaborators:

- `CMModelFolder` describes each folder in `Models` and `Examples`.
- `Metacello` loads a model from the Tonel files of its folder.
- `Iceberg` lists the folders that are git repositories; I never load code through it.
- `FileReference` gives me my folder; I never assume it is on a particular disk, so tests use a memory file system.
- `CMExampleEdited` asks the modeler whether to copy an example they edited.
- `CMWorkspaceError` is what I raise when a folder cannot be used.

## Public API and Key Messages

- `CMWorkspace createAt: aFileReference` creates a new workspace.
- `CMWorkspace at: aFileReference` opens an existing workspace.
- `CMWorkspace isWorkspace: aFileReference` tells whether a folder is a workspace: it is when it contains a `Models` folder.
- `CMWorkspace current` and `CMWorkspace current:` give and set the workspace of the image.
- `CMWorkspace defaultLocation` is the folder suggested to the modeler, `Cormas` in their home folder.
- `folders` returns a `CMModelFolder` for each folder in `Models` and `Examples`, whether it is a model or not.
- `backUp: aFolder` zips a folder, with everything in it, into `Backups` and returns the zip. Cormas calls it before destroying any code; restoring is unzipping into `Models`.
- `download: aRepositoryUrl` clones a model of the library into a new folder of `Examples`, named after its baseline, without installing it.
- `copyEditedExample: anInstalledModel` is called before the code of an installed example is saved: it signals `CMExampleEdited`, and copies the example to `Models` for the model to use from then on, or stops saving the model when the modeler declines.
- `catalog` returns the `CMCatalog` of my `Catalog` folder, whose `update` downloads the catalog of example models.
- `updateExamples` resets every example to the latest version of its repository, then reloads the installed ones. Files added by hand, such as outputs, are kept.
- `createModelFrom: aModelTemplate` writes a new model into a new folder of `Models`, installs it and returns the folder.
- `export: aModelFolder to: aZipFile` zips the whole folder, as it is on disk.
- `installFromZip: aZipFile` extracts a zip into a new folder of `Models`, following single folders down to the one holding `cormas.json`, and installs the model; the folder stays even when the model cannot be installed.
- `install: aModelFolder` loads a model from the files in its folder and remembers the folder. It refuses, leaving the image as it was, to replace any code already in the image.
- `uninstall: aBaselineName` backs up the code of a model as it is in the image, then removes it; the folder is left untouched.
- `delete: aModelFolder` backs up a folder, uninstalls its model if it is installed from there, then deletes it.
- `saveClassNamed: aClassName inPackageNamed: aPackageName` and `savePackageNamed: aPackageName` write what changed into the folder of the installed model the package belongs to; `installedModelNamed:` tells whether that model is saved.
- `orphanPackages` returns the loaded packages named like the packages of an installed model but outside its baseline, whose changes are saved nowhere, with the model they seem to belong to.
- `folderOf: aClass` returns the folder of the installed model that a class belongs to; `CMModel>>folder` uses it.
- `refresh` finds the folder of every installed model and reloads what changed in it; the class side calls it on the current workspace when the image starts.
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

- A model is always loaded from its files with `tonel://`, even when its folder is a git repository: Iceberg would load the last commit instead of what is in the folder. Iceberg only registers the folder, with `src` as its source directory; a folder without `.project` shows in Iceberg as a project to commit.
- The class side also listens to `IceRepositoryModified`, which Iceberg announces after a commit, a checkout or a pull, and when its working copy becomes dirty; the refresh that follows reloads only when files changed.
- Examples are cloned and updated with libgit2 through Iceberg's classes, without registering them with Iceberg. Whether an example was edited by hand is found by comparing its files with those of its last commit.
- A failed installation removes every package that appeared during it.
- The class side listens to the code changes announced by `SystemAnnouncer` and passes them to the current workspace. Each change saves one class in the packages it affected. A removed or renamed class is saved in every package of the installed models, because Pharo does not announce that the extension methods of other packages went with it.
- Uninstalling and reloading forget the model while its code is removed or loaded, so that this is not saved back into its folder.
- A refresh uses the folder a model was installed from while its `cormas.json` names the same baseline. Otherwise it follows the only other folder with that baseline; with none or several, it keeps the code, stops saving and records the problem for the modeler to decide.
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

{ #category : 'code changes' }
CMWorkspace class >> classChanged: anAnnouncement [

	current ifNotNil: [ :workspace |
		workspace classChanged: anAnnouncement ]
]

{ #category : 'code changes' }
CMWorkspace class >> classRenamedOrRemoved: anAnnouncement [

	current ifNotNil: [ :workspace |
		workspace classRenamedOrRemoved: anAnnouncement ]
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

{ #category : 'code changes' }
CMWorkspace class >> icebergRepositoryModified: anAnnouncement [

	current ifNotNil: [ :workspace |
		workspace icebergRepositoryModified: anAnnouncement repository ]
]

{ #category : 'class initialization' }
CMWorkspace class >> initialize [
	"Listen to the code changes of the image and to Iceberg, so that the current workspace saves changes into the folders of its models and refreshes a model whose folder Iceberg changed, and refresh the current workspace when the image starts"

	SessionManager default registerUserClassNamed: self name.
	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance
		when:
			MethodAnnouncement , ClassAdded , ClassModifiedClassDefinition
			, ClassCommented , ClassRepackaged , ClassParentRenamed
		send: #classChanged:
		to: self;
		when: ClassRenamed , ClassRemoved
		send: #classRenamedOrRemoved:
		to: self;
		when: PackageTagRenamed send: #packageTagRenamed: to: self.
	Iceberg announcer unsubscribe: self.
	Iceberg announcer
		when: IceRepositoryModified
		send: #icebergRepositoryModified:
		to: self
]

{ #category : 'testing' }
CMWorkspace class >> isWorkspace: aFileReference [
	"A folder is a workspace if and only if it contains a Models folder"

	^ (aFileReference / 'Models') isDirectory
]

{ #category : 'code changes' }
CMWorkspace class >> packageTagRenamed: anAnnouncement [

	current ifNotNil: [ :workspace |
		workspace savePackageNamed: anAnnouncement package name ]
]

{ #category : 'system startup' }
CMWorkspace class >> startUp: resuming [
	"When the image starts, bring the models of the current workspace up to date with their folders, which may have changed while the image was closed"

	resuming ifTrue: [
		current ifNotNil: [ :workspace | workspace refresh ] ]
]

{ #category : 'private' }
CMWorkspace >> anyFileIn: aCommitFolder differsFrom: aFolder [
	"Answer whether a file of aCommitFolder, looking into its subfolders, is missing from aFolder or has other contents there"

	^ aCommitFolder children anySatisfy: [ :each |
			  | file |
			  file := aFolder / each basename.
			  each isDirectory
				  ifTrue: [ self anyFileIn: each differsFrom: file ]
				  ifFalse: [
						  file isFile not or: [
								  (file binaryReadStreamDo: [ :stream | stream upToEnd ])
								  ~= (each binaryReadStreamDo: [ :stream | stream upToEnd ]) ] ] ]
]

{ #category : 'backups' }
CMWorkspace >> backUp: aFolder [
	"Zip aFolder, with everything in it, into my Backups folder and return the zip. Unzipping it into Models restores the folder. A backup never replaces another one. Cormas backs up code before destroying it, so when this raises an error, nothing must be destroyed"

	| zip |
	CMWorkspaceError whileWritingIn: self backupsFolder do: [
			self backupsFolder ensureCreateDirectory.
			zip := self newBackupFor: aFolder basename.
			self zip: aFolder to: zip ].
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
CMWorkspace >> catalog [

	^ CMCatalog in: self catalogFolder
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

{ #category : 'code changes' }
CMWorkspace >> classChanged: anAnnouncement [
	"Save the class in every package the change affected: a method moved from one package to another changes both"

	anAnnouncement packagesAffected do: [ :each |
			self
				saveClassNamed: anAnnouncement classAffected instanceSide name
				inPackageNamed: each name ]
]

{ #category : 'code changes' }
CMWorkspace >> classRenamedOrRemoved: anAnnouncement [
	"Save the class under its old and new names in every package of the installed models: Pharo does not announce that the extension methods of other packages on the class went with it"

	| classNames |
	classNames := { anAnnouncement classAffected instanceSide
		              originalName } asSet.
	(anAnnouncement isKindOf: ClassRenamed) ifTrue: [
		classNames add: anAnnouncement oldName ].
	installed do: [ :model |
			model loadedPackages do: [ :package |
					classNames do: [ :each |
						model saveClassNamed: each inPackageNamed: package name ] ] ]
]

{ #category : 'private' }
CMWorkspace >> clone: aRepositoryUrl to: aFolder [

	[
		IceGitLibGitClone new
			location: aFolder;
			url: aRepositoryUrl;
			execute ]
		on: IceError
		do: [ :error |
				CMWorkspaceError signal:
					'Cormas cannot download ' , aRepositoryUrl , ' ('
					, error description , ')' ]
]

{ #category : 'examples' }
CMWorkspace >> copyEditedExample: anInstalledModel [
	"Ask whether to copy the example whose code changed to Models. With a copy, the installed model uses it from then on, so its changes are saved there and nothing is unloaded. Otherwise raise a CMWorkspaceError, which stops saving the model until it is reloaded from the example"

	| copy |
	(CMExampleEdited signalFor: anInstalledModel) ifFalse: [
			CMWorkspaceError signal: anInstalledModel baselineName
				, ' is an example: its changes are not saved' ].
	copy := self
		        newFolderNamed: anInstalledModel folder basename
		        in: self modelsFolder.
	CMWorkspaceError
		whileWritingIn: self modelsFolder
		do: [ anInstalledModel folder copyAllTo: copy ].
	self forgetIcebergRepositoriesAt: anInstalledModel folder.
	anInstalledModel folder: copy.
	self registerWithIceberg: anInstalledModel
]

{ #category : 'private' }
CMWorkspace >> createFolders [

	CMWorkspaceError
		whileWritingIn: location
		do: [ self modelsFolder ensureCreateDirectory ]
]

{ #category : 'creating' }
CMWorkspace >> createModelFrom: aModelTemplate [
	"Write a new model from the template into a new folder of Models and install it from there, like any other model. Return the folder. Raise a CMWorkspaceError, leaving the image and the workspace as they were, when the model cannot be created"

	| folder modelFolder |
	self folders
		detect: [ :each |
		each hasBaselineNamed: aModelTemplate baselineName ]
		ifFound: [ :each |
				CMWorkspaceError signal:
					'A model named ' , aModelTemplate baselineName
					, ' is already in the workspace, in ' , each location fullName ].
	folder := self
		          newFolderNamed: aModelTemplate basename
		          in: self modelsFolder.
	CMWorkspaceError
		whileWritingIn: folder
		do: [ aModelTemplate writeTo: folder ].
	modelFolder := CMModelFolder in: self at: folder.
	[ self install: modelFolder ]
		on: CMWorkspaceError
		do: [ :error |
				folder ensureDeleteAll.
				error pass ].
	^ modelFolder
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

{ #category : 'examples' }
CMWorkspace >> download: aRepositoryUrl [
	"Clone a model of the library into a new folder of Examples, named after its baseline, and return the folder. The model is not installed. Raise a CMWorkspaceError, leaving nothing in Examples, when the repository cannot be cloned, holds no model, or when that example is already downloaded"

	| temporaryName clone folder |
	temporaryName := '.cormas-download-' , UUID new asString.
	[
		clone := CMModelFolder
			         in: self
			         at: self examplesFolder / temporaryName.
		self clone: aRepositoryUrl to: clone location.
		clone isModel ifFalse: [
				CMWorkspaceError signal:
					aRepositoryUrl , ' holds no model (no cormas.json)' ].
		self folders
			detect: [ :each |
				each isExample and: [ each hasBaselineNamed: clone baselineName ] ]
			ifFound: [ :each |
					CMWorkspaceError signal:
						clone baselineName , ' is already downloaded, in '
						, each location fullName ].
		folder := self
			          newFolderNamed: clone baselineName
			          in: self examplesFolder.
		CMWorkspaceError
			whileWritingIn: self examplesFolder
			do: [ clone location moveTo: folder ] ] ensure: [
		(self examplesFolder / temporaryName) ensureDeleteAll ].
	^ CMModelFolder in: self at: folder
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

{ #category : 'sharing' }
CMWorkspace >> export: aModelFolder to: aZipFile [
	"Zip the whole folder of a model, as it is on disk, so that it can be sent and installed elsewhere"

	CMWorkspaceError
		whileWritingIn: aZipFile parent
		do: [ self zip: aModelFolder location to: aZipFile ]
]

{ #category : 'private' }
CMWorkspace >> extract: aZipFile to: aFolder [

	CMWorkspaceError
		whileWritingIn: aFolder parent
		do: [ aFolder ensureCreateDirectory ].
	[ (ZipArchive new readFrom: aZipFile) extractAllTo: aFolder ]
		on: Error
		do: [ :error |
				CMWorkspaceError signal:
					aZipFile basename , ' cannot be read as a zip file ('
					, error messageText , ')' ]
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

{ #category : 'iceberg' }
CMWorkspace >> forgetIcebergRepositoriesAt: aFolder [

	(self icebergRepositoriesAt: aFolder) do: [ :each | each forget ]
]

{ #category : 'iceberg' }
CMWorkspace >> icebergRepositoriesAt: aFolder [

	^ IceRepository registry select: [ :each | each location = aFolder ]
]

{ #category : 'iceberg' }
CMWorkspace >> icebergRepositoryModified: anIceRepository [
	"An Iceberg operation, such as a checkout or a pull, may have changed the folder of a model: bring that model up to date with it"

	(installed select: [ :each | each folder = anIceRepository location ])
		do: [ :each | self refresh: each ]
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
		         in: self
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
	installed at: model baselineName put: model.
	self registerWithIceberg: model
]

{ #category : 'sharing' }
CMWorkspace >> installFromZip: aZipFile [
	"Extract a zip into a new folder of Models, never over another one, and install the model it holds. Return the folder. The folder stays in Models even when the model cannot be installed, like a folder dropped there"

	| temporaryName model folder |
	temporaryName := '.cormas-unzip-' , UUID new asString.
	[
		self extract: aZipFile to: self modelsFolder / temporaryName.
		model := self
			         modelFolderIn: self modelsFolder / temporaryName
			         ifNone: [
					         CMWorkspaceError signal:
						         aZipFile basename , ' holds no model (no cormas.json)' ].
		folder := self
			          newFolderNamed: (model basename = temporaryName
					           ifTrue: [ aZipFile basenameWithoutExtension ]
					           ifFalse: [ model basename ])
			          in: self modelsFolder.
		CMWorkspaceError
			whileWritingIn: self modelsFolder
			do: [ model moveTo: folder ] ] ensure: [
		(self modelsFolder / temporaryName) ensureDeleteAll ].
	self install: (CMModelFolder in: self at: folder).
	^ CMModelFolder in: self at: folder
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

{ #category : 'private' }
CMWorkspace >> modelFolderIn: aFolder ifNone: aBlock [
	"Return the folder holding cormas.json, following single folders down from aFolder, as zips are made in many ways. Hidden folders and the __MACOSX folder that macOS adds to zips are ignored"

	| current subfolders |
	current := aFolder.
	[ (current / 'cormas.json') isFile ] whileFalse: [
			subfolders := current directories reject: [ :each |
				              (each basename beginsWith: '.') or: [
					              each basename = '__MACOSX' ] ].
			subfolders size = 1 ifFalse: [ ^ aBlock value ].
			current := subfolders first ].
	^ current
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
CMWorkspace >> newFolderNamed: aName in: aParentFolder [
	"Return a folder of aParentFolder that does not exist yet, named aName, or 'aName 2', 'aName 3' and so on when it is taken"

	| candidate index |
	candidate := aParentFolder / aName.
	index := 1.
	[ candidate exists ] whileTrue: [
			index := index + 1.
			candidate := aParentFolder / (aName , ' ' , index printString) ].
	^ candidate
]

{ #category : 'code changes' }
CMWorkspace >> orphanPackages [
	"Return, for each loaded package named like the packages of an installed model but declared by no installed model, the model it seems to belong to. Its changes are saved nowhere until it is added to that model"

	| orphans |
	orphans := Dictionary new.
	installed do: [ :model |
			(self packageOrganizer packageNames select: [ :each |
					 (model isNamedLikeMyPackages: each) and: [
						 installed noneSatisfy: [ :other | other ownsPackageNamed: each ] ] ])
				do: [ :each | orphans at: each put: model ] ].
	^ orphans
]

{ #category : 'refreshing' }
CMWorkspace >> refresh [
	"Bring every installed model up to date with its folder, as at startup: find its folder, then reload from it what changed outside Cormas, backing up the code in the image first. When my own folder is not found, change nothing: a drive that is not plugged in is no reason to forget models"

	self isFound ifFalse: [ ^ self ].
	installed copy do: [ :each | self refresh: each ]
]

{ #category : 'refreshing' }
CMWorkspace >> refresh: anInstalledModel [
	"Use the folder the model was installed from while it is still there. Otherwise, follow the only folder with the same baseline, as when the folder was renamed or moved; with none or several, keep the code and stop saving until the modeler decides"

	| candidates |
	((CMModelFolder in: self at: anInstalledModel folder)
		 hasBaselineNamed: anInstalledModel baselineName) ifFalse: [
			candidates := self folders select: [ :each |
				              each hasBaselineNamed: anInstalledModel baselineName ].
			candidates size = 1 ifFalse: [
				^ anInstalledModel cannotChooseAmongFolders: candidates ].
			self forgetIcebergRepositoriesAt: anInstalledModel folder.
			anInstalledModel folder: candidates first location ].
	anInstalledModel isUpToDate ifFalse: [ self reload: anInstalledModel ].
	self registerWithIceberg: anInstalledModel
]

{ #category : 'iceberg' }
CMWorkspace >> registerWithIceberg: anInstalledModel [
	"When the folder of the model is a git repository, register it with Iceberg so that git users can commit from the image. Iceberg only reads the folder: Cormas loads the code itself, from the files rather than from the last commit"

	(anInstalledModel folder / '.git') exists ifFalse: [ ^ self ].
	(self icebergRepositoriesAt: anInstalledModel folder) ifNotEmpty: [
		^ self ].
	(IceRepositoryCreator new
		 location: anInstalledModel folder;
		 subdirectory: 'src';
		 ensureProjectFile;
		 addLocalRepository) register
]

{ #category : 'refreshing' }
CMWorkspace >> reload: anInstalledModel [
	"Back up the code of the model as it is in the image, then reload it from its folder. The model is forgotten while it loads, so that loading is not saved back into its folder"

	self backUpCodeOf: anInstalledModel baselineName.
	installed removeKey: anInstalledModel baselineName.
	[ anInstalledModel reload ] ensure: [
		installed at: anInstalledModel baselineName put: anInstalledModel ]
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
	"Remove the code of an installed model from the image and forget its folder, which is left untouched. The code in the image is backed up first, so nothing is lost even if it differs from the folder or the folder is gone. The model is forgotten before its code is removed, so that the removal is not saved into its folder"

	| model |
	model := self installedModelNamed: aBaselineName.
	self backUpCodeOf: aBaselineName.
	installed removeKey: aBaselineName.
	self forgetIcebergRepositoriesAt: model folder.
	model loadedPackages do: [ :each | each removeFromSystem ].
	Metacello new
		baseline: aBaselineName;
		unregister
]

{ #category : 'private' }
CMWorkspace >> update: anExample [
	"Reset the folder of anExample to the latest commit of its library repository, backing it up first when files of the library were edited by hand"

	| repository latest |
	repository := IceRepositoryCreator new
		              location: anExample location;
		              createRepository.
	[
		repository fetch.
		latest := repository branch upstream commit ]
		on: IceError
		do: [ :error |
				CMWorkspaceError signal:
					'Cormas cannot download the latest version of ' , anExample name
					, ' (' , error description , ')' ].
	(self
		 anyFileIn: repository headCommit fileSystem
		 differsFrom: anExample location) ifTrue: [
		self backUp: anExample location ].
	repository branch commit: latest
]

{ #category : 'examples' }
CMWorkspace >> updateExamples [
	"Reset every downloaded example to the latest version of its library repository, then reload the installed ones from their folders. Files of the library edited by hand in an example are backed up first. Files added by hand, such as outputs, are kept"

	(self folders select: [ :each |
		 each isExample and: [ (each location / '.git') isDirectory ] ])
		do: [ :each | self update: each ].
	self refresh
]

{ #category : 'private' }
CMWorkspace >> zip: aFolder to: aZipFile [
	"Write a zip holding aFolder itself with everything in it, so that unzipping it gives the folder back"

	ZipArchive new
		addTree: aFolder relativeTo: aFolder parent match: [ :each | true ];
		writeToFile: aZipFile
]
