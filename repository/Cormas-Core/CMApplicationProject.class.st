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
	#category : #'Cormas-Core-Project'
}

{ #category : #accessing }
CMApplicationProject class >> applicationName [
	" Answer a <String> with receiver's name "
	
	^ 'CORMAS Application'
]

{ #category : #accessing }
CMApplicationProject >> cormasModel [
	" Answer the receiver's current project model, a <CMAbstractModel> instance "

	^ self currentProject cormasModel 
]

{ #category : #accessing }
CMApplicationProject >> defaultProjectClass [
	" Private - See superimplementor's comment "

	^ CMProjectModel
]

{ #category : #accessing }
CMApplicationProject >> gitBridge [
	^ resourceLocator
		ifNil: [ resourceLocator := CMGitBridge new ]
]

{ #category : #initialization }
CMApplicationProject >> initialize [

	super initialize.
	translator := CMEnglishTranslator new.
]

{ #category : #accessing }
CMApplicationProject >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ self gitBridge modelNames
]

{ #category : #accessing }
CMApplicationProject >> resourceLocator: anObject [
	resourceLocator := anObject
]

{ #category : #accessing }
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

{ #category : #accessing }
CMApplicationProject >> translator [

	^ translator
]

{ #category : #accessing }
CMApplicationProject >> translator: anObject [

	translator := anObject
]
