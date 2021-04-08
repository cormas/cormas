"
Provides utilities to browse and open a CORMAS project file (.zip)


"
Class {
	#name : #CMProjectOpener,
	#superclass : #CMResourceOpener,
	#instVars : [
		'openerWindow',
		'zipFileSys'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMProjectOpener class >> metadataFromProjectFile: aZipFileSystemFile [

	^ STON fromStream: (aZipFileSystemFile fileEntryAt: CMProjectFile metadataFilename) readStream
]

{ #category : #accessing }
CMProjectOpener >> metadataFromProjectFile [
	" Answer a <Dictionary> with the receiver's currently opened CORMAS project metadata "

	^ STON fromStream: self modelMetadata readStream
]

{ #category : #callbacks }
CMProjectOpener >> modelFile [
	" Answer a <ZipFileSystemFile> representing the source code of the project being opened in the receiver "

	^ zipFileSys fileEntryAt: CMProjectFile sourceCodeFilenameWithExtension
]

{ #category : #callbacks }
CMProjectOpener >> modelMainClass [
	" Answer a <String> representing the receiver's currently project being opened "

	^ self metadataFromProjectFile at: 'Model class'
]

{ #category : #callbacks }
CMProjectOpener >> modelMetadata [
	" Answer a <ZipFileSystemFile> representing the currently opened CORMAS project in the receiver "

	^ zipFileSys fileEntryAt: CMProjectFile metadataFilename
]

{ #category : #callbacks }
CMProjectOpener >> modelName [
	" Answer a <String> representing the receiver's currently project being opened "

	^ self metadataFromProjectFile at: 'Name'
]

{ #category : #callbacks }
CMProjectOpener >> openProject [
	" Request a model to the user and open it for the receiver "

	CMSpOpenProjectPresenter openFor: self projectManager.


]

{ #category : #callbacks }
CMProjectOpener >> openProjectFromFile: aFileReference [
	" Answer a <String> with the full path of the opened project, if possible. Otherwise raise an Exception "

	self tryOpenFromFile: aFileReference.
	openStatus := true.
	self currentProject: (CMProjectModel basicNew
		fileName: aFileReference fullName;
		projectManager: self projectManager;
		initializeForModel: (self class environment at: self modelMainClass) new
			named: self modelName;
			yourself).
	openStatus
		ifTrue: [ self projectManager doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #accessing }
CMProjectOpener >> openerWindow [
	^ openerWindow
]

{ #category : #accessing }
CMProjectOpener >> openerWindow: anObject [
	openerWindow := anObject
]

{ #category : #callbacks }
CMProjectOpener >> tryOpenFromFile: fileRef [
	" Private - Try to open fileRef <FileReference> project file "

	[ 	
		zipFileSys := self validateProjectFile: fileRef.
		self modelFile readStream fileInDisplayingProgress 
	]
	on: Error
	do: [ : ex | 
		self handleFileInException: ex.
		openStatus := false ].
]

{ #category : #callbacks }
CMProjectOpener >> validateProjectFile: aFileReference [
	" Answer the <ZipFileSystemDirectory> of aFileReference's root "

	zipFileSys := (ZipStore reference: aFileReference) open root.
	(#( #sourceCodeFilenameWithExtension #metadataFilename)
		allSatisfy: [ : selector | zipFileSys fileEntriesIncludes: (CMProjectFile perform: selector) ])
			ifFalse: [ self error: 'CORMAS project file missing files' ].
	^ zipFileSys
]
