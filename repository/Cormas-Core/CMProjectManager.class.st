"
Controller between the UI classes and CMProjectModel.

Example expressions:

CMProjectManager new openProject.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

openStatus 		<Boolean> 	<true> if receiver's model file was opened successfully, <false> otherwise
"
Class {
	#name : #CMProjectManager,
	#superclass : #PFProjectManager,
	#instVars : [
		'openStatus',
		'currentModelPath',
		'opener'
	],
	#category : #'Cormas-Core-Project'
}

{ #category : #accessing }
CMProjectManager >> applicationClass [

	^ CMApplicationProject
]

{ #category : #accessing }
CMProjectManager >> applicationExtension [
	" See comment in #applicationExtension "

	^ self applicationClass applicationExtension  
]

{ #category : #callbacks }
CMProjectManager >> cleanEnvironment [
	" These 3 steps are necessary because WeakAnnouncements hanging around "

	3 timesRepeat: [ Smalltalk garbageCollect ].
]

{ #category : #callbacks }
CMProjectManager >> closeProject [
	" Close the current opened project. Answer <true> if project was closed, <false> otherwise "

	self hasProject ifTrue: [ self doPostCloseActions ].
	^ true

]

{ #category : #'code-generation' }
CMProjectManager >> codeGenerator [
	" Answer the receiver's Code Generator "
	
	^ self currentProject codeGenerator
]

{ #category : #accessing }
CMProjectManager >> cormasModel [
	" Answer a <CMAbstractModel> which is a Cormas model instance "

	^ self currentProject cormasModel
]

{ #category : #accessing }
CMProjectManager >> cormasModel: aCMAbstractModel [
	" Set aCMAbstractModel which is a Cormas model instance "

	self currentProject cormasModel: aCMAbstractModel
]

{ #category : #accessing }
CMProjectManager >> cormasModelAuthors [
	" Answer a <Collection> with author names (one by line) to the receiver's current project model "

	^ self currentProject cormasModelAuthors
]

{ #category : #accessing }
CMProjectManager >> cormasModelAuthors: aString [
	" Set aString with author names (one by line) to the receiver's current project model "

	self currentProject cormasModelAuthors: aString
]

{ #category : #accessing }
CMProjectManager >> cormasModelClass [
	" Answer a <Class> representing the model class of the receiver's current project "

	^ self currentProject cormasModelClass
]

{ #category : #accessing }
CMProjectManager >> cormasModelComment [
	" Set the receiver's model comments to aString "

	^ self currentProject cormasModelComment

]

{ #category : #accessing }
CMProjectManager >> cormasModelComment: aString [
	" Set the receiver's model comments to aString "

	self currentProject cormasModelComment: aString

]

{ #category : #accessing }
CMProjectManager >> cormasModelCreationDate: aString [

	self currentProject cormasModelCreationDate: aString

]

{ #category : #accessing }
CMProjectManager >> cormasModelName [
	" Answer a <String> which is a Cormas model name "

	^ self currentProject cormasModelName
]

{ #category : #accessing }
CMProjectManager >> cormasModelVersion: aString [
	" Set the receiver's model version number to aString.
	ToDo: Currently the version number format is not normalized/validated "

	self currentProject cormasModelVersion: aString

]

{ #category : #accessing }
CMProjectManager >> cormasModels [
	" Answer a <Collection> of <String> with the application available models "
	
	^ self application modelNames
]

{ #category : #accessing }
CMProjectManager >> cormasProjectName [
	" Answer a <String> which is a Cormas model name "

	^ self currentProject userProvidedName
]

{ #category : #callbacks }
CMProjectManager >> cormasRepository [
	" See comment in CMApplicationProject "

	^ CMApplicationProject cormasRepository
]

{ #category : #accessing }
CMProjectManager >> createClassModelNamed: modelName [
 	" Private - See delegated method implementor. Answer a new <Class> "
	
	^ self currentProject createClassModelNamed: modelName
]

{ #category : #callbacks }
CMProjectManager >> createNewProject [
	" Ask for a new project name and create it if valid name was provided "

	| answer |

	(answer := self requestedInvalidProjectName: self translator tNewProjectName) value
		ifTrue: [ self informMessage: self translator tNewProjectInvalidName ]
		ifFalse: [
			self createAppProject: answer key.
			self doPostNewActions ]

]

{ #category : #callbacks }
CMProjectManager >> createProject: projectName in: aCMApplicationProject [

	| newProject newModel |
	
	newProject := aCMApplicationProject createProjectNamed: projectName.
	newModel := (self createClassModelNamed: (projectName asValidCormasClassName: self cormasProjectName)) new.
	newProject
		projectManager: self;
		initializeForModel: newModel;
		yourself.
	aCMApplicationProject currentProject: newProject.
	self updateNewProject: projectName.
	self fsm handleEvent: #actionNew.

]

{ #category : #accessing }
CMProjectManager >> currentProjectAuthors [
	" Answer a <String> containing receiver's project authors, opposed to model authors "

	^ self currentProject cormasModelClass cmAuthors

]

{ #category : #accessing }
CMProjectManager >> currentProjectAuthors: aString [
	" Set a <String> containing receiver's project authors, opposed to model authors "

	^ self currentProject currentProjectAuthors: aString

]

{ #category : #accessing }
CMProjectManager >> currentProjectHasAuthor [
	" Answer <true> if the receiver's model has authors "

	^ self currentProject cormasModelAuthors notNil and: [ self currentProject cormasModelAuthors notEmpty ]
]

{ #category : #testing }
CMProjectManager >> currentProjectHasComments [
	" Answer <true> if the receiver's model has comments "

	^ self currentProject cormasModelClass respondsTo: #comments
]

{ #category : #testing }
CMProjectManager >> currentProjectHasControlMethods [
	" Answer <true> if receiver's model contains at least one initialization method "

	^  self modelControlInitMethods notEmpty
]

{ #category : #testing }
CMProjectManager >> currentProjectHasCreationDate [
	" Answer <true> if receiver's contains a version name "

	^  self currentProject cormasModelClass respondsTo: #creationDate
]

{ #category : #testing }
CMProjectManager >> currentProjectHasInitMethods [
	" Answer <true> if receiver's model contains at least one initialization method "

	^  self modelInitMethods notEmpty
]

{ #category : #testing }
CMProjectManager >> currentProjectHasVersion [
	" Answer <true> if receiver's contains a version name "

	^  self currentProject cormasModelClass respondsTo: #cmVersion
]

{ #category : #accessing }
CMProjectManager >> currentProjectVersion [
	" Answer a <String> containing receiver's current version name. If no version is found, answer a descriptive string reflecting the situation (i.e. 'no version') "

	^ [ self currentProject cormasModelClass cmVersion ]
	on: MessageNotUnderstood 
	do: [ : ex | self translator tNoVersion ]

]

{ #category : #callbacks }
CMProjectManager >> deleteProject [
	" Private - Delete the current project from this system and unset its references "

	self currentProject ifNotNil: [ 
		(RGContainer packageOfClass: self cormasModelClass) 
			ifNotNil: [ : rgObject | rgObject realPackage removeFromSystem ] ].
	self currentProject release.
	self currentProject: nil.
]

{ #category : #callbacks }
CMProjectManager >> doPostCloseActions [
	" Private - See superimplementor's comment "

	self flag: #toReview.
	Cursor wait showWhile: [
		self cormasRepository ifNotNil: [ : cormasRepo |
			| icePackage |
			icePackage := IcePackage named: self cormasModelClass package name repository: cormasRepo.
			self announcer unsubscribe: self currentProject.
			[ self fsm handleEvent: #actionClose ] on: SsEventNotSupposed do: [: ex | self inform: 'CORMAS project was not cleanly closed' ].
			self deleteProject.	
			self cleanEnvironment.
			" This seems to be not necessary anymore. It was included because at some point 
			closing projects also unloaded the Iceberg package, making it unavailable for
			re-opening again "
			"(RPackageOrganizer default includesPackageNamed: icePackage package)
				ifTrue: [ self reloadProject: icePackage repository: cormasRepo ]" ] ].
]

{ #category : #callbacks }
CMProjectManager >> exploreProject [

	self flag: #toBeReviewed.
	self currentProject explore.
]

{ #category : #utilities }
CMProjectManager >> findModelClass: aFilename [
	" Answer a <String> with the model class name found in aFilename"
 
	| ckDecl |
	self flag: #toReview.
	ckDecl := ((ChunkFileFormatParser for: aFilename asFileReference readStream) parseChunks
		select: [ : c | c isDoItDeclaration and: [ c contents beginsWith: 'CormasModel subclass:' ] ]) anyOne.
	^ ckDecl contents substrings third
		
]

{ #category : #accessing }
CMProjectManager >> gitBridge [ 
	" Answer a <CMResourceLocator>, an object to locate receiver resources "

	^ self application gitBridge
]

{ #category : #initialization }
CMProjectManager >> initialize [
	" Set the receiver's inital state "

	super initialize.
	self applicationClass: CMApplicationProject.
	openStatus := false.

]

{ #category : #testing }
CMProjectManager >> isValidCormasEntityName: aString [ 
	" Answer <true> if aString is a valid name for an entity in the context of CORMAS "
	
	^ (self class environment hasClassNamed: (aString asValidCormasClassName: self cormasProjectName)) not
]

{ #category : #accessing }
CMProjectManager >> modelControlInitMethods [
	" Answer a <Collection> of <String> with CORMAS model control selectors "
	
	^ (self cormasModelClass organization listAtCategoryNamed: #control) collect: #asString
]

{ #category : #accessing }
CMProjectManager >> modelInitMethods [
	" Answer a <Collection> of <String> with CORMAS model initialization selectors "

	^ (self cormasModelClass organization listAtCategoryNamed: #init) collect: #asString
]

{ #category : #accessing }
CMProjectManager >> modelProbesMethods [
	" Answer a <Collection> of <String> with CORMAS model probes selectors "

	^ (self cormasModelClass organization listAtCategoryNamed: #probes) collect: [:aGlobalProbeName | 'Global>>', aGlobalProbeName asString]
]

{ #category : #'accessing - opening' }
CMProjectManager >> openProject [
	" Request a model to the user and open it for the receiver "

	self opener 
		projectManager: self;
		openProject
]

{ #category : #'accessing - opening' }
CMProjectManager >> openProject: aFileReferenceOrModel [
	" Request a model to the user and open it for the receiver "

	self hasProject
		ifTrue: [ self doPostCloseActions ]. 
	self opener openProject: aFileReferenceOrModel
]

{ #category : #'accessing - opening' }
CMProjectManager >> opener [
	^ opener
		ifNil: [ opener := self defaultCormasOpener new ]
]

{ #category : #'accessing - opening' }
CMProjectManager >> opener: anObject [
	opener := anObject
]

{ #category : #accessing }
CMProjectManager >> projectClass [

	^ CMProjectModel
]

{ #category : #callbacks }
CMProjectManager >> querySaveProject [
	" Private - Request saving project if there are unsaved changes "

	" If the project is broken, e.g. development tasks, then we don't want to save anything "
	self currentProject ifNil:[ ^ false ]. 
	(self currentProject requiresSaving and: [ self confirm: self translator tQuerySaveProject ])
		ifTrue: [ self saveProject ].
]

{ #category : #initialization }
CMProjectManager >> release [

	self 
		fsm: nil;
		opener: nil;
		settingsClass: nil;
		applicationClass: nil.
	super release.
]

{ #category : #callbacks }
CMProjectManager >> reloadProject: icePackage repository: anIceRepository [

	IceTipStandardAction new 
		repository: anIceRepository;
		message: ('Loading package {1}' format: { icePackage name });
		onSuccessRepositoryModified;
		execute: [ 
			icePackage name = #_UnpackagedPackage
				ifFalse: [ 
					Iceberg announcer
						suspendAllForRepository: anIceRepository
						while: [ icePackage load ] ] ].
	Iceberg announcer announce: (IceRepositoryModified for: anIceRepository)

]

{ #category : #callbacks }
CMProjectManager >> resubscribeUIEvents [
	" Patch: Subscriptions lost after closing a project. Reinitialize "

	| uiWindowClass |
	self flag: #toReview.
	uiWindowClass := self classFor: #CMSpecProjectWindow.
	(self announcer subscriptionsForClass: uiWindowClass)
		ifEmpty: [ uiWindowClass allInstancesDo: [ : w | w initializeSubscriptions ] ].
]

{ #category : #callbacks }
CMProjectManager >> updateNewProject: modelName [
	" See superimplementor's comment "

	self currentProject hasCormasModelClass
		ifFalse: [ self currentProject cormasModelClass: (self createClassModelNamed: modelName) ].
	self currentProject cormasModel: self cormasModelClass new.
	self cormasModelClass initialize.
	self cormasModel projectManager: self.
	self cormasModel timeStep: 0.
]

{ #category : #callbacks }
CMProjectManager >> updateStateClosed [
	" Private - Setup an announcement with information related with closing a project. 
	If the project is broken, we configure a temporary file. "
	
	| fileName |

	self notifyEvent:	'Action: Close'.
	fileName := self currentProject 
		ifNil: [ FileReference newTempFilePrefix: 'invalid-cormas-project' suffix: '' ] 
		ifNotNil: [ self currentProject fileName ]. 
	self announcer announce: 
		(PFCloseProject new 
			projectName: self currentProjectName;
			projectLocation: fileName;
			yourself).

]

{ #category : #callbacks }
CMProjectManager >> updateStateOpened [
	" Private - This callback evaluate after the handleEvent: was fired "

	self notifyEvent:	'Action: Opened'.
	self resubscribeUIEvents.	
	self announcer announce: PFOpenedProject new.
]

{ #category : #utilities }
CMProjectManager >> verifyClassExist: aClassName [
	
	^ Smalltalk hasClassNamed: self cormasModelClass
]
