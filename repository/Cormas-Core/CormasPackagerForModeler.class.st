"
The specialized CormasPackager class for a modeler packaging (installation for modelers)
"
Class {
	#name : #CormasPackagerForModeler,
	#superclass : #CormasPackager,
	#category : 'Cormas-Core-Others'
}

{ #category : #resources }
CormasPackagerForModeler class >> launchPackagingLabel [
	
	^'Package modeler installation'
]

{ #category : #'description accessing' }
CormasPackagerForModeler class >> targetPublic [
	"return the public used in the description"
	
	^'modelers'
]

{ #category : #resources }
CormasPackagerForModeler class >> windowTitle [
	
	^super windowTitle , 'Modeler packaging'
]

{ #category : #'private actions' }
CormasPackagerForModeler >> changeDefaultCOMDirectory [
	"change the default COM directory (checked at startup in a dev image)"
	
	COMSessionManager defaultCOMDirectoryName: '.'
]

{ #category : #accessing }
CormasPackagerForModeler >> computeDefaultTargetFile [
	"the complete path to the generated exe (directory + imageName + .exe) as a Filename"
	
	| dirName fileName version |
	version := Cormas versionAsString.
	dirName := 'cormas-<1s>-modeler' expandMacrosWith: version.
	fileName := 'cormas-<1s>-modeler.exe' expandMacrosWith: version.
	^self basePackagingDirectory \ dirName \ fileName
]

{ #category : #'private actions' }
CormasPackagerForModeler >> copyAndInstallVWSources [
	"copy the source files since modeler has acces to all source code.
	then make a relative path in the SourceFileManager.
	ensure this work for a developer or modeler environment"
	
	| aFilename targetDir mgr sourcesFile |
	aFilename := self targetFile.
	targetDir := aFilename directory.
	targetDir ensureDirectory.
	mgr := SourceFileManager default.
	sourcesFile := (mgr allFiles at: mgr sourcesIndex) asFilename.
	sourcesFile copyTo: targetDir \ sourcesFile tail.
	mgr
		file: mgr sourcesIndex
		name: sourcesFile tail
		writable: false
]

{ #category : #'private actions' }
CormasPackagerForModeler >> copyParcelsSources [
	"copy all neededs parcels source and change the location to a relative one"
	
	| mgr targetDir |
	mgr := SourceFileManager default.
	targetDir := self targetFile directory \ 'parcels'.
	targetDir ensureDirectory.
	mgr allFiles
		keysAndValuesDo:
			[:i :each | 
			(self shouldBeCopiedSource: each)
				ifTrue:
					[each copyTo: targetDir \ each tail.
					mgr
						file: i
						name: 'parcels\' , each tail
						writable: false]]
]

{ #category : #private }
CormasPackagerForModeler >> createReadmeFile [
	"create a readme file"
	
	| s |
	s := (self packagingDirectory \ 'readme.txt') writeStream.
	[s
		nextPutAll: 'Please, note the following :';
		cr;
		cr;
		nextPutAll: ' - This is a packaged version of Cormas for modelers';
		cr;
		cr;
		nextPutAll:
				' - The Photo and Video tools require to have QuickTime installed on your computer';
		cr] ensure: [s close]
]

{ #category : #actions }
CormasPackagerForModeler >> doPackaging [
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation"
	
	super doPackaging.
	self ensureRuntimePackagerLoaded.
	self copyParcelsSources.
	self copyAndInstallVWSources.
	self changeDefaultCOMDirectory.
	self saveThenQuitImage
]

{ #category : #'initialize-release' }
CormasPackagerForModeler >> initializeChecks [
	
	super initializeChecks.
	self
		addCheckName: #haveNoCurrentModelLoaded
		description: 'have no model loaded in the current image'
		action: [:p | p currentModel isNil]
]

{ #category : #'private actions' }
CormasPackagerForModeler >> saveThenQuitImage [
	"save the image"
	
	self closeRequest.
	self mainWindow ifNotNil: [:win | win checkForEvents].
	[(Delay forSeconds: 1) wait.
	ObjectMemory
		saveAs: self targetImagePath asString
		thenQuit: true] fork
]

{ #category : #'private actions' }
CormasPackagerForModeler >> shouldBeCopiedSource: aFilename [
	"indicates if aFilename representing a source file should be copied to the target"
	
	aFilename isNil ifTrue: [^false].
	aFilename extension = '.pst' ifFalse: [^false].
	^true
]

{ #category : #accessing }
CormasPackagerForModeler >> targetRuntimeMode [
	"return the target runtimeMode (aSymbol in the Cormas availableRuntimeModes)"
	
	^#modeler
]
