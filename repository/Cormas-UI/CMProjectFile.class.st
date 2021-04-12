"
Represents a CORMAS project on disk.
Currently, a project is a ZIP file to enable easy edition of projects by users.

Uses bugfixes to ZipArchive shared by Cyril Ferlicot in Pharo Discord channel

Use CMModel2ProjectMigrator to create project files.

"
Class {
	#name : #CMProjectFile,
	#superclass : #ZipArchive,
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMProjectFile class >> archive: aFilePattern in: aZipArchive [
    aFilePattern isString
        ifTrue: [ 
				self 
					archiveFileMatching: aFilePattern 
					directory: FileSystem workingDirectory 
					in: aZipArchive ]
        ifFalse: [ 
            "then is expected to be a fileReference"
            aFilePattern isDirectory
                ifTrue: [ self archiveDirectoryRecursively: aFilePattern relativeTo: FileSystem workingDirectory in: aZipArchive ]
                ifFalse: [ self archiveFile: aFilePattern in: aZipArchive ] ]
]

{ #category : #accessing }
CMProjectFile class >> archiveAllFromPharo: aCollectionOfFileReferencesOrMatchingPatterns as: aZipArchiveName [

    | zipArchive |
    zipArchive := self new.
    aCollectionOfFileReferencesOrMatchingPatterns do: [ :each |
        self archive: each in: zipArchive ].
    zipArchive writeToFile: aZipArchiveName.
]

{ #category : #accessing }
CMProjectFile class >> archiveDirectoryRecursively: aFileReference relativeTo: relativeFileReference in: aZipArchive [

	| relativePath |
	relativePath := DiskStore current stringFromPath: (aFileReference relativeTo: relativeFileReference ).
    (aFileReference childrenMatching: '*') 
		ifNotEmpty: [ : subFiles |  
			subFiles do: [ :eachFileReference | 
            eachFileReference isDirectory
                ifTrue: [ self archiveDirectoryRecursively: eachFileReference relativeTo: relativeFileReference in: aZipArchive ]
                ifFalse: [ aZipArchive addFile: eachFileReference pathString as: relativePath ] ] ]
		ifEmpty: [ 
			aFileReference isDirectory
				ifTrue: [ 
					aZipArchive 
						addDirectory: aFileReference 
						as: relativePath  ]
				ifFalse: [ 
					aZipArchive 
						addDirectory: aFileReference pathString 
						as: relativePath ] ]
]

{ #category : #accessing }
CMProjectFile class >> archiveFile: aFileReference in: aZipArchive [

    aZipArchive addFile: aFileReference pathString as: aFileReference basename
]

{ #category : #accessing }
CMProjectFile class >> archiveFileMatching: aStringPattern directory: aFileReference in: aZipArchive [

    (aFileReference filesMatching: aStringPattern) do: [ :eachFileReference |
        self archiveFile: eachFileReference in: aZipArchive ].    
]

{ #category : #defaults }
CMProjectFile class >> demoImageFilenameWithExtension [
	" Answer a <String> with the file name of the demo image file of a CORMAS project "

	^ 'demo.gif'

]

{ #category : #accessing }
CMProjectFile class >> metadataFilename [
	" Answer a <String> with the name of the file which stores metadata information about a project "

	^ 'metadata.ston'
]

{ #category : #defaults }
CMProjectFile class >> sourceCodeFilename [
	" Answer a <String> with the file name of the source code file of all model classes and packages. "

	^ 'model'

]

{ #category : #defaults }
CMProjectFile class >> sourceCodeFilenameWithExtension [
	" Answer a <String> with the file name of the source code file of all model classes and packages. "

	^ 'model.st'

]

{ #category : #'archive operations' }
CMProjectFile >> addFile: aFileReference as: anotherFileName [
	| newMember |
	newMember := self memberClass newFromFile: aFileReference asFileReference.
	newMember localFileName: anotherFileName.
	self addMember: newMember.
	^newMember
]

{ #category : #'archive operations' }
CMProjectFile >> addTree: aFileNameOrDirectory removingFirstCharacters: n match: aBlock [
	| dir relativePath matches |
	dir := aFileNameOrDirectory asFileReference.
	relativePath := (dir fullName allButFirst: n) asFileReference.
	matches := dir entries select: [ :entry | aBlock value: entry ].
	matches
		do: [ :e | | newMember |
			newMember := e isDirectory
					ifTrue: [ self memberClass newFromDirectory: e asFileReference ]
					ifFalse: [ self memberClass newFromFile: (e asFileReference relativeToPath: FileSystem workingDirectory) fullName asFileReference  ].
		newMember localFileName: (relativePath / e name) fullName.
		self addMember: newMember.
		e isDirectory ifTrue: [ self addTree: e fullName removingFirstCharacters: n match: aBlock ].
	]

]
