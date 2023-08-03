"
This is the Spec 2 version of CMSpecObject.
It provides a Spec 2 ""project managed"" support for subclasses.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	projectManager:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpPManagedPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'projectManager'
	],
	#category : #'Cormas-UI-Spec2-Project'
}

{ #category : #'instance creation' }
CMSpPManagedPresenter class >> example [

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: CMEnglishTranslator new;
		initialize;
		openWithSpec
]

{ #category : #'instance creation' }
CMSpPManagedPresenter class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMSpPManagedPresenter class >> openFor: aCMProjectManager [ 
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #accessing }
CMSpPManagedPresenter >> cormasModel [
	" Answer the receiver's model, a subclass of <CMAbstractModel> "
	
	^ self projectManager cormasModel
]

{ #category : #accessing }
CMSpPManagedPresenter >> currentProject [
	" Answer the receiver's <CMProjectModel> "

	^ self projectManager currentProject
]

{ #category : #accessing }
CMSpPManagedPresenter >> projectManager [
	^ projectManager
		ifNil: [ projectManager := CMProjectManager new ]
]

{ #category : #accessing }
CMSpPManagedPresenter >> projectManager: anObject [
	projectManager := anObject
]

{ #category : #accessing }
CMSpPManagedPresenter >> translator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator
]

{ #category : #accessing }
CMSpPManagedPresenter >> translator: aPFTranslator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator: aPFTranslator
]
