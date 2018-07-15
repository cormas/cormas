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
	#category : 'Cormas-UI-Project'
}

{ #category : #'code-generation' }
CMProjectManager >> addNewClassType: aString inheritingFrom: aClass name: nameString initProtocol: initBoolean stepProtocol: stepBoolean [

	self codeGenerator 
		addNewClassType: aString 
		inheritingFrom: aClass 
		name: nameString 
		initProtocol: initBoolean 
		stepProtocol: stepBoolean 

]

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
	" Answer a <CMProjectModel> which is a Cormas model instance "

	^ self currentProject cormasModel
]

{ #category : #accessing }
CMProjectManager >> cormasModelAuthors: aString [
	" Set aString with author names (one by line) to the receiver's model "

	self currentProject cormasModelAuthors: aString
]

{ #category : #accessing }
CMProjectManager >> cormasModelClass [

	^ self currentProject cormasModelClass
]

{ #category : #accessing }
CMProjectManager >> cormasModelCreationDate: aString [

	self currentProject cormasModelCreationDate: aString

]

{ #category : #accessing }
CMProjectManager >> cormasModelEmails: aString [
	" Set aString with emails (one by line) to the receiver's model "

	self currentProject cormasModelEmails: aString
]

{ #category : #accessing }
CMProjectManager >> cormasModelName [
	" Answer a <String> which is a Cormas model name "

	^ self currentProject cormasModelName
]

{ #category : #accessing }
CMProjectManager >> cormasModelText: aString [
	" Set the receiver's model comments to aString "

	self currentProject cormasModelText: aString

]

{ #category : #accessing }
CMProjectManager >> cormasModelVersion: aString [
	" Set the receiver's model version number to aString.
	ToDo: Currently the version number format is not normalized/validated "

	self currentProject cormasModelVersion: aString

]

{ #category : #callbacks }
CMProjectManager >> cormasModels [
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ Cormas modelsPath entries collect: #basename
]

{ #category : #callbacks }
CMProjectManager >> cormasOpenLocations [
	" Answer a Collection of valid locations for opening a Cormas model "
	
	^ self cormasOpenLocationsMap keys

]

{ #category : #callbacks }
CMProjectManager >> cormasOpenLocationsMap [
	" Answer a Collection of valid locations for opening a Cormas model "

	^ Dictionary new
		at: 'Local Disk' 		put: #requestModelOpenFromLocalDisk;
		at: 'URL' 				put: #requestModelOpenFromURL;
		at: 'Local image' 		put: #requestModelOpenFromLocalImage;
		at: 'Remote image'		put: #requestModelOpenFromRemoteImage;
		yourself 
]

{ #category : #accessing }
CMProjectManager >> createClassModelNamed: modelName [
 	" Private - See delegated method implementor. Answer a new <Class> "
	
	^ self currentProject createClassModelNamed: modelName
]

{ #category : #callbacks }
CMProjectManager >> createNewProject [
	" Private - See superimplementor's comment "
	
	| answer |

	(answer := self requestMessage: self translator tNewProjectName) isEmptyOrNil 
		ifFalse: [ 
			self createAppProject: answer.
			self fsm handleEvent: #actionNew.
			(CMSpecModelComments for: self) openWithSpec ]
		ifTrue: [ self informMessage: self translator tNewProjectEmptyName ].


]

{ #category : #callbacks }
CMProjectManager >> doPostOpenActions [
	" Private - See superimplentor's comment "

	self updateNewProject: self cormasModelName.
	self fsm handleEvent: #actionOpened.
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
CMProjectManager >> openEditAttributes [

	self projectWindow openEditAttributes.
]

{ #category : #callbacks }
CMProjectManager >> openImageProject: modelName [
	" Open the project of the modelClass "

	self
		currentProject:
			(CMProjectModel basicNew
				initializeForModel: modelName asClass new named: modelName;
				yourself)
]

{ #category : #callbacks }
CMProjectManager >> openModelNamed: aString [
	" Request a file to be opened as CORMAS project "

	(FDOpenFileDialog new
		title: ('Choose st file');
		extensionFilters: 	{ 'st files' -> #(st) };
		defaultFolder:  FileLocator imageDirectory / 'Models'/ aString ;
		openModal)	
			
		ifNotNil: [ : fileRef | 
			[ fileRef readStream fileInDisplayingProgress ]
			on: Exception
			do: [ : ex | 
				self alertMessage: ex messageText. 
				openStatus := false ].
			openStatus := true.
			^ fileRef fullName ]
		ifNil: [ openStatus := false ]
]

{ #category : #callbacks }
CMProjectManager >> openProject [

	| locationName |
	locationName := self requestModelNameLocation
		ifNotNil: [ : locName | self perform: (self cormasOpenLocationsMap at: locName) ].

]

{ #category : #callbacks }
CMProjectManager >> openProject: modelName fileName: fileName [
	" Open the project named projectApp "

	| modelClass |
	modelClass := (self findModelClass: fileName) allButFirst asClass.
	self currentProject: (CMProjectModel basicNew
		fileName: fileName;
		initializeForModel: modelClass new named: modelName;
		yourself).


]

{ #category : #callbacks }
CMProjectManager >> requestModelNameLocation [
	" Open request dialog to select a load nodel location "
	
	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichOpeningLocation;
		items: self cormasOpenLocations.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
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
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| widget |
	widget := SpcListModel new.
	widget
		title: self translator tWhichModel;
		items: CormasModel subclasses.
	widget openDialogWithSpec modalRelativeTo: self currentWorld.
	^ widget selectedItem name
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

	| mName fileName |
	(mName := self requestModelOpenDialogFromLocalImage) ifNotNil: [ :modelName | openStatus := true ].
	openStatus
		ifTrue: [ self openImageProject: mName.
			self doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #callbacks }
CMProjectManager >> updateNewProject: modelName [
	" See superimplementor's comment "

	self currentProject hasCormasModelClass
		ifFalse: [ self currentProject cormasModelClass: (self createClassModelNamed: modelName).
			self currentProject cormasModel: self cormasModelClass new ].
	self cormasModelClass initialize.
	self cormasModel projectManager: self.
	super updateNewProject: modelName.
	self cormasModel timeStep:0.
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

{ #category : #utilities }
CMProjectManager >> verifyClassExist: aClassName [
	
	^ Smalltalk hasClassNamed: self cormasModelClass
]
