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
		'currentModelPath',
		'opener'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #'*Cormas-UI' }
CMProjectManager >> defaultCormasOpener [
	" Answer a <Class> responsible for managing to open CORMAS projects or models "

	^ CMProjectOpener
]

{ #category : #'*Cormas-UI' }
CMProjectManager >> doPostNewActions [
	" Basic post new actions. Redefine in subclasses if necessary "

	super doPostNewActions.
	(CMSpecModelComments for: self) openWithSpec.

]

{ #category : #'*Cormas-UI' }
CMProjectManager >> openModel: aModel [
	" Open aModel for the receiver "

	^ (CMModelOpener newFrom: self) 
		openModel: aModel;
		yourself
]
