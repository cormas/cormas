"
I represent a model installed in the image from a folder of the workspace. I keep that folder up to date with the code in the image, and I never overwrite a file that someone else changed.

## Responsibility:

- I know the baseline of the model, which declares its packages, and the folder it was installed from.
- I write what changed in the image into my folder: one class, or a whole package, touching only the files that differ, each through a temporary file.
- I reload from my folder the packages whose files changed outside Cormas, or all of them when the image holds code that was not saved.
- I remember the hash of every file as Cormas last loaded or wrote it. When a file to touch differs from it, someone else changed the folder: I stop saving and remember the problem, and the code stays in the image.

## Collaborators:

- `CMWorkspace` creates me when it installs a model and asks me to save the packages that change. Before I change the folder of an example, I ask it to copy the example to `Models`.
- `TonelWriter` writes the files, in the version declared in `src/.properties` as Iceberg does, so they are the files Iceberg would commit.
- `CMWorkspaceError` carries the reason why a package could not be saved.

## Public API and Key Messages

- `CMInstalledModel in: aWorkspace baselineName: aString folder: aFileReference` creates an instance; `recordFiles` then remembers the files of the folder.
- `saveClassNamed: aClassName inPackageNamed: aPackageName` writes what a package of the model defines on a class: the class itself, or the extension methods of the package on it. Its cost depends on the class, not on the size of the model.
- `savePackageNamed: aPackageName` writes a whole package of the model.
- `isUpToDate` tells whether the image and the folder hold the same code; `reload` loads from the folder what differs, and `folder:` follows a folder that was renamed or moved.
- `isSaved` and `problem` tell whether everything in the image is in the folder, and why not.
- `ownsPackageNamed:`, `packageNames` and `loadedPackages` describe the packages of the model.
- `addPackageNamed: aPackageName` declares a package in the baseline, creating it if needed, and saves both. It refuses a baseline with groups or without a `for: #common do:` block, which must be edited by hand.
- `writePackagesTo: aFolder` writes all the packages, for example into a backup.

For example, after a method of the Forest model was changed in the image:

```smalltalk
| model |
model := CMWorkspace current installedModelNamed: 'Forest'.
model saveClassNamed: 'Tree' inPackageNamed: 'Forest-Model'.
model isSaved
	ifFalse: [ model problem ]
```

## Internal Representation

- `baselineName` is the name of the baseline, without `BaselineOf`; it is the identity of the model.
- `workspace` is the `CMWorkspace` that installed me.
- `folder` is the `FileReference` of the model folder.
- `fileHashes` maps the path of each file of `src`, relative to `folder`, to the SHA-256 of its content as Cormas last loaded or wrote it.
- `problem` is `nil` while everything is saved, otherwise the reason why it is not.

### Implementation Points

