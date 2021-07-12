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

{ #category : #'*Cormas-UI' }
CMProjectModel >> cormasDemoImage [
	" Answer a <Morph> demo image for the CORMAS project represented by the receiver "
	" So far demo images for in-image models are not supported "

	^ CMModelOpener cormasDemoImage 
]

{ #category : #'*Cormas-UI' }
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
