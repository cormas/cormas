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
CMApplicationProject class >> createUserDirectories [
	" Create the demos location <FileReference> "

	| baseLocation |
	(baseLocation := CMApplicationPreferences settingBaseLocation asFileReference) exists
		ifTrue: [ ^ self ].
	baseLocation ensureCreateDirectory.
	(baseLocation / 'demos') ensureCreateDirectory.
	(baseLocation / 'preferences') ensureCreateDirectory.
]

{ #category : #accessing }
CMApplicationProject class >> installDemos [

	| demosLocation |
	(demosLocation := CMApplicationPreferences settingBaseLocation asFileReference / 'demos') exists
		ifFalse: [ ^ self ].
	

]

{ #category : #accessing }
CMApplicationProject class >> removeUserDirectories [
	| baseLocation |
	(baseLocation := CMApplicationPreferences settingBaseLocation asFileReference) exists
		ifFalse: [ ^ self ].
	(self confirm: 'Warning: You are about to remove all directories and files under ' , baseLocation fullName)
		ifTrue: [ baseLocation deleteAll ].

]

{ #category : #accessing }
CMApplicationProject class >> removeUserDirectoriesNoConfirmation [
	| baseLocation |
	(baseLocation := CMApplicationPreferences settingBaseLocation asFileReference) exists
		ifFalse: [ ^ self ].
	baseLocation deleteAll.

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