- What to save is written in memory and compared with the folder file by file. For a class, the files compared are `package.st` and every file the package could hold about the class (`.class.st`, `.trait.st`, `.extension.st`), so a class that moved or disappeared leaves no file behind. Files that do not differ are not touched, and a file changed outside Cormas elsewhere in the package does not prevent saving this class.
- Monticello asks before loading over code it does not know about; `reload` answers to load, since the workspace backed up the code in the image just before.
- A file is written to a temporary file, then the old file is deleted and the temporary one renamed. A crash between the two leaves a missing file, which the next save reports as changed outside Cormas.
"
Class {
	#name : 'CMInstalledModel',
	#superclass : 'Object',
	#instVars : [
		'baselineName',
		'folder',
		'fileHashes',
		'problem',
		'workspace'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMInstalledModel class >> in: aWorkspace baselineName: aString folder: aFileReference [

	^ self new
		  setWorkspace: aWorkspace
		  baselineName: aString
		  folder: aFileReference
]

{ #category : 'packages' }
CMInstalledModel >> addPackageNamed: aPackageName [
	"Declare the package in my baseline, creating it when it does not exist, and save it with the baseline into my folder. From then on its changes are saved like those of my other packages"

	| method |
	(self ownsPackageNamed: aPackageName) ifTrue: [
			CMWorkspaceError signal:
				aPackageName , ' is already a package of ' , baselineName ].
	self baselineClass project version groups ifNotEmpty: [
			CMWorkspaceError signal:
				self baselinePackageName , ' defines groups, so add '
				, aPackageName , ' to it by hand' ].
	method := self baselineMethod.
	self baselineClass
		compile: (self sourceOf: method withPackageNamed: aPackageName)
		classified: method protocolName.
	self packageOrganizer ensurePackage: aPackageName.
	self
		saveClassNamed: self baselinePackageName
		inPackageNamed: self baselinePackageName.
	self savePackageNamed: aPackageName
]

{ #category : 'private' }
CMInstalledModel >> baselineClass [

	^ self class environment at: self baselinePackageName asSymbol
]

{ #category : 'private' }
CMInstalledModel >> baselineMethod [

	^ self baselineClass methods
		  detect: [ :each | each hasPragmaNamed: #baseline ]
		  ifNone: [
				  CMWorkspaceError signal:
					  self baselinePackageName , ' has no method with <baseline>' ]
]

{ #category : 'accessing' }
CMInstalledModel >> baselineName [

	^ baselineName
]

{ #category : 'accessing' }
CMInstalledModel >> baselinePackageName [

	^ 'BaselineOf' , baselineName
]

{ #category : 'refreshing' }
CMInstalledModel >> cannotChooseAmongFolders: modelFolders [
	"Stop saving: the folder I was installed from is gone, and there is not exactly one other folder of the same model to follow"

	problem := modelFolders
		           ifEmpty: [
				           'The folder of ' , baselineName
				           ,
				           ' is gone: restore it, or remove the model from the image' ]
		           ifNotEmpty: [
				           baselineName , ' is in several folders: '
				           ,
				           (', ' join:
					            (modelFolders collect: [ :each | each name ]))
				           , '. Choose the one to use' ]
]

{ #category : 'private' }
CMInstalledModel >> changedPackageNames [
	"Return the names of the packages whose files differ from what Cormas last loaded or wrote, or of all my loaded packages when the image holds code that was not saved"

	| onDisk |
	self isSaved ifFalse: [
		^ (self loadedPackages collect: [ :each | each name ]) asSet ].
	onDisk := self hashesOnDisk.
	^ ((onDisk keys asSet , fileHashes keys reject: [ :path |
			    (onDisk at: path ifAbsent: [ nil ])
			    = (fileHashes at: path ifAbsent: [ nil ]) ]) collect: [ :path |
		   (folder resolveString: path) parent basename ]) asSet
]

{ #category : 'private' }
CMInstalledModel >> checkUnchanged: aPath [
	"Raise a CMWorkspaceError unless the file is as Cormas last loaded or wrote it: Cormas never overwrites or deletes a file it did not write"

	| file unchanged |
	file := folder resolveString: aPath.
	unchanged := file exists
		             ifTrue: [
		             (fileHashes at: aPath ifAbsent: [ nil ])
		             = (self hashOf: file) ]
		             ifFalse: [ (fileHashes includesKey: aPath) not ].
	unchanged ifFalse: [
			CMWorkspaceError signal:
				baselineName , ' was changed outside Cormas: ' , aPath ]
]

{ #category : 'accessing' }
CMInstalledModel >> dependencyNames [
	"Return the names of the projects that my baseline loads before the model"

	^ self baselineClass project version projects collect: [ :each |
		  each name ]
]

{ #category : 'private' }
CMInstalledModel >> filesOf: definitions inPackageNamed: aPackageName [
	"Return the Tonel files of the definitions as a dictionary from their path in my folder to their bytes. They are written in memory, with the Tonel writer that Iceberg would use for my folder"

	| root src |
	root := FileSystem memory root.
	src := root / 'src'.
	src ensureCreateDirectory.
	self tonelWriterClass new
		directoryReference: src;
		writeSnapshot: (MCSnapshot fromDefinitions: definitions).
	^ ((src / aPackageName) allFiles collect: [ :each |
		   (each relativeTo: root) pathString
		   -> each binaryReadStream upToEnd ]) asDictionary
]

{ #category : 'private' }
CMInstalledModel >> filesOfClassNamed: aClassName inPackageNamed: aPackageName [

	| definitions |
	definitions := OrderedCollection with:
		               (MCOrganizationDefinition packageName: aPackageName).
	self class environment at: aClassName asSymbol ifPresent: [ :class |
			class package name = aPackageName ifTrue: [
				definitions add: class asClassDefinition ].
			definitions addAll:
				(self methodsOf: class inPackageNamed: aPackageName) ].
	^ self filesOf: definitions inPackageNamed: aPackageName
]

{ #category : 'private' }
CMInstalledModel >> filesOfPackageNamed: aPackageName [

	^ self
		  filesOf: (MCPackage named: aPackageName) snapshot definitions
		  inPackageNamed: aPackageName
]

{ #category : 'accessing' }
CMInstalledModel >> folder [

	^ folder
]

{ #category : 'refreshing' }
CMInstalledModel >> folder: aFileReference [
	"Use another folder, found with the same baseline after mine was renamed or moved"

	folder := aFileReference
]

{ #category : 'private' }
CMInstalledModel >> hashOf: aFile [

	^ (SHA256 hashMessage: aFile binaryReadStream upToEnd) hex
]

{ #category : 'private' }
CMInstalledModel >> hashesOnDisk [

	^ ((folder / 'src') allFiles collect: [ :each |
		   (self pathOf: each) -> (self hashOf: each) ]) asDictionary
]

{ #category : 'packages' }
CMInstalledModel >> isNamedLikeMyPackages: aPackageName [
	"Answer whether the package starts like my packages, up to their first dash, such as Forest-Analysis for a model whose packages are Forest-Model and Forest-Tests"

	^ self packageNames anySatisfy: [ :each |
		  aPackageName beginsWith: (each copyUpTo: $-) , '-' ]
]

{ #category : 'saving' }
CMInstalledModel >> isSaved [
	"Answer whether everything changed in the image was written to my folder"

	^ problem isNil
]

{ #category : 'refreshing' }
CMInstalledModel >> isUpToDate [
	"Answer whether the image and my folder hold the same code: everything was saved, and no file changed since Cormas last loaded or wrote it"

	^ self isSaved and: [ fileHashes = self hashesOnDisk ]
]

{ #category : 'private' }
CMInstalledModel >> loadPackageNamed: aPackageName [

	((TonelRepository new directory: folder / 'src')
		 versionFromFileNamed: aPackageName) load
]

{ #category : 'accessing' }
CMInstalledModel >> loadedPackages [
	"Return the packages of the model that are in the image, with the baseline. A package of a group that was not loaded is not in the image"

	^ (self packageNames copyWith: self baselinePackageName)
		  select: [ :each | self packageOrganizer hasPackage: each ]
		  thenCollect: [ :each | self packageOrganizer packageNamed: each ]
]

{ #category : 'private' }
CMInstalledModel >> methodsOf: aClass inPackageNamed: aPackageName [
	"Return the definitions of the methods of the package in aClass, on both sides. They are read from the method dictionaries, which are up to date when a removal is announced, unlike localMethods of a class that uses traits; methods that come from traits are left out"

	^ aClass methods , aClass classSide methods
		  select: [ :each |
			  each isFromTrait not and: [ each package name = aPackageName ] ]
		  thenCollect: [ :each | each asMCMethodDefinition ]
]

{ #category : 'testing' }
CMInstalledModel >> ownsPackageNamed: aPackageName [
	"Answer whether the package is one of the model, its baseline included, so that its changes are saved in my folder"

	^ aPackageName = self baselinePackageName or: [
		  self packageNames includes: aPackageName ]
]

{ #category : 'accessing' }
CMInstalledModel >> packageNames [
	"Return the names of the packages that my baseline declares, in all its groups, without the baseline itself. They are the packages of the model"

	^ self baselineClass project version packages collect: [ :each |
		  each name ]
]

{ #category : 'private' }
CMInstalledModel >> pathOf: aFile [

	^ (aFile relativeTo: folder) pathString
]

{ #category : 'private' }
CMInstalledModel >> pathsOfClassNamed: aClassName inPackageNamed: aPackageName [
	"Return the paths of every file where the package can hold something about the class, so that a file left behind by a class that moved or disappeared is deleted"

	| packageFolder |
	packageFolder := folder / 'src' / aPackageName.
	^ ({
		   'package.st'.
		   (aClassName , '.class.st').
		   (aClassName , '.trait.st').
		   (aClassName , '.extension.st') } collect: [ :each |
		   self pathOf: packageFolder / each ]) asSet
]

{ #category : 'private' }
CMInstalledModel >> pathsOnDiskInPackageNamed: aPackageName [

	| packageFolder |
	packageFolder := folder / 'src' / aPackageName.
	^ packageFolder exists
		  ifTrue: [
			  (packageFolder allFiles collect: [ :each | self pathOf: each ])
				  asSet ]
		  ifFalse: [ Set new ]
]

{ #category : 'saving' }
CMInstalledModel >> problem [
	"Return why the model is not saved"

	^ problem
]

{ #category : 'saving' }
CMInstalledModel >> recordFiles [
	"Remember the hash of every file of my folder's src, as Cormas loaded or wrote it, so that a file changed by someone else is never overwritten"

	fileHashes := self hashesOnDisk
]

{ #category : 'refreshing' }
CMInstalledModel >> reload [
	"Load from my folder the packages whose files changed since Cormas last loaded or wrote them, all of them when the image holds code that was not saved, and the packages my baseline declares that are not loaded yet. Monticello asks before replacing code it does not know about: the code in the image was backed up, so load. When loading fails, keep the problem"

	| changed |
	changed := self changedPackageNames.
	[
		[
			(changed includes: self baselinePackageName) ifTrue: [
				self loadPackageNamed: self baselinePackageName ].
			(self packageNames select: [ :each |
					 (changed includes: each) or: [
							 (self packageOrganizer hasPackage: each) not and: [
								 (folder / 'src' / each) isDirectory ] ] ]) do: [ :each |
				self loadPackageNamed: each ] ]
			on: MCMergeOrLoadWarning
			do: [ :warning | warning load ].
		self recordFiles.
		problem := nil ]
		on: Error
		do: [ :error |
				problem := baselineName
				           , ' could not be reloaded from its folder: '
				           , error messageText ]
]

{ #category : 'private' }
CMInstalledModel >> save: files over: paths [
	"Make each of paths hold its content in files, or not exist when files has none for it. When a file was changed by someone else, or cannot be written, stop saving and remember the problem: the code stays in the image, and nothing more is written until the model is reloaded"

	self isSaved ifFalse: [ ^ self ].
	[
		folder exists ifFalse: [
			CMWorkspaceError signal:
				'The folder ' , folder fullName , ' is gone' ].
		self write: files over: paths ]
		on: CMWorkspaceError
		do: [ :error |
				problem := error messageText.
				workspace announceChange ]
]

{ #category : 'saving' }
CMInstalledModel >> saveClassNamed: aClassName inPackageNamed: aPackageName [
	"Write into my folder what the package defines on the class: its definition and methods, or the extension methods of the package on it. Only that file and package.st are compared and touched, so saving does not get slower as the model grows"

	self
		save:
		(self filesOfClassNamed: aClassName inPackageNamed: aPackageName)
		over:
		(self pathsOfClassNamed: aClassName inPackageNamed: aPackageName)
]

{ #category : 'saving' }
CMInstalledModel >> savePackageNamed: aPackageName [
	"Write the whole package as it is in the image into my folder, touching only the files that differ"

	| files |
	files := self filesOfPackageNamed: aPackageName.
	self
		save: files
		over:
		files keys asSet , (self pathsOnDiskInPackageNamed: aPackageName)
]

{ #category : 'initialization' }
CMInstalledModel >> setWorkspace: aWorkspace baselineName: aString folder: aFileReference [

	workspace := aWorkspace.
	baselineName := aString.
	folder := aFileReference.
	fileHashes := Dictionary new
]

{ #category : 'private' }
CMInstalledModel >> sourceOf: aBaselineMethod withPackageNamed: aPackageName [
	"Return the source of the baseline method with the package declared at the end of its for: #common do: block"

	| tree common |
	tree := aBaselineMethod parseTree.
	common := tree allChildren
		          detect: [ :each |
				          each isMessage and: [
						          each selector = #for:do: and: [
								          each arguments first isLiteralNode and: [
									          each arguments first value = #common ] ] ] ]
		          ifNone: [
				          CMWorkspaceError signal:
					          self baselinePackageName
					          , ' has no for: #common do: block, so add '
					          , aPackageName , ' to it by hand' ].
	common arguments last body addNode:
		(RBParser parseExpression:
			 'spec package: ' , aPackageName printString).
	^ tree formattedCode
]

{ #category : 'private' }
CMInstalledModel >> tonelWriterClass [
	"Return the Tonel writer for the version declared in src/.properties, as Iceberg does"

	| properties version |
	properties := folder / 'src' / '.properties'.
	version := TonelWriter defaultVersion.
	properties isFile ifTrue: [
			version := (STON fromString: properties contents)
				           at: #version
				           ifAbsent: [ version ] ].
	^ TonelWriter forVersion: version
]

{ #category : 'private' }
CMInstalledModel >> write: files over: paths [
	"Check first that every file to touch is as Cormas last saw it, then write and delete. Before changing the folder of an example, which only Cormas changes, have the workspace copy it to Models or stop saving. An old version is never changed. Before changing a model made with another major of Cormas, have the workspace migrate it or stop saving. Then record that the model is made with this Cormas"

	| toWrite toDelete |
	toWrite := files keys reject: [ :path |
			           | file |
			           file := folder resolveString: path.
			           file exists and: [
				           file binaryReadStream upToEnd = (files at: path) ] ].
	toDelete := paths reject: [ :path |
			            (files includesKey: path) or: [
				            (folder resolveString: path) exists not ] ].
	(toWrite isEmpty and: [ toDelete isEmpty ]) ifTrue: [ ^ self ].
	(CMModelFolder in: workspace at: folder) isExample ifTrue: [
		workspace copyEditedExample: self ].
	(CMModelFolder in: workspace at: folder) isOldVersion ifTrue: [
		workspace editOldVersion: self ].
	toWrite , toDelete asArray do: [ :path | self checkUnchanged: path ].
	((CMModelFolder in: workspace at: folder)
		 isMadeWithAnotherMajorThan: CMVersion current) ifTrue: [
		workspace migrate: self to: CMVersion current ].
	CMWorkspaceError whileWritingIn: folder / 'src' do: [
			toWrite do: [ :path | self writeBytes: (files at: path) at: path ].
			toDelete do: [ :path |
					(folder resolveString: path) delete.
					fileHashes removeKey: path ] ].
	CMWorkspaceError whileWritingIn: folder do: [
			(CMModelFolder in: workspace at: folder) recordMadeWith:
				CMVersion current ]
]

{ #category : 'private' }
CMInstalledModel >> writeBytes: aByteArray at: aPath [
	"Write through a temporary file, so that a file is never left half written"

	| file temporary |
	file := folder resolveString: aPath.
	temporary := file parent / (file basename , '.cormas-tmp').
	file parent ensureCreateDirectory.
	temporary binaryWriteStreamDo: [ :stream |
		stream nextPutAll: aByteArray ].
	file exists ifTrue: [ file delete ].
	temporary moveTo: file.
	fileHashes at: aPath put: (SHA256 hashMessage: aByteArray) hex
]

{ #category : 'writing' }
CMInstalledModel >> writePackagesTo: aSourceFolder [
	"Write the packages of the model, as they are in the image, as Tonel files in aSourceFolder"

	self loadedPackages do: [ :each |
			self tonelWriterClass new
				directoryReference: aSourceFolder;
				writeSnapshot: (MCPackage named: each name) snapshot ]
]
