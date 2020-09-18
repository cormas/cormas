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
		'codeGenerator'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #'instance creation' }
CMProjectModel class >> for: aCormasModel [
	" Answer a new instance of the receiver configured for aCormasModel "
	^ self new initializeForModel: aCormasModel 
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
		targetClassCategory: self cormasModelClass category;
		addNewClassType: aCMEntityNewAnnouncement type
		inheritingFrom: aCMEntityNewAnnouncement superclass
		name: aCMEntityNewAnnouncement entityName
		initProtocol: false 
		stepProtocol: false
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
CMProjectModel >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CMProjectModel >> cormasModel: aCormasModel [
	" Set the receiver's model to be aCormasModel "

	cormasModel := aCormasModel
]

{ #category : #accessing }
CMProjectModel >> cormasModelAuthors: aString [ 
	" See comment in CMProjectManager>>cormasModelAuthors: "

	self codeGenerator
		generateMethod: aString 
		selector: #cmAuthors 
		inClass: self cormasModelClass class.

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
CMProjectModel >> cormasModelComment: aString [ 
	" See comment in CMProjectManager>>cormasModelComment: "

	self codeGenerator 
		generateMethod: aString 
		selector: #comments 
		inClass: self cormasModelClass class.

]

{ #category : #accessing }
CMProjectModel >> cormasModelCreationDate: aString [ 

	self codeGenerator
		generateMethod: aString 
		selector: #creationDate 
		inClass: self cormasModelClass class.


]

{ #category : #accessing }
CMProjectModel >> cormasModelName [
	" Answer a <String> with the receiver's model name "

	^ self cormasModelClass cormasModelName
]

{ #category : #accessing }
CMProjectModel >> cormasModelVersion: aString [ 

	self codeGenerator
		generateMethod: aString 
		selector: #cmVersion 
		inClass: self cormasModelClass class
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

{ #category : #'accessing-simulations' }
CMProjectModel >> findSimulationNamed: aName [
	" Answer <true> if the dump folder has stored simulations "

	^ self storedSimulations detect: [ : simName | simName = aName ]

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

	self initializeForModel: aCormasModel named: self defaultCormasModelName.

]

{ #category : #'initialize - release' }
CMProjectModel >> initializeForModel: aCormasModel named: aString [
	" Private - Set up the cormas model for the receiver "

	self initializeNamed: aString.
	self cormasModel: aCormasModel.
	self cormasModelClass: aCormasModel class.
	self initializeEvents.

]

{ #category : #accessing }
CMProjectModel >> passiveClasses [
	" Answer a <Collection> with the receiver's model passive classes "
	
	^ self cormasModelClass passiveClasses
]

{ #category : #'initialize - release' }
CMProjectModel >> projectAnnouncer [

	^ self projectManager announcer
]

{ #category : #accessing }
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

	| theClass |
	
	theClass := self class environment at: aCMEntityAnnouncement entityName.
	(self perform: (aCMEntityAnnouncement type asLowercase , 'Classes') asSymbol)
		remove: theClass
		ifAbsent: [ self error ].
	self codeGenerator removeClass: aCMEntityAnnouncement entityName asValidCormasClassName.
]

{ #category : #callbacks }
CMProjectModel >> renameEntity: aCMEntityAnnouncement [
	| theClass entitiesGetter |
	
	theClass := self class environment at: aCMEntityAnnouncement oldName.
	(self codeGenerator
		renameClass: aCMEntityAnnouncement oldName asValidCormasClassName
		to: aCMEntityAnnouncement entityName asValidCormasClassName)
		ifFalse: [ ^ self ].
	entitiesGetter := (aCMEntityAnnouncement type asLowercase , 'Classes') asSymbol.
	(self perform: entitiesGetter)
		remove: theClass
		ifAbsent: [ ^ self error ].
	(self perform: entitiesGetter) add: theClass
]

{ #category : #accessing }
CMProjectModel >> resourceLocator [
	" Answer the application's resource locator "
	
	^ self application resourceLocator
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

{ #category : #'accessing-simulations' }
CMProjectModel >> storedSimulations [
	" Answer a <Collection> with the receiver's current model stored simulations "

	^ (self resourceLocator dumpPath: self cormasModel class name) 
		allChildrenMatching: CMSimManager simNameStart , '*'

]

{ #category : #accessing }
CMProjectModel >> userProvidedName [
	" Answer a <String> with the receiver's name as provided by the user on creation "

	^ self info infoName
]

{ #category : #accessing }
CMProjectModel >> validateCormasModelName: modelName [
	" Answer a <String> with modelName as valid Smalltalk class name "

	| validClassName |
	(validClassName := self codeGenerator validateClassName: modelName) ~= modelName
		ifTrue: [ self crTrace: modelName , ': ' , self translator tModifiedModelName , validClassName ].
	^ validClassName
]
