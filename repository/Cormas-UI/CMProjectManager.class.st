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
		'currentModelPath'
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
CMProjectManager >> cormasOpenLocations [
	" Answer a Collection of valid locations for opening a Cormas model "
	
	^ self cormasOpenLocationsMap keys

]

{ #category : #accessing }
CMProjectManager >> cormasOpenLocationsMap [
	" Answer a Collection of valid locations for opening a Cormas model "

	^ Dictionary new
		at: self translator tLocalStorage 		put: #requestModelOpenFromLocalDisk;
		at: 'URL' 										put: #requestModelOpenFromURL;
		at: self translator tLocalImage			put: #requestModelOpenFromLocalImage;
		at: self translator tRemoteImage 			put: #requestModelOpenFromRemoteImage;
		yourself 
]

{ #category : #accessing }
CMProjectManager >> createClassModelNamed: modelName [
 	" Private - See delegated method implementor. Answer a new <Class> "
	
	^ self currentProject createClassModelNamed: modelName
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

{ #category : #testing }
CMProjectManager >> currentProjectAuthors [
	" Answer a <String> containing receiver's model authors "

	^ self currentProject cormasModelClass cmAuthors

]

{ #category : #accessing }
CMProjectManager >> currentProjectHasAuthor [
	" Answer <true> if the receiver's model has comments "

	^ self currentProject cormasModelClass respondsTo: #cmAuthors
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

{ #category : #testing }
CMProjectManager >> currentProjectVersion [
	" Answer a <String> containing receiver's current version name. If no version is found, answer a descriptive string reflecting the situation (i.e. 'no version') "

	^ [ self currentProject cormasModelClass cmVersion ]
	on: MessageNotUnderstood 
	do: [ : ex | self translator tNoVersion ]

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

{ #category : #private }
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

{ #category : #callbacks }
CMProjectManager >> openImageProject: modelName [
	" Open the project of the modelClass "

	self currentProject: (CMProjectModel basicNew
		projectManager: self;
		initializeForModel: (self class environment at: modelName) new
			named: modelName;
			yourself)
]

{ #category : #callbacks }
CMProjectManager >> openModelNamed: aString [
	" Request a file to be opened as CORMAS project "

	(FDOpenFileDialog new
		title: 'Choose st file';
		extensionFilters: 	{ 'st files' -> #(st) };
		defaultFolder: self resourceLocator modelsPath;
		openModal)	
			
		ifNotNil: [ : fileRef | 
			[ fileRef readStream fileInDisplayingProgress ]
			on: Exception
			do: [ : ex | 
				self alertMessage: ex asString. 
				openStatus := false ].
			openStatus := true.
			^ fileRef fullName ]
		ifNil: [ openStatus := false ]
]

{ #category : #callbacks }
CMProjectManager >> openProject [
	" Request a model to the user and open it for the receiver "

	self requestModelNameLocation ifNotNil: [ : locName | 
		self perform: (self cormasOpenLocationsMap at: locName) ].

]

{ #category : #callbacks }
CMProjectManager >> openProject: modelName fileName: fileName [
	" Open the project named projectApp "

	| modelClass |
	modelClass := self class environment at: (self findModelClass: fileName) allButFirst asSymbol.
	self currentProject:
		(CMProjectModel basicNew
			fileName: fileName;
			initializeForModel: modelClass new named: modelName;
			yourself)

]

{ #category : #accessing }
CMProjectManager >> projectClass [

	^ CMProjectModel
]

{ #category : #callbacks }
CMProjectManager >> requestModelNameLocation [
	" Open request dialog to select a load model location "
	
	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichOpeningLocation;
		items: self cormasOpenLocations.
	widget openDialogWithSpec 
		cancelAction: [ widget selectItem: nil ];	
		modalRelativeTo: self currentWorld.
	^ widget selectedItem		
		
]

{ #category : #callbacks }
CMProjectManager >> requestModelOpenDialogFromLocalDisk [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichModel;
		items: self cormasModels.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem
]

{ #category : #callbacks }
CMProjectManager >> requestModelOpenDialogFromLocalImage [
	" Open a Cormas model. Answer a <String> with the project name it it was opened successfully, nil otherwise "

	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichModel;
		items: CMAbstractModel subclasses.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem 
		ifNotNil: [ : selection | selection name ]
		ifNil: [ widget selectedItem ]
]

{ #category : #callbacks }
CMProjectManager >> requestModelOpenFromLocalDisk [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName fileName |
	(mName := self requestModelOpenDialogFromLocalDisk)
		ifNotNil: [ :modelName | fileName := self openModelNamed: modelName ].
	openStatus
		ifTrue: [ self openProject: mName fileName: fileName.
			self doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #callbacks }
CMProjectManager >> requestModelOpenFromLocalImage [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName |
	
	openStatus := false.
	(mName := self requestModelOpenDialogFromLocalImage) ifNotNil: [ :modelName | openStatus := true ].
	openStatus
		ifTrue: [ 
			self openImageProject: mName.
			self doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #accessing }
CMProjectManager >> resourceLocator [ 
	" Answer the receiver's <CMResourceLocator>, an object to locate resources "

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
CMProjectManager >> updateStateInit [
	" Private - Handle the open application event "

	super updateStateInit.
	self projectWindow
		menuDisableProgrammingGroup;
		menuDisableVisualizationGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableHelpGroup.
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
	self informMessage: self translator tProjectOpenSuccess.
]

{ #category : #utilities }
CMProjectManager >> verifyClassExist: aClassName [
	
	^ Smalltalk hasClassNamed: self cormasModelClass
]
