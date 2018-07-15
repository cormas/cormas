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
		'processRun'
	],
	#category : 'Cormas-UI-Project'
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

{ #category : #'accessing-path' }
CMApplicationProject >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ (self cormasPath / 'Add-ons') ensureCreateDirectory.


]

{ #category : #'accessing-path' }
CMApplicationProject >> cormasPath [
	" Answer a <FileReference> corresponding to the path of Cormas directory. "

	^ FileSystem disk workingDirectory
		
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
CMApplicationProject >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) asFileReference / 'dump') ensureCreateDirectory.

]

{ #category : #'accessing-simulations' }
CMApplicationProject >> findSimulationNamed: aName [
	" Answer <true> if the dump folder has stored simulations "

	^ (Cormas dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].

]

{ #category : #testing }
CMApplicationProject >> hasStoredSimulations [
	" Answer <true> if the dump folder has stored simulations "

	| directoryContent |
	self terminateAllProcesses.
	(directoryContent := Cormas dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].
	^ directoryContent isEmpty
]

{ #category : #'accessing-path' }
CMApplicationProject >> modelPath: aModelClassName [
	"Purpose: Returns a Filename corresponding to the path of the current model directory.
	Argument: aModelClassName = <String>
	Example: 
	(Cormas modelPath: #FireModel) construct: 'test.csv' 
	"
	
	^ (self modelsPath / aModelClassName asString) ensureCreateDirectory.

]

{ #category : #'accessing-path' }
CMApplicationProject >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory "
	
	^ (self cormasPath / 'Models') ensureCreateDirectory.

]

{ #category : #'accessing-simulations' }
CMApplicationProject >> storedSimulations [
	" Answer <true> if the dump folder has stored simulations "

	^ (Cormas dumpPath: self cormasModel class name)
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

{ #category : #'accessing-path' }
CMApplicationProject >> videoPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) asFileReference / 'video') ensureCreateDirectory.

]

{ #category : #'accessing-path' }
CMApplicationProject >> xmlPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) asFileReference / 'xml') ensureCreateDirectory.

]
