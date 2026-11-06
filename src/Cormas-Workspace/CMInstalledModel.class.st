"
I represent a model installed in the image from a folder of the workspace. I keep that folder up to date with the code in the image, and I never overwrite a file that someone else changed.

## Responsibility:

- I know the baseline of the model, which declares its packages, and the folder it was installed from.
- I write a changed package into my folder, touching only the files that differ, each through a temporary file.
- I remember the hash of every file as Cormas last loaded or wrote it. When a file to touch differs from it, someone else changed the folder: I stop saving and remember the problem, and the code stays in the image.

## Collaborators:

- `CMWorkspace` creates me when it installs a model and asks me to save the packages that change.
- `TonelRepository` writes packages with the same Tonel writer as Iceberg, so the files are the ones Iceberg would commit.
- `CMWorkspaceError` carries the reason why a package could not be saved.

## Public API and Key Messages

- `CMInstalledModel baselineName: aString folder: aFileReference` creates an instance; `recordFiles` then remembers the files of the folder.
- `savePackageNamed: aPackageName` writes a package of the model into the folder.
- `isSaved` and `problem` tell whether everything in the image is in the folder, and why not.
- `ownsPackageNamed:`, `packageNames` and `loadedPackages` describe the packages of the model.
- `writePackagesTo: aFolder` writes all the packages, for example into a backup.

For example, after a method of the Forest model was changed in the image:

```smalltalk
| model |
model := CMWorkspace current installedModelNamed: 'Forest'.
model savePackageNamed: 'Forest-Model'.
model isSaved
	ifFalse: [ model problem ]
```

## Internal Representation

- `baselineName` is the name of the baseline, without `BaselineOf`; it is the identity of the model.
- `folder` is the `FileReference` of the model folder.
- `fileHashes` maps the path of each file of `src`, relative to `folder`, to the SHA-256 of its content as Cormas last loaded or wrote it.
- `problem` is `nil` while everything is saved, otherwise the reason why it is not.

### Implementation Points

