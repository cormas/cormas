"
Accessing application:

CMSpecApplicationProject uniqueInstance.

Release and re-initialize application:

CMApplicationProject release.
CMApplicationProject currentProjectName.

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

	^ 'prj'
]

{ #category : #accessing }
CMApplicationProject class >> applicationName [
	" Answer a <String> with receiver's name "
	
	^ 'CORMAS Application'
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

{ #category : #'accessing-simulations' }
CMApplicationProject >> findSimulationNamed: aName [
	" Answer <true> if the dump folder has stored simulations "

	^ (self resourceLocator dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].

]

{ #category : #testing }
CMApplicationProject >> hasStoredSimulations [
	" Answer <true> if the dump folder has stored simulations "

	| directoryContent |

	self terminateAllProcesses.
	(directoryContent := self resourceLocator dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].
	^ directoryContent isEmpty
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

{ #category : #'accessing-simulations' }
CMApplicationProject >> storedSimulations [
	" Answer <true> if the dump folder has stored simulations "

	^ (self resourceLocator dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].

]

{ #category : #convenience }
CMApplicationProject >> terminateAllProcesses [
	"Terminate all the processes"
	
	processReplayForward isNil
		ifFalse:
			[processReplayForward terminate.
			processReplayForward := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil]
]
