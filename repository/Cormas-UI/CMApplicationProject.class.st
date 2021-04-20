"
Accessing application:

CMSpecApplicationProject uniqueInstance.

Release and re-initialize application:

CMApplicationProject release.
CMApplicationProject currentProjectName.

Create user directories:

CMApplicationProject createUserDirectories.
CMApplicationProject removeUserDirectories.
"
Class {
	#name : #CMApplicationProject,
	#superclass : #PFProjectApplication,
	#instVars : [
		'processReplayForward',
		'processReplayBackward',
		'processRun',
		'resourceLocator'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMApplicationProject class >> applicationExtension [
	" See comment in #applicationExtension "

	^ 'zip'
]

{ #category : #accessing }
CMApplicationProject class >> applicationName [
	" Answer a <String> with receiver's name "
	
	^ 'CORMAS Application'
]

{ #category : #accessing }
CMApplicationProject class >> applicationVersion [
	"Answer the current CORMAS version"

	^ GRVersion major: 0 minor: 1 revision: 0
]

{ #category : #accessing }
CMApplicationProject class >> baseDirectory [
	" Answer a <FileReference> with the directory of CORMAS where projects and settings are located "

	^ CMApplicationPreferences settingBaseLocation asFileReference
]

{ #category : #accessing }
CMApplicationProject class >> createUserDirectories [
	" Create directories for storing CORMAS files in this system "

	self baseDirectory ensureCreateDirectory.
	#(#demosPath #userProjectsPath #preferencesPath) 
		do: [ : pathSym | (CMResourceLocator perform: pathSym) ensureCreateDirectory ]
]

{ #category : #accessing }
CMApplicationProject class >> hasCormasDemos [
	" Answer <true> if the system has CORMAS project files in the demos path "

	^ CMResourceLocator demosPath hasFiles and: [ 
		CMResourceLocator demosPath children anySatisfy: #isZipFile ]
]

{ #category : #accessing }
CMApplicationProject class >> hasDemos [
	" Answer <true> if this system already has a directory where CORMAS projects "

	^ CMResourceLocator demosPath exists and: [ self hasCormasDemos ]

]

{ #category : #accessing }
CMApplicationProject class >> hasUserProjects [
	" Answer <true> if this system already has a directory where CORMAS projects and preferences were created "

	^ self baseDirectory exists and: [ self hasDemos ]

]

{ #category : #accessing }
CMApplicationProject class >> removeUserDirectories [

	self baseDirectory exists
		ifFalse: [ ^ self ].
	(self confirm: 'Warning: You are about to remove all directories and files under ' , self baseDirectory fullName)
		ifTrue: [ self baseDirectory deleteAll ].

]

{ #category : #accessing }
CMApplicationProject class >> removeUserDirectoriesNoConfirmation [

	self baseDirectory
		ifFalse: [ ^ self ].
	self baseDirectory deleteAll.

]

{ #category : #testing }
CMApplicationProject >> cormasModel [
	" Answer the receiver's current project model, a <CMAbstractModel> instance "

	^ self currentProject cormasModel 
]

{ #category : #accessing }
CMApplicationProject >> defaultProjectClass [
	" Private - See superimplementor's comment "

	^ CMProjectModel
]

{ #category : #defaults }
CMApplicationProject >> defaultTranslatorClass [
	" Answer the default translation class for the receiver "

	^ CMTranslator
]

{ #category : #'accessing-path' }
CMApplicationProject >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ self resourceLocator modelNames
]

{ #category : #accessing }
CMApplicationProject >> resourceLocator [
	^ resourceLocator
		ifNil: [ resourceLocator := CMResourceLocator new ]
]

{ #category : #accessing }
CMApplicationProject >> resourceLocator: anObject [
	resourceLocator := anObject
]

{ #category : #convenience }
CMApplicationProject >> terminateAllProcesses [
	"Terminate all the processes"

	processReplayForward
		ifNotNil: [ processReplayForward terminate.
			processReplayForward := nil ].
	processReplayBackward
		ifNotNil: [ processReplayBackward terminate.
			processReplayBackward := nil ].
	processRun
		ifNotNil: [ processRun terminate.
			processRun := nil ]
]
