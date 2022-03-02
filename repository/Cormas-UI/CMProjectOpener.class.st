"
Provides utilities to browse and open a CORMAS project file (.zip)


"
Class {
	#name : #CMProjectOpener,
	#superclass : #CMResourceOpener,
	#instVars : [
		'zipFileSys',
		'readStream'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMProjectOpener class >> demoImageFromProjectFile: aFileReference [
	" Answer a <Morph> which serves as demo for the CORMAS project in aFileReference "

	| zipDemoFileAssoc |
	
	zipDemoFileAssoc := self findDemoResource: ((ZipStore reference: aFileReference) open root).
	^ zipDemoFileAssoc forCormasProjectDemo
]

{ #category : #private }
CMProjectOpener class >> findDemoResource: zipFileSys [
	" Answer a <ZipFileSystemFile>. A demo could be an image or animation, try to find one for the project being opened "

	| candidateLocations validZipDirEntries |
	
	candidateLocations := #('animations' 'images').
	
	validZipDirEntries := candidateLocations 
		collect: [ : locationString | (zipFileSys fileEntryAt: locationString) entries ]
		thenSelect: [ : zipEntry | zipEntry notEmpty ].
	^ (self selectImageResources: validZipDirEntries)  
		detect: [ : zipDirDict | (self findLatestDemoResource: zipDirDict) notNil ]
		ifNone: [ self cormasDemoImage ]
		

]

{ #category : #private }
CMProjectOpener class >> findLatestDemoResource: aCollection [ 
	" Answer a  with the last modification time "
	
	| now older zipDemoFile |
	now := TRPlatform current dateAndTimeClass now.
	older := TRPlatform current dateAndTimeClass year: 1900 day: 1.
	aCollection associationsDo: [ : assoc | 
		| zipFile |
		zipFile := assoc value.
		(now - zipFile creationTime) < (now - older)
			ifTrue: [ 
				older := zipFile creationTime.
				zipDemoFile := zipFile ] ].
	^ zipDemoFile
	

]

{ #category : #accessing }
CMProjectOpener class >> metadataFromProjectFile: aZipFileSystemFile [
	" Answer a <Dictionary> with metadata for CORMAS project at aZipFileSystemFile "

	^ STON fromStream: (aZipFileSystemFile fileEntryAt: CMProjectFile metadataFilename) readStream
]

{ #category : #private }
CMProjectOpener class >> selectImageResources: aCollection [ 

	^ aCollection 
		collect: [ : entryValueDict | 
			entryValueDict select: [ : zipFile | zipFile basename endsWithAnyOf: #('gif' 'png' 'jpg' 'jpeg') ] ]
		thenSelect: #notEmpty
]

{ #category : #private }
CMProjectOpener >> createProjectFor: aFileReference [
	" Private - Answer a new project model for aFileReference representing a CORMAS project file "

	^ CMProjectModel basicNew
		fileReference: aFileReference;
		projectManager: self projectManager;
		initializeForModel: (self class environment at: self modelMainClass) new
			named: self modelName;
			yourself
]

{ #category : #private }
CMProjectOpener >> getProjectFrom: aFileReferenceOrProjectModel [
	" Private - The user can open a project from a demo (file) or the image. This method creates and answer a project model if necessary "
	
	^ aFileReferenceOrProjectModel isProject
		ifFalse: [ 
			self tryOpenFromFile: aFileReferenceOrProjectModel.
			openStatus := true.
			self createProjectFor: aFileReferenceOrProjectModel ]
		ifTrue: [ 
			openStatus := true.			
			aFileReferenceOrProjectModel ].
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

	| storedName |
	
	((storedName := self metadataFromProjectFile at: 'Name') endsWith: 'Model')
		ifTrue: [ ^ storedName removeSuffix: 'Model' ].
	^ storedName
]

{ #category : #callbacks }
CMProjectOpener >> openProject [
	" Request a model to the user and open it for the receiver "

	CMSpOpenProjectPresenter openFor: self projectManager.


]

{ #category : #callbacks }
CMProjectOpener >> openProject: aFileReferenceOrProjectModel [
	" Answer a <String> with the full path of the opened project, if possible. Otherwise raise an Exception "

	| currentProjectModel |
	
	openStatus := false.
	currentProjectModel := self getProjectFrom: aFileReferenceOrProjectModel.
	self currentProject: currentProjectModel.
	openStatus
		ifTrue: [ self projectManager doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #accessing }
CMProjectOpener >> readStream [
	^ readStream
]

{ #category : #accessing }
CMProjectOpener >> readStream: anObject [
	readStream := anObject
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
CMProjectOpener >> tryReadSourceFromFile: fileRef [
	" Private - Try to open fileRef <FileReference> project file "

	[ 	
		zipFileSys := self validateProjectFile: fileRef.
		^ self modelFile readStream 
	]
	on: Error
	do: [ : ex | 
		self handleFileInException: ex.
		openStatus := false ].
]

{ #category : #callbacks }
CMProjectOpener >> tryReadSourceFromProject [
	" Private - Try to open and read source code for the model currently opened in the receiver's project manager. Answer a <ReadStream> "

	[ 	
		zipFileSys := self validateProjectFile: self projectManager currentProjectFileReference.
		readStream := self modelFile readStream.
		openStatus := true.
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

{ #category : #accessing }
CMProjectOpener >> zipFileSys [
	^ zipFileSys
]

{ #category : #accessing }
CMProjectOpener >> zipFileSys: anObject [
	zipFileSys := anObject
]
