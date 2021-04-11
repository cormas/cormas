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
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMProjectManager >> applicationExtension [
	" See comment in #applicationExtension "

	^ self applicationClass applicationExtension  
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

	| newProject |
	
	newProject := 
		(aCMApplicationProject createProjectNamed: projectName)
			projectManager: self;
			initializeForModel: (self createClassModelNamed: projectName asValidCormasClassName) new
				named: projectName asValidCormasClassName;
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
CMProjectManager >> currentProjectHasCreationDate [
	" Answer <true> if receiver's contains a version name "

	^  self currentProject cormasModelClass respondsTo: #creationDate
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

{ #category : #defaults }
CMProjectManager >> defaultCormasOpener [
	" Answer a <Class> responsible for managing to open CORMAS projects or models "

	^ CMProjectOpener
]

{ #category : #callbacks }
CMProjectManager >> doPostCloseActions [

	self announcer unsubscribe: self currentProject.
	self fsm handleEvent: #actionClose.
	self projectWindow quitSubApplicationWindows.

	" These 3 steps are necessary because WeakAnnouncements hanging around "
	self currentProject release.
	self currentProject: nil.
	3 timesRepeat: [ Smalltalk garbageCollect ].

]

{ #category : #callbacks }
CMProjectManager >> doPostNewActions [
	" Basic post new actions. Redefine in subclasses if necessary "

	super doPostNewActions.
	(CMSpecModelComments for: self) openWithSpec.

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

{ #category : #initialization }
CMProjectManager >> initialize [
	" Set the receiver's inital state "

	super initialize.
	self applicationClass: CMApplicationProject.
	self settingsClass: CMApplicationPreferences.
	openStatus := false.

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
CMProjectManager >> openModel: aModel [
	" Open aModel for the receiver "

	^ (CMModelOpener newFrom: self) 
		openModel: aModel;
		yourself
]

{ #category : #'accessing - opening' }
CMProjectManager >> openProject [
	" Request a model to the user and open it for the receiver "

	self opener openProject
]

{ #category : #'accessing - opening' }
CMProjectManager >> openProject: aFileReferenceOrName [
	" Request a model to the user and open it for the receiver "

	self opener openProject: aFileReferenceOrName
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

{ #category : #accessing }
CMProjectManager >> resourceLocator [ 
	" Answer a <CMResourceLocator>, an object to locate receiver resources "

	^ self application resourceLocator
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
CMProjectManager >> updateStateCormasUI [
	" Private - If there is a window for the receiver then update its status "

	self projectWindow ifNotNil: [ : w |
		w
			menuDisableProgrammingGroup;
			menuDisableVisualizationGroup;
			menuDisableSimulationGroup;
			menuDisableToolsGroup;
			menuDisableHelpGroup ]
]

{ #category : #callbacks }
CMProjectManager >> updateStateInit [
	" Private - Handle the open application event "

	super updateStateInit.
	self updateStateCormasUI.
]

{ #category : #callbacks }
CMProjectManager >> updateStateNew [

	self notifyEvent:	'Action: New'.
	self announcer announce: CMProjectNewAnnouncement new.
	self informMessage: self translator tProjectNewSuccess.
]

{ #category : #callbacks }
CMProjectManager >> updateStateOpened [
	" Private - This callback evaluate after the handleEvent: was fired "

	self notifyEvent:	'Action: Opened'.
	self announcer announce: CMProjectOpenAnnouncement new.
	CMApplicationPreferences settingProjectNotifications 
		ifTrue: [ self informMessage: self translator tProjectOpenSuccess ].
]

{ #category : #utilities }
CMProjectManager >> verifyClassExist: aClassName [
	
	^ Smalltalk hasClassNamed: self cormasModelClass
]
