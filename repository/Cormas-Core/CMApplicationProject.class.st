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

{ #category : #about }
CMApplicationProject class >> contributors [

	^ String streamContents: [ : stream | 
		stream 
			<< 'Thank you to the following contributors: \';
			cr;
			<< self developerNames ]
]

{ #category : #callbacks }
CMApplicationProject class >> cormasRepository [
	" Answer the receiver's CORMAS Iceberg repository  "

	^ IceLibgitRepository registry detect: [ : repo | repo name = 'cormas' ]
]

{ #category : #accessing }
CMApplicationProject class >> createUserDirectories [
	" Create directories for storing CORMAS files in this system "

	self baseDirectory ensureCreateDirectory.
	#(#demosPath #userProjectsPath #preferencesPath) 
		do: [ : pathSym | (CMResourceLocator perform: pathSym) ensureCreateDirectory ]
]

{ #category : #about }
CMApplicationProject class >> currentVersion [
		
	^ '0.1'
]

{ #category : #about }
CMApplicationProject class >> developerNames [
^ 'Innocent Bakam
François Bousquet
Christophe Le Page
Pierre Bommel
Alassane Bah
Nicolas Bécu
Emmanuel Lieurain
Jean-Christophe Soulié
Paul Guyot
Jean François Lefevre
Hernán Morales Durand'
]

{ #category : #about }
CMApplicationProject class >> downloadString [
^ 
'Visit the Cormas web site :  
      in French = http://cormas.cirad.fr
      in English = http://cormas.cirad.fr/indexeng.htm
'

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

{ #category : #about }
CMApplicationProject class >> licenseString [
	^ self licenseStringTemplate format: (Array with: Date today year asString)
]

{ #category : #about }
CMApplicationProject class >> licenseStringTemplate [
	^ 'LICENSE
	
Licensed under the MIT License.

Copyright (c) 1996-{1} CIRAD - Green Research Unit, and CORMAS Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, subject to the following conditions: The
above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'
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

{ #category : #about }
CMApplicationProject class >> systemInformationString [

	^ String streamContents: [ : stream |
		stream 
			cr;
			nextPutAll: self currentVersion;
			cr; cr;
			nextPutAll: self licenseString;
			cr; cr;
			nextPutAll: self downloadString;
			cr; cr;
			nextPutAll: self contributors ]
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
CMApplicationProject >> defaultTranslatorClass [
	" Answer the default translation class for the receiver "

	^ CMTranslator
]

{ #category : #accessing }
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
