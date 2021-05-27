"
Implements behavior of VW's Cormas class

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMProjectModel,
	#superclass : #PFProjectBase,
	#instVars : [
		'cormasModel',
		'cormasModelClass',
		'codeGenerator',
		'cormasVersion',
		'tracker'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #'instance creation' }
CMProjectModel class >> for: aCormasModel [
	" Answer a new instance of the receiver configured for aCormasModel "
	^ self new initializeForModel: aCormasModel 
]

{ #category : #'instance creation' }
CMProjectModel class >> for: aCormasModel named: aString [
	" Answer a new instance of the receiver configured for aCormasModel "
	^ self basicNew 
		initializeForModel: aCormasModel 
		named: aString
]

{ #category : #'instance creation' }
CMProjectModel class >> forMetadata: metadataDictionary [
	" Answer a new instance of the receiver filled with metadaDictionary "
	
	^ self basicNew 
		version: (metadataDictionary at: #Version);
		userProvidedName: (metadataDictionary at: #Name);
		authors: (metadataDictionary at: #Authors);
		creationDate: (metadataDictionary at: #CreationDate);
		demo: (metadataDictionary at: #Demo);

		cormasModelComment: (metadataDictionary at: #Comments);
		cormasVersion: (metadataDictionary at: #'CORMAS version');
		cormasModelVersion: (metadataDictionary at: #Version);

		relatedProjects: (metadataDictionary at: #'Related projects');
		osVersion: (metadataDictionary at: #'OS version');
		stars: (metadataDictionary at: #Stars);
		valid: (metadataDictionary at: #Valid);
		language: (metadataDictionary at: #Language);
		yourself
		
]

{ #category : #'instance creation' }
CMProjectModel class >> forModel: aCormasModel [
	" Answer a new instance of the receiver configured for aCormasModel "
	^ self basicNew 
		initializeForModel: aCormasModel 
		named: aCormasModel friendlyName
]

{ #category : #'instance creation' }
CMProjectModel class >> forProjectFile: aCormasProjectFileReference [
	" Answer a new instance of the receiver filled with metadaDictionary "
	
	^ self basicNew 
		yourself
		
]

{ #category : #accessing }
CMProjectModel class >> projectFileExtension [
	" Answer a <String> with the receiver's file extension "

	^ CMApplicationProject applicationExtension
]

{ #category : #callbacks }
CMProjectModel >> abstractEntity: aCMEntityAnnouncement [ 
	" Specialize the entity class in aCMEntityAnnouncement "

	self codeGenerator targetClass: aCMEntityAnnouncement entityName.
	aCMEntityAnnouncement isAbstract 
		ifTrue: [ self codeGenerator installAbstractMethod ]
		ifFalse: [ self codeGenerator installConcreteMethod ]

]

{ #category : #callbacks }
CMProjectModel >> addNewEntity: aCMEntityNewAnnouncement [ 
	" Add a new entity to the receiver "
	
	self codeGenerator 
		targetClass: self cormasModelClass;
		targetClassCategory: self cormasModelClass category;
		addNewClassType: aCMEntityNewAnnouncement type
		inheritingFrom: aCMEntityNewAnnouncement superclass
		name: aCMEntityNewAnnouncement entityName
		initProtocol: false 
		stepProtocol: false
]

{ #category : #accessing }
CMProjectModel >> asCormasProjectModelForPreview [

	^ self
]

{ #category : #'accessing - names' }
CMProjectModel >> asCormasProjectName [
	" Answer a <String> with the receiver's name, does not assume a Cormas model already present "

	^ self friendlyName
]

{ #category : #accessing }
CMProjectModel >> codeGenerator [
	" Answer a code generator binding a reference to the receiver model "

	^ codeGenerator
		ifNil: [ codeGenerator := CGStCormas for: self ]

]

{ #category : #accessing }
CMProjectModel >> codeGenerator: anObject [
	codeGenerator := anObject
]

{ #category : #accessing }
CMProjectModel >> cormasDemoImage [
	" Answer a <Morph> demo image for the CORMAS project represented by the receiver "
	" So far demo images for in-image models are not supported "

	^ CMModelOpener cormasDemoImage 
]

{ #category : #accessing }
CMProjectModel >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CMProjectModel >> cormasModel: aCormasModel [
	" Set the receiver's model to be aCormasModel "

	cormasModel := aCormasModel
]

{ #category : #accessing }
CMProjectModel >> cormasModelAuthors [
	" See comment in CMProjectManager>>cormasModelAuthors "

	^ self authors

]

{ #category : #accessing }
CMProjectModel >> cormasModelAuthors: aCollection [ 
	" See comment in CMProjectManager>>cormasModelAuthors: "

	self authors: aCollection

]

{ #category : #accessing }
CMProjectModel >> cormasModelClass [
	" Answer the receiver's model, a subclass of <CMAbstractModel> "

	^ cormasModelClass
		ifNil: [ cormasModelClass := self createClassModelNamed: self defaultStdCormasModelName ]
]

{ #category : #accessing }
CMProjectModel >> cormasModelClass: aClass [
	" Set the receiver's model class to be aClass "

	cormasModelClass := aClass
]

{ #category : #accessing }
CMProjectModel >> cormasModelClasses [
	" Answer a <Collection> with the receiver's model classes "

	^ self cormasModelClass package classes

]

{ #category : #accessing }
CMProjectModel >> cormasModelComment [
	" Answer a <String> with the receiver's comments "

	^ self info comment

]

{ #category : #accessing }
CMProjectModel >> cormasModelComment: aString [ 
	" Set a free text aString to the receiver's comments "

	self info comment: aString

]

{ #category : #accessing }
CMProjectModel >> cormasModelCreationDate: aString [ 

	self codeGenerator
		generateMethod: aString 
		selector: #creationDate 
		inClass: self cormasModelClass class.


]

{ #category : #'accessing - names' }
CMProjectModel >> cormasModelName [
	" Answer a <String> with the receiver's CORMAS model name "

	^ self cormasModelClass cormasModelName
]

{ #category : #accessing }
CMProjectModel >> cormasModelVersion: aString [ 
	" See comment in #version: "

	self version: aString 

]

{ #category : #accessing }
CMProjectModel >> cormasVersion [
	^ cormasVersion
]

{ #category : #accessing }
CMProjectModel >> cormasVersion: aString [ 
	" Set the CORMAS version used to create the receiver. This is the minimum version compatible "

	cormasVersion :=  aString 

]

{ #category : #accessing }
CMProjectModel >> createClassModelNamed: modelName [
	" Generate a new class named modelName. modelName should be in the format CMXXXModel. See defaultCormasModelName for details.
	Answer the new generated <Class> "
	
	| validClassName |
	
	validClassName := self validateCormasModelName: modelName.
	self codeGenerator
		targetClassCategory: self defaultStdCormasCategoryName;
		targetClass: validClassName;
		generateClassNamed: validClassName 
		superclass: CMAbstractModel.
	self codeGenerator generateMethods.
	^ Smalltalk at: validClassName asSymbol
]

{ #category : #defaults }
CMProjectModel >> defaultCormasModelName [
	" Answer a default model <String> name for unnamed model's creation case "

	^ 'Unnamed'
]

{ #category : #defaults }
CMProjectModel >> defaultProjectManager [
	" Private - See superimplementor's comment "

	^ CMProjectManager new
]

{ #category : #defaults }
CMProjectModel >> defaultStdCormasCategoryName [
	" Answer a <String> in the format CMXXXModel where XXX is the user provided name of the receiver's model "
	
	^ String streamContents: [ : stream |
			stream
				<< 'Cormas-Model-';
				<< self userProvidedName ]
]

{ #category : #defaults }
CMProjectModel >> defaultStdCormasModelName [
	" Answer a <String> in the format CMXXXModel where XXX is the user provided name of the receiver's model "
	
	^ String streamContents: [ : stream |
			stream
				<< 'CM';
				<< self userProvidedName;
				<< 'Model' ]
]

{ #category : #accessing }
CMProjectModel >> definedCormasVersions [
	" For now we return a CMProjectModel but we should support versions "

	^ Array with: self
]

{ #category : #'accessing - simulations' }
CMProjectModel >> findSimulationNamed: aName [
	" Answer <true> if the dump folder has stored simulations "

	^ self storedSimulations detect: [ : simName | simName = aName ]

]

{ #category : #'accessing - names' }
CMProjectModel >> friendlyName [
	^ self cormasModel friendlyName.
]

{ #category : #testing }
CMProjectModel >> hasCormasModelClass [
	" Answer <true> if receiver has configured a Cormas model "
	
	^ self cormasModelClass notNil
]

{ #category : #testing }
CMProjectModel >> hasStoredSimulations [
	" Answer <true> if the receiver has a project opened and the project's dump folder has stored simulations, <false> otherwise "

	^ self storedSimulations notEmpty
]

{ #category : #accessing }
CMProjectModel >> info [
	" Answer an instance of <PFProjectInformation> "

	^ info
		ifNil: [ 
			info := PFProjectInformation 
				named: self defaultCormasModelName
				project: self. ]
]

{ #category : #accessing }
CMProjectModel >> infoDictionary [

	^ OrderedDictionary newFromPairs: { 
		'Name' . self info infoName .
		'Version' . self versionString .
		'Author' . self authorName .
		'Creation date' . self history creationDateAsString .
		'Is demo' . self demo asString .
		'Full name' . self info fullFilename .
		'OS version' . self osVersion .
		'Language' . self language .
		'Comments' . self cormasModelComment }
]

{ #category : #'initialize - release' }
CMProjectModel >> initializeEvents [

	self projectAnnouncer
		when: CMEntityNewAnnouncement
		send: #addNewEntity:
		to: self.
	self projectAnnouncer
		when: CMEntityRemoveAnnouncement
		send: #removeEntity:
		to: self.
	self projectAnnouncer 
		when: CMEntityRenameAnnouncement 
		send: #renameEntity:
		to: self.
	self projectAnnouncer 
		when: CMEntitySpecializeAnnouncement 
		send: #specializeEntity:
		to: self.
	self projectAnnouncer 
		when: CMEntityAbstractAnnouncement 
		send: #abstractEntity:
		to: self.
]

{ #category : #'initialize - release' }
CMProjectModel >> initializeForModel: aCormasModel [
	" Private - Set up the cormas model for the receiver "

	self cormasModel: aCormasModel.
	self cormasModelClass: aCormasModel class.
	self initializeEvents.

]

{ #category : #'initialize - release' }
CMProjectModel >> initializeForModel: aCormasModel named: aString [
	" Private - Set up the cormas model for the receiver with name aString "

	self initializeNamed: aString.
	self cormasModel: aCormasModel.
	self cormasModelClass: aCormasModel class.
	self cormasModel projectManager: self projectManager.
	self initializeEvents.

]

{ #category : #testing }
CMProjectModel >> isModified [
	" See superimplementor's comment "
	
	| opener |
	
	self projectManager currentProjectFileReference ifNil: [ ^ true ].
	opener := CMProjectOpener newFrom: self projectManager.
	opener tryReadSourceFromProject openStatus
		ifFalse: [ self error: 'Error while reading project from file' ].
	self tracker track: opener readStream.
	^ (self tracker equalToCurrent: self cormasModelClasses) not
]

{ #category : #accessing }
CMProjectModel >> modelComment [
	^ self info comment
]

{ #category : #accessing }
CMProjectModel >> passiveClasses [
	" Answer a <Collection> with the receiver's model passive classes "
	
	^ self cormasModelClass passiveClasses
]

{ #category : #printing }
CMProjectModel >> printOn: aStream [
	" Private - See superimplementor's comment "

	aStream 
		nextPutAll: 'Cormas Project: '.
	info ifNotNil: [ :i | 
		aStream space; 
			nextPut: $(;
			nextPutAll: info infoName;
			nextPut: $) ]
		ifNil: [ aStream nextPutAll: '(not yet opened)' ]
]

{ #category : #'initialize - release' }
CMProjectModel >> projectAnnouncer [

	^ self projectManager announcer
]

{ #category : #'accessing - names' }
CMProjectModel >> projectName [
	" Answer a <String> with the receiver's model name "

	^ self cormasModelName
]

{ #category : #'initialize - release' }
CMProjectModel >> release [ 

	super release.
	self 
		info: nil;
		cormasModel: nil;
		cormasModelClass: nil;
		projectManager: nil;
		codeGenerator: nil.

]

{ #category : #callbacks }
CMProjectModel >> removeEntity: aCMEntityAnnouncement [ 
	" Remove the entity class in aCMEntityAnnouncement "

	| theClass theGetter |
	
	theClass := self classFor: aCMEntityAnnouncement entityName.
	theGetter := theClass asGetterForEntityClass.

	self removeEntitySubclasses: aCMEntityAnnouncement.

	(self perform: (aCMEntityAnnouncement type asLowercase , 'Classes') asSymbol)
		remove: theClass
		ifAbsent: [ self error ].
	self codeGenerator removeClass: theClass.
	self removeEntityReferences: theGetter.

]

{ #category : #callbacks }
CMProjectModel >> removeEntityReferences: theGetter [ 
	" Remove the entity class in aCMEntityAnnouncement "

	| theSetter |
	theSetter := theGetter asMutator.
	(self cormasModelClass canUnderstand: theGetter)
		ifTrue: [ self cormasModelClass removeSelector: theGetter ].
	(self cormasModelClass canUnderstand: theSetter)
		ifTrue: [ self cormasModelClass removeSelector: theSetter ].
	[ self cormasModelClass removeInstVarNamed: theGetter ]
	on: SlotNotFound 
	do: [ : ex | ].

]

{ #category : #callbacks }
CMProjectModel >> removeEntitySubclasses: aCMEntityAnnouncement [
	" Callback which ask for confirmation to delete the subclasses in the announcement aCMEntityAnnouncement entity "

	| theClass theGetter |
	
	theClass := self classFor: aCMEntityAnnouncement entityName.
	(self shouldRemoveSubclasses: theClass) ifFalse: [ ^ nil ].

	(OrderedCollection withAll: theClass allSubclasses)
		do: [ : cl | 	
				theGetter := cl asGetterForEntityClass.
				(self perform: (aCMEntityAnnouncement type asLowercase , 'Classes') asSymbol)
					remove: cl
					ifAbsent: [ self error ].
				self removeEntityReferences: theGetter.
				self codeGenerator removeClass: cl ]
]

{ #category : #callbacks }
CMProjectModel >> renameEntity: aCMEntityRenameAnnouncement [
	| oldClass newClass entitiesGetter |
	
	oldClass := aCMEntityRenameAnnouncement oldName copy.
	newClass := aCMEntityRenameAnnouncement entityName asValidCormasClassName: self projectManager cormasProjectName.
	(self codeGenerator
		renameClass: oldClass
		to: newClass)
		ifFalse: [ ^ self ].
	entitiesGetter := (aCMEntityRenameAnnouncement type asLowercase , 'Classes') asSymbol.
	(self perform: entitiesGetter) remove: oldClass ifAbsent: [ ].
	(self perform: entitiesGetter) add: newClass.

]

{ #category : #accessing }
CMProjectModel >> resourceLocator [
	" Answer the application's resource locator "
	
	^ self application resourceLocator
]

{ #category : #private }
CMProjectModel >> saveProjectFile [

	| modelSaver |
	
	'Saving project file...' traceCr.
	modelSaver := CMModel2ProjectMigrator new.
	modelSaver 
		buildForModel: self;
		buildProjectFile;
		moveProjectFile.
	'Done saving project.'
]

{ #category : #callbacks }
CMProjectModel >> shouldRemoveSubclasses: theClass [
	" Private - Detect if the parameter theClass has subclasses and confirm with the user. Answer <true> if they should be removed "

	theClass withAllSubclasses size > 1
		ifTrue: [ 
			| subClasses |
			subClasses := String streamContents: [ : stream |
				theClass allSubclasses do: [ : cl |
					stream 
						<< '   ';
						<< cl name asString;
						<< '\' ] ].
			^ self confirm: ('Delete the class ' , theClass name asString , ' and the following subclasses ? \ \' , subClasses) withCRs ].

	^ false

]

{ #category : #accessing }
CMProjectModel >> socialClasses [
	" Answer a <Collection> with the receiver's model social classes "
	
	^ self cormasModelClass socialClasses
]

{ #category : #accessing }
CMProjectModel >> spatialClasses [
	" Answer a <Collection> with the receiver's model spatial classes "
	
	^ self cormasModelClass spatialClasses
]

{ #category : #callbacks }
CMProjectModel >> specializeEntity: aCMEntityAnnouncement [ 
	" Specialize the entity class in aCMEntityAnnouncement "

	self codeGenerator 
		targetClassCategory: self cormasModelClass category;
		addNewClassType: aCMEntityAnnouncement type
		inheritingFrom: aCMEntityAnnouncement superclass
		name: aCMEntityAnnouncement entityName
		initProtocol: false 
		stepProtocol: false.

]

{ #category : #'accessing - simulations' }
CMProjectModel >> storedSimulations [
	" Answer a <Collection> with the receiver's current model stored simulations "

	^ (self resourceLocator dumpPath: self cormasModel class name) 
		allChildrenMatching: CMSimManager simNameStart , '*'

]

{ #category : #accessing }
CMProjectModel >> tracker [
	" Answer a <CMProjectTracker> an object used to track source code changes between a saved version in disk and current version in the image "

	^ tracker
		ifNil: [ tracker := CMProjectTracker new ]
]

{ #category : #accessing }
CMProjectModel >> tracker: anObject [

	tracker := anObject
]

{ #category : #'accessing - names' }
CMProjectModel >> userProvidedName [
	" Answer a <String> with the receiver's name as provided by the user on creation "

	^ self info infoName
]

{ #category : #'accessing - names' }
CMProjectModel >> userProvidedName: aString [
	" Answer a <String> with the receiver's name as provided by the user on creation "

	self info infoName: aString
]

{ #category : #'accessing - names' }
CMProjectModel >> validateCormasModelName: modelName [
	" Answer a <String> with modelName as valid Smalltalk class name "

	| validClassName |
	(validClassName := self codeGenerator validateClassName: modelName) ~= modelName
		ifTrue: [ self crTrace: modelName , ': ' , self translator tModifiedModelName , validClassName ].
	^ validClassName
]