- A whole package is written in memory and compared with the folder file by file, which handles new, changed, renamed and removed classes the same way. Files that do not differ are not touched.
- A file is written to a temporary file, then the old file is deleted and the temporary one renamed. A crash between the two leaves a missing file, which the next save reports as changed outside Cormas.
"
Class {
	#name : 'CMInstalledModel',
	#superclass : 'Object',
	#instVars : [
		'baselineName',
		'folder',
		'fileHashes',
		'problem'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMInstalledModel class >> baselineName: aString folder: aFileReference [

	^ self new setBaselineName: aString folder: aFileReference
]

{ #category : 'accessing' }
CMInstalledModel >> baselineName [

	^ baselineName
]

{ #category : 'accessing' }
CMInstalledModel >> baselinePackageName [

	^ 'BaselineOf' , baselineName
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

	^ (self class environment at: self baselinePackageName asSymbol)
		  project version projects collect: [ :each | each name ]
]

{ #category : 'private' }
CMInstalledModel >> filesOf: aPackageName [
	"Return the Tonel files of the package as it is in the image, as a dictionary from their path in my folder to their bytes. They are written in memory with the format declared in my folder"

	| root src |
	root := FileSystem memory root.
	src := root / 'src'.
	src ensureCreateDirectory.
	(folder / 'src' / '.properties') isFile ifTrue: [
		folder / 'src' / '.properties' copyTo: src / '.properties' ].
	self
		write: (self packageOrganizer packageNamed: aPackageName)
		to: src.
	^ ((src / aPackageName) allFiles collect: [ :each |
		   (each relativeTo: root) pathString
		   -> each binaryReadStream upToEnd ]) asDictionary
]

{ #category : 'accessing' }
CMInstalledModel >> folder [

	^ folder
]

{ #category : 'private' }
CMInstalledModel >> hashOf: aFile [

	^ (SHA256 hashMessage: aFile binaryReadStream upToEnd) hex
]

{ #category : 'saving' }
CMInstalledModel >> isSaved [
	"Answer whether everything changed in the image was written to my folder"

	^ problem isNil
]

{ #category : 'accessing' }
CMInstalledModel >> loadedPackages [
	"Return the packages of the model that are in the image, with the baseline. A package of a group that was not loaded is not in the image"

	^ (self packageNames copyWith: self baselinePackageName)
		  select: [ :each | self packageOrganizer hasPackage: each ]
		  thenCollect: [ :each | self packageOrganizer packageNamed: each ]
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

	^ (self class environment at: self baselinePackageName asSymbol)
		  project version packages collect: [ :each | each name ]
]

{ #category : 'private' }
CMInstalledModel >> pathOf: aFile [

	^ (aFile relativeTo: folder) pathString
]

{ #category : 'saving' }
CMInstalledModel >> problem [
	"Return why the model is not saved"

	^ problem
]

{ #category : 'saving' }
CMInstalledModel >> recordFiles [
	"Remember the hash of every file of my folder's src, as Cormas loaded or wrote it, so that a file changed by someone else is never overwritten"

	fileHashes := Dictionary new.
	(folder / 'src') allFiles do: [ :each |
		fileHashes at: (self pathOf: each) put: (self hashOf: each) ]
]

{ #category : 'saving' }
CMInstalledModel >> savePackageNamed: aPackageName [
	"Write the package as it is in the image into my folder, touching only the files that differ. When a file was changed by someone else, or cannot be written, stop saving and remember the problem: the code stays in the image, and nothing more is written until the model is reloaded"

	self isSaved ifFalse: [ ^ self ].
	folder exists ifFalse: [
		^ problem := 'The folder ' , folder fullName , ' is gone' ].
	[ self write: (self filesOf: aPackageName) in: aPackageName ]
		on: CMWorkspaceError
		do: [ :error | problem := error messageText ]
]

{ #category : 'initialization' }
CMInstalledModel >> setBaselineName: aString folder: aFileReference [

	baselineName := aString.
	folder := aFileReference.
	fileHashes := Dictionary new
]

{ #category : 'private' }
CMInstalledModel >> write: files in: aPackageName [
	"Make the folder of the package hold exactly files, checking first that every file to touch is as Cormas last saw it"

	| packageFolder onDisk toWrite toDelete |
	packageFolder := folder / 'src' / aPackageName.
	onDisk := packageFolder exists
		          ifTrue: [
			          (packageFolder allFiles collect: [ :each |
				           self pathOf: each ]) asSet ]
		          ifFalse: [ Set new ].
	toWrite := files keys reject: [ :path |
			           (onDisk includes: path) and: [
					           (folder resolveString: path) binaryReadStream upToEnd
					           = (files at: path) ] ].
	toDelete := onDisk reject: [ :path | files includesKey: path ].
	toWrite , toDelete asArray do: [ :path | self checkUnchanged: path ].
	CMWorkspaceError whileWritingIn: packageFolder do: [
			toWrite do: [ :path | self writeBytes: (files at: path) at: path ].
			toDelete do: [ :path |
					(folder resolveString: path) delete.
					fileHashes removeKey: path ] ]
]

{ #category : 'writing' }
CMInstalledModel >> write: aPackage to: aSourceFolder [
	"Write the package as it is in the image with the Tonel writer that Iceberg uses, without changing its working copy, so that Iceberg sees no difference"

	| package |
	package := MCPackage named: aPackage name.
	(TonelRepository new directory: aSourceFolder) storeVersion:
		(MCVersion
			 package: package
			 info: (MCVersionInfo
					  name: aPackage name , '-cormas'
					  id: UUID new
					  message: 'Written by Cormas'
					  date: Date today
					  time: Time now
					  author: 'Cormas'
					  ancestors: #(  )
					  stepChildren: #(  ))
			 snapshot: package snapshot
			 dependencies: #(  ))
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

	self loadedPackages do: [ :each | self write: each to: aSourceFolder ]
]
