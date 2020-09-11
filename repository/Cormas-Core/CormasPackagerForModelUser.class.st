"
The specialized CormasPackager class for a model user packaging (installation for model users)
"
Class {
	#name : #CormasPackagerForModelUser,
	#superclass : #CormasPackager,
	#category : 'Cormas-Core-Others'
}

{ #category : #resources }
CormasPackagerForModelUser class >> launchPackagingLabel [
	"redefines this method in order to chenge the button label"
	
	^'Package a model user installation'
]

{ #category : #'description accessing' }
CormasPackagerForModelUser class >> targetPublic [
	"return the public used in the description"
	
	^'model users'
]

{ #category : #resources }
CormasPackagerForModelUser class >> windowTitle [
	
	^super windowTitle , 'Model user packaging'
]

{ #category : #actions }
CormasPackagerForModelUser >> changeDefaultCOMDirectory [
	"change the default COM directory (checked at startup in a dev image)"
	
	COMSessionManager defaultCOMDirectoryName: '.'
]

{ #category : #accessing }
CormasPackagerForModelUser >> computeDefaultTargetFile [
	"the complete path to the generated exe (directory + imageName + .exe) as a Filename"
	
	| dirName fileName |
	self currentModel
		ifNil:
			[dirName := 'model-version-user'.
			fileName := 'model-version-user.exe']
		ifNotNil:
			[:m | 
			dirName := '<1s>-<2s>'
				expandMacrosWith: m name
				with: m versionName.
			fileName := '<2s>.exe'
				expandMacrosWith: m name
				with: m versionName].
	^self basePackagingDirectory \ dirName \ fileName
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> copyModelFiles [
	
	| target pcl pclFile pstFile targetModelPath modelDirectoryTarget |
	target := self packagingDirectory \ Cormas modelsPath tail.
	target ensureDirectory.
	targetModelPath := Cormas modelPath: self currentModel name.
	self
		recursiveCopy: targetModelPath
		to: target
		matching: [:fn | self shouldBeCopied: fn].
	modelDirectoryTarget := target construct: self currentModel name.
	pcl := (Parcel parcelsDefiningClass: self currentModel) any.
	pclFile := pcl parcelFilename asFilename.
	pclFile copyTo: modelDirectoryTarget \ pclFile tail.
	pstFile := self pstFileFrom: pclFile.
	pstFile copyTo: modelDirectoryTarget \ pstFile tail.
	self redirectSourceFileFor: pcl to: pstFile
]

{ #category : #private }
CormasPackagerForModelUser >> createReadmeFile [
	"create a readme file"
	
	| s |
	s := (self packagingDirectory \ 'readme.txt') writeStream.
	[s
		nextPutAll: 'Please, note the following :';
		cr;
		cr;
		nextPutAll: ' - This is a packaged version of Cormas for the Model ';
		nextPutAll: self currentModel name;
		cr;
		cr;
		nextPutAll:
				' - The Photo and Video tools require to have QuickTime installed on your computer';
		cr] ensure: [s close]
]

{ #category : #actions }
CormasPackagerForModelUser >> doPackaging [
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation"
	
	super doPackaging.
	self openAndPlaceSimulationGUI.
	self rebuildMainMenu.
	self copyModelFiles.
	self disableComServerExamples.	"self createRuntimePackager.
	self installPatchRes94469."
	self installNotifierChanges.	"self configurePackager."	"self executePackager"
	self suppressEmergencyEvaluator.
	self suppressVisualLauncherShortcut.
	self changeDefaultCOMDirectory.
	self saveThenQuitImage
]

{ #category : #accessing }
CormasPackagerForModelUser >> extraParcelsNamesToUnload [
	"return the parcel names that should be unloaded before packaging"
	
	^#()	"'SUnitUI'
'SUnit'
'StoreForPostgreSQL'
'AutoComplete'
'ExtraEmphases'
'Headless'
'Compression-ZLib'
'PostgreSQLEXDI'
'AT Parser Compiler'"
]

{ #category : #'initialize-release' }
CormasPackagerForModelUser >> initializeChecks [
	
	super initializeChecks.
	self
		addCheckName: #haveACurrentModelLoaded
		description: 'have a model loaded in the current image'
		action: [:p | p currentModel notNil]
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> openAndPlaceSimulationGUI [
	"open the simulation interface if needed then place it below the main window"
	
	Cormas current mainWin moveTo: 15 @ 35.
	Cormas current ensureSimulationGUIisOpen
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> pstFileFrom: aParcelFilename [
	"return the pst file associated to aParcelFilename"
	
	| s |
	s := WriteStream with: aParcelFilename asString.
	s setToEnd.
	s skip: -3.
	s nextPutAll: 'pst'.
	^s contents asFilename
]

{ #category : #actions }
CormasPackagerForModelUser >> rebuildMainMenu [
	
	Cormas current rebuildMenu
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> redirectSourceFileFor: aParcel to: aFilename [
	"redirect the source for the aParcel to a relative path to aFilename
	Models\MyModel\MyModel.pcl"
	
	| aStream sourceIndex |
	aStream := String new writeStream.
	aStream
		nextPutAll: aFilename directory directory tail;
		nextPut: $\;
		nextPutAll: aFilename directory tail;
		nextPut: $\;
		nextPutAll: aFilename tail.
	sourceIndex := aParcel propertyAt: #sourceIndex.
	SourceFileManager default
		file: sourceIndex
		name: aStream contents
		writable: false
]

{ #category : #actions }
CormasPackagerForModelUser >> saveThenQuitImage [
	"save the image"
	
	self closeRequest.
	self mainWindow ifNotNil: [:win | win checkForEvents].
	[(Delay forSeconds: 1) wait.
	ObjectMemory
		saveAs: self targetImagePath asString
		thenQuit: true] fork
]

{ #category : #actions }
CormasPackagerForModelUser >> shouldLeaveOpened: aController [
	"indicate if aController controls a window that should be leave in the installation image
	We leave the actual simulationWin opened"
	
	Cormas current simulationWin
		ifNotNil: [:win | win controller == aController ifTrue: [^true]].
	^super shouldLeaveOpened: aController
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> suppressEmergencyEvaluator [
	"Suppress the emergency evaluator"
	
	InputState interruptKeyValue: (Character value: 0)
]

{ #category : #'private actions' }
CormasPackagerForModelUser >> suppressVisualLauncherShortcut [
	"Suppress the VisualLauncher shortcut"
	
	InputState warpToLauncherKey: -1
]

{ #category : #accessing }
CormasPackagerForModelUser >> targetRuntimeMode [
	"return the target runtimeMode (aSymbol in the Cormas availableRuntimeModes)"
	
	^#modelUser
]
